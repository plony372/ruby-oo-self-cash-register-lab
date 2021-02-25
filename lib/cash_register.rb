# include 'pry'
class CashRegister

    attr_accessor :total, :discount, :item
    @@all_items = []
    @@all_prices = []
    def initialize(total = 0, discount = 20)
        @total = total
        @discount = discount
    end

    def add_item(title, price, quantity = 1)
        @total += price * quantity
        @@all_items.push(title)
        @@all_prices.push(price)
    end

    def apply_discount 
        @total -= (discount * (total / 100))
        # binding.pry
        "After the discount, the total comes to $#{total}."
    end

    def item
        @@all_items
    end

    def void_last_transaction
        lastItem = @@all_prices.pop()
        @total -= lastItem
        
    end


end

cash = CashRegister.new
cash.add_item("macbook air", 1000)
cash.add_item("fether", 1.99)
# p cash.total
p cash.void_last_transaction
p cash.void_last_transaction


