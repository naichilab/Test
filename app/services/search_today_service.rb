class SearchTodayService

    def initialize()
    	require "date"

        #現在時刻を取る
        #@now = Time.current
        @now = DateTime.now

        #翌日の5時を取る
        @nextday = DateTime.now.beginning_of_day + 1.day + 5.hour

    end

    def execute
    	#現在時刻から翌日の朝5時までのライブを取得
    	@results = Event.where(datetime: @now...@nextday)
    end
end