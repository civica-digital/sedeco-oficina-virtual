module ZoningHelper

	def get_array_rank(inicial)
		ranks = []
		(5000.downto(Integer(inicial))).each do |n|
  			ranks << "#{n}m2"
  		end
  	return ranks
	end

end