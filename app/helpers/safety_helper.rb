module SafetyHelper

	def get_array_aforo(inicial)
		ranks = []
		(500.downto(Integer(inicial))).each do |n|
  			ranks << "#{n}"
  		end
  	return ranks
	end

end