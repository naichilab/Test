class SearchNextSatService

    def initialize()
    	require "date"

        #明日の5時を取る
        @next_sat = DateTime.now.beginning_of_day + 1.day + 5.hour

        #翌日の5時を取る
        @nextday = @next_sat + 1.day + 5.hour

    end

    def execute
    	#現在時刻から明日の朝5時までのライブを取得
    	@results = Event.where(datetime: @next_sat...@nextday)
    end
end