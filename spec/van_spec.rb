require_relative './spec_helper'

describe Van do

  let(:van) {Van.new(15)}
  let(:bike) {Bike.new}
  # let(:station) {DockingStation.new({capacity: 20})}
  
  it 'should be empty when initialized' do
    expect(van.no_of_bikes).to eq 0
  end

  it 'should accept a bike' do 
    van.accept_bike bike
    expect(van.no_of_bikes).to eq 1
  end

  # it 'should accept a bike from the garage' do
  #   garage = Garage.new

  # end

  # it 'should reduce number of bikes in the station by one when it accepts one' do
  #   station = DockingStation.new({capacity: 20})
  #   station.dock(bike)
  #   van.accept_bike_from_station(bike,station)
  #   expect(station.bike_count).to eq 0
  # end


  it 'should release a bike' do
    van.accept_bike bike
    van.release_bike bike
    expect(van.no_of_bikes).to eq 0
  end

  it 'should not accept bikes when full' do
    15.times {van.accept_bike(Bike.new)}
    expect{ van.accept_bike bike }.to raise_error 'Van is full'
  end

end

# SPECS
# The van is moving broken bikes from the stations to the garage.

# Once they are fixed, the van moves them back to the stations.So the van must be able to accept the bikes at the source and release them at the destination.

# Obviously, the van must have some limit on the capacity, just like the station.

# However, the van isn't going to be very different from the station. It may have some additional methods to interact with the station and the garage but overall it's fairly similar to the station.
