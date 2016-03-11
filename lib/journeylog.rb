require_relative 'journey'

class Journeylog
  attr_reader :fare

  def initialize(journey_klass: Journey)
    @log = []
    @journey_klass = journey_klass
    @fare = 0
    @temp = nil
  end

  def journeys
    @log.dup
  end

  def start(station)
    store_journey if @journey
    current_journey.start(station)
  end

  def finish(station)
    current_journey.finish(station)
    store_journey
  end

  def fare
    if @temp == @log.last
      @fare = 0
    else
      @fare = @log.last.fare
      @temp = @log.last
    end
    @fare
  end

private
  def current_journey
    @journey || @journey = @journey_klass.new
  end

  def store_journey
    # @fare = @journey.fare
    @log << @journey
    @journey = nil
  end
end
