class SearchEventService

    def initialize(date_param)
        @date = date_param
    end

    def execute
        if @date == 'today'
            return @events = Event.where(live_date: (Date.today.beginning_of_day)..(Date.today.end_of_day + 1860))
        elsif @date == 'tomorrow'
            return @events = Event.where(live_date: (Date.tomorrow.beginning_of_day)..(Date.tomorrow.end_of_day + 1860))
        elsif @date == 'next_sat'
            if Date.today.saturday?
            else
                return @events = Event.where(live_date: (Date.today.beginning_of_day)..(Date.today.end_of_day + 1860))
            end
        elsif @date == 'next_sun'
            if Date.today.sunday?
            else
                return @events = Event.where(live_date: (Date.today.beginning_of_day)..(Date.today.end_of_day + 1860))
            end
        elsif @date == 'next_day'
            return @events = Event.where(live_date: (Date.today.next_day.beginning_of_day)..(Date.today.next_day.end_of_day + 1860))
        elsif @date == 'prev_day'
            return @events = Event.where(live_date: (Date.today.prev_day.beginning_of_day)..(Date.today.prev_day.end_of_day + 1860))
        end

        @events

    end
end
