class PendingsController < ApplicationController
    def create
        event = Event.find(params[:event_id])
        pending = current_user.pendings.new(event_id: event.id)
        pending.save
        #redirect_to events_path
    end

    def destroy
        pending = current_user.pendings.find_by(event_id: params[:event_id])
        pending.destroy
        #redirect_to events_path
    end

    private

    def event_params
        params.require(:event).permit(:id, :live_date, :live_start, :live_name, :live_remarks, :link_1, :live_email, :image, :uid, :ip)
    end

    def user_params
        params.require(:user).permit(:id, :name, :profile_image, :uid, :email, :password)
    end
end
