require "spec_helper"
require_relative "../../../model/listing_services/rent_in_riga.rb"

RSpec.describe RentInRiga do
  describe "#uri" do
    it "returns the uri where to downlad the data from" do
      expect(described_class.new.uri).to eq(
        "http://manager.rentinriga.lv/xml/city"
      )
    end
  end

  describe "#base_listings_filter" do
    it "returns the base filter to find each listing" do
      expect(described_class.new.base_listings_filter).to eq(
        "//apartment[transaction_type = 'TRANSACTION_GIVE_RENT']"
      )
    end
  end

  describe "#active_listings_filter" do
    it "returns the base filter to find each listing" do
      expect(described_class.new.active_listings_filter).to eq(
        "#{base_listings_filter}[status = 'REO_STATUS_ACTIVE']"
      )
    end
  end

  describe "#archived_listings_filter" do
    it "returns the base filter to find each listing" do
      expect(described_class.new.archived_listings_filter).to eq(
        "#{base_listings_filter}[status = 'REO_STATUS_ARCHIVED']"
      )
    end
  end

  describe "#deleted_listings_filter" do
    it "returns the base filter to find each listing" do
      expect(described_class.new.deleted_listings_filter).to eq(
        "#{base_listings_filter}[status = 'REO_STATUS_DELETED']"
      )
    end
  end

  def base_listings_filter
    "//apartment[transaction_type = 'TRANSACTION_GIVE_RENT']"
  end
end
