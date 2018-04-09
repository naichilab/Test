class EventChangeHistoryController < ApplicationController
    def create
        event = Event.find(params[:event_id])
        event_change_history = current_user.event_change_histroies.new(event_id: event.id)

        # ユーザーIDを保存
        if user_signed_in?
         event.event_change_histories.user_id = current_user.user_id
        end

        # ユーザーのipアドレスを保存
         binding.pry
         event.event_change_histories.user_ip = request.remote_ip
         event_change_history.save
    end

    private

    def event_params
        params.require(:event).permit(:id, :live_date, :live_start, :live_name, :live_remarks, :link_1, :live_email, :image, :uid, :ip)
    end

    def user_params
        params.require(:user).permit(:id, :name, :profile_image, :uid, :email, :password)
    end
end
