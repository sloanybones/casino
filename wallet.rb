class Wallet

    def initialize(money)
        @money = money
    end

    def add_money(money)
        @money += money
    end

    def subtract_money(money)
        @money -= money
    end

    def current_balance
<<<<<<< HEAD
=======
        # puts "$#{@money}"
>>>>>>> b09246c6381515b9745d0c3905fde9af6142688d
        @money
    end
    
    def validate_money(bet)
        if (@money - bet) >= 0
            true
        else
            false
        end
    end
    
end
