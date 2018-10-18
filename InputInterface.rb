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

class InputEnumFormat < InputFormat
	attr_accessor :errorMessage, :options
	def initialize message:"Enter the number of the option you want", options:[], errorMessage: "The value entered is incorrect"
		super message
		@errorMessage = errorMessage
		@options = options
	end
	def execute
		puts message
		for i in 1..options.length
			puts ("#{i}) #{options[i-1]}")
		end
		isCorrect = false
		value = 0
		until isCorrect
			print(": ")
			input = gets.chomp()
			if is_valid? input
				value = input.to_i
				isCorrect = true
			else
				puts(@errorMessage)
			end
		end 
		return value
	end
	def is_valid? value
		if InputFormat.is_i? value
			if(value.to_i >0 and value.to_i <= options.length)
				return true
			end
		end
		return false
	end
end

class InputInterface
	def initialize
		@formats = []
	end
	def addIntInput message:""
		@formats.push(InputIntFormat.new message:message)
	end
	def addEnumInput options: []
		@formats.push(InputEnumFormat.new options:options)
	end
	def read
		data = []
		@formats.each do |inputFormat|
			data.push(inputFormat.execute)
		end
		return data
	end
end
