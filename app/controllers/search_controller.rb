class SearchController < ApplicationController

  def index
    @search_type = params[:search_type]

    if @search_type == 'Items'
      @results = Item.search("*#{params[:q]}*", :page => params[:page], :per_page => 20)
    elsif @search_type == 'Characters'
      @results = Character.search("*#{params[:q]}*", :page => params[:page], :per_page => 20)
    else
      @search_type = false
    end
  end

end
