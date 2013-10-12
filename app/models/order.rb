class Order < ActiveRecord::Base
  attr_accessible :address, :email, :name, :pay_type, :cart_id, :product_id, :product, :cart

  PAYMENT_TYPES = ["Check", "Credit Card", "Purchase Order"]


validates :pay_type, :inclusion => PAYMENT_TYPES
validates :name, :address, :email, :pay_type, :presence => true

has_many :line_items, :dependent => :destroy

def add_line_items_from_cart(cart)
		cart.line_items.each do |item|
			item.cart_id = nil
			line_items << item
#this is adding each line item to the order table (sets cart id to 0 so we can delete the cart)


end	
end

	end