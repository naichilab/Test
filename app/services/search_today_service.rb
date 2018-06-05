class SearchTodayService

    def initialize(date_param)
    	require "date"

    	@date = date_param

    	if @date == 'today'
	        #現在時刻を取る
	        #@now = Time.current
	        @now = DateTime.now
	        #翌日の5時を取る
	        @nextday = DateTime.now.beginning_of_day + 1.day + 5.hour
    	elsif @date == 'tomorrow'
	        #明日の5時を取る
	        #@now = Time.current
	        @tomorrow = DateTime.now.beginning_of_day + 1.day + 5.hour
	        #翌日の5時を取る
	        @nextday = @tomorrow + 1.day + 5.hour
    	elsif @date == 'next_sat'
    	elsif @date == 'next_sun'
    	end
    end

    def execute
    	#現在時刻から翌日の朝5時までのライブを取得
    	@events = Event.where(datetime: @now...@nextday)
    end
end