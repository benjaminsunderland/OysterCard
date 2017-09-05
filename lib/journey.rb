class Journey

attr_accessor :fare

PENALTY_FARE = 6
MIN_FEE = 1

 def fare
  PENALTY_FARE
 end

 def complete?
   false
 end

end

=begin

  def initialize(station)
    @station = station
    @in_journey = false
  end

end

=end
