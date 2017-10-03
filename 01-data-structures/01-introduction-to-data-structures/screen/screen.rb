require_relative 'pixel'

class Screen
  attr_accessor :width
  attr_accessor :height
  attr_accessor :matrix

  def initialize(width, height)
    @width = width
    @height = height
    @screen_hash = {}
  end

  # Insert a Pixel at x, y
  def insert(pixel, x, y)
    # Should I run inbounds here too?
    inbounds(x, y)
    
    :screen_location = x, y

    screen_hash[:screen_location] = pixel
  end

  def at(x, y)
    inbounds(x, y)

    # Do I have to redefine here?
    :screen_location = x, y

    # fetch hash method fetches the value of the key
    screen_hash.fetch(:screen_location)

    #if x, y are not inside width and height scope, inbounds
  end

  private

  def inbounds(x, y)
    #handles when x, y are outside of width, height and integer scope - returns nil
    if x < 0 || y < 0
      return nil
    elsif x > @width || y > @height
      return nil
    elsif x.integer? == false || y.integer? == false
      return nil
    else
      return (x, y)
    end
  end

end
