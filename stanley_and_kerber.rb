module StanleyAndKerber
	PREDICTION_TABLE = { 23 => 18.4,
		                   24 => 19.0,
		                   25 => 19.7,
		                   26 => 20.3,
		                   27 => 21.0,
		                   28 => 21.6,
		                   29 => 22.3,
		                   30 => 22.9 }
	#determines the space needed using the stanley and kerber prediction table
def stanley_and_kerber md_width_li_on_one_side
	unless (23..30) === md_width_li_on_one_side
		raise ArgumentError,
		      "The total sum of the mesio-distal width of the erupted Permanent Central and Lateral Incisors, and the unerupted Canine and Premolar, on one side of the mandible must be between 23-30mm "
	end

  PREDICTION_TABLE.fetch(md_width_li_on_one_side) #returns the space needed when supplied with the measured mesio-distal width of the incissors on one side of the mandible

end
end
