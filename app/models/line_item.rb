class LineItem < ActiveRecord::Base
	attr_accessible :product, :product_id, :id, :updated_at, :cart_id, :created_at, :quantity, :price, :order_id
  belongs_to :product
  belongs_to :cart
  belongs_to :order

  def total_price
  	product.price * quantity
  end


end