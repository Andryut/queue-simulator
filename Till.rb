class Till
  attr_accessor :attendedList, :queue
  def initialize queue:, attendedList:
    @queue = queue
    @attendedList = attendedList
    @atentionDelay = 0
    self.checkout
  end

  def checkout
    if @atentionDelay == 0
      unless @actualCustomer.nil?
        self.endPurchase
      else
        unless @queue.empty?
          self.nextPurchase
        end
      end
    else
      @atentionDelay -= 1
    end
  end

  protected
  def nextPurchase
    @actualCustomer = @queue.remove
    randomCreator = Random.new
    @atentionDelay = randomCreator.rand(4..25)
  end

  def endPurchase
    @attendedList.add(customer: @actualCustomer)
    unless @queue.empty?
      self.nextPurchase
    else
      @acutalCustomer = nil
    end
  end
end
