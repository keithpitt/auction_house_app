class Auction < ActiveRecord::Base

  belongs_to :character
  belongs_to :item
  belongs_to :scan

  before_create :update_buyout_per_item

  protected

    def update_buyout_per_item
      self.buyout_per_item = buyout / quantity
    end

end
