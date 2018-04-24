# Oystercard class
class Oystercard
  attr_reader :balance, :history, :entry_station, :exit_station

  MAXIMUM_BALANCE = 90
  MINIMUM_BALANCE = 1

  def initialize
    @balance = 0
    @limit = MAXIMUM_BALANCE
    @minimum = MINIMUM_BALANCE
    @history = []
    @journey = {entry_station: nil, exit_station: nil}
  end

  def top_up(amount)
    raise "maximim balance of £#{@limit} exceeded" if balance + amount > @limit
    @balance += amount
  end

  def touch_in(entry_station)
    raise 'insufficient funds available' if balance < @minimum
    @entry_station = entry_station
    @journey[:entry_station] = entry_station
  end

  def touch_out(exit_station)
    deduct(@minimum)
    @journey[:exit_station] = exit_station
    @history << @journey
    @entry_station = nil
  end

  def in_journey?
    !!@entry_station
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end
