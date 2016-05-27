module TanakaAndJohnston
	#returns the amount of space required for the unerupted canines and premolars
	#by taking in the mesio-distal width of the lower incissors using the Tanaka and Johnston formular
	def tanaka_and_johnston_max md_width_li
		md_width_uecap = 11 + 0.5 * md_width_li
	end

	def tanaka_and_johnston_mand md_width_li
		md_width_uecap = 10.5 + 0.5 * md_width_li
	end
end
