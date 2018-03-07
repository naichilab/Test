class Event < ApplicationRecord
	attachment :image

	#一人のユーザーが複数のライブを登録できる
	belongs_to :user

	#一人のユーザーが複数のライブに参加できる
    has_many :participates, dependent: :destroy

	#一人のユーザーが複数のライブを「検討中」にできる
    has_many :pendings, dependent: :destroy

    #チェック
    validates :live_id, presence: true
    validates :live_date, presence: true
    validates :live_name, presence: true

    #　参加するになってるかチェック
    def Participated_by?(user)
      participates.where(user_id: user.id).exists?
    end

    # 検討中になってるかチェック
    def Pending_by?(user)
      pendings.where(user_id: user.id).exists?
    end
end