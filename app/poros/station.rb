class Station
  attr_reader :name,
              :address,
              :fuel_type,
              :distance

  def initialize(data)
    @name = data[:station_name]
    @address = "#{data[:street_address]}, #{data[:city]}, #{data[:state]} #{data[:zip]}"
    @fuel_type = data[:fuel_type_code]
    @access = data[:access_days_time]
    @distance = data[:distance].round(1)
  end

  def access_times
    @access.split(';').map{|day| day.split(':')}
  end
end