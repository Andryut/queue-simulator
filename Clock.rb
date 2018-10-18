class Clock

  def initialize totalTime:, offset:
    @time = totalTime
    @offset = offset
  end
  
  def running?
    gotTime = time > 0
    if gotTime
      totalTime -= 1
      sleep offset
    end
    return gotTime
  end
end
