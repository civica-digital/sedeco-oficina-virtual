module ImpactHelper
	def get_array_fecha(inicial)
		fechas = []
		(Integer(inicial)..2015).each do |n|
  			fechas << n
  		end
  		return fechas
	end
end
