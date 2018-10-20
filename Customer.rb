load "LetterChain.rb"
class Customer
  @@identifier = LetterChain.new
  def initialize
    @waitingTime = 0
    @id = @@identifier.next
  end

  def enterAQueue queues:
    queue = shortestQueue(queues: queues)
    queue.add(customer: self)
  end

  def update
    @waitingTime += 1
  end

  protected
  def shortestQueue queues:
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
