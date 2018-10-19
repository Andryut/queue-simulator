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

	attr_accessor :error_message

	def initialize message:"Enter a value", error_message: "The value entered does not have the correct format"
		super message
		@error_message = error_message
	end

	def execute
		is_correct = false
		value = 0
		until is_correct
			print(message)
			input = gets.chomp()
			if InputFormat.is_i? input
				value = input.to_i
				is_correct = true
			else
				puts(@error_message)
			end
		end
		return value
	end
end

class InputEnumFormat < InputFormat

	attr_accessor :error_message, :options

	def initialize message:"Enter the number of the option you want", options:[], error_message: "The value entered is incorrect"
		super message
		@error_message = error_message
		@options = options
	end

	def execute
		puts message
		for i in 1..options.length
			puts ("#{i}) #{options[i-1]}")
		end
		is_correct = false
		value = 0
		until is_correct
			print(": ")
			input = gets.chomp()
			if is_valid? input
				value = input.to_i
				is_correct = true
			else
				puts(@error_message)
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
		@formats = {}
	end

	def add_int_input(message: "", symbol:)
		@formats.merge!({symbol => InputIntFormat.new(message: message)})
	end

	def add_enum_input(options: [], symbol:)
		@formats.merge!({symbol => InputEnumFormat.new(options: options)})
	end

	def read
		data = {}
		@formats.each do |key, value|
			data.merge!({key => value.execute})
		end
		return data
	end
end
