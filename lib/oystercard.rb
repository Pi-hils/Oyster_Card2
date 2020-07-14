class Oystercard
 attr_reader :balance
 DEFAULT_BALANCE = 0
 MINIMUM_AMOUNT = 1
 MAX_CAPACITY = 90

        def initialize(balance = DEFAULT_BALANCE)
            @balance = balance
        end

        def top_up(amount)
            raise "amount more than 90" if @balance >= MAX_CAPACITY
            @balance += amount
        end

        def deduct(amount)
            @balance -= amount
            "money deducted"
        end

        def touch_in
            raise "not enough amount on card" if @balance < MINIMUM_AMOUNT
            @in_use = true
            "this works"
        end

        def touch_out
            @in_use = false
            "touching out"
        end

        def in_journey?
            @in_use
        end
end