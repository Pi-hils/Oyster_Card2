class Oystercard
 attr_reader :balance
 DEFAULT_BALANCE = 0

        def initialize(balance = DEFAULT_BALANCE)
            @balance = balance
        end

        def top_up(amount)
            raise "amount more than 90" if @balance >= 90
            @balance += amount
        end

        def deduct(amount)
            @balance -= amount
            "money deducted"
        end

        def touch_in
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