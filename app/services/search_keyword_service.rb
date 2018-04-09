class SearchKeywordService

    def initialize(date_param,keyword_param)
        @keyword = keyword_param
    end

    def execute
        Event.search(@keyword).result
    end
end
