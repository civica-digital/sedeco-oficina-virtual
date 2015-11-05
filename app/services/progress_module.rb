module ProgressModule 
	   #guarda los valores clickeados por el momento en la session del usuario
  def save_advance_impact(actual, clicked)
   	case actual.to_i
  	 	when 1 #pregunta uno
  	 		case clicked.to_i
  		 		when 1
  		 			session[:has_bussine] = true
  		 		when 2
  		 			session[:has_bussine] = false
  		 		when 3
  		 			session[:has_bussine] = -4
  		 	else
  				session[:has_bussine] = false
  	 		end

  	 	when 2 #pregunta 2
  	 		case clicked.to_i
  		 		when 1..5
  					session[:impacto_usuario] = -2
  		 		when 6
  		 			session[:impacto_usuario] = -4
  		 		when 7
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
	          when 6
	            session[:impacto_usuario] = -4
	        else
	          session[:impacto_usuario] = -4
	        end

  	 	when 4 #pregunta 4
	        case clicked.to_i
	          when 1
	            session[:has_siapem] = true
	          when 2
	            session[:has_siapem] = false
	          when 3
	            session[:has_siapem] = -4
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
            session[:has_open_declaration] = -4
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
end