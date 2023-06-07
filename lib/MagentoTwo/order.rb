module MagentoTwo
  class Order < Client
    def initialize

    end

    def all
    end

    def pending
    end

    def complete
    end

    def processing
    end

    def ship(notify: true, carrier_code: nil, title: nil, track_number: nil)
      object = [
        notify: notify,
        tracks: [
          [track_number: track_number],
          [title: title],
          [carrier_code: carrier_code]
        ]
      ]
    end
  end
end
