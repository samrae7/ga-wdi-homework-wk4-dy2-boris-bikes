require_relative './spec_helper'

describe Garage do

  let(:bike) {Bike.new}
  let(:garage) {Garage.new}
  let(:van) {Van.new (15)}

  it 'should be empty after we instantiate it' do
    expect(garage.bike_count).to eq 0
    
  end

  it 'should increase its count of bikes when it accepts bikes from the van' do
    van.accept_bike bike
    garage.accept_bike_from_van(bike,van)
    expect(garage.bike_count).to eq 1
  end

  it 'should reduce number of bikes in the van by one when it accepts a bike from the van' do
    van.accept_bike bike
    garage.accept_bike_from_van(bike, van)
    expect(van.no_of_bikes).to eq 0
  end

  it 'should decrease its count of bikes when it releases one to the van' do
    van.accept_bike bike
    garage.accept_bike_from_van(bike, van)
    garage.release_bike_to_van(bike, van)
    expect(garage.bike_count).to eq 0
  end

  it 'should increase number of bikes in the van when it releases a bike back to the van' do
    van.accept_bike bike
    garage.accept_bike_from_van(bike, van)
    garage.release_bike_to_van(bike,van)
    expect(van.no_of_bikes).to eq 1
  end




end

# The situation with the garage is very similar. What's the difference between a garage and a docking station? Only a van is supposed to take bikes out of a garage. Also, the bikes get fixed once they get to the garage. Otherwise, the garage is not much different from the station.