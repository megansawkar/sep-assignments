# A line of people at an amusement park ride
# There is a front to the line, as well as a back.
# People may leave the line whenever they see fit and those behind them take their place.
class Line
  attr_accessor :members

  def initialize
    self.members = []
  end

  def join(person)
    members.push(person)
  end

  def leave(person)
    person_index = index(person)
    members.delete_at(person_index)
  end

  def front
    members[0]
  end

  def middle
    location = (members.length)/2
    return members[location]
  end

  def back
    members[-1]
  end

  def search(person)
    if members.include?(person)
      return person
    end
  end

  private

  def index(person)
    members.index(person)
  end

end
