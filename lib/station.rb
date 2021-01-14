class Station

  attr_reader :station_name, :station_zone

  def initialize
    @station_name
    @station_zone
  end

end

# At present, each "journey" = "hash k/v pairs (entry and exit stations)", stored in the @journeys array instance variable of the card instance

=begin
journeys = [
 {entry_station: "Highgate" , exit_station: "East Finchley"}
 {entry_station: "Highgate" , exit_station: "East Finchley"}
 {entry_station: "Highgate" , exit_station: "East Finchley"}
]


journeys = [
 journey instance
 journey instance
 journey instance
]

<Journey>#142380418234091238 @entry_station: "Highgate", @exit_station: "East_Finchley"

=end
