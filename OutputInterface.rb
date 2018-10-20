module OutputType
	OnlyOneQueue = 1
	MultiQueue = 2
end

class OutputInterface

	def initialize type:
		@type = type
	end

	def print tills:
		@output_text = Array.new
		self.draw_head tills
		self.draw_body tills
		@output_text.each do |line|
			puts line
		end
	end

	def draw_head tills
		@max_length = LetterChain.max_length
		line = ""
		till_representation = self.fill_of("C", @max_length)
		tills.each do
			line += "|" +  till_representation + "| "
		end
		@output_text << line
		line = ""
		tills.each do |till|
			line += "|" +  till.actual_customer.to_s + self.fill_of(" ", @max_length - till.actual_customer.to_s.length) + "| "
		end
		@output_text << line
		@output_text << ""
	end

	def draw_body tills
		max_queue = get_max tills: tills
		for i in 0...max_queue
			line = ""
			tills.each do |till|
				unless till.queue[i].nil?
					line += "|" +  till.queue[i].to_s + self.fill_of(" ", @max_length - till.queue[i].to_s.length) + "| "
				else
					line += "|" +  self.fill_of(" ", @max_length) + "| "
				end
			end
			@output_text << line
		end
	end

	def fill_of char, length
		output = ""
		for i in 0...length
			output += char
		end
		return output
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
