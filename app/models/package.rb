class Package < ApplicationRecord
    before_create :complete_total_and_label_weight

    def complete_total_and_label_weight
        self.package_total_weight = total_weight_calculator.calculate
        self.package_label_weight = self.package_total_weight.ceil
    end

    def total_weight_calculator
        @total_weight_calculator ||= TotalWeightCalculator.new(length, width, height, weight )
    end


    scope :pending_overweight, -> { where("overweight is null") }


end
