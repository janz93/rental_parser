require "nokogiri"
require "open-uri"

class RentalParser
  def initialize(listing_service)
    @listing_service = listing_service
  end

  def fetch_rentals
    doc = Nokogiri::XML(open(@listing_service.uri))
    doc.xpath(@listing_service.base_listings_filter)
  end
end
