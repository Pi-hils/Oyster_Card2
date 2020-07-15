require 'oystercard'

describe Oystercard do
let(:entry_station) {double(:entry_station)}
let(:exit) {double(:exit_station)}


    describe "balance" do
     it "#must have no money on card" do
        # card = Oystercard.new
        expect(subject.balance).to eq 0
    end
  end
    it "#is able to top" do
        expect(subject.top_up(Oystercard::MAX_CAPACITY)).to eq Oystercard::MAX_CAPACITY
    end

    it "#empty - journeys_history" do
        expect(subject.journey_history).to be_empty
    end

    it "#maximum limit on card is eq 90" do
        oyster = Oystercard.new(Oystercard::MAX_CAPACITY)
     expect { oyster.top_up(Oystercard::MINIMUM_AMOUNT) }.to raise_error "amount more than #{Oystercard::MAX_CAPACITY}"
    end


   it "#touch_in" do
    subject.top_up(Oystercard::MAX_CAPACITY)
    expect(subject.touch_in(entry_station)).to eq "welcome to #{entry_station}"
   end

    it "#touch_out" do
        expect(subject.touch_out(exit)).to eq "touching out"
    end

    it "#in_journey" do
        subject.top_up(Oystercard::MAX_CAPACITY)
        subject.touch_in(entry_station)
        expect(subject.in_journey?).to eq true
    end

    it "#not in_journey" do
        subject.touch_out(exit)
        expect(subject.in_journey?).to eq false
    end

    describe "#journey history" do
    it "touching in and out" do
        subject.top_up(Oystercard::MAX_CAPACITY)
        subject.touch_in(entry_station)
        subject.touch_out(exit) 
        expect(subject.journey_history).to eq [{entry: @entry_station, exit: exit}]
    end
end

    it "#raises error" do
        expect {raise 'not enough amount on card'}.to raise_error
    end

    it "#charging amount " do
        expect {subject.touch_out(exit)}.to change{subject.balance}.by (- Oystercard::MINIMUM_AMOUNT)
    end

    it 'expects card to remember entry station' do
      subject = Oystercard.new
      subject.top_up(Oystercard::MAX_CAPACITY)
      expect(subject.touch_in(entry_station)).to eq "welcome to #{entry_station}"
    end

    it "starts with an #empty journey" do
        expect(subject.journey_history).to eq []
    end

end

