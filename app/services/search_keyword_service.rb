class SearchKeywordService

    def initialize(keyword_param)
        @keyword = keyword_param
    end

    def execute
        @events = Event.where(‘title = ? or description = ?‘, @keyword, @keyword)

        @events
    end
end