class Garage

  def initialize
    @bikes=[]
  end

  def bike_count
    @bikes.count 
  end

  def accept_bike_from_van(bike,van)
    @bikes << bike
    van.release_bike bike
  end

  def release_bike_to_van (bike, van)
    @bikes.delete(bike)
    van.accept_bike bike
  end

end