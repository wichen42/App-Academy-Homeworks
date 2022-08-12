fish_arr = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

def sluggish_octopus(arr)
    longest_fish = nil
    (0...arr.length).each do |i|
        (i+1...arr.length).each do |j|
            arr[i].length > arr[j] ? longest_fish = arr[i] : longest_fish = arr[j]
        end
    end
    return longest_fish
end

#p sluggish_octopus(fish_arr)

def dominant_octopus(fish_arr)
    return fish_arr if fish_arr.length <= 1
    mid = fish_arr.length / 2
    left = dominant_octopus(fish_arr.take(mid), &prc)
    right = dominant_octopus(fish_arr.drop(mid), &prc)
    merge(left, right, &prc)
end

def merge(left, right, &prc)
    prc = Proc.new {|x,y| x <=> y} unless block_given?
    output = []
    until left.empty? || right.empty?
        case prc.call(left.first, right.first)
        when -1
            output << left.shift
        when 0
            output << left.shift
        when 1
            output << right.shift
        end
    end
    output + left + right
end

p dominant_octopus(fish_arr).last

def clever_octopus(fish_arr)
    longest = ""
    fish_arr.each {|fish| longest = fish if fish.length > longest.length}
    return longest
end

