load "InputInterface.rb"
interface =	 InputInterface.new
interface.addIntInput message:"Enter a integer number"
interface.addEnumInput options: ["Patata", "potato"]
print "the values are #{interface.read.to_s}"