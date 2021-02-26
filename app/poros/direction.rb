class Direction
  attr_reader :time

  def initialize(data)
    @time = data[:route][:realTime]
    @legs = data[:route][:legs]
  end

  def instructions
    @legs.flat_map do |leg|
      leg[:maneuvers].map do |maneuver|
        maneuver[:narrative]
      end
    end
  end
end