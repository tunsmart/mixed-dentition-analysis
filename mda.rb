require_relative "mixed_dentition_analyser"

puts "Hello, am Jake, welcome to the Mixed dentition analysis application, can i know your name?"

name = gets.chomp #gets name from user



puts "Hi Dr #{name}, now tell me which arch you intend to work on, type 'U' for upper jaw and 'L' for lower....U or L , which is it?"

arch = gets.chomp #gets whether upper or lower arch from the user
arch.downcase!
space_analyser = MixedDentitionAnalysis.new#creates a new object of the Mixed Dentition Analyser class


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
		 space_required = space_analyser.space_analysed_upper(md_width_li)
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
								space_required = space_analyser.space_analysed_lower(md_width_li)
								puts "The space required for the unerupted canine and premolar is #{space_required}mm.
							        Thanks for using the mixed dentition analysis program"
							  exit

				when "s"
					puts "The Stanley and kerber Method will be used,
					you should have a Periapical radiograph with you, please follow the following instructions carefully"
					puts "Measure the mesio-distal width of the Permanent Mandibular Central and Lateral incissors"
					puts "and input the SUM of their mesio-distal width below"
					values = []
					values << gets.to_i
					puts "Finally measure the mesio-distal width of the erupting Canine and Premolar from the radiograph"
					puts "and input the SUM of their mesio-distal width below too"
					values << gets.to_i
					final_values = values.inject(:+)
					space_required = space_analyser.space_analysed_stanley_and_kerber(final_values)
					puts "The space required for the unerupted canine and premolar is #{space_required}mm.
								Thanks for using the mixed dentition analysis program"
					exit

				else
					space_analyser.help_two
					exit
				end

else
	space_analyser.help_one
	exit
end
