class ParticipatesController < ApplicationController
    def create
        event = Event.find(params[:event_id])
        participate = current_user.participates.new(event_id: event.id)
        participate.save
        @event = Event.find(params[:event_id])
        @participate = current_user.participates.find_by(event_id: params[:event_id])
    end

    def destroy
        participate = current_user.participates.find_by(event_id: params[:event_id])
        participate.destroy
        @event = Event.find(params[:event_id])
        @participate = current_user.participates.find_by(event_id: params[:event_id])
    end

    private

    def event_params
        params.require(:event).permit(:id, :live_date, :live_start, :live_name, :live_remarks, :link_1, :live_email, :image, :uid, :ip)
    end

    def user_params
        params.require(:user).permit(:id, :name, :profile_image, :uid, :email, :password)
    end
end