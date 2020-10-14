class Provider < ApplicationRecord
  attribute :isp_email,:validate => /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/
  validates_presence_of :name, :website, :description, :isp_email, :image, :rating, :contact_no, :max_speed, :lowest_price
  
  TYPE_OF_FILTER = {
  	'Featured' => 'created_at',
  	'Price low to high' => 'lowest_price', 
  	'Price high to low'=> 'lowest_price DESC', 
  	'Rating low to high'=> 'rating', 
  	'Rating high to low'=> 'rating DESC'
  }.freeze

  def blank_stars
    5 - rating.to_i
  end

 
  def self.get_order_by_clause(filter)
  	TYPE_OF_FILTER[filter.to_s]
  end
  
  def self.search(search)
    where("lower(name) LIKE ? OR lowest_price = ?", "%#{search.downcase}%", search.to_i)
  end
end
