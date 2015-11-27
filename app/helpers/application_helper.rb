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

  #crea array dinamico para dorpdown
  def get_array_values(init,type)
    if type == "fecha"
      final = Time.new.year
      unidad = ""
    elsif type == "rango"
      final = 5000
      unidad = "m2"
    elsif type == "aforo"
      final = 500
      unidad = ""
    end
    array_ = []

    ((final.to_i).downto(Integer(init))).each do |n|
      array_ << "#{n}#{unidad}"
    end
    return array_
  end

  def bajo_impacto?
    session[:impacto_usuario] == -1
  end

  def bootstrap_class_for(flash_type)
    case flash_type.to_sym
      when :success
        "alert-success"
      when :error
        "alert-danger"
      when :alert
        "alert-danger"
      when :notice
        "alert-success"
      else
        flash_type.to_s
    end
  end

  def form_errors_class(object)
    if object.send(:errors).present?
      "has-errors"
    end
  end
end
