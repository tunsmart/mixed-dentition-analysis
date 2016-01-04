class MixedDentitionAnalysis

	def initialize name
		@name = name
		@time = Time.now
	end

	#returns the amount of space required for the unerupted canines and premolars
	#by taking in the mesio-distal width of the lower incissors using the Tanaka and Johnston formular
	def tanaka_and_johnston_max md_width_li
		md_width_uecap = 11 + 0.5 * md_width_li
	end

	def tanaka_and_johnston_mand md_width_li
		md_width_uecap = 10.5 + 0.5 * md_width_li
	end
    #determines the space needed using the stanley and kerber prediction table
	def stanley_and_kerber md_width_li_on_one_side
		unless (23..30) === md_width_li_on_one_side
			raise ArgumentError,
			"The sum of the mesio-distal width on one side of the mandible must be between 23-30mm "
		end
		prediction_table = { 23 => 18.4,24 => 19.0,25 => 19.7,26 => 20.3,27 => 21.0,28 => 21.6,29 => 22.3,30 => 22.9}
		space_needed = prediction_table.fetch(md_width_li_on_one_side) #returns the space needed when supplied with the measured mesio-distal width of the incissors on one side of the mandible
	end
end

puts "Hello, am Jake, welcome to the Mixed dentition analysis application, can i know your name?"

name = gets.chomp #gets name from user
space_analyser = MixedDentitionAnalysis.new(name)#creates a new object of the Mixed Dentition Analyser class


puts "Hi Dr #{name}, now tell me which arch you intend to work on, type 'U' for upper jaw and 'L' for lower....U or L , which is it?"

arch = gets.chomp.downcase! #gets whether upper or lower arch from the user
  def help #defines a little logic to display to the user when they type in the incorrect arch option
  	print "You must type in either U or L"
  end
case arch
when "u"
	puts "Since you are working on the upper arch Dr #{name}, please follow the following instructions carefully"
	print "The Tanaka and Johnston method, will be used:
	   measure the mesio-distal width of each of the lower incissors, best done with the boley's guage, enter your values, one after the other below....."
		 values = []
		 while values.length < 4
			values << gets.to_i
		end
		md_width_li = values.inject(:+)
		space_analysed = space_analyser.tanaka_and_johnston_max(md_width_li)
		print "The space required for the unerupted canine and premolar is #{space_analysed}mm.
		Thanks for using the mixed dentition analysis program"
		exit
when "l"
	puts "honey"
else
	help
	exit
end
