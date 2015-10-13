module ImpactHelper
	def get_array_fecha(inicial)
		fechas = []
		(2015.downto(Integer(inicial))).each do |n|
  		fechas << n
  	end
  	return fechas
	end

	def prod_img_full(img)
  	"iconos/#{img}.png"
	end

	def prod_img_over(img)
  	"iconos/#{img}-m.png"
	end

	def get_progreso(total, value)
		unless total.nil? || total.to_i > 0
			(value.to_i * 100 / total.to_i)
		else
			0
		end
 	end

 	def clean_array_impacto
 	@respuestas_texto_array.clear
    @respuestas_imagen_array.clear
    @respuestas_siguiente_array.clear
    @respuestas_rango_array.clear
    @respuestas_id_array.clear
    @respuestas_uso_restriccion_array.clear
    @respuestas_siguiente_restriccion_array.clear
 	end


end