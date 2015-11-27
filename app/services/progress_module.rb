module ProgressModule 
	#guarda los valores clickeados por el momento en la session del usuario
  #*************************************IMPACTO*********************************
  def save_advance_impact(actual, clicked)
   	case actual.to_i
  	 	when 1 #pregunta uno
  	 		case clicked.to_i
  		 		when 1
  		 			session[:has_bussine] = true
  		 		when 2
  		 			session[:has_bussine] = false
  		 	else
  				session[:has_bussine] = false
  	 		end

  	 	when 2 #pregunta 2
  	 		case clicked.to_i
  		 		when 1..5
  					session[:impacto_usuario] = -2
  		 		when 6
  		 			session[:impacto_usuario] = -4
  		 	else
  		 		session[:impacto_usuario] = -4
  	 		end

  	 	when 3 #pregunta 3
	        case clicked.to_i
	          when 1..4
	            session[:impacto_usuario] = -3
	          when 5
	            session[:impacto_usuario] = -1
	        else
	          session[:impacto_usuario] = -1
	        end

  	 	when 4 #pregunta 4
	        case clicked.to_i
	          when 1
	            session[:has_siapem] = true
	          when 2
	            session[:has_siapem] = false
	          when 3
	            session[:has_siapem] = false
	        else
	          session[:has_siapem] = false
	        end

  	 	when 6 #pregunta 6
	        case clicked.to_i
	          when 1
	            session[:has_special_license] = true
	          when 2
	            session[:has_special_license] = false
	          when 3
	            session[:has_special_license] = -4
	        else
	          session[:has_special_license] = false
	        end

      when 7 #pregunta 7
        case clicked.to_i
          when 1
            session[:has_open_declaration] = true
          when 2
            session[:has_open_declaration] = false
          when 3
            session[:has_open_declaration] = false
        else
          session[:has_open_declaration] = false
        end
  	else
   	
   	end
  end


  #guarda los valores clickeados por el momento en la session del usuario
  def save_advance_date_impact(actual, clicked, date)
    case actual.to_i
      when 5 #pregunta 5
        case clicked.to_i
          when 2
            session[:date_siapem] = 0
        else
          session[:date_siapem] = date
        end
    else
    
    end
  end
#*************************************SEGURIDAD*********************************
  def save_advance_safety(actual, clicked)
    case actual.to_i
      when 3 #pregunta 3
        case clicked.to_i
          when 1
            session[:has_autodiagnostico] = true
          when 2
            session[:has_autodiagnostico] = false
          when 3
            session[:has_autodiagnostico] = -4
        else
          session[:has_autodiagnostico] = false
        end
          
      when 4 #pregunta 4
        case clicked.to_i
          when 1
            session[:vobo_seguridad] = true
          when 2
            session[:vobo_seguridad] = false
          when 3
            session[:vobo_seguridad] = -4
        else
          session[:vobo_seguridad] = false
        end
          
      when 5 #pregunta 5
        case clicked.to_i
          when 1
            session[:has_protection] = true
          when 2
            session[:has_protection] = false
          when 3
            session[:has_protection] = -4
        else
          session[:has_protection] = false
        end
          
      when 6 #pregunta 6
        case clicked.to_i
          when 1
            session[:make_protection] = true
          when 2
            session[:make_protection] = false
          when 3
            session[:make_protection] = -4
        else
          session[:make_protection] = false
        end
          
      when 7 #pregunta 7
        case clicked.to_i
          when 1
            session[:license_ambiental] = true
          when 2
            session[:license_ambiental] = false
          when 3
            session[:license_ambiental] = -4
        else
          session[:license_ambiental] = false
        end
          
      when 8 #pregunta 8
        case clicked.to_i
          when 1
            session[:license_sanitaria] = true
          when 2
            session[:license_sanitaria] = false
          when 3
              session[:license_sanitaria] = -4
        else
          session[:license_sanitaria] = false
        end

      when 9 #pregunta 9
        case clicked.to_i
          when 1
            session[:no_adeudos] = true
          when 2
            session[:no_adeudos] = false
          when 3
            session[:no_adeudos] = -4
        else
          session[:no_adeudos] = false
        end
      
      else
      end
  end


    #guarda los valores clickeados por el momento en la session del usuario
  def save_advance_rank_safety(actual, clicked, date)
    case actual.to_i
      when 1 #pregunta 1
        case clicked.to_i
          when 2
            session[:aforo] = 0
          else
            session[:aforo] = date
          end
      else
      end
  end

  def save_aforo(value)
    session[:aforo] = value
  end

#*************************************USO DE SUELO*********************************
  def save_advance_zoning(actual, clicked) 
    case actual.to_i
      when 1#pregunta 1
        case clicked.to_i
          when 1
            session[:type_zoning] = -1
          when 2..4
            session[:type_zoning] = -2
          when 5
            session[:type_zoning] = -5
        else
          session[:type_zoning] = -1
        end
      when 2#pregunta 2
        puts '*******************'
        case clicked.to_i
          when 1
            session[:is_business_home] = true
            puts 'hola'
          when 2
            session[:is_business_home] = false
        else
          session[:is_business_home] = false
        end
      when 5#pregunta 5
        case clicked.to_i
          when 1
            session[:has_zoning] = -12
          when 2
            session[:has_zoning] = -13
          when 3
            session[:has_zoning] = -4
        else
          session[:has_zoning] = -4
        end
      when 7#pregunta 7
        case clicked.to_i
          when 1
            session[:has_zoning] = -21
          when 2..4
            session[:has_zoning] = -22
          when 5
            session[:has_zoning] = -4
        else
          session[:has_zoning] = -4
        end

    else
    
    end
  end

    #guarda los valores clickeados por el momento en la session del usuario
  def save_advance_rank_zoning(actual, clicked, date)
   case actual.to_i
      when 3 #pregunta 3
        case clicked.to_i
          when 2
            session[:size_house] = 0
        else
          session[:size_house] = date
        end
      when 4 #pregunta 4
        case clicked.to_i
          when 2
            session[:size_business] = 0
        else
          session[:size_business] = date
          validate_not_zoning
        end
      when 6 #pregunta 6
        case clicked.to_i
          when 2
            session[:date_zoning] = 0
        else
          session[:date_zoning] = date
        end
      when 8 #pregunta 8
        case clicked.to_i
          when 2
            session[:city_zoning] = 0
        else
          session[:city_zoning] = date
        end
      
      when 9 #pregunta 9
        case clicked.to_i
          when 2
            session[:town_business] = 0
        else
          session[:town_business] = date
        end
    else
    
    end
  end


  #valida si el negocio aplica para no tramitar uso de suelo
  def validate_not_zoning
    unless session[:size_house].nil? || session[:size_house].to_i == 0
      business = session[:size_business].to_i
      house = session[:size_house].to_i
      puts business
      puts house
      if (business*100)/house <= 20
       session[:uso_de_suelo] = true
      else
        session[:uso_de_suelo] = false
      end
    end
  end

end