require_relative 'journey'



class Journeylog

attr_reader :fare



  def initialize(journey_klass: Journey)
    @log = []
    @journey_klass = journey_klass
    @fare = 0
    # @deduct = false
    
  end

  def journeys
    @log.dup
  end

  def start(station)
    @fare = @journey.fare if @journey
    @log << @journey if @journey
    current_journey.start(station)
  end

  def finish(station)
    current_journey.finish(station)
    store_journey
    # @deduct = true
  end

  def double_touch_in
    # current_journey
    # store_journey
    # @deduct = true
  end

  # def deduct?
  #   @deduct
  # end

private

  def current_journey
    @journey || @journey = @journey_klass.new
  end

  def store_journey
    @fare = @journey.fare
    @log << @journey
    @journey = nil
  end

end
