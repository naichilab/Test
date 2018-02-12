class EventsController < ApplicationController

	def new
		@event = Event.new
	end

	def create
        # ストロングパラメーターを使用
         event = Event.new(event_params)
        # DBへ保存する
         event.save
        # 詳細画面へリダイレクト
         redirect_to event_path(event.id)
    end

    def index
    	@events = Event.all
    end

    def show
    	@event = Event.find(params[:id])
    end

    def edit
    	@event = Event.find(params[:id])
    end

    def update
    	event = Event.find(params[:id])
        event.update(event_params)
        redirect_to event_path(event.id)
    end

    def destroy
		event = Event.find(params[:id])
        event.destroy
        redirect_to events_path
    end

	private

    def event_params
        params.require(:event).permit(:live_id, :live_date, :live_start, :live_name, :live_remarks, :link_1, :live_email, :image)
    end
end
