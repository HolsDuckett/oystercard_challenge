class Journey

  attr_reader :entry_station, :exit_station

  def initialize(entry_station)
    @entry_station = entry_station
    puts "in journey.rb, entry_station = #{entry_station}"
  end

  # Card methods = generating a card
  # Card is being passed to journey_2.rb
  # We are querying journey_2.rb instance

  # We are querying a new instance of journey_2.rb


end

=begin

card.touch_in("Highgate")

journey = Journey.new("Highgate")

=end
