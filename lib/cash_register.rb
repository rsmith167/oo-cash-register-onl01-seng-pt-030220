
class CashRegister

  attr_accessor :total, :discount, :items, :also_items
  def initialize (discount = 0)
    @total = 0.0
    @discount = discount.to_f
    @items = {}
  @also_items = []
  end
  def add_item(name, price, quantity = 0)
   
    if quantity != 0
      @items[name] = price.to_f * quantity.to_f
      self.total += price.to_f * quantity.to_f
      quantity.times do
        @also_items << name
      end
    else
      @items[name] = price.to_f
      self.total += price.to_f
      @also_items << name
    end
    
  end
  def apply_discount
    if @discount != 0
      self.total = self.total * (1 - @discount/100)
      return "After the discount, the total comes to $#{self.total.to_i}."
    else
      return "There is no discount to apply."
    end
  end
  def items
    @also_items
  end
  def void_last_transaction
    place = @items[@items.keys.last]
    if @discount != 0.0
        self.total -= place * (1 - @discount/100)
    else
        self.total -= place
    end
   @items.delete(@items.keys.last)
   @also_items.pop
  end
  
end