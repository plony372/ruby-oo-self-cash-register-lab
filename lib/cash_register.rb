# include 'pry'
# class CashRegister

#     attr_accessor :total, :discount, :item
#     @@all_items = []
#     @@all_prices = []
#     def initialize(discount = 20)
#         @total = 0
#         @discount = discount
#     end

#     def add_item(title, price, quantity = 1)
#         @total += price * quantity
#         @@all_items.push(title)
#         @@all_prices.push(price)
#     end

#     def apply_discount 
#         @total -= (discount * (total / 100))
#         # binding.pry
#         "After the discount, the total comes to $#{total}."
#     end

#     def item
#         @@all_items
#     end

#     def void_last_transaction
#         lastItem = @@all_prices.pop()
#         @total -= lastItem
#     end
# end





class CashRegister

    attr_accessor :items, :discount, :total, :last_transaction
  
    def initialize(discount=0)
      @total = 0
      @discount = discount
      @items = []
    end
  
    def add_item(title, amount, quantity=1)
      self.total += amount * quantity
      quantity.times do
        items << title
      end
      @last_transaction = amount * quantity
    end
  
    def apply_discount
      if discount != 0
        self.total = (total * ((100.0 - discount.to_f)/100)).to_i
        "After the discount, the total comes to $#{self.total}."
      else
        "There is no discount to apply."
      end
    end
  
    def void_last_transaction
      self.total = self.total - self.last_transaction
    end
  end

cash = CashRegister.new
cash.add_item("macbook air", 1000)
cash.add_item("fether", 1.99)
# p cash.total
p cash.void_last_transaction
p cash.void_last_transaction


