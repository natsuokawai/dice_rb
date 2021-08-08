class Dice
  def initialize(l1, l2, l3, l4, l5, l6)
    @labels = {
      l1: l1,
      l2: l2,
      l3: l3,
      l4: l4,
      l5: l5,
      l6: l6
    }

    @map = {
      T: :l1,
      N: :l5,
      S: :l2,
      E: :l3,
      W: :l4,
      B: :l6
    }
  end

  def top
    @map[:T]
  end

  def top_num
    @labels[top]
  end

  def move(direction)
    raise ArgumentError, 'direction must be any of N, S, E, W' unless %i[N S E W].include? direction

    case direction
    when :N
      @map[:N], @map[:T], @map[:S], @map[:B] = [@map[:T], @map[:S], @map[:B], @map[:N]]
    when :S
      @map[:N], @map[:T], @map[:S], @map[:B] = [@map[:B], @map[:N], @map[:T], @map[:S]]
    when :E
      @map[:E], @map[:T], @map[:W], @map[:B] = [@map[:T], @map[:W], @map[:B], @map[:E]]
    when :W
      @map[:E], @map[:T], @map[:W], @map[:B] = [@map[:B], @map[:E], @map[:T], @map[:W]]
    end

    @map
  end
end

labels = gets.chomp.split(' ')
directions = gets.chomp

dice = Dice.new(*labels)
directions.each_char do |direction|
  dice.move(direction.to_sym)
end
puts dice.top_num
