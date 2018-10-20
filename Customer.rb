load "LetterChain.rb"

class Customer

  def initialize
    @waiting_time = 0
    @@identifier = LetterChain.new
    @id = @@identifier.next
  end

  def enter_a_queue queues:
    queue = shortest_queue(queues: queues)
    queue.add(customer: self)
  end

  def update
    @waiting_time += 1
  end

  protected
  def shortest_queue queues:
    short = queues.first
    queues.each do |queue|
      if short.length > queue.length
        short = queue
      end
    end
    return short
  end
  
  def to_s
    return id
  end
end
