class ScanFilesController < ApplicationController

  before_filter :login_required

  def new
    @scan_file = current_user.scan_files.build
    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def create
    @scan_file = current_user.scan_files.build params[:scan_file]
    respond_to do |format|
      if @scan_file.save
        system "rake scan_aws_file SCAN_FILE_ID=#{@scan_file.id} 2> #{RAILS_ROOT}/log/scans/scan_#{@scan_file.id}.log &" 
        flash[:notice] = 'Your scan file was successfully uploaded.'
        format.html { redirect_to :action => 'new' }
      else
        format.html { render :action => "new" }
      end
    end
  end

end
