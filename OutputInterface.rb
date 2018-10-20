load "Till.rb"
module OutputType
	MultiQueue = 1
	OnlyOneQueue = 2
end
class OutputInterface

	def initialize type
		@type = type
	end
	def print tills:
		letters = LetterChain.new
		outputText = []
		outputText<<""
		outputText<<""
		if @type == OutputType.MultiQueue
			max = getMax tills:tills
			for i in 1..max
				outputText<<""
			end
			tills.each do |till|
				outputText[0] += "|C | "
				outputText[1] += "|#{till.actualCustomer.to_s}| "
				count = 2
				space = " "*5
				for i in 0..max-1
					if i < till.queue.length
						outputText[i+2] += "|#{till.queue[i].to_s}| "
					else
						outputText[i+2] += space
					end

				end
			end
		elsif @type == OutputType.OnlyOneQueue
			tills.each do |till|
				outputText[0] += "|C | "
				outputText[1] += "|#{till.actualCustomer.to_s}| "
			end
			queue = tills[0].queue
			position = (tills.length/2)*5
			space = " "*position
			queue.each do |customer|
				outputText<<"|#{customer.to_s}| "
			end
		end
		outputText.each do |line|
			puts line
		end
	end
	def getMax tills:
		max = 0
		tills.each do |till|
			if till.queue.length > max
				max = till.queue.length
			end
		end
		return max
	end
end