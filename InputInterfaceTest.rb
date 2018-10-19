load "InputInterface.rb"
interface =	 InputInterface.new
interface.add_int_input(message: "Enter a integer number", key: :number)
interface.add_enum_input(options: ["Patata", "potato"], key: :option)
print "the values are #{interface.read.to_s}"
