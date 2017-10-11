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
    #remove that item from the end(top) of the array
    name = @stack[-1]

    @stack.delete_at(-1)
    self.top = @stack[-1]
    return name
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
