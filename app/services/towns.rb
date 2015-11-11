module Towns
  def self.load_towns
    load_values(:towns)
  end

  def self.load_city(city)
    return "" unless city.present?

    formatted_city = format(city)
    load_values("towns/#{formatted_city}").fetch(formatted_city).values
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
end