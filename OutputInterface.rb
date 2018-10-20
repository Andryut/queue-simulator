load "Till.rb"

module OutputType
	MultiQueue = 1
	OnlyOneQueue = 2
end

class OutputInterface

	def initialize type:
		@type = type
	end

	def print tills:
		letters = LetterChain.new
		output_text = []
		output_text<<""
		output_text<<""
		if @type == OutputType.MultiQueue
			max = get_max tills:tills
			for i in 1..max
				output_text<<""
			end
			tills.each do |till|
				output_text[0] += "|CC| "
				output_text[1] += "|#{till.actual_customer.to_s}| "
				count = 2
				space = " "*5
				for i in 0..max-1
					if i < till.queue.length
						output_text[i+2] += "|#{till.queue[i].to_s}| "
					else
						output_text[i+2] += space
					end

				end
			end
		elsif @type == OutputType.OnlyOneQueue
			tills.each do |till|
				output_text[0] += "|CC| "
				output_text[1] += "|#{till.actual_customer.to_s}| "
			end
			queue = tills[0].queue
			position = (tills.length/2)*5
			space = " "*position
			queue.each do |customer|
				output_text<<"#{space}|#{customer.to_s}| "
			end
		end
		output_text.each do |line|
			puts line
		end
	end

	def get_max tills:
		max = 0
		tills.each do |till|
			if till.queue.length > max
				max = till.queue.length
			end
		end
		return max
	end
end
