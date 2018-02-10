require_relative 'linked_list'
require_relative 'node.rb'

class SeparateChaining
  attr_reader :max_load_factor

  def initialize(size)
    # define max load factor, create the array for storage, create a variable to count total items in the hash
    @max_load_factor = 0.7
    @items = Array.new(size)
    @count = 0
  end

  def []=(key, value)
    # purpose: define/input @items[key] = value

    # create a separate variable to track the total items in the hash - add an items to
    # that variable when adding an item using the key, value (when accessing this method)

    # first, because accessing this method, add to the total items in the hash
    @count += 1

    # with that number, determine if the hash needs to be re-sized - is the current load factor
    # higher than the max load factor?
    if load_factor > @max_load_factor
      resize
    end

    # after determining if resize is needed or not needed (and resizing) add an item to the hash
    # set the index
    # if an item doesn't exist at that index, create a new linked list
    i = index(key, @items.size)

    if !@items[i]
      @items[i] = LinkedList.new()
    end

    # add a node to the index point
    @items[i].add_to_tail(Node.new(key, value))
  end

  def [](key)
    # purpose: define/access the value of the key

    # get index and assign to oldHead
    # set array[index] to a link that contains key, value
    i = index(key, @items.size)
    current_node = @items[i].head

    # if current_node exists, set current_node as the second link in the chain
    if current_node && current_node.key != key
      current_node = current_node.next
    end

    # return current_node.value
    if current_node
      current_node.value
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
    return sum % size
  end

  # Calculate the current load factor
  def load_factor
    # load factor = total hash items over total items in array
    return @count/@items.size.to_r
  end

  # Simple method to return the number of items in the hash
  def size
    @items.count
  end

  # Resize the hash, doubles the size of the array and assigns
  #   items to proper location when invoked
  def resize
    new_size = @items.size * 2
    old_ary = @items
    @items = Array.new(new_size)

    old_ary.each { |x|
      # if an item exists at all
      if x
        # create a current node variable at the head of that linked list
        current_node = x.head
        # while on that node
        while current_node
          # set the index of that node
          i = index(current_node.key, @items.size)
          # if there is no item inserted at that index, create a new linked list at that index
          # for inserting the node
          if !@items[i]
            @items[i] = LinkedList.new()
          end

          # insert the node of with the current key and value onto the linked list
          @items[i].add_to_tail(Node.new(current_node.key, current_node.value))
          # move the current node to the node that was just inserted
          current_node = current_node.next
        end
      end
    }
   end
end
