require_relative 'weather'

class Airport

  include Weather
  attr_accessor :size, :planes
  
  def initialize
    @size = 10
    @planes = []
  end
  
  def stormy?
    [:stormy, :sunny].sample
  end

  def land(plane)
    fail 'Can\'t land, airport full.' if full?
    fail 'Can\'t land, weather is bad.' if Weather.stormy?
    plane.status = :landed
    planes << plane
  end

  def take_off(plane)
    fail 'Can\'t take off, weather is bad.' if Weather.stormy?
    planes.delete(plane)
    plane.status = :flying
  end

  private

  def full?
    planes.length >= size
  end

end 
