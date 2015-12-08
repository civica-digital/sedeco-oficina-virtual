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
      save_advance_zoning(params[:savetime][:actual],params[:savetime][:clicked])
    end
    
    unless params[:pagetown].blank?
      @town_name = params[:pagetown][:city_id]
      @key = params[:pagetown][:key]
      respond_to do |format|
        format.js  {render :layout => false}
      end
    end

    unless params[:savedate].blank?
      save_advance_rank_zoning(params[:savedate][:actual],params[:savedate][:clicked],params[:savedate][:date])
    end

    unless params[:pagetime].blank?    
      next_value = getNext(params[:pagetime][:next],params[:pagetime][:restriction],params[:pagetime][:next_restrictions])
      progreso_de_suelo = get_progress(params[:pagetime][:totals],next_value)
      respond_to do |format|
        if session[:uso_de_suelo] && next_value == "0"
          format.js { render :partial => 'shared/outputs/finish_zoning', :locals => {:type => t('outputs.zoning.type_sin_suelo'), :text =>t('outputs.zoning.comment_sin_suelo'),:next_text=>t('outputs.zoning.next_text_sin_suelo'), :path=> "#{safety_index_path}",new_window: false  }}
        elsif !session[:uso_de_suelo] && next_value == "0"
          format.js { render :partial => 'shared/outputs/finish_zoning', :locals => {:type => t('outputs.zoning.type_con_suelo',), :text =>t('outputs.zoning.comment_con_suelo'),:next_text=>t('outputs.zoning.next_text_con_suelo'), :path=> "#{safety_index_path}",new_window: false  }}
        elsif next_value == "-5"
          format.js { render :partial => 'shared/outputs/finish_zoning', :locals => {:type => t('outputs.zoning.type_equipamiento'), :text =>t('outputs.zoning.comment_equipamiento'),:next_text=>t('outputs.zoning.next_text_equipamiento'), :path=> "#{appointments_path}",new_window: true  }}
        elsif next_value == "-6"
          format.js { render :partial => 'shared/outputs/finish_zoning', :locals => {:type => t('outputs.zoning.type_derechos'), :text =>t('outputs.zoning.comment_derechos'),:next_text=>t('outputs.zoning.next_text_derechos'), :path=> "#{appointments_path}",new_window: true }}
        else  
          format.js { render :js => "hidden_div(#{next_value},100,#{progreso_de_suelo},0);"}
        end
      end
    end
  end

  #regresa el id de la vista que continua
  def getNext(next_val, restriction, next_restriction)
    if restriction.to_i == -20 && !session[:is_business_home]
      next_restriction
  	elsif restriction.to_i == -20 && session[:uso_de_suelo]
  		next_restriction
  	else
  		next_val
  	end
  end


end
