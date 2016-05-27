require_relative "tanaka_and_johnston"
require_relative "stanley_and_kerber"





class MixedDentitionAnalysis
	include TanakaAndJohnston
	include StanleyAndKerber

	def initialize(values)
		@values = values
	end

	def space_analysed_upper
		self.tanaka_and_johnston_max(@values)
	end

	def space_analysed_lower
		self.tanaka_and_johnston_mand(@values)
	end

	def help_one #defines a little logic to display to the user when they type in the incorrect arch option
  	puts "You must type in either U or L"
  end

	def help_two #defines a little logic to display to the user when they type in the incorrect method option
  	puts "You must type in either T or S"
  end


end

puts "Hello, am Jake, welcome to the Mixed dentition analysis application, can i know your name?"

name = gets.chomp #gets name from user



puts "Hi Dr #{name}, now tell me which arch you intend to work on, type 'U' for upper jaw and 'L' for lower....U or L , which is it?"

arch = gets.chomp #gets whether upper or lower arch from the user
arch.downcase!


case arch
when "u"
	puts "Since you are working on the upper arch Dr #{name},
	      please follow the following instructions carefully"
	puts "The Tanaka and Johnston method, will be used:
	      measure the mesio-distal width of each of the lower incissors,
		    best done with the boley's guage, enter your values, one after the other below....."
		 values = []
		 values << gets.to_i while values.length < 4
		 md_width_li = values.inject(:+)
		 space_analyser = MixedDentitionAnalysis.new(md_width_li)#creates a new object of the Mixed Dentition Analyser class
		 space_required = space_analyser.space_analysed_upper
		 puts "The space required for the unerupted canine and premolar is #{space_required}mm.
		       Thanks for using the mixed dentition analysis program"
		 exit
when "l"
	puts "To analyze space needed in the Mandible, the Tanaka and Johnston
	      or Stanley and Kerbers methods, can be used. type T for Tanaka, or S for Stanley"
				method = gets.chomp
				method.downcase!
				case method
				when "t"
					puts "The Tanaka and Johnston method, will be used:
					      measure the mesio-distal width of each of the lower incissors,
						    best done with the boley's guage, enter your values, one after the other below....."
								values = []
							  values << gets.to_i while values.length < 4
							  md_width_li = values.inject(:+)
							  space_analyser = MixedDentitionAnalysis.new(md_width_li)
								space_required = space_analyser.space_analysed_lower
								puts "The space required for the unerupted canine and premolar is #{space_required}mm.
							        Thanks for using the mixed dentition analysis program"
							  exit

				when "s"
				else
					space_analyser.help_two
					exit
				end

else
	space_analyser.help_one
	exit
end
