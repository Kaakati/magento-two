# frozen_string_literal: true

require "test_helper"

class TestMagentoTwo < Minitest::Test
  def test_configuration
    MagentoTwo.configure do |config|
      config.host = "http://95.179.232.47/rest/V1/"
      config.token = "skididq1ksems0mb8b58eekm66mx3ix5"
    end
    assert MagentoTwo.configuration.host.eql?("http://95.179.232.47/rest/V1/")
    assert MagentoTwo.configuration.token.eql?("skididq1ksems0mb8b58eekm66mx3ix5")
  end

  def test_client_url_path
    assert MagentoTwo::Client.new.endpoint.eql?(MagentoTwo.configuration.host)
  end

  def test_ship_order
    MagentoTwo.configure do |config|
      config.host = "http://95.179.232.47/rest/V1/"
      config.token = "skididq1ksems0mb8b58eekm66mx3ix5"
    end
    # puts MagentoTwo::Order.new.pending
    # puts MagentoTwo::Order.new.processing
    puts MagentoTwo::Order.new.complete
    puts MagentoTwo::Order.new.ship(order_id: 2, carrier_code: 'Manifest', title: 'Tracking Number', track_number: '1Y-9876543210')
    # puts MagentoTwo::Order.new.all
  end
end
