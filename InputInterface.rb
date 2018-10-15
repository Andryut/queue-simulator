class InputFormat
	attr_accessor :message
	def initialize message
		@message = message+": "
	end
	def execute
		print(message)
		return gets.chomp()
	end
	def self.is_i? value
		if !/\A\d+\z/.match(value)
			return false
		else
			return true
		end 
	end
end

class InputIntFormat < InputFormat
	attr_accessor :errorMessage
	def initialize message:"Enter a value", errorMessage: "The value entered does not have the correct format"
		super message
		@errorMessage = errorMessage
	end
	def execute
		isCorrect = false
		value = 0
		until isCorrect
			print(message)
			input = gets.chomp()
			if InputFormat.is_i? input
				value = input.to_i
				isCorrect = true
			else
				puts(@errorMessage)
			end
		end 
		return value
	end
end

