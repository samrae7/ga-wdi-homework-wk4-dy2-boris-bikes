class Van

  def initialize capacity
    @bikes = []
    @capacity = capacity
  end

  def no_of_bikes
    @bikes.count
  end

  def accept_bike bike
    raise 'Van is full' if no_of_bikes == @capacity
    @bikes<< bike
  end

  def release_bike bike
    @bikes.delete bike
  end


end