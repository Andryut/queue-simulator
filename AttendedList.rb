class AttendedList

  def initialize
    @list = Array.new
  end

  def add customer:
    @list << customer.waiting_time
  end

  def wait_time_average
    unless @list.empty?
      average = @list.sum.to_f/@list.length.to_f
    else
      average = 0
    end
    return average
  end
end
