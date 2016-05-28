require_relative "mixed_dentition_analyser"
require_relative "messages"

puts Message.greetings

puts Message.message1

arch = gets.chomp #gets whether upper or lower arch from the user
arch.downcase!
space_analyser = MixedDentitionAnalysis.new#creates a new object of the Mixed Dentition Analyser class


case arch
when "u"
	puts Message.message2
	puts Message.message3
		 values = []
		 values << gets.to_i while values.length < 4
		 md_width_li = values.inject(:+)
		 space_required = space_analyser.space_analysed_upper(md_width_li)
		 puts Message.message4 + " #{space_required}mm"
		 puts Message.message5
		 exit
when "l"
	puts Message.message6
				method = gets.chomp
				method.downcase!
				case method
				when "t"
					puts Message.message3
								values = []
							  values << gets.to_i while values.length < 4
							  md_width_li = values.inject(:+)
								space_required = space_analyser.space_analysed_lower(md_width_li)
								puts Message.message4 + " #{space_required}mm"
								puts Message.message5
							  exit

				when "s"
					puts Message.message7
					values = []
					values << gets.to_i
					puts Message.message8
					values << gets.to_i
					final_values = values.inject(:+)
					space_required = space_analyser.space_analysed_stanley_and_kerber(final_values)
					puts Message.message4 + " #{space_required}mm"
					puts Message.message5
					exit

				else
					space_analyser.help_two
					exit
				end

else
	space_analyser.help_one
	exit
end
