require 'journey'
require 'oystercard'

describe Journey do

  describe '#initialize' do
    let (:entry_station) { double :entry_station }
    let (:exit_station) { double :exit_station }

    it 'should recognise an #entry_station' do
      card = Oystercard.new
      card.top_up(10)
      card.touch_in(:entry_station)
      expect(card.journey.entry_station).to eq :entry_station
    end

    it { is_expected.to respond_to :exit_station }

  end

end
