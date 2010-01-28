class AccountController < ApplicationController

  before_filter :login_required

  def index
    # Do nothing.
  end

end
