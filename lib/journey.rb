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
    @end_stat && @entrance ? MIN_FARE : PEN_FARE
  end
end
