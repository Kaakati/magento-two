# frozen_string_literal: true

require "test_helper"

class TestMagentoTwo < Minitest::Test
  def test_configuration
    MagentoTwo.configure do |config|
      config.host = "http://95.179.163.92/rest/V1/"
      config.token = "Bearer ssudztnqp152oc91xkunp0xj6837byfg"
    end
    assert MagentoTwo.configuration.host.eql?("http://95.179.163.92/rest/V1/")
    assert MagentoTwo.configuration.token.eql?("Bearer ssudztnqp152oc91xkunp0xj6837byfg")
  end

  def test_client_url_path
    assert MagentoTwo::Client.new.endpoint.eql?(MagentoTwo.configuration.host)
  end

  def test_ship_order
    puts MagentoTwo::Order.new.ship(carrier_code: 'Manifest', title: 'Tracking Number', track_number: '1Y-9876543210')
  end
end
