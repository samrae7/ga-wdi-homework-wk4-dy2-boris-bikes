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
    raise "This bike isn't broken. It should stay at the station" if  !bike.broken?
    van.accept_bike bike
    release bike
  end

  def accept_bike_from_van (bike,van)
    raise 'This bike is still broken. Take it to the garage to get it fixed.' if bike.broken?
    raise 'Station is full' if full?
    dock bike
    van.release_bike bike
  end

end





















