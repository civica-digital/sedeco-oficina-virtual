module ImpactHelper
	def get_array_fecha(inicial)
		fechas = []
		(2015.downto(Integer(inicial))).each do |n|
  			fechas << n
  		end
  		return fechas
	end

	def prod_img_full(img)
  		"#{img}.png"
	end

	def prod_img_over(img)
  		"#{img}-m.png"
	end
end
