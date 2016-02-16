class ApplicationController < ActionController::Base.send(:include, ProgressModule,ImpactModule,ZoningModule,SafetyModule)
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  require 'json'

  #obtiene el progreso del progresBar
  def get_progress(total, value)
 	  (value.to_i * 100 / total.to_i) - 10
  end

  #obtiene el json de un arbol a partir del nombre de este
  def get_json(value)
 	  source = "lib/inputs/#{value}/#{value}.json"
    file_read = File.read(source)
  	@file = ActiveSupport::JSON.decode(file_read)["#{value}"]["array_preguntas"]["pregunta"]
    init_trees(value)
  end

  #inicializamos los arreglos que se len de los json
  def init_trees(value)
    @respuestas_texto_array = []
    @respuestas_imagen_array = []
    @respuestas_siguiente_array = []
    @respuestas_rango_array = []
    @respuestas_hover_array = []
    @respuestas_id_array = []
    @respuestas_uso_restriccion_array = []
    @respuestas_siguiente_restriccion_array = []

    @tipo_de_impacto = ""
    @progreso_de_impacto =  value == 'impacto' ?  0 : 100
    @progreso_de_suelo  =   value == 'seguridad' ? 100 : 0
    @progreso_de_seguridad  = 0

    @array_city=[]
    @array_id=[]
    @impacto_usuario =  session[:impacto_usuario]
  end
end
