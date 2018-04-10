class SearchDateKeywordService

    def initialize(date_param, keyword_param)
        @date = date_param
        @keyword = keyword_param
    end

    def execute
        Event.where(date: (date_param), name: (keyword_param)).or(Event.where(date: (date_param), description: (keyword_param)))
    end
end