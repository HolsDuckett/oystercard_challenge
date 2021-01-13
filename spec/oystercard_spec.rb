require 'oystercard'

describe Oystercard do

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

  it { is_expected.to respond_to(:deduct).with(1).argument }

  it "should deduct given amount from balance" do
    expect{ subject.deduct(5) }.to change{ subject.balance }.by -5
  end

  it { is_expected.to respond_to(:in_journey?) }
  it { is_expected.to respond_to(:touch_in) }
  it { is_expected.to respond_to(:touch_out) }

  it "should return a default value of false" do
    expect(subject.in_journey?).to be false
  end

  it "should return true when card touches in" do
    subject.top_up(10)
    subject.touch_in
    expect(subject.in_journey?).to be true
  end

  it "should return false when card touches out" do
    subject.top_up(10)
    subject.touch_in
    subject.touch_out
    expect(subject.in_journey?).to be false
  end

  it "it should raise an error if your balance has insufficient funds" do
    expect{ subject.touch_in }.to raise_error "You have insuffiecient funds."
  end

end
