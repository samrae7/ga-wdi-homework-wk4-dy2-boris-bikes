class Van

  def initialize capacity
    @bikes = []
    @capacity = capacity
  end

  def bike_count
    @bikes.count
  end

  def accept_bike bike
    raise 'Van is full' if bike_count == @capacity
    @bikes<< bike
  end

  def release_bike bike
    @bikes.delete bike
  end


end