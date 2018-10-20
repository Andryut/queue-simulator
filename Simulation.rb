class Simulation

  def initialize data:
    @simulation_types = {:single_queue => 1, :multiple_queues => 2}
    @simulation_type = data[:simulation_type]
    @active_queues = data[:active_queues]
    @simulation_time = data[:simulation_time]
    @delta_time = data[:delta_time]
  end

  def run
    self.init_clock
    while @clock.running?
      @output_interface.print
    end
    self.finish
  end

  protected

  def init_clock
    @clock = Clock.new(total_time: @simulation_time, offset: @delta_time)
    @clock.start
  end

  def init_tills
  end

  def init_out_interface
  end



  def generate_customers
  end

  def finish
  end
end
