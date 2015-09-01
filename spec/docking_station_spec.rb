require_relative './spec_helper'

describe DockingStation do

  def fill_station station
    20.times { station.dock(Bike.new) }
  end

  let(:station) { DockingStation.new({capacity: 20}) }
  let(:bike) { Bike.new }
  let(:van) {Van.new (15)}

  it 'should be empty after we build it' do
    expect(station.bike_count).to eq 0
  end

  it 'should be able to dock a bike' do
    station.dock(bike)
    
    expect(station.bike_count).to eq 1
  end

  it 'should be able to release a bike' do
    station.dock(bike)
    station.release(bike)

    expect(station.bike_count).to eq 0
  end

  it 'should know when it has reached capacity' do
    fill_station station

    expect(station.full?).to be true
  end

  it 'should not accept a bike if it\'s full' do
    fill_station station

    expect{station.dock(bike)}.to raise_error 'Station is full'
  end

  it 'should provide a list of available bikes' do
    working_bike, broken_bike = Bike.new, Bike.new
    broken_bike.break
    station.dock(working_bike)
    station.dock(broken_bike)

    expect(station.available_bikes).to eq [working_bike]
  end

  it 'should decrease its number of bikes by one when it releases one to the van' do
    # van = Van.new (15)
    station.dock(bike)
    station.release_bike_to_van(bike, van)
    expect(station.bike_count).to eq 0
  end

  it 'should increase number of bikes in van by one when it release a bike to the van' do
    # van = Van.new (15)
    station.dock(bike)
    station.release_bike_to_van(bike, van)
    expect(van.bike_count).to eq 1
  end

  it 'should increase its number of bikes by one when it accepts one from the van' do
    # van = Van.new (15)
    van.accept_bike bike
    station.accept_bike_from_van(bike, van)
    expect(station.bike_count).to eq 1
  end 

  it 'should decrease number of bikes in the van by one when it accepts a bike from it' do
    van.accept_bike bike
    station.accept_bike_from_van(bike, van)
    expect(van.bike_count).to eq 0
  end

end






















