load "InputInterface.rb"
interface =	 InputInterface.new
interface.add_int_input message:"Enter a integer number"
interface.add_enum_input options: ["Patata", "potato"]
print "the values are #{interface.read.to_s}"
