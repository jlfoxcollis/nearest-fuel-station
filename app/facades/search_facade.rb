class SearchFacade
  class << self
    def find_nearest(params)
      zip = params[:location].split(' ').last 
      stations = GasStationService.find_nearest(zip)[:fuel_stations]
      Station.new(stations[0])
    end

    def get_directions(from, to)
      directions =  MapQuestService.get_me_there(from, to)
      Direction.new(directions)
    end
  end

end