require "spec_helper"
require "rental_parser"

RSpec.describe RentalParser do
  describe "#fetch_rentals" do
    it "returns the rentals as array of nokogiri objects", :vcr do
      listing_service = double("listing_service")
      allow(listing_service).to receive(:uri).and_return(
        "http://www.city24.ee/xml/LV_example.xml"
      )
      allow(listing_service).to receive(:base_listings_filter).and_return(
        "//apartment[transaction_type = 'TRANSACTION_GIVE_RENT']"
      )
      rental_parser = described_class.new(listing_service)

      expect(
        rental_parser.fetch_rentals
      ).to be_kind_of Nokogiri::XML::NodeSet
      expect(listing_service).to have_received(:uri)
      expect(listing_service).to have_received(:base_listings_filter)
    end
  end
end
