require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    # define the index using key and array size
    i = index(key, @items.size)

    if @items[i] && @items[i].value != value
      i = next_open_index(i)

      if i == -1
        resize
        i = index(key, @items.size)
      end
      p i
    end

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
    @items.each_with_index { |x, index|
      if x.nil?
        return index
      else
        return -1
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
    @items = Array.new(new_size)

    old_ary.each { |x|
      if x
        i = index(x.key, @items.size)
        @items[i] = x
      end
    }
  end
end
