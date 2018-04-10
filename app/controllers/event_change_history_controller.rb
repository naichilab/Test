class EventChangeHistoryController < ApplicationController
    def create
    	binding.pry
    	# イベントが登録・編集されたら、変更履歴テーブルを更新
        event = Event.find(params[:event_id])
        event_change_history = current_user.event_change_histroies.new(event_id: event.id)

        # ユーザーIDを保存
        if user_signed_in?
         event_change_histories.user_id = current_user.user_id
        end

        # ユーザーのipアドレスを保存
         event_change_histories.user_ip = request.remote_ip

        event_change_history.save
    end

    private
    #ライブ情報
    def event_params
        params.require(:event).permit(:id,:date, :start, :title, :description, :tel, :email, :image,event_links_attributes: [:id, :event_id, :url],event_change_histories_attributes: [:id, :event_id, :user_id, :user_ip], event_performers_attributes: [:id, :event_id, :performer],event_categories_attributes: [:id,:event_id, :category])
    end

    #ユーザー情報
    def user_params
        params.require(:user).permit(:id, :name, :profile_image, :uid, :email, :password)
    end
end
