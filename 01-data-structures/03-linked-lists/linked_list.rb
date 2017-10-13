require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

def initialize
  @head = nil
  @tail = nil
end

  def empty?
    @head.nil? && @tail.nil?
  end

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    new_node = Node.new(node) #create a new node with node input
    if empty?
      @head = @tail = node
    else @tail.next = node
      @tail = node
    #  @size += 1
    end
  end


  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    until @head.next == @tail
      @head = @head.next
    end
    @tail = nil
  end

  # This method prints out a representation of the list.
  def print
     current_node = @head
     while current_node != nil
       puts "#{current_node.data}"
       current_node = current_node.next
     end
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    if @head == node
      @head = node.next
    #node = @head
    #until node.next == @tail
    #  node = node.next
    #end
    #node.next = nil
    #@tail = node
    end
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    new_node = Node.new(node)
    if empty?
      @head = @tail = node
    else node.next = @head
      @head = node
    #  @size =+1
    end
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front

  end
end
