class TotalWeightCalculator
    attr_accessor :length, :width, :height, :weight

    def initialize( length, width, height, weight)
        @length = length.to_f
        @width = width.to_f
        @height = height.to_f
        @weight = weight.to_f
    end

    def calculate
        total_w = volumetric_weight < @weight ? @weight : volumetric_weight
        total_w
    end

    def volumetric_weight
        @volumetric_weight ||= calculate_volumetric_weight
    end

    private 
        def calculate_volumetric_weight
            (@length * @width * @height) / 5000
        end
end