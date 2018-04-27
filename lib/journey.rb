class Journey

  attr_reader :journey


  MIN_FARE = 1
  PENALTY_FARE = 6

  def initialize
    @journey = {entry_station: nil, exit_station: nil}
  end


  def start_journey(station)
    @journey[:entry_station] = station
  end

  def finish_journey(station)
    @journey[:exit_station] = station
  end

  def fare
    @journey[:exit_station] == nil || @journey[:entry_station] == nil ? PENALTY_FARE : MIN_FARE
  end

  # def in_journey?
  #   !!@entry_station
  # end

end
