class SearchController < ApplicationController

  def index
    @station = SearchFacade.find_nearest(params)
    @directions = SearchFacade.get_directions(params[:location], @station.address)
  end

end