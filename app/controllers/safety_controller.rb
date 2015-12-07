class SafetyController < ApplicationController
  before_action only: :index do
    get_json('seguridad')
  end

  def index
    evaluate_params(params)
  end



  private 

  #Evalua los parametros enviados de la vista (guarda o renderea dependiendo)
  def evaluate_params(params)
    unless params[:savetime].blank?
      save_advance_safety(params[:savetime][:actual],params[:savetime][:clicked])
    end
    
    unless params[:savedate].blank?
      save_advance_rank_safety(params[:savedate][:actual],params[:savedate][:clicked],params[:savedate][:date])
    end

    unless params[:impact].blank?
      superficie = params[:impact][:superficie].chomp('m2')   
      mobiliario = params[:impact][:mobiliario].chomp('m2')   
      aforo_size = Towns.get_value_from_impact(params[:impact][:type],params[:impact][:name])
      total = (superficie.to_f -  mobiliario.to_f) / aforo_size.to_f
      save_aforo(total)
      respond_to do |format|
        format.js { render :js => "set_value_aforo(#{total.to_i});"}
      end
    end
    
    unless params[:pagetime].blank?    
      next_value = getNext(params[:pagetime][:next],params[:pagetime][:restriction],params[:pagetime][:next_restrictions])
      progreso_de_seguridad = get_progress(params[:pagetime][:totals],next_value)
      respond_to do |format|  
        if next_value == "0"
          format.js { render :partial => 'shared/outputs/finish_safety', :locals => {:type => t('outputs.safety.type_last'), :text =>t('outputs.safety.comment_last'),:next_text=>t('outputs.safety.next_text_last'), :path=> "#{diagnostic_index_path}",new_window: false}}
        else
          format.js { render :js => "hidden_div(#{next_value},100,100,#{progreso_de_seguridad});"}
        end
      end
    end
  end


    #regresa el id de la vista que continua
   def getNext(next_val, restriction, next_restriction)
      if restriction.to_i == -3 && session[:impacto_usuario] == -2
        next_restriction
      elsif restriction.to_i == 50 && session[:aforo] != nil && session[:aforo].to_i > 49
        next_restriction
      else
        next_val
      end
   end

end
