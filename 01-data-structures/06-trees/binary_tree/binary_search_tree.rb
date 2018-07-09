require_relative 'node'

class BinarySearchTree

  def initialize(root)
    @root = root
    p @root
  end

  def insert(root, node)
    # assign root to temp variable for looping
    # while a root exists keep looping through until a locaition for the node is met

    temp = root

    while temp
      # first verify that the node to be inserted is not a duplicate. if it is, return it as there can be
      # no duplicates
      if temp.rating == node.rating
        return temp
      # otherwise, check to see if the node's rating is less then or greater than that of the current
      # temp rating
      elsif node.rating < temp.rating
        # if less than, then verify whether there is a node in the spot to the left. if there is, reset
        # the temp to that left node and start back over through the loop
        if temp.left
          temp = temp.left
        else
        # if there is no node in that spot, then insert the node in that location and return it to end
        # the loop
          temp.left = node
          return
        end
      elsif node.rating > temp.rating
        # repeat of above. if the node to be inserted has a higher rating than the current root node (temp),
        # then first check to see if there is a node in the spot to the right. if there is, reset the temp
        # to that right node and start back over through the loop
        if temp.right
          temp = temp.right
        else
        # if there is no node in that spot, then insert the node in that location and return it to end the
        # loop
          temp.right = node
          return
        end
        #finally, if there is no root, create a new tree using the node
      else
        return root = Node.new(node)
      end
    end
  end

  # Recursive Depth First Search
  def find(root, data)
  end

  def delete(root, data)
  end

  # Recursive Breadth First Search
  def printf(children=nil)
  end

  private


end
