module ApplicationHelper
  
  #obtiene la imagen svg
  def prod_img_full(img)
    "iconos/#{img}.svg"
  end

  #limpia los arrays utilizados para llenar las vistas
  def clean_arrays
    @respuestas_texto_array.clear
    @respuestas_imagen_array.clear
    @respuestas_siguiente_array.clear
    @respuestas_rango_array.clear
    @respuestas_id_array.clear
    @respuestas_uso_restriccion_array.clear
    @respuestas_siguiente_restriccion_array.clear
  end

end
