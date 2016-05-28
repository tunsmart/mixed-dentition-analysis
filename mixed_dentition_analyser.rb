require_relative "tanaka_and_johnston"
require_relative "stanley_and_kerber"


class MixedDentitionAnalysis
	include TanakaAndJohnston
	include StanleyAndKerber


	def space_analysed_stanley_and_kerber(values)
		self.stanley_and_kerber(values)
	end

	def space_analysed_upper(values)
		self.tanaka_and_johnston_max(values)
	end

	def space_analysed_lower(values)
		self.tanaka_and_johnston_mand(values)
	end

	def help_one #defines a little logic to display to the user when they type in the incorrect arch option
  	puts "You must type in either U or L"
  end

	def help_two #defines a little logic to display to the user when they type in the incorrect method option
  	puts "You must type in either T or S"
  end


end
