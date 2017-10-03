class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
  end

  def push(item)
    #Add the item to the end(top) of the array
    @stack << item
    #redefine the top of the stack to be the last item in the array
    self.top = @stack[-1]
  end

  def pop
    #return the item that is being removed
    return @stack[-1]
    #remove that item from the end(top) of the array
    @stack[-1].delete
    #redefine the top of the stack to be the new last item in the array or nil if no items left
    if @stack.all? {|x| x.nil?} #array is empty
      self.top = nil
    else
      self.top = @stack[-1] #array has an item in it
    end
  end

  def empty?
    # if the array is empty or nil, return true, otherwise return false
    if @stack.all? {|x| x.nil?} #array is empty 
      return true
    else
      return false
    end
  end
end
