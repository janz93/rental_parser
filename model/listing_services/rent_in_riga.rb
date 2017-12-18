class RentInRiga
  CITES = [
    "COUNTY_RIGA",
    "COUNTY_JURMALA"
  ].freeze

  def uri
    "http://manager.rentinriga.lv/xml/city"
  end

  def base_listings_filter
    "//apartment[transaction_type = 'TRANSACTION_GIVE_RENT']"
  end

  def active_listings_filter
    "#{base_listings_filter}[status = 'REO_STATUS_ACTIVE']"
  end

  def archived_listings_filter
    "#{base_listings_filter}[status = 'REO_STATUS_ARCHIVED']"
  end

  def deleted_listings_filter
    "#{base_listings_filter}[status = 'REO_STATUS_DELETED']"
  end

  private

  def city_filter
    filter = ""
    CITES.each do |city|
      filter << "[city = '#{city}']"
    end
    filter
  end
end
