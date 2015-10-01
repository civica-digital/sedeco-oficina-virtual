module ImpactHelper
	def get_array_fecha(inicial)
		fechas = []
		(2015.downto(Integer(inicial))).each do |n|
  			fechas << n
  		end
  		return fechas
	end
end
