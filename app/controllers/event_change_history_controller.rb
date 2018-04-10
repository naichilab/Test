class EventChangeHistoryController < ApplicationController
    def create
        event = Event.find(params[:event_id])
        event_change_history = current_user.event_change_histroies.new(event_id: event.id)

        # ユーザーIDを保存
        if user_signed_in?
         event.event_change_histories.user_id = current_user.user_id
        end

        # ユーザーのipアドレスを保存
         event.event_change_histories.user_ip = request.remote_ip
         event_change_history.save
    end

    private

    def event_params
        params.require(:event).permit(:id, :date, :start, :title, :description, :tel, :email, :image)
    end

    def user_params
        params.require(:user).permit(:id, :name, :profile_image, :uid, :email, :password)
    end
end