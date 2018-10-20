class Simulation

  def initialize data:
    @clock = Clock.new(total_time: data[:simulation_time], offset: data[:delta_time])
    self.init_tills(active_tills: data[:active_tills], simulation_type: data[:simulation_type])
    @output_interface = OutputInterface.new type: data[:simulation_type]
  end

  def run
    while @clock.running?
      @output_interface.print tills: @tills
      if @clock.comming?
        self.generate_customers
      end
      self.checkout
    end
    self.finish
  end

  protected

  def init_tills active_tills:, simulation_type:
    @tills = Array.new
    @attended_list = AttendedList.new
    @queues = Array.new
    if simulation_type == OutputType::MultiQueue
      queues_number = active_tills
    elsif simulation_type == OutputType::OnlyOneQueue
      queues_number = 1
    end
    for i in 0...active_tills
      @queues[i%queues_number] =  CustomerQueue.new
      @tills.push Till.new(queue: @queues[i%queues_number], attended_list: @attended_list)
    end
    puts @queues.length
  end

  def checkout
    @tills.each do |till|
      till.checkout
    end
    @queues.each do |queue|
      queue.update
    end
  end

  def generate_customers
    random_creator = Random.new
    new_customers = random_creator.rand(0..5)
    (0...new_customers).each do
      queue = self.min_length_queue
      queue.add customer: Customer.new
    end
  end

  def min_length_queue
    queue = @queues[0]
    @queues.each do |a_queue|
      if queue.length > a_queue.length
        queue = a_queue
      end
    end
    return queue
  end

  def finish
    puts "#{@attended_list.wait_time_average}"
  end
end
