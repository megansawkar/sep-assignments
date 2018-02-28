require_relative 'node'

class OpenAddressing
  def initialize(size)
    @items = Array.new(size)
  end

  def []=(key, value)
    # defines data in the hash
    # define the index using key and array size
    i = index(key, @items.size)

    # if an item exists and that item's value is not equal to the input value
    if @items[i] && @items[i].value != value
      # find the next open index and return it
      i = next_open_index(i)

      # if the next open index returns -1, resize the hash and set the index again according to input
      if i == -1
        resize
        i = index(key, @items.size)
      end
    end

    # input a new hash value at the index location returned
    @items[i] = Node.new(key, value)
  end

  def [](key)
    # allows to read data from the hash

    # identify the index of the key
    i = index(key, @items.size)
    # set a stop for the while loop
    stop = false
    # if the index spot exists and the key does not equal key
    while @items[i] && @items[i].key != key
      if i == 0
        # if i is index 0, stop the while loop
        stop = true
      end

      # iterate up until the key = the key
      i += 1

      # if i is greater than the array size and the while loop is still going
      if i >= @items.size && stop == false
        # set i to 0 and stop the while loop
        # iterate up
        i = 0
        stop = true
      end
    end

    # when an item is returned from the while loop, return that item's value
    if @items[i]
      @items[i].value
    end
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
    # first check the array in order from the index point to the last item in the array.
    # if there is no item in an index spot along the way, return that index
    for i in index...@items.size do
      if !@items[i]
        return i
      end
    end

  # second, if nothing is returned, check the array from the first index spot to the
  # input index. If an item doesn't exist in one of these index spots along the way,
  # return that index
    for i in 0...index do
      if !@items[i]
        return i
      end
    end

  # otherwise, if no index is returned, return -1
    -1
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
        @items[i]
        @items[i] = x
      end
    }
  end

  def state_of_hash
    item_index = 0
    @items.each { |x|
      if x
        p "Index: #{item_index}, Key: #{x.key}, Value: #{x.value}"
      else
        p "Index: #{item_index}, nil"
      end
      item_index += 1
    }
  end
end
