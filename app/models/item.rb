class Item < ActiveRecord::Base

  has_many :auctions

  validates_presence_of :name

  define_index do
    indexes name
    set_property :enable_star => true
  end

  def average_buyout_price
    auctions.average(:buyout_per_item).to_i
  end

  def to_param
    "#{id}-#{name.parameterize}"
  end
  
end
