class AttendedList

  def initialize
    @list = Array.new
  end

  def add client:
    @list << client
  end

  def waitTimeAverage
    @list.sum/@list.length
  end
end
