class ApiController < ApplicationController

  API_OK = 'ok'
  MISSING_API_KEY = 'missing api key'
  UNKNOWN_API_KEY = 'unknown api key'

  before_filter :authentication_required

  protect_from_forgery :except => [ :upload_scan ]

  def upload_scan
    @scan_file = @user.scan_files.build :uploaded_data => params[:file]
    if @scan_file.save
      system "rake scan_aws_file SCAN_FILE_ID=#{@scan_file.id} 2> #{RAILS_ROOT}/log/scans/scan_#{@scan_file.id}.log &" 
      render :text => API_OK
    else
      render :text => @scan_file.errors.inspect, :status => 400
    end
  end

  private

    def authentication_required
      @api_key = params[:api_key]
      return render(:text => MISSING_API_KEY, :status => 401) if @api_key.nil? || @api_key.blank?

      @user = User.find_by_api_key(@api_key)
      return render(:text => UNKNOWN_API_KEY, :status => 401) if @user.nil?
    end

end
