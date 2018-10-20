class Clock

  def initialize total_time:, offset:
    @time = total_time
    @offset = offset
  end

  def running?
    got_time = time > 0
    if got_time
      total_time -= 1
      sleep offset
    end
    return got_time
  end
end
