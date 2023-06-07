# frozen_string_literal: true

require_relative "MagentoTwo/version"
require_relative "MagentoTwo/configuration"
require_relative "MagentoTwo/client"
require_relative "MagentoTwo/order"

module MagentoTwo

  class << self
    attr_accessor :configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end

  def self.reset
    @configuration = Configuration.new
  end

  def self.configure
    yield(configuration)
  end
end
