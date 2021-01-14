require 'station'

describe Station do

  describe '#initialize' do

    it 'should respond to #station_name' do
      expect(subject).to respond_to :station_name
    end

    it 'should respond to #station_zone' do
      expect(subject).to respond_to :station_zone
    end

  end

end
