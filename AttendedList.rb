class AttendedList

  def initialize
    @list = Array.new
  end

  def add customer:
    @list << customer
  end

  def waitTimeAverage
    average = @list.sum/@list.length
    return average
  end
end
