class Board
  attr_accessor :cups

  def initialize(name1, name2)
    @cups = Array.new(14) {Array.new(4) {:stone}}
    @cups[6], @cups[13] = [], []
    @player1 = name1
    @player2 = name2
  end

  def place_stones
    # helper method to #initialize every non-store cup with four stones each
  end

  def valid_move?(start_pos)
    if start_pos > 13 || start_pos < 0 || start_pos == 6 || start_pos == 13
      raise "Invalid starting cup"
      return false
    elsif @cups[start_pos].empty?
      raise "Starting cup is empty"
      return false
    end
    return true
  end

  def make_move(start_pos, current_player_name)
    num_stones = @cups[start_pos].count
    @cups[start_pos] = []
    i = start_pos % 14
    until num_stones == 0
      i = (i+1) % 14
      next if i == 6 && current_player_name == @player2
      next if i == 13 && current_player_name == @player1
      @cups[i] << :stone
      num_stones-=1
    end
    self.render
    next_turn(i)
  end

  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    return :prompt if ending_cup_idx == 6 || ending_cup_idx == 13
    if ending_cup_idx == 1
      :switch
    else
      return ending_cup_idx
    end
  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    front = @cups[0...6].empty?
    back = @cups[7...13].empty?
    return front || back
  end

  def winner
  end
end
