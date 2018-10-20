class LetterChain

	def initialize
		@alphabet = ["A", "B", "D", "E", "F",
			"G", "H", "I", "J", "K", "L",
			"M", "N", "O", "P", "Q", "R",
			"S", "T", "U", "V", "W", "X",
			"Y", "Z"]
		@chain = [0]
		@@max_length = 1
	end

	def next
		last_value = self.to_s
		self.add
		return last_value
	end

	def self.max_length
		@@max_length
	end

	protected

	def add
		self.add_position 0
	end

	def add_position position
		unless @chain.length <= position
			@chain[position] = (@chain[position] + 1) % @alphabet.length
			if @chain[position] == 0
				if @chain.length == position+1
					@chain.push 0
					@@max_length += 1
				else
					self.add_position position+1
				end
			end
		end
	end

	def to_s
		string = ""
		for i in 0...@chain.length
			string += @alphabet[@chain[@chain.length-1-i]]
		end
		return string
	end
end
