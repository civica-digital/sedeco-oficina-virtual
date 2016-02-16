module ImpactModule 

  #guarda los valores clickeados en la session del usuario
  def save_advance_date_impact(actual, clicked, date)
    if actual.to_i == 5
      case clicked.to_i
        when 2
          session[:date_siapem] = 0
        else
          session[:date_siapem] = date
      end
    end
  end

    #guarda si el usuario tiene o no un negocio  
  def save_has_bussine(clicked)
    case clicked.to_i
      when 1
        session[:has_bussine] = true
      when 2
        session[:has_bussine] = false
    end
  end

  #guarda tipo de impacto
  def save_impacto_vecinal_usuario(clicked)
    case clicked.to_i
      when 1..5
        session[:impacto_usuario] = -2
      when 6
        session[:impacto_usuario] = -4
    end
  end

  #guarda tipo de impacto
  def save_impacto_zonal_usuario(clicked)
    case clicked.to_i
      when 1..4
        session[:impacto_usuario] = -3
      when 5
        session[:impacto_usuario] = -1
    end
  end

  #el usuario_tiene_siapem
  def save_has_siapem(clicked)
    case clicked.to_i
      when 1
        session[:has_siapem] = true
      when 2
        session[:has_siapem] = false
      when 3
        session[:has_siapem] = false
    end
  end

  #si cuenta con licencia especial
  def save_has_special_license(clicked)
    case clicked.to_i
      when 1
        session[:has_special_license] = true
      when 2
        session[:has_special_license] = false
      when 3
        session[:has_special_license] = false
    end
  end

  #si cuenta con declaracion de apertura
  def save_has_open_declaration(clicked)
    case clicked.to_i
      when 1
        session[:has_open_declaration] = true
      when 2
        session[:has_open_declaration] = false
      when 3
        session[:has_open_declaration] = false
    end
  end
end
