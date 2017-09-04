class OysterCard
  attr_accessor :balance, :in_journey
  attr_reader :station_name

  MAXIMUM = 100

  def initialize
    @balance = 0
  end

  def top_up(amount)
    raise "#{MAXIMUM} is over your allowed top-up limit" if (@balance + amount) >= MAXIMUM
    @balance += amount
  end

  def touch_in(station)
    raise 'You have an insufficient balance' if @balance < 1
    @station_name = station
    @in_journey = true
  end

  def touch_out
    @balance -= 1
    @in_journey = false
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end
