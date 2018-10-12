class Queue < Array

  def add customer:
    self << customer
  end

  def remove
    firstCustomerInQueue = self.first
    self.delete(0)
    return firstCustomerInQueue
  end

  def update
    self.each do |customer|
      customer.update
    end
  end
end
