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

    #iterate through each node and track the node that on and the previous node
    current_node = @head
    while current_node.next
      prev = current_node
      current_node = current_node.next
    end

    #identify when the next node is nil, then set the tail to be the previous node (the node before the
    #node that are currently on)
    if prev
      prev.next = nil
      @tail = prev
    else
    #otherwise, if there is no previous or next, list is empty
      @tail = nil
      @head = nil
    end
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
    #iterate through each node from the head moving forward as long as the current node does not equal
    #the input node. Set the current node to a variable of previous node to track the previous node.
    #Then set the variable of current node to the next node to keep moving forward.
    while current_node && current_node != node
      prev = current_node
      current_node = current_node.next
    end

    if prev #look at the previous node
      if !current_node.next #if there is no next node
        @tail = prev #delete the last node by setting the tail to the previous node
      end
      prev.next = current_node.next # otherwise delete the middle node by skipping the current node
      #and setting the previous node to equal the node after the current node
    else
      @head = current_node.next #otherwise delete the head by setting the head equal to the next node
    end
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
