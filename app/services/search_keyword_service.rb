class SearchEventService

    def initialize(keyword_param)
        @keyword = keyword_param
    end

    def execute
        Event.search(@keyword).result
    end
end
