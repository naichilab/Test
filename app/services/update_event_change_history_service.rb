class UpdateEventChangeHistoryService

    def initialize(event_id_param,remote_ip_param,user_id_param)
        # Set Event ID / イベントIDを取得
        @event_id = event_id_param

        # Set Remote IP / ユーザーのipアドレスを取得
        @remote_ip = remote_ip_param

        # Set User ID /ユーザーIDを取得
        #if logged_in?
        @user_id = user_id_param
        #end
    end

    def execute
        # Create Event Change History record / ライブ情報の変更履歴を作成
        @event_change_history = EventChangeHistory.new(event_id: @event_id)

        # Set Remote_ip in user_ip column /ユーザーのipアドレスを保存
        @event_change_history.user_ip = @remote_ip

        # Set user_id in user_id column (if any) / ユーザーIDを保存
        #if logged_in?
        @event_change_history.user_id = @user_id
        #end

        # Save Event change history / ライブ情報の変更履歴を保存
        @event_change_history.save

    end
end