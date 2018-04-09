class SearchDateKeywordService

    def initialize(date_param, keyword_param)
        @date = date_param
        @keyword = keyword_param
    end

    def execute
        Event.where(live_date: (date_param), live_name: (keyword_param)).or(Event.where(live_date: (date_param), live_remarks: (keyword_param)))
    end
end