class Clock

  def initialize total_time:, offset:
    @time = total_time + 1
    @initial_time = total_time
    @offset = offset
  end

  def running?
    got_time = @time > 0
    if got_time
      @time -= 1
      unless @time == @initial_time
        sleep @offset
        Gem.win_platform? ? (system "cls") : (system "clear")
      end
    end
    return got_time
  end

  def comming?
    (@initial_time - @time)%3
  end
end
