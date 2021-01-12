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

end
