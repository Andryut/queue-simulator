class Till

  def initialize queue:, attendedList:
    @queue = queue
    @attendedList = attendedList
    unless queue.empty?
      self.nextPurchase
    end
  end

  def checkout
    @atentionDelay -= 1
    self.
  end

  protected
  def nextPurchase
    @actualCustomer = @queue.remove
    randomCreator = Random.new
    @atentionDelay = randomCreator.rand(4..25)
  end

  def endPurchase
    @attendedList << @actualCustomer
    unless queue.empty?
      self.nextPurchase
    end
  end
end
