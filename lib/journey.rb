class Journey
  MIN_FARE = 1
  PEN_FARE = 6
  attr_reader :entrance, :end_stat

  def start(station)
    @entrance = station

  end

  def finish(station)
   @end_stat = station
  end

  def fare
    @end_stat && @entrance ? fare_price : PEN_FARE
  end

  def fare_price
    (@end_stat.zone - entrance.zone).abs +  MIN_FARE
  end
end
