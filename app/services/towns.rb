module Towns
  def self.load_towns
    load_values(:towns)
  end

  def self.load_city(city)

    return "" unless city.present?
    formatted_city = format(city)
    begin
     load_values("towns/#{formatted_city}").fetch(formatted_city).values
    rescue => ex
      return ""
    end
  end

  private

  def self.format(city_name)
    I18n.transliterate(city_name)
      .downcase
      .gsub(" ", "_")
      .gsub(".", "")
  end

  def self.load_values(object)
    File.open(path_to(object)) { |file|
      YAML.load(file.read)
    }
  end

  def self.path_to(object)
    File.expand_path("#{object}.yml", File.dirname(__FILE__))
  end

  def self.load_aforo(type)
    load_values(type == 'bajo' ? 'aforo/bajo_impacto' : 'aforo/impacto_vecinal').map do |town|
        { id: town[:id], label: town[:name], size: town[:size]}
      end
  end

  def self.get_value_from_impact(type,name)
    Towns.load_aforo(type).each do |aforo|
      if aforo[:label] == name
        return aforo[:size]
      end
    end
  end

end