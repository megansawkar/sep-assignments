class HashClass
  # establish/create an array for storing key, value pairs
  # check to make sure that the new value is not the same as a previous HashItem or Value
  # if it is the same, resize the array
  # create a new HashItem using the index(key, value) pair in the array
  # when resizing the array, create a temporary array for storage of the old array data. create a new array
  #   that is 2x the size of the old array. iterate through each item in the old array and reassign it a spot
  #   in the new array using the index method, the key of that item and the size of the new array.

  def initialize(size)
    # initialize the hash class by creating an array for storage of all the key, value pairs
    @items = Array.new(size)
  end

  def []=(key, value)
    # insert a new key, value pair into the array
    # check to see that that there isn't an existing key, value pair that matches the one being input
    # if there is, resize the array
    # if there isn't, input the new HashItem with the key value pair

    # def []= end - defines a method for element reference and element assignment -
    # in this case assigning the key, value pair as an element in the array.

    # before adding the item, loop through the array. for each item, check to see if the key and value
    # match the key and value of an item already in the array.
    # @items[i] = the Hash item itself. @items[i].value = the ascii value of the Hash item (or the index)
    # if the HashItem and the ascii value of an item in the array do not match the input value, then resize
    @items.each { |x|
      if @items[index(key, @items.size)] && @items[index(key, @items.size)].value != value
        resize
      end
    }

    #input a new HashItem - the array value at the index is a new HashItem with the key and value pair
    # array[index] = new item in an array
    @items[index(key, @items.size)] = HashItem.new(key, value)
  end


  def [](key)
    #uses the key, the index method and the size of the array to access the value in a given HashItem location
    #returns the sum of the ascii values of a string
    return @items[index(key, @items.size)].value
  end

  def resize
    # assign the old array to a new variable for storing and accessing
    new_size = @items.size * 2
    old_ary = @items
    # create a new array using the same variable name, only make it 2x a big
    @items = Array.new(new_size)

    #iterate through each item in the old array and assign it to the new array
    old_ary.each { |x|
      #if a value exists
      if x
        #re-assign that item a new spot using the index.
        #make sure the location in the array = the value of the item being looked at
        @items[index(x.key, @items.size)] = x
      end
    }

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

  # Simple method to return the number of items in the hash
  def size
    @items.count
  end

end
