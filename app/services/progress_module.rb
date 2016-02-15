module ProgressModule 
#guarda los valores clickeados en la session del usuario

#***********IMPACTO************************
  #recibe seleccion y guarda en sesion
  def save_advance_impact(actual, clicked)
    case actual.to_i
      when 1 
        save_has_bussine(clicked.to_i)
      when 2 
        save_impacto_vecinal_usuario(clicked.to_i)
      when 3 
        save_impacto_zonal_usuario(clicked.to_i)  
      when 4
        save_has_siapem(clicked.to_i)
      when 6
        save_has_special_license(clicked.to_i)
      when 7
        save_has_open_declaration(clicked.to_i)
      else
    end

  end


#***************USO DE SUELO****************
  def save_advance_zoning(actual, clicked) 
    case actual.to_i
      when 1
        save_type_zoning(clicked.to_i)
      when 2
        save_is_business_home(clicked.to_i)
      when 5
        save_has_zoning(clicked.to_i)
      when 7
        save_has_type_zoning(clicked.to_i)
      else
    end
  end


  def save_advance_rank_zoning(actual, clicked, date)
   case actual.to_i
      when 3
        save_size_house(clicked.to_i)
      when 4
        save_size_business(clicked.to_i)
      when 6
        save_date_zoning(clicked.to_i)
      when 8
        save_city_zoning(clicked.to_i)
      when 9
        save_town_business(clicked.to_i)
    else
    end
  end

  #**********************SEGURIDAD*********************
  def save_advance_safety(actual, clicked)
    case actual.to_i
      when 3
        save_has_autodiagnostico(clicked.to_i)
      when 4
        save_vobo_seguridad(clicked.to_i)
      when 5
        save_has_protection(clicked.to_i)  
      when 6 
        save_make_protection(clicked.to_i) 
      when 7 
        save_license_ambiental(clicked.to_i)
      when 8
        save_make_license_ambiental(clicked.to_i)
      when 9
        save_license_sanitaria(clicked.to_i)
      when 10
        save_make_license_sanitaria(clicked.to_i)
      when 11
        save_no_adeudos(clicked.to_i)
      else
      end
  end

  #hace un set del aforo
  def save_aforo(value)
    session[:aforo] = value
  end

  #limpia todos los valores de la sesion
  def clean_params_session
    session[:has_bussine] = nil
    session[:impacto_usuario] = nil
    session[:has_siapem] = nil
    session[:has_special_license] = nil
    session[:has_open_declaration] = nil
    session[:date_siapem] = nil

    session[:type_zoning]= nil
    session[:is_business_home] = nil
    session[:has_zoning] = nil
    session[:has_type_zoning] = nil
    session[:size_house]= nil
    session[:size_business] = nil
    session[:date_zoning] = nil
    session[:city_zoning] = nil
    session[:town_business] = nil
    session[:uso_de_suelo] = nil

    session[:has_autodiagnostico] = nil
    session[:vobo_seguridad] = nil
    session[:has_protection] = nil
    session[:make_protection] = nil
    session[:license_ambiental] = nil
    session[:make_license_ambiental] = nil
    session[:license_sanitaria] = nil
    session[:make_license_sanitaria] = nil
    session[:no_adeudos] = nil
    session[:aforo] = nil
  end

end