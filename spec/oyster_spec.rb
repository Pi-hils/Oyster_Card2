require 'oystercard'

describe Oystercard do

    describe "balance" do
     it "#must have no money on card" do
        card = Oystercard.new
        expect(card.balance).to eq 0
    end
end
    # it "#must have money on card" do

end