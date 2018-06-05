class SearchNextSunService

    def initialize()
    	require "date"

        #明日の5時を取る
        @next_sun = DateTime.now.beginning_of_day + 1.day + 5.hour

        #翌日の5時を取る
        @nextday = @next_sun + 1.day + 5.hour
    end

    def execute
    	#次の土曜日の朝5時から翌日の朝5時までのライブを取得
    	@results = Event.where(datetime: @next_sun...@nextday)
    end
end