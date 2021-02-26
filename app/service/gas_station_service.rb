class GasStationService
  def self.find_nearest(zip)
    response = faraday.get("/api/alt-fuel-stations/v1/nearest.json?") do |f|
      f.params['fuel_type'] = "ELEC"
      f.params['location'] = "#{zip}"
    end
    parsed = parse(response)
  end

  private

  def self.parse(arg)
    JSON.parse(arg.body, symbolize_names: true)
  end

  def self.faraday
    Faraday.new('https://developer.nrel.gov') do |faraday|
      faraday.params['api_key'] = ENV['NREL_API_KEY']
    end
  end
end