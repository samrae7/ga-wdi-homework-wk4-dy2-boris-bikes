class DockingStation

  DEFAULT_CAPACITY = 5

  def initialize options = {}
    # @capacity = options[:capacity]
    @capacity = options.fetch(:capacity, DEFAULT_CAPACITY)
    @bikes = []
  end

  def bike_count
    @bikes.count
  end

  def dock bike
    raise 'Station is full' if full?
    @bikes << bike
  end

  def release bike
    @bikes.delete bike
  end

  def full?
    bike_count == @capacity
  end

  def available_bikes
    @bikes.reject { |bike| bike.broken? }
  end

  def release_bike_to_van (bike,van)
    van.accept_bike bike
    release bike
  end

end





















