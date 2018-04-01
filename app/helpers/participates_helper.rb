module ParticipatesHelper
    def participated_by?(user)
      participates.where(user_id: user.id).exists?
    end
end