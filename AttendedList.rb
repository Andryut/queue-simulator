class AttendedList

  def initialize
    @list = Array.new
  end

  def add client:
    @list << client
  end

  def waitTimeAverage
    average = @list.sum/@list.length
    return average
  end
end
