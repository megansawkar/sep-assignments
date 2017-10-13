class Node
  attr_accessor :next #stores the next node in the linked list
  attr_accessor :data #stores the value of the current list element 

  def initialize(data)
    @data = data
  end
end
