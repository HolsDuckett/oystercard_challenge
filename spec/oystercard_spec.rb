require 'oystercard'

describe Oystercard do
  let (:entry_station) { double :entry_station }

  it { is_expected.to respond_to(:balance) }

  it { is_expected.to respond_to(:top_up).with(1).argument }

  it "should check a card has a balance" do
    expect(subject.balance).to eq(0)
  end

  it "should top up balance" do
    expect{ subject.top_up(20) }.to change{ subject.balance }.by 20
  end

  it "should raise an error if max limit exceeded" do
    subject.top_up(Oystercard::LIMIT)
   expect{ subject.top_up(1) }.to raise_error "That's too much money. You've exceeded your limit of £#{Oystercard::LIMIT}."
  end

  it "should deduct given amount from balance" do
    expect{ subject.send(:deduct, 5) }.to change{ subject.balance }.by -5
  end

  it { is_expected.to respond_to(:in_journey?) }
  it { is_expected.to respond_to(:touch_in).with(1).argument }
  it { is_expected.to respond_to(:touch_out) }

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
    subject.touch_out
    expect(subject).not_to be_in_journey
  end

  it "should change the balace after every touch out" do
    subject.top_up(10)
    subject.touch_in(entry_station)
    subject.touch_out
    expect{ subject.touch_out }.to change{ subject.balance }.by -1
  end

  it "it should raise an error if your balance has insufficient funds" do
    expect{ subject.touch_in(entry_station) }.to raise_error "You have insuffiecient funds."
  end

  it "should remeber the entry station when you touch in" do
    subject.top_up(10)
    expect(subject.touch_in(entry_station)).to eq entry_station
  end

end
