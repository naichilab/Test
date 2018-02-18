class EventsController < ApplicationController

	def new
		@event = Event.new
	end

	def create
        # ストロングパラメーターを使用
         @event = Event.new(event_params)
        # ユーザーIDを取得
         ＠event.uid = @current_user.id
        # ユーザーのipアドレスを取得
         @event.ip = request.remote_ip

        # エラーチェック＆DB保存→詳細画面へリダイレクト
        respond_to do |format|
          if @event.valid? && @event.save
            format.html { redirect_to event_path(event.id), notice: 'ありがとうございます！ライブ登録が完了しました！！' }
          else
            format.html { redirect_to event_path(event.id), notice: 'ライブ登録に失敗しました。お手数ですが最初からやり直してください。' }
          end
        end
    end

    def index
    	@events = Event.page(params[:page]).reverse_order
    end

    def show
    	@event = Event.find(params[:id])
    end

    def edit
    	@event = Event.find(params[:id])
    end

    def update
    	@event = Event.find(params[:id])
        @event.update(event_params)
        redirect_to event_path(event.id)
    end

    def destroy
		@event = Event.find(params[:id])
        @event.destroy
        redirect_to events_path
    end

	private

    def event_params
        params.require(:event).permit(:live_id, :live_date, :live_start, :live_name, :live_remarks, :link_1, :live_email, :image, :user, :ip)
    end
end
