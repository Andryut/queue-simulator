class SimulationProgram

  def initialize
    @input_interface = InputInterface.new
    @input_interface.add_enum_input(options: ["Single queue.", "Multiple queue"], :simulation_type)
    @input_interface.add_int_input(message: "Enter the number of active tills.", :active_queues)
    @input_interface.add_int_input(message: "Enter the time of the simulation in minutes.", :simulation_time)
    @input_interface.add_int_input(message: "Enter the delta of time in seconds.", :delta_time)
  end

  def start
    data = @input_interface.read
    @simulation = Simulation.new(data: data)
    @simulation.run
  end
end
