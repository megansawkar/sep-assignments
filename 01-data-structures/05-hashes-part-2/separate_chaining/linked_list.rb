require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @head = nil
    @tail = nil
  end

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    if @head == nil
      @head = node
    else
      @tail.next = node
    end
    @tail = node
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
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
    @head = @head.next
  end
end
