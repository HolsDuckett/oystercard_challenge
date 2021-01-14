class Journey

  attr_reader :entry_station, :exit_station

  DEFAULT_ENTRY_STATION = nil

  def initialize(entry_station = DEFAULT_ENTRY_STATION)
    @entry_station = entry_station
    @exit_station = nil
  end

end
