class SearchTomorrowService

    def initialize()
    	require "date"

        #明日の5時を取る
        #@now = Time.current
        @tomorrow = DateTime.now.beginning_of_day + 1.day + 5.hour

        #翌日の5時を取る
        @nextday = @tomorrow + 1.day + 5.hour

    end

    def execute
    	#明日の朝5時から翌日の朝5時までのライブを取得
    	@results = Event.where(datetime: @tomorrow...@nextday)
    end
end