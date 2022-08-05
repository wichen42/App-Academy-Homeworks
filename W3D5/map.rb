class Map # 

    def initialize(n=1)
        @map = []
    end

    def set(key,value)
        if @map.any? {|pair| pair[0] == key}
            @map.each do |sub|
                if sub[0] == key
                sub[1] = value
                end
            end
        else
            @map << [key, value]    
        end
    end

    def get(key)
        @map.each {|pair| return pair[0] if pair[0] == key} 
    end

    def delete(key)
        @map.each_with_index {|pair, i| @map.delete_at(i) if pair[0] == key }
    end

    def show
        @map.each {|pair| return pair if pair[0] == key} 
    end


end