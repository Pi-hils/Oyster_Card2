require 'oystercard'

describe Oystercard do

    describe "balance" do
     it "#must have no money on card" do
        # card = Oystercard.new
        expect(subject.balance).to eq 0
    end
  end
    it "#is able to top" do
        expect(subject.top_up(5)).to eq 5
    end

    it "#maximum limit on card is eq 90" do
        oyster = Oystercard.new(90)
     expect { oyster.top_up(1) }.to raise_error "amount more than 90"
    end

    it "#deducted a certain amaount from card balance" do
        subject.top_up(10)
        expect(subject.deduct(5)).to eq "money deducted"
    end

   it "#touch_in" do
    expect(subject.touch_in).to eq "this works"
   end

    it "#touch_out" do
        expect(subject.touch_out).to eq "touching out"
    end

    it "#in_journey" do
        subject.touch_in
        expect(subject.in_journey?).to eq true
    end

    it "#not in_journey" do
        subject.touch_out
        expect(subject.in_journey?).to eq false
    end
end