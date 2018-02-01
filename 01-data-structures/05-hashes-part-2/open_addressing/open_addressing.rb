require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    i = index(key, @items.size)

    while @items[i]
      @items[i += 1]
      if @items[i] && @items[i].value != value
      # if @items[i].empty? == false || @items[i].nil? == false
        resize
      end
    end


    # @items.each { |x|
    #   if @items[i] && @items[i].value != value
    #     resize
    #   end
    # }
    #
    @items[i] = Node.new(key, value)
  end

  def [](key)
    i = index(key, @items.size)
    @items[i].value
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    sum = 0
    key.each_char { |x|
      v = x.ord
      sum += v
    }
    sum % size
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
    #iterate through each item of the array
    @items.each { |x|
      # if index exists at that spot
      if index
        #increment to the next index location
        index += 1
        #if the next location is nil return that loctaion
        #otherwise, return -1
        if index.nil?
          return index
        else
          return -1
        end
      end
    }
  end

  # Simple method to return the number of items in the hash
  def size
    @items.count
  end

  # Resize the hash
  def resize
    new_size = @items.size * 2
    old_ary = @items
    new_ary = Array.new(new_size)

    old_ary.each { |x|
      if x
        i = index(x.key, @items.size)
        @items[i] = x
      end
    }
  end
end
