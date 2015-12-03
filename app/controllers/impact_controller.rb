class ImpactController < ApplicationController
  before_action only: :index do
    get_json('impacto')
  end
  
 def index
  evaluate_params(params)
 end


private 

  #Evalua los parametros enviados de la vista (guarda o renderea dependiendo)
  def evaluate_params(params)
    unless params[:savetime].blank?
      save_advance_impact(params[:savetime][:actual],params[:savetime][:clicked])
    end

    unless params[:savedate].blank?
      save_advance_date_impact(params[:savedate][:actual],params[:savedate][:clicked],params[:savedate][:date])
    end

    unless params[:pagetime].blank?    
      next_value = getNext(params[:pagetime][:next],params[:pagetime][:restriction],params[:pagetime][:next_restrictions])
      progreso_de_impacto = get_progress(params[:pagetime][:totals],next_value)
      respond_to do |format|
        if next_value == "-3"
          format.js { render :partial => 'shared/outputs/finish_impact', :locals => {:type => t('outputs.impact.type_zonal'), :text =>t('outputs.impact.comment_zonal'),:next_text=>t('outputs.impact.next_text_zonal'), :path=> "#{appointments_path}"} }
        elsif next_value == "-2"
          format.js  { render :partial => 'shared/outputs/finish_impact', :locals => {:type => t('outputs.impact.type_vecinal'), :text =>t('outputs.impact.comment_vecinal'),:next_text=>t('outputs.impact.next_text_vecinal'), :path=> "#{zoning_index_path}"} }
        elsif next_value == "-21"
          format.js { render :partial => 'shared/outputs/finish_impact', :locals => {:type => t('outputs.impact.type_vecinal'), :text =>t('outputs.impact.comment_vecinal_cita'),:next_text=>t('outputs.impact.next_text_vecinal_cita'), :path=> "#{appointments_path}"} }
        elsif next_value == "-1"
          format.js { render :partial => 'shared/outputs/finish_impact', :locals => {:type => t('outputs.impact.type_bajo'), :text =>t('outputs.impact.comment_bajo'),:next_text=>t('outputs.impact.next_text_bajo'), :path=> "#{zoning_index_path}"} }
        else    
          format.js { render :js => "hidden_div(#{next_value},#{progreso_de_impacto},0,0);"}
        end
      end
    end
  end

  #regresa el id de la vista que continua
  def getNext(next_val, restriction, next_restriction)
  	if restriction.to_i == -2 && session[:impacto_usuario].to_i == -2 
  		next_restriction
  	else
  		next_val
  	end
  end

end
