class Simulation

  def initialize data:
    self.init_clock(total_time: data[:simulation_time], offset: data[:delta_time])
    self.init_tills(queues_number: data[:active_queues], simulation_type: data[:simulation_type])
    self.init_out_interface simulation_type: data[:simulation_type]
  end

  def run
    while @clock.running?
      @output_interface.print
    end
    self.finish
  end

  protected

  def init_clock total_time:, offset:
    @clock = Clock.new(total_time: total_time, offset: offset)
  end

  def init_tills queues_number:, simulation_type:
    @tills = Array.new
    @attended_list = Array.new

  end

  def init_out_interface simulation_type:
  end

  def generate_customers
    #TODO md_ez
  end

  def finish
    #TODO ez
  end
end
