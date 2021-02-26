class MapQuestService
  def self.get_me_there(to, from)
    response = faraday.get("/directions/v2/route?") do |f|
      f.params['to'] = to
      f.params['from'] = from
    end
    parsed = parse(response)
  end

  private

  def self.parse(arg)
    JSON.parse(arg.body, symbolize_names: true)
  end

  def self.faraday
    Faraday.new('http://www.mapquestapi.com') do |faraday|
      faraday.params['key'] = ENV['MAPQUEST_KEY']
    end
  end
end