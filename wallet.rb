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
        # puts "$#{@money}"
        return @money
    end
    
    def validate_money(bet)
        if (@money - bet) >= 0
            true
        else
            false
        end
    end
    
end