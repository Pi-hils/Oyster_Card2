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
        end
end