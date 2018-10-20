class Till

  attr_reader :attended_list, :queue, :actual_customer
  
  def initialize queue:, attended_list:
    @queue = queue
    @attended_list = attended_list
    @atention_delay = 0
    self.checkout
  end

  def checkout
    if @atention_delay == 0
      unless @actual_customer.nil?
        self.end_purchase
      else
        unless @queue.empty?
          self.next_purchase
        end
      end
    else
      @atention_delay -= 1
    end
  end

  protected
  def next_purchase
    @actual_customer = @queue.remove
    random_creator = Random.new
    @atention_delay = random_creator.rand(4..25)
  end

  def end_purchase
    @attended_list.add(customer: @actual_customer)
    unless @queue.empty?
      self.next_purchase
    else
      @actual_customer = nil
    end
  end
end
