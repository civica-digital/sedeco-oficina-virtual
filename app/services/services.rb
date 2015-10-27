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
    load_values(:towns).map do |town|
      { id: town[:id], label: town[:name] }
    end
  end

  def self.path_to(object)
    File.expand_path("#{object}.yml", File.dirname(__FILE__))
  end
end