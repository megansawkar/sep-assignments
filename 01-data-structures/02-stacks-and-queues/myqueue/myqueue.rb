class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @head = @queue[0]
  end

  def enqueue(element)
    #add element to the end of the array
    @queue << element
    #define head and tail
    @head = @queue[0]
    @tail = @queue[-1]
  end

  def dequeue
    #delete element from the beginning of the array
    @queue.delete_at(0)
    #define head and tail
    @head = @queue[0]
    @tail = @queue[-1]
  end

  def empty?
    #return true is the queue is empty and false if the queue has anyone in it
    if @queue.all? {|x| x.nil?} #array is empty
      return true
    else
      return false
    end
  end
end
