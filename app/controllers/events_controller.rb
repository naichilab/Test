class EventsController < ApplicationController

	def new
		@event = Event.new
	end

	def create
        # イベント情報を取得
         @event = Event.new(event_params)

        # ipアドレスを取得
         remote_ip = request.remote_ip

        # エラーチェック＆DB保存→詳細画面へリダイレクト
        if @event.save
            # イベントが登録されたら、変更履歴テーブルを更新
            event = Event.find_by(params[:event_id])
            UpdateEventChangeHistoryService.new(params[:event_id],remote_ip).execute

            redirect_to "/events/#{@event.id}" , notice: 'ありがとうございます！ライブ登録が完了しました！'
        else
            flash.now[:error] = 'ライブ登録に失敗しました...。お手数ですが最初からやり直してください。'
            render :new
        end
    end

    def index
        @q = Event.ransack(params[:q])
    	@events = Event.page(params[:page]).reverse_order
    end

    def search
        #binding.pry

        #今日のライブ情報を表示
        return @events = SearchTodayService.new().execute if params[:today].present?

        #明日のライブ情報を表示
        return @events = SearchTomorrowService.new().execute if params[:tomorrow].present?

        #次の土曜日のライブ情報を表示
        return @events = SearchNextSatService.new().execute if params[:next_sat].present?

        #次の日曜日のライブ情報を表示
        return @events = SearchNextSunService.new().execute if params[:next_sun].present?

        #日付もしくはキーワードで検索
        return @events = SearchDatetimeKeywordService.new(params[:datetime],params[:keyword]).execute if params[:datetime].present? && params[:keyword].present?
        return @events = SearchKeywordService.new(params[:keyword]).execute if params[:keyword].present?
        return @events = SearchDatetimeService.new(params[:datetime]).execute if params[:datetime].present?

        respond_to do |format|
          format.html # index.html.erb
        end
    end

    def show
    	@event = Event.find_by(params[:id])
    end

    def edit
    	@event = Event.find_by(params[:id])

    end

    def update
    	@event = Event.find_by(params[:id])

        # イベントが編集されたら、変更履歴テーブルを更新
        event = Event.find_by(params[:event_id])
        event_change_history = event_change_histrories.build(event_id: event.id)

        #ユーザーがログインしていたら、ユーザーIDを変更履歴に保存
        logged_in?

        # ユーザーのipアドレスを取得
         @event.event_change_histories.user_ip = request.remote_ip

        @event.update(event_params)
        redirect_to event_path(params[:id])
    end

    def destroy
		@event = Event.find_by(params[:id])
        @event.destroy
        redirect_to events_path
    end

	private
    #ライブ情報
    def event_params
        params.require(:event).permit(:id,:datetime, :title, :description, :tel, :email, :image,event_links_attributes: [:id, :event_id, :url],event_change_histories_attributes: [:id, :event_id, :user_id, :user_ip], event_performers_attributes: [:id, :event_id, :performer],event_categories_attributes: [:id,:event_id, :category])
    end

    #ユーザー情報
    def user_params
        params.require(:user).permit(:id, :name, :profile_image, :uid, :email, :password)
    end

    #検索クエリ
    def search_params
        params.require(:keyword).permit(:title_or_description)
        params.require(:date).permit(:datetime_eq)
        params.require(:date_and_keyword).permit
    end
end