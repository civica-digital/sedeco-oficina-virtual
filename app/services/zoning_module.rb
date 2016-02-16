module ZoningModule 

  #tipo de uso de suelo
  def save_type_zoning(clicked)
  	case clicked.to_i
      when 1
        session[:type_zoning] = 'Habitacional'
      when 2
        session[:type_zoning] = 'Habitacional Mixto'
      when 3
        session[:type_zoning] = 'Habitacional con Oficina'
      when 4
        session[:type_zoning] = 'Habitacional con Comercio'
      when 5
        session[:type_zoning] = 'Equipamiento'
      when 6
        session[:type_zoning] = 'Sin información'
      else
        session[:type_zoning] = -1
      end
  end

  #tiene negocio en casa
  def save_is_business_home(clicked)
    case clicked.to_i
      when 1
        session[:is_business_home] = true
      when 2
        session[:is_business_home] = false
      else
        session[:is_business_home] = false
      end
  end

  #tiene uso de suelo
  def save_has_zoning(clicked)
    case clicked.to_i
      when 1
        session[:has_zoning] = true
      when 2
        session[:has_zoning] = false
      when 3
        session[:has_zoning] = false
      else
        session[:has_zoning] = false
      end
  end

  #tipo de uso de suelo
  def save_has_type_zoning(clicked)
    case clicked.to_i
      when 1
        session[:has_type_zoning] = "Derechos adquiridos"
      when 2
        session[:has_type_zoning] = "Certificado único de zonificación"
      when 3
        session[:has_type_zoning] = "Especial"
      when 4
        session[:has_type_zoning] = "Específico"
      when 5
        session[:has_type_zoning] = "Sin información"
      else
        session[:has_type_zoning] = "Sin información"
      end
  end

  #tamano de la vivienda
  def save_size_house(clicked,date)
    case clicked.to_i
      when 2
        session[:size_house] = 0
      else
        session[:size_house] = date
      end
  end

  #tamano del negocio
  def save_size_business(clicked,date)
    case clicked.to_i
      when 2
        session[:size_business] = 0
      else
        session[:size_business] = date
        validate_not_zoning
      end
  end

  #fecha del uso de suelo
  def save_date_zoning(clicked,date)
    case clicked.to_i
      when 2
        session[:date_zoning] = 0
      else
        session[:date_zoning] = date
      end
  end

  #delegacion del negocio
  def save_city_zoning(clicked,date)
    case clicked.to_i
      when 2
        session[:city_zoning] = nil
      else
        session[:city_zoning] = date
      end
  end

  #colonia del negocio
  def save_town_business(clicked,date)
    case clicked.to_i
      when 2
        session[:town_business] = nil
      else
        session[:town_business] = date
      end
  end

  #valida si el negocio aplica para no tramitar uso de suelo
  def validate_not_zoning
    unless session[:size_house].nil? || session[:size_house].to_f == 0
      business = session[:size_business].to_f
      house = session[:size_house].to_f
      puts business
      puts house
      if (business*100)/house <= 20.0
       session[:uso_de_suelo] = true
      else
        session[:uso_de_suelo] = false
      end
    end
  end



end