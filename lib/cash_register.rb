class CashRegister
    attr_accessor :total, :discount, :items, :previous_total

    def initialize(discount = 0)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title, price, quantity = 1)
        # takes the price of the item times the quantity as the last transaction to then increment with total
        self.previous_total = price * quantity
        self.total += self.previous_total
        quantity.times do
            @items << title
        end
    end

    def apply_discount
        if self.discount != 0
            discount_percent = (100.0 - self.discount.to_f) / 100
            self.total = (self.total * discount_percent).to_i
            "After the discount, the total comes to $#{self.total}."
        else 
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        self.total -= self.previous_total
    end

end
