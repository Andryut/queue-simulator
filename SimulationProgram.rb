class SimulationProgram

  def initialize
    @inputInterface = InputInterface.new
  end

  def start
    data = @inputInterface.read
    @simulation = Simulation.new(data: data)
    @simulation.run
  end
end
