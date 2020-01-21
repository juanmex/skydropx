class OverweightReportGenerator
    def initialize(file_data)
        @labels = file_data
    end

    def import_labels_data
        @labels.each do |label|
            package = Package.create(
                tracking_number: label["tracking_number"],
                carrier: label["carrier"],
                length: label["parcel"]["length"],
                width: label["parcel"]["width"],
                height: label["parcel"]["height"],
                weight: label["parcel"]["weight"],
                distance_unit: label["parcel"]["distance_unit"],
                mass_unit: label["parcel"]["mass_unit"]
            )
        end
    end

    def calculate_overweight
        
        fedex_tracker = FedexTracker.new({
            :key => ENV["fedex_key"],
            :password => ENV["fedex_password"],
            :account_number =>  ENV["fedex_account_number"],
            :meter => ENV["fedex_meter"],
            :mode => ENV["fedex_mode"]})

        Package.pending_overweight.each do |package|
            item = fedex_tracker.track_element(package.tracking_number)
            info_data = fedex_tracker.element_info(item)
            total_weight_calculator = TotalWeightCalculator.new(
                info_data[:length],
                info_data[:width],
                info_data[:height],
                info_data[:weight])
            fedex_total_weight = total_weight_calculator.calculate

            package.update(fedex_total_weight: fedex_total_weight, overweight: ( fedex_total_weight - package.package_total_weight))
        end
    end
end