class Oystercard
 attr_reader :balance, :entry_station, :journey_history
 DEFAULT_BALANCE = 0
 MINIMUM_AMOUNT = 1
 MAX_CAPACITY = 90

        def initialize(balance = DEFAULT_BALANCE)
            @balance = balance
            @in_use = false
            @journey_history = []
        end

        def top_up(amount)
            raise "amount more than 90" if @balance >= MAX_CAPACITY
            @balance += amount
        end

        def touch_in(entry_station)
            raise "not enough amount on card" if @balance < MINIMUM_AMOUNT
             @entry_station = entry_station
            "welcome to #{entry_station}"
        end

        def touch_out(exit)
            deduct(MINIMUM_AMOUNT)
            @entry_station = nil
            @journey_history << {entry: @entry_station, exit: exit}
            "touching out"
        end

        def in_journey?
            @entry_station != nil ? true : false
    
        end

        private

        def deduct(amount)
            @balance -= amount
            "money deducted"
        end

    
end
