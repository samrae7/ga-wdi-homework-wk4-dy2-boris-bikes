class Garage

  def initialize capacity
    @bikes=[]
    @capacity = capacity
  end

  def bike_count
    @bikes.count 
  end

  def accept_bike_from_van(bike,van)
    raise "This bike isn't broken. Take it away" if bike.broken? == false
    raise 'Garage is full' if @bikes.count==25
    @bikes << bike
    van.release_bike bike
  end

  def release_bike_to_van (bike, van)
    raise "This bike isn't fixed yet. Leave it here" if bike.broken? == true
    van.accept_bike bike
    @bikes.delete(bike)
  end

  def fix_bike bike
    bike.fix
  end

end