class AttendedList

  def initialize
    @list = Array.new
  end

  def add customer:
    @list << customer
  end

  def wait_time_average
    average = @list.sum/@list.length
    return average
  end
end
