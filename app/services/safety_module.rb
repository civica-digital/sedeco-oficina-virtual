module SafetyModule

  def save_has_autodiagnostico(clicked)
    case clicked.to_i
      when 1
        session[:has_autodiagnostico] = true
      when 2
        session[:has_autodiagnostico] = false
      when 3
        session[:has_autodiagnostico] = false
    end
  end

  def save_vobo_seguridad(clicked)
    case clicked.to_i
      when 1
        session[:vobo_seguridad] = true
      when 2
        session[:vobo_seguridad] = false
      when 3
        session[:vobo_seguridad] = false
    end
  end

  def save_has_protection(clicked)
    case clicked.to_i
      when 1
        session[:has_protection] = true
      when 2
        session[:has_protection] = false
      when 3
        session[:has_protection] = false
    end
  end

  def save_make_protection(clicked)
    case clicked.to_i
      when 1
        session[:make_protection] = true
      when 2
        session[:make_protection] = false
      when 3
        session[:make_protection] = false
    end    
  end


  def save_license_ambiental(clicked)
    case clicked.to_i
      when 1
        session[:license_ambiental] = true
      when 2
        session[:license_ambiental] = false
      when 3
        session[:license_ambiental] = false
    end
  end


  def save_make_license_ambiental(clicked)
    case clicked.to_i
      when 1
        session[:make_license_ambiental] = true
      when 2
        session[:make_license_ambiental] = false
      when 3
        session[:make_license_ambiental] = false
    end 
  end


  def save_license_sanitaria(clicked)
    case clicked.to_i
      when 1
        session[:license_sanitaria] = true
      when 2
        session[:license_sanitaria] = false
      when 3
        session[:license_sanitaria] = false
    end
  end

  def save_make_license_sanitaria(clicked)
    case clicked.to_i
      when 1
        session[:make_license_sanitaria] = true
      when 2
        session[:make_license_sanitaria] = false
      when 3
        session[:make_license_sanitaria] = false
    end
  end

  def save_no_adeudos(clicked)
    case clicked.to_i
      when 1
        session[:no_adeudos] = true
      when 2
        session[:no_adeudos] = false
      when 3
        session[:no_adeudos] = false
    end
  end

  #guarda los valores clickeados en la session del usuario
  def save_advance_rank_safety(actual, clicked, date)
    if actual.to_i == 1 
      case clicked.to_i
        when 2
          session[:aforo] = 0
        else
          session[:aforo] = date
      end
    end
  end
end
