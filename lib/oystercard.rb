class Oystercard
 attr_reader :balance, :entry_station, :journey_history
 DEFAULT_BALANCE = 0
 MINIMUM_AMOUNT = 1
 MAX_CAPACITY = 90

        def initialize(balance = DEFAULT_BALANCE)
            @balance = balance
            @journey_history = []
        end

        def top_up(amount)
            raise "amount more than 90" if @balance >= MAX_CAPACITY
            @balance += amount
        end

        def touch_in(entry_station)
            raise "not enough amount on card" if @balance < MINIMUM_AMOUNT
            @entry_station = entry_station
            "this works"
        end

        def touch_out(exit)
            deduct(MINIMUM_AMOUNT)
            @journey_history << {entry: @entry_station, exit: exit}
            @entry_station = nil
            "touching out"
        end

        def in_journey?
            if @entry_station != nil
              true
            else
              false
            end
        end

        private

        def deduct(amount)
            @balance -= amount
            "money deducted"
        end
end
