class Participate < ApplicationRecord
	belongs_to :user
	belongs_to :event

	#1ユーザー1回まで
	validates_uniqueness_of :event_id, scope: :user_id
end