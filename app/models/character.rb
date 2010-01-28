class Character < ActiveRecord::Base

  belongs_to :realm

  validates_presence_of :name

  define_index do
    indexes name
    set_property :enable_star => true
  end

end
