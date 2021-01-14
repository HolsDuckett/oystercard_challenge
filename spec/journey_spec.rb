require 'journey'
require 'oystercard'

describe Journey do

  describe '#initialize' do
    let (:entry_station) { double :entry_station }
    let (:exit_station) { double :exit_station }

    it 'should respond to #entry_station' do
      card = Oystercard.new
      card.top_up(10)
      card.touch_in("Highgate")
      
    end

    #it 'should respond to #exit_station' do
    #  expect(subject).to respond_to :exit_station
    #end

  end

end

=begin
starting a journey
finishing a journey
returning whether or not the journey is complete
calculating the fare of a journey
=end
