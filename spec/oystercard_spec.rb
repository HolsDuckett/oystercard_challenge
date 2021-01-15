require 'oystercard'

describe Oystercard do
  let (:entry_station) { double :entry_station }
  let (:exit_station) { double :exit_station }
  let (:journeys) { [{entry_station: entry_station, exit_station: exit_station}] }

  describe '#balance' do
    it { is_expected.to respond_to(:balance) }

    it "should check a card has a balance" do
      expect(subject.balance).to eq(0)
    end
  end

  describe '#top_up' do
    it { is_expected.to respond_to(:top_up).with(1).argument }

    it "should top up balance" do
      expect{ subject.top_up(20) }.to change{ subject.balance }.by 20
    end

    it "should raise an error if max limit exceeded" do
      subject.top_up(Oystercard::LIMIT)
     expect{ subject.top_up(1) }.to raise_error "That's too much money. You've exceeded your limit of £#{Oystercard::LIMIT}."
    end
  end

  describe '#deduct' do
    it "should deduct given amount from balance" do
      expect{ subject.send(:deduct, 5) }.to change{ subject.balance }.by -5
    end
  end

  describe '#in_journey?' do
    it { is_expected.to respond_to(:in_journey?) }

    it "should state subject is not in a journey" do
      expect(subject).not_to be_in_journey
    end

    it "should return true when card touches in" do
      subject.top_up(10)
      subject.touch_in(entry_station)
      expect(subject).to be_in_journey
    end

    it "should return false when card touches out" do
      subject.top_up(10)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect(subject).not_to be_in_journey
    end
  end

  describe '#touch_in' do
    it { is_expected.to respond_to(:touch_in).with(1).argument }

    it "it should raise an error if your balance has insufficient funds" do
      expect{ subject.touch_in(entry_station) }.to raise_error "You have insuffiecient funds."
    end

    it "should remember the entry station when you touch in" do
      subject.top_up(10)
      expect(subject.touch_in(entry_station)).to eq entry_station
    end
  end

  describe '#touch_out' do
    it { is_expected.to respond_to(:touch_out).with(1).argument }

    it "should change the balace after every touch out" do
      subject.top_up(10)
      subject.touch_in(entry_station)
      subject.touch_out(exit_station)
      expect{ subject.touch_out(exit_station) }.to change{ subject.balance }.by -1
    end

    it "should remember the exit station when you touch out" do
      subject.top_up(10)
      subject.touch_in(entry_station)
      expect(subject.touch_out(exit_station)).to eq journeys
    end
  end

  describe "#journeys" do
    it "should check that the journeys is empty by default" do
      expect(subject.journeys).to eq []
    end
  end
end
