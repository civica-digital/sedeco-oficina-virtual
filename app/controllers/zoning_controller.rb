class ZoningController < ApplicationController
  before_action only: :index do
    get_json('suelo')
  end

  
  def index
    evaluate_params(params)  
  end


  private
  #Evalua los parametros enviados de la vista (guarda o renderea dependiendo)
  def evaluate_params(params)
    unless params[:savetime].blank?
      save_advance(params[:savetime][:actual],params[:savetime][:clicked])
    end
    
    unless params[:savedate].blank?
      save_advance_rank(params[:savedate][:actual],params[:savedate][:clicked],params[:savedate][:date])
    end
    
    unless params[:pagetown].blank?
      @town_name = params[:pagetown][:city_id]
      @key = params[:pagetown][:key]
      respond_to do |format|
        format.js  {render :layout => false}
      end
    end

    unless params[:pagetime].blank?    
      next_value = getNext(params[:pagetime][:next],params[:pagetime][:restriction],params[:pagetime][:next_restrictions])
      progreso_de_suelo = get_progress(params[:pagetime][:totals],next_value)
      respond_to do |format|
        if session[:uso_de_suelo] && next_value == "0"
          format.js { render :js => "finaliza_sin_uso_de_suelo();"}
        elsif !session[:uso_de_suelo] && next_value == "0"
          format.js { render :js => "finaliza_con_uso_de_suelo();"}
        elsif next_value == "-5"
          format.js { render :js => "finaliza_uso_equipamiento();"}
        elsif next_value == "-6"
          format.js { render :js => "finaliza_uso_derechos_adquiridos();"}
        else  
          format.js { render :js => "hidden_div(#{next_value},100,#{progreso_de_suelo},0);"}
        end
      end
    end
  end

  #regresa el id de la vista que continua
  def getNext(next_val, restriction, next_restriction)
  	if restriction.to_i == -20 && session[:uso_de_suelo]
  		next_restriction
  	else
  		next_val
  	end
  end

     
  #valida si el negocio aplica para no tramitar uso de suelo
  def validate_not_zoning
    unless session[:size_house].nil? || session[:size_house].to_i == 0
      business = session[:size_business].to_i
      house = session[:size_house].to_i
      if (business*100)/house <= 20
       session[:uso_de_suelo] = true
      else
        session[:uso_de_suelo] = false
      end
    end
  end

end
