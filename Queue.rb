class Queue < Array

  def add element:
    self << element
  end

  def remove
    element = self.first
    self.delete(0)
    return element
  end

  def update
    self.each do |customer|
      customer.update
    end
  end
end
