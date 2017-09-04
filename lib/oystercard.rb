class OysterCard

  attr_accessor :balance, :in_journey

  MAXIMUM = 100

  def initialize
    @balance = 0
  end

  def top_up(amount)
    fail "#{MAXIMUM} is over your allowed top-up limit" if (@balance + amount) >= MAXIMUM
    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def touch_in
   fail "You have an insufficient balance" if @balance < 1
   @in_journey = true
  end

  def touch_out
    @in_journey = false
  end


end
