class ReportsController < ApplicationController

  def top_items
    @sql_items = ActiveRecord::Base.connection.execute <<-SQL
      SELECT item_id, COUNT(*) FROM auctions GROUP BY item_id ORDER BY count DESC limit 50;
    SQL
    @top_items = []
    @sql_items.each { |x| @top_items << { :item => Item.find_by_id(x[0]), :count => x[1] } }
  end

end
