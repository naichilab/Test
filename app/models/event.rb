class Event < ApplicationRecord
	attachment :image

	#一人のユーザーが複数のライブに参加できる
    has_many :participates, dependent: :destroy

	#一人のユーザーが複数のライブを「検討中」にできる
    has_many :pendings, dependent: :destroy

  #複数のリンクを持てる
    has_many :event_links, dependent: :destroy
    accepts_nested_attributes_for :event_links

  #複数の変更履歴を持てる
    has_many :event_change_histories, dependent: :destroy
    accepts_nested_attributes_for :event_change_histories

  #複数の出演者を持てる
    has_many :performers, dependent: :destroy
    accepts_nested_attributes_for :performers

    #存在チェック
    validates :datetime, presence: true
    validates :title, presence: true

    #　参加するになってるかチェック
    def participated_by?(user)
      participates.where(user_id: user.id).exists?
    end

    # 検討中になってるかチェック
    def pending_by?(user)
      pendings.where(user_id: user.id).exists?
    end

    # リンクの件数をチェック
    def how_many_urls?(event)
      links.where(event_id: event.id).count
    end

    def user_signed_in?
         # Returns true if the user is logged in, false otherwise.
         !current_user.nil?
    end

    def self.lumine_urls
        links = []
        month = 1

        #1月〜12月分のURLを取得
        while month <= 12 do
          if month <= 9
            links << ("http://www.yoshimoto.co.jp/lumine/schedule0"+ "#{month}"+".php")
          else
            links << ("http://www.yoshimoto.co.jp/lumine/schedule"+"#{month}"+".php")
          end
          month = month + 1
        end

        links.each do |lumine_url|
            get_lumine(lumine_url)
        end
    end

    #日付検索
    ransacker :live_date, type: :date do
      Arel.sql('date(created_at)')
    end

    #ルミネのページをスクレイピング
    def self.get_lumine(link)
        lumine = Mechanize.new
        page = lumine.get(lumine_url)

        schedule_part = page.search('#schedule_pc')
        eles = schedule_part.search('ul')

        eles.each do |ele|
          if ele.search('#dayTitle').present?
            day = ele.search('#dayTitle').inner_text
          else
            day = Event.last.day
          end
          live_name = ele.search('li .schedule_con, .lastChild')[1].inner_text
          live_start = ele.search('li .schedule_con, .lastChild')[0].inner_text

          place = '¥nルミネtheよしもと¥n'
          price = ele.search('li .schedule_con, .lastChild')[4].inner_text
          performers_list = ele.search('li .schedule_con, .lastChild')[2].inner_text
          detail = ele.search('li .schedule_con, .lastChild')[3].inner_text

          remarks = place+price+"¥n"+performers_list+details

          event = Event.where(live_name: title, day: day, starting_time: starting_time, remarks: remarks).first_or_create

          #performers = performers_list.gsub(/\r\n|\s/,"").gsub(/\[.*?\]/,"／").split("／").reject(&:blank?)
          #performers.each do |name|
          #  performer = Performer.where(name: name).first_or_create
          #  live.performers << performer
          #end
        end
    end
end