module MagentoTwo
  class Order < Client

    PENDING = 'pending'
    PROCESSING = 'processing'
    COMPLETE = 'complete'

    # Returns All Orders
    #
    # @return [Hash] Orders Items
    def all
      begin
        response = @connection.get('orders', query_params(value: PENDING, index: 0)
                                            .merge!(query_params(value: PROCESSING, index: 1))
                                            .merge!(query_params(value: COMPLETE, index: 2)))
        JSON.parse(response.body, object_class: OpenStruct)
      rescue JSON::ParserError, TypeError => e
        puts e
      end
    end

    # Returns Pending (New) Orders
    #
    # @return [OpenStruct] Array Orders Items
    def pending
      begin
        response = @connection.get('orders', query_params(value: PENDING))
        JSON.parse(response.body, object_class: OpenStruct)
      rescue JSON::ParserError, TypeError => e
        puts e
      end
    end

    # Returns Completed (Shipped) Orders
    #
    # @return [OpenStruct] Orders Items
    def complete
      begin
        response = @connection.get('orders', query_params(value: COMPLETE))
        JSON.parse(response.body, object_class: OpenStruct)
      rescue JSON::ParserError, TypeError => e
        puts e
      end
    end

    # Returns Processing (Invoiced) Orders
    #
    # @return [OpenStruct] Orders Items
    def processing
      begin
        response = @connection.get('orders', query_params(value: PROCESSING))
        JSON.parse(response.body, object_class: OpenStruct)
      rescue JSON::ParserError, TypeError => e
        puts e
      end
    end

    # Update Order shipment and save shipment details on order
    #
    # @param [String, title] Carrier Name
    # @param [String, track_number] Shipment Tracking Number
    # @param [String, carrier_code] Magento Carrier Code
    # @param [Integer, order_id] Magento Order ID
    # @return [String] Order ID
    def ship(order_id: nil, notify: true, carrier_code: nil, title: nil, track_number: nil)
      object = tracking_params(
        order_id: order_id,
        notify: true,
        carrier_code: carrier_code,
        title: title,
        track_number: track_number)

      begin
        response = @connection.post("order/#{order_id}/ship") do |req|
          req.body = object.to_json
        end
        puts JSON.parse(response.body)
        response.body
      rescue JSON::ParserError, TypeError => e
        puts e
      end
    end

    private

    def query_params(field: 'status', value: PENDING, condition: 'eq', index: 0)
      {
        "searchCriteria[filter_groups][0][filters][#{index}][field]": field,
        "searchCriteria[filter_groups][0][filters][#{index}][value]": value,
        "searchCriteria[filter_groups][0][filters][#{index}][condition_type]": condition
      }
    end

    def tracking_params(order_id: nil, notify: true, carrier_code: nil, title: nil, track_number: nil)
      {
        notify: notify,
        tracks: [
          {
            track_number: track_number,
            title: title,
            carrier_code: carrier_code
          }
        ]
      }
    end
  end
end
