require 'oystercard'

describe Oystercard do

    describe "balance" do
     it "#must have no money on card" do
        # card = Oystercard.new
        expect(subject.balance).to eq 0
    end
  end
    it "#is able to top" do
        expect(subject.top_up(Oystercard::MAX_CAPACITY)).to eq Oystercard::MAX_CAPACITY
    end

    it "#maximum limit on card is eq 90" do
        oyster = Oystercard.new(Oystercard::MAX_CAPACITY)
     expect { oyster.top_up(Oystercard::MINIMUM_AMOUNT) }.to raise_error "amount more than #{Oystercard::MAX_CAPACITY}"
    end


   it "#touch_in" do
    subject.top_up(Oystercard::MAX_CAPACITY)
    expect(subject.touch_in).to eq "this works"
   end

    it "#touch_out" do
        expect(subject.touch_out).to eq "touching out"
    end

    it "#in_journey" do
        subject.top_up(Oystercard::MAX_CAPACITY)
        subject.touch_in
        expect(subject.in_journey?).to eq true
    end

    it "#not in_journey" do
        subject.touch_out
        expect(subject.in_journey?).to eq false
    end

    it "#raises error" do
        expect {raise 'not enough amount on card'}.to raise_error
    end

    it "#charging amount " do
        expect {subject.touch_out}.to change{subject.balance}.by (- Oystercard::MINIMUM_AMOUNT)
    end
end