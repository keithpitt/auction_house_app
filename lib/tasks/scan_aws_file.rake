desc "Scan AW_SCANS file"
task :scan_aws_file => :environment do
  @scan_file = ScanFile.find(ENV["SCAN_FILE_ID"])
  @scan_file.do_scan
end
