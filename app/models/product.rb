class Product < ActiveRecord::Base

	default_scope	:order => 'title' #now it will order it alphabetically
	has_many :line_items
	before_destroy :ensure_not_referenced_by_any_line_item

attr_accessible :description, :image_url, :price, :title
  
  validates :title, :description, :image_url, :presence => true
  validates :price, :numericality => {:greater_than_or_equal_to => 0.01}
  validates :title, :uniqueness => true
  validates_length_of :title, minimum: 10, message: 'go kill yourself'
  validates :image_url, :format => {
  		:with => %r{\.(gif|jpg|png|jpeg)$}i,
  		:message => 'Must be a url for gif, jpg, jpeg, or png image, bitch!'
  }

	private
	#ensure that there are no line items referencing this product
	def ensure_not_referenced_by_any_line_item
		if line_items.empty?
			return true
		else
			errors.add(:base, 'Line Items present')
			return false
		end
	end

end
  


