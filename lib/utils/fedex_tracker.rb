class FedexTracker

    def initialize(credentials)
        @shipment = Fedex::Shipment.new(credentials)
    end

    def track_element(tracking_number)
        @shipment.track(:tracking_number => tracking_number).first.as_json
    end

    def element_info(item)
        data = {}
        dimension = item["details"]["package_dimensions"]
        unit = dimension["units"]

        case unit
        when "IN"
            data[:length] = UnitConversor.convert(dimension["length"],:in, :cm)
            data[:width] = UnitConversor.convert(dimension["width"],:in, :cm)
            data[:height] = UnitConversor.convert(dimension["height"],:in, :cm)
        when "CM"
            data[:length] = dimension["length"].to_f
            data[:width] = dimension["width"].to_f
            data[:height] = dimension["height"].to_f
        end

        weight = item["details"]["package_weight"]
        unit = weight["units"]
        value = weight["value"]

        case unit
        when "LB"
            data[:weight] = UnitConversor.convert(value,:lb, :kg)
        when "KG"
            data[:weight] = value.to_f
        end

        data
    end

end