require_relative 'pixel'

class Screen
  attr_accessor :width
  attr_accessor :height
  attr_accessor :matrix

  @@screen_hash = {}

  def initialize(width, height)
    @width = width
    @height = height
  end

  # Insert a Pixel at x, y
  def insert(pixel, x, y)
    # Check to see if x and y are valid data.
    if inbounds(x, y) == true
      screen_location = {:x => 'x', :y => 'y'}
      @@screen_hash[:screen_location] = pixel
    else
      nil
    end

  end

  def at(x, y)
    # Check to see if x and y are valid data.
    if inbounds(x, y) == true
      screen_location = {:x => 'x', :y => 'y'}
      # fetch hash method fetches the value of the key
      @@screen_hash.fetch(:screen_location)
    else
      nil
    end
  end

  private

  def inbounds(x, y)
    #handles when x, y are outside of width, height and integer scope - returns nil
    if x < 0 || y < 0
      return false
      puts "Invalaid data. Negative numbers are not valid locations on the screen."
    elsif x > @width || y > @height
      return false
      puts "Invalid data. Screen location is outside the screen."
    elsif x.integer? == false || y.integer? == false
      return false
      puts "Invalid data. Screen location can only be found using integers."
    else
      return true
    end
  end

end
