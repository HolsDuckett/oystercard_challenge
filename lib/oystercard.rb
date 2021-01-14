require_relative 'journey'

class Oystercard

  MAXIMUM_CARD_VALUE = 90
  MINIMUM_FARE = 1

  attr_reader :balance, :entry_station, :journeys, :journey

  def initialize
    @balance = 0
    @entry_station = nil
    @journeys = []
  end

  def top_up(amount)
    raise "Maximum card value £#{MAXIMUM_CARD_VALUE}." if (@balance + amount) > MAXIMUM_CARD_VALUE
    @balance += amount
  end

  def in_journey?
   !@entry_station.nil?
  end

  def touch_in(entry_station)
    raise 'Insufficient funds.' if @balance < MINIMUM_FARE
    @entry_station = entry_station
    @journeys << {entry_station: entry_station, exit_station: nil}
    @journey = Journey.new(entry_station)
    entry_station
  end

  def touch_out(exit_station)
    deduct(MINIMUM_FARE)
    @entry_station = nil
    @journeys[-1][:exit_station] = exit_station
    @journeys
  end

  private

  def deduct(amount)
    @balance -= amount
  end

end
