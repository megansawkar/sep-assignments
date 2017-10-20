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
    #create a new node with node input
    if empty?
      @head = @tail = node
    else @tail.next = node
      @tail = node
    end
  end


  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    #identify the tail by iterating through each element in the list from the head on until the 'next'
    #node = the tail. Make the node before the tail the new tail, and the next node = to nil.
    current_node = @head
    while current_node.next
      prev = current_node
      current_node = current_node.next
    end

    if prev
      prev.next = nil
      @tail = prev
    else
      @tail = nil
      @head = nil
    end


    # current_node = @head
    # until current_node.next == @tail
    #   current_node = @tail
    #   current_node.next = nil
    # end

    # current_node = @head
    # until current_node.next == @tail
    #   current_node = current_node.next
    # end
    # current_node.next = nil
  end

  # This method prints out a representation of the list.
  def print
    #run a loop that prints out every node from the head until the node = nil
     current_node = @head
     while current_node != nil
       puts "#{current_node.data}"
       current_node = current_node.next
     end
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    #iterate through each node in the list. Compare each node to the input node. If and when the
    #current node and input node are equal, change the pointer to skip over that node (the previous
    #node needs to point to the next node).

    current_node = @head
    while current_node && current_node != node
      prev = current_node
      current_node = current_node.next
    end

    if prev
      if !current_node.next
        @tail = prev
      end
      prev.next = current_node.next
    else
      @head = current_node.next
    end

    # current_node = @head
    # if current_node = node
    #   @head = current_node.next
    # else
    #   until current_node.next = node
    #     current_node = current_node.next
    #   end
    #   current_node.next = current_node.next.next
    # end
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    if empty?
      @head = @tail = node
    else node.next = @head
      @head = node
    end
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    #identify the head of the list. Change the head to be the next element in the list.
    @head = @head.next
  end
end
