require_relative 'journey'

PEN_FARE = 6

class Journeylog

  def initialize(journey_klass: Journey)
    @log = []
    @journey_klass = journey_klass
    # @deduct = false
  end

  def journeys
    @log.dup
  end

  def start(station)
    current_journey.start(station)
    # double_touchin if @journey != nil
  end

  def finish(station)
    current_journey.end(station)
    # store_journey
    # @deduct = true
  end


  def store_journey
    # @fare = @journey.complete? ? Journey::MIN_FARE : PEN_FARE
    # @log << @journey
    # @journey = nil
  end

  def double_touchin
    # current_journey
    # store_journey
    # @deduct = true
  end

  def fare
    # @fare
  end

  # def deduct?
  #   @deduct
  # end

private

  def current_journey
    @journey || @journey = @journey_klass.new
  end

end
