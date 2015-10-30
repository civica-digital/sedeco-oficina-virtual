module Services
 	def self.load_values(object)
    File.open(path_to(object)) { |file|
      YAML.load(file.read)
    }
  end

  def self.load_towns
    load_values(:towns).map do |town|
      { id: town[:id], label: town[:name] }
    end
  end

  def self.load_city(city)
    puts '*********************'
    puts city
    if city == 'Álvaro Obregón'
       return load_values(:alvaro_obregon).fetch("alvaro_obregon").values
       
    elsif city == 'Azcapotzalco'
     return load_values(:azcapotzalco).fetch("azcapotzalco").values

    elsif city == 'Benito Juárez'
      return load_values(:benito_juarez).fetch("benito_juarez").values

    elsif city == 'Coyoacán'
      return load_values(:coyoacan).fetch("coyoacan").values

    elsif city == 'Cuajimalpa de Morelos'
      return load_values(:cuajimalpa).fetch("cuajimalpa").values

    elsif city == 'Cuauhtémoc'
      return load_values(:cuauhtemoc).fetch("cuauhtemoc").values

    elsif city == 'Gustavo A. Madero'
      return load_values(:gustavo_a_madero).fetch("gustavo_a_madero").values

    elsif city == 'Iztacalco'
      return load_values(:iztacalco).fetch("iztacalco").values

    elsif city == 'Iztapalapa'
      return load_values(:iztapalapa).fetch("iztapalapa").values

    elsif city == 'La Magdalena Contreras'
      return load_values(:magdalena).fetch("magdalena").values

    elsif city == 'Miguel Hidalgo'
      return load_values(:miguel_hidalgo).fetch("miguel_hidalgo").values

    elsif city == 'Milpa Alta'
      return load_values(:milpa_alta).fetch("milpa_alta").values

    elsif city == 'Tláhuac'
      return load_values(:tlahuac).fetch("tlahuac").values

    elsif city == 'Tlalpan'
      return load_values(:tlalpan).fetch("tlalpan").values

    elsif city == 'Venustiano Carranza'
      return load_values(:venustiano_carranza).fetch("venustiano_carranza").values

    elsif city == 'Xochimilco'
      return load_values(:xochimilco).fetch("xochimilco").values

    end
  end

  def self.path_to(object)
    File.expand_path("#{object}.yml", File.dirname(__FILE__))
  end

end