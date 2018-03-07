class ParticipatesController < ApplicationController
        def create
            event = Event.find(params[:id])
            participate = current_user.participates.new(id: event.id)
            participate.save
            redirect_to events_path
        end
        def destroy
            participate = current_user.favorites.find_by(live_id: params[:live_id])
            participate.destroy
            redirect_to events_path
        end
end