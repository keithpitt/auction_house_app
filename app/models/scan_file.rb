class ScanFile < ActiveRecord::Base

  belongs_to :user

  has_attachment  :content_type => 'application/octet-stream',  # Thats what lua files report as.
                  :storage => :file_system,
                  :max_size => 100.megabytes

  validates_as_attachment

  after_create :generate_md5_checksum

  def file=(value)
    self.uploaded_data = value
  end

  def do_scan
    unless new_record?
      AddonParser::Auctions.scan File.read(full_filename)
      update_attribute :scanned_at, Time.now
    end
  end

  private

    def generate_md5_checksum
      checksum = `openssl md5 "#{full_filename}"`
      update_attribute :md5_checksum, checksum.gsub(/.*=/, '').strip.chomp
    end

end
