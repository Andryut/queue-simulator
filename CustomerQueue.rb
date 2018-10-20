class CustomerQueue < Array

  def add customer:
    self << customer
  end

  def remove
    first_customer_in_queue = self.first
    self.delete_at 0
    return first_customer_in_queue
  end

  def update
    self.each do |customer|
      customer.update
    end
  end
end
