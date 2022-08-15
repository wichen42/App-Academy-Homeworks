class LRUCache

    def initialize(size)
        @cache = []
        @max_size = size
    end
    
    def count
        return @cache.length
    end

    def add(el)
        if count < @max_size
            @cache << el
        else
            @cache = @cache[1..-1]
            @cache << el
        end
    end
    
    def show
        clone = @cache.dup
        return clone
    end

end

cache = LRUCache.new(3)
cache.add(1)
cache.add("hello, world")
cache.add(:test)
p cache
p cache.show