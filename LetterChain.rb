class LetterChain
	def initialize
		@alphabet = ["A", "B", "C", "D", "E", "F",
			"G", "H", "I", "J", "K", "L",
			"M", "N", "O", "P", "Q", "R",
			"S", "T", "U", "V", "W", "X",
			"Y", "Z"]
		@chain = [0,0]
	end
	def next
		lastValue = to_s
		currentLetter = @chain.length() -1
		if is_Z? @chain[currentLetter]
			while is_Z? @chain[currentLetter]
				@chain[currentLetter] = 0
				currentLetter -= 1
			end
			if currentLetter >= 0
				@chain[currentLetter] += 1
			end
			@chain<<0
		else
			@chain[currentLetter] += 1
		end
		return lastValue
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