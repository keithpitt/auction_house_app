module AddonParser

  module Auctions

    # Whenever we hit the RESET_INDEX, it means that were
    # about to start a new loop of items.
    RESET_INDEX = 'itemQuantity'

    SCAN_OK = 'SCAN_OK'
    SCAN_BAD = 'SCAN_BAD'

    def self.scan(contents)

      # Ensure all the extra white space is out.
      contents.gsub!(/(\s)(\s)+/, '')

      # Auctions
      auctions = []

      c = nil
      contents.scan(/\["\w+"\]\s=\s\"[\w\s\"\\"\'\-:()\[\]]+\"/u) do |x|
         y = x.scan(/\"[\w\s\"\\"\'\-:()\[\]]+\"/u)
         key = y[0].slice(1, y[0].length-2)
         value = y[1].slice(1, y[1].length-2)
         if key == RESET_INDEX
            auctions << c unless c.nil?
            c = {}
         end
         c[key] = value
      end

      # Add in the last one (that wasnt caught by the RESET_INDEX
      # condition)
      auctions << c unless c.nil?

      begin

        current_scan_time = ""
        current_scan = ""

        auctions.each do |auction|

          seller = Character.find_or_create_by_name(auction['itemSeller'])
          item = Item.find_or_create_by_name(auction['itemName'])

          if auction['itemName'].blank? || auction['itemName'].empty?
            raise StandardError, "Missing itemName for #{auction.inspect}"
            exit
          end

          if auction['scanTime'] != current_scan_time
            current_scan = Scan.create(:scanned_at => Time.at(auction['scanTime'].to_i))
            current_scan_time = auction['scanTime']
          end

          a = Auction.new :item => item, :scan => current_scan, :character => seller, :quantity => auction['itemQuantity'],
                          :buyout => auction['itemBuyout'], :current_bid => auction['itemCurrentBid'],
                          :orig_bid => auction['itemOriginalBid']
          a.save!

        end

      rescue StandardError => e

        return "#{SCAN_BAD}: #{e.message}"

      end

      return SCAN_OK

    end

  end

end
