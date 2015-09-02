require_relative './spec_helper'

describe Garage do

  let(:bike) {Bike.new}
  let(:garage) {Garage.new (25)}
  let(:van) {Van.new (15)}

  def put_broken_bikes_in_garage(bike, van)
    bike.break
    van.accept_bike bike
    garage.accept_bike_from_van(bike,van)
  end

  it 'should be empty after we instantiate it' do
    expect(garage.bike_count).to eq 0
    
  end

  it 'should increase its count of bikes when it accepts bikes from the van' do
    put_broken_bikes_in_garage(bike, van)
    expect(garage.bike_count).to eq 1
  end

  it 'should reduce number of bikes in the van by one when it accepts a bike from the van' do
    put_broken_bikes_in_garage(bike, van)
    expect(van.bike_count).to eq 0
  end

  it 'should decrease its count of bikes when it releases one to the van' do
    put_broken_bikes_in_garage(bike, van)
    bike.fix
    garage.release_bike_to_van(bike, van)
    expect(garage.bike_count).to eq 0
  end

  it 'should increase number of bikes in the van when it releases a bike back to the van' do
    put_broken_bikes_in_garage(bike, van)
    bike.fix
    garage.release_bike_to_van(bike,van)
    expect(van.bike_count).to eq 1
  end

  it 'should fix bikes' do
    garage.fix_bike bike   
    expect(bike.broken?).to eq false  
  end

  it 'should stop accepting bikes when it is full' do
      25.times do
        bike = Bike.new
        put_broken_bikes_in_garage(bike, van)
      end
      expect do
        put_broken_bikes_in_garage(bike, van)
      end.to raise_error 'Garage is full'
  end

  it 'should only accept broken bikes' do
    expect{garage.accept_bike_from_van(bike,van)}.to raise_error "This bike isn't broken. Take it away"
  end

  it 'should only release fixed bikes' do
    put_broken_bikes_in_garage(bike, van)
    expect{garage.release_bike_to_van(bike, van) }.to raise_error "This bike isn't fixed yet. Leave it here"
  end

end

# SPEC - The situation with the garage is very similar. What's the difference between a garage and a docking station? Only a van is supposed to take bikes out of a garage. Also, the bikes get fixed once they get to the garage. Otherwise, the garage is not much different from the station.