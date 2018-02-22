class Pending < ApplicationRecord
	belongs_to :user
	belongs_to :event

	#1ユーザー1回まで
	validates_uniqueness_of :live_id, scope: :uid
end
