class SearchDatetimeService

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
        if @date == 'today'
            # Extract Event data from now until tomorrow 5am / 現在時刻から明日の朝5時までのデータを取得
            return @events = Event.where(datetime: @now...@nextday)
        elsif @date == 'tomorrow'
            # Extract Event data on tomorrow (5am to 5am next day) / 明日のデータを取得(朝5時〜翌日朝5時)
            return @events = Event.where(datetime: @tomorrow...@nextday)
        elsif @date == 'next_sat'
            if Date.today.saturday?
            else
                return @events = Event.where(date: (Date.today.beginning_of_day)..(Date.today.end_of_day + 1860))
            end
        elsif @date == 'next_sun'
            if Date.today.sunday?
            else
                return @events = Event.where(date: (Date.today.beginning_of_day)..(Date.today.end_of_day + 1860))
            end
        elsif @date == 'next_day'
            return @events = Event.where(date: (Date.today.next_day.beginning_of_day)..(Date.today.next_day.end_of_day + 1860))
        elsif @date == 'prev_day'
            return @events = Event.where(date: (Date.today.prev_day.beginning_of_day)..(Date.today.prev_day.end_of_day + 1860))
        end

        @events

    end
end