class LetterChain

	def initialize
		@alphabet = ["A", "B", "D", "E", "F",
			"G", "H", "I", "J", "K", "L",
			"M", "N", "O", "P", "Q", "R",
			"S", "T", "U", "V", "W", "X",
			"Y", "Z"]
		@chain = [0,0]
	end

	def next
		last_value = to_s
		current_letter = @chain.length() -1
		if is_Z? @chain[current_letter]
			while is_Z? @chain[current_letter]
				@chain[current_letter] = 0
				current_letter -= 1
			end
			if current_letter >= 0
				@chain[current_letter] += 1
			end
			@chain<<0
		else
			@chain[current_letter] += 1
		end
		return last_value
	end

	def is_Z? value
		return @alphabet[value] == "Z"
	end

	def to_s
		string = ""
		@chain.each do |c|
			string += @alphabet[c]
		end
		return string
	end
end
