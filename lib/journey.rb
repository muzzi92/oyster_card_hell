class Journey
  MIN_FARE = 1
  PENALTY_FARE = 6
  attr_reader :entry_station, :exit_station

  def start_journey(station)
    @entry_station = station
  end

  def finish_journey(station)
    @exit_station = station
  end

  def fare
    @exit_station == nil || @entry_station == nil ? PENALTY_FARE : MIN_FARE
  end
end
