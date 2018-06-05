class UpdateEventChangeHistoryService

    def initialize(event_id_param,remote_ip_param)
        @event_id = event_id_param
        #event_change_history = EventChangeHistory.new(event_id: event_id_param)

        # ユーザーのipアドレスを保存
        #event_change_history.user_ip = remote_ip_param
        @remote_ip = remote_ip_param

        #ユーザーがログインしていたら、ユーザーIDを変更履歴に保存
        #if logged_in?
        #    event_change_history.user_id = current_user
        #end
    end

    def execute
        # ライブ情報の変更履歴を作成
        event_change_history = EventChangeHistory.new(event_id: @event_id)

        # ユーザーのipアドレスを保存
        event_change_history.user_ip = @remote_ip_param

        #ユーザーがログインしていたら、ユーザーIDを変更履歴に保存
        #if logged_in?
        #    event_change_history.user_id = current_user.id
        #end

        event_change_history.save
    end
end