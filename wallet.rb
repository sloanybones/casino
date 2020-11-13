class Wallet
    #do something
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
        puts "$#{@money}"
    end
    
end