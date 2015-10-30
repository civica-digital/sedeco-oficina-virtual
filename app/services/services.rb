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
    if city == 'Álvaro Obregón'
       return load_values('towns/alvaro_obregon').fetch("alvaro_obregon").values
       
    elsif city == 'Azcapotzalco'
     return load_values('towns/azcapotzalco').fetch("azcapotzalco").values

    elsif city == 'Benito Juárez'
      return load_values('towns/benito_juarez').fetch("benito_juarez").values

    elsif city == 'Coyoacán'
      return load_values('towns/coyoacan').fetch("coyoacan").values

    elsif city == 'Cuajimalpa de Morelos'
      return load_values('towns/cuajimalpa').fetch("cuajimalpa").values

    elsif city == 'Cuauhtémoc'
      return load_values('towns/cuauhtemoc').fetch("cuauhtemoc").values

    elsif city == 'Gustavo A. Madero'
      return load_values('towns/gustavo_a_madero').fetch("gustavo_a_madero").values

    elsif city == 'Iztacalco'
      return load_values('towns/iztacalco').fetch("iztacalco").values

    elsif city == 'Iztapalapa'
      return load_values('towns/iztapalapa').fetch("iztapalapa").values

    elsif city == 'La Magdalena Contreras'
      return load_values('towns/magdalena').fetch("magdalena").values

    elsif city == 'Miguel Hidalgo'
      return load_values('towns/miguel_hidalgo').fetch("miguel_hidalgo").values

    elsif city == 'Milpa Alta'
      return load_values('towns/milpa_alta').fetch("milpa_alta").values

    elsif city == 'Tláhuac'
      return load_values('towns/tlahuac').fetch("tlahuac").values

    elsif city == 'Tlalpan'
      return load_values('towns/tlalpan').fetch("tlalpan").values

    elsif city == 'Venustiano Carranza'
      return load_values('towns/venustiano_carranza').fetch("venustiano_carranza").values

    elsif city == 'Xochimilco'
      return load_values('towns/xochimilco').fetch("xochimilco").values
    else
      return ""
    end
  end

  def self.path_to(object)
    File.expand_path("#{object}.yml", File.dirname(__FILE__))
  end

end