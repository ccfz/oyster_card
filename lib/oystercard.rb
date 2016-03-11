class Oystercard
  DEFAULT_BALANCE = 0
  MAX_BALANCE = 90

  def initialize(journeylog, balance = DEFAULT_BALANCE)
    @balance = DEFAULT_BALANCE
    @journeylog = journeylog.new
  end

  def check_balance
    @balance
  end

  def top_up(value)
    raise 'max out balance' if value + balance > MAX_BALANCE
    @balance += value
  end

  def touch_in(station)
    raise 'balance too low' if balance < Journey::MIN_FARE
    @journeylog.start(station)
    deduct_fare
  end

  def touch_out(station)
    @journeylog.finish(station)
    deduct_fare
  end

  def log
    @journeylog.journeys
  end

  private
  attr_reader :balance

  def deduct_fare
      @balance -= @journeylog.fare
  end
end
