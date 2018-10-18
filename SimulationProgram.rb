class SimulationProgram

  def initialize
    @input_interface = InputInterface.new
  end

  def start
    data = @input_interface.read
    @simulation = Simulation.new(data: data)
    @simulation.run
  end
end
