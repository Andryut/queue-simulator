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


