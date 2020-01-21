require "./lib/utils/total_weight_calculator"
RSpec.describe TotalWeightCalculator do

    context 'good params for calculations' do
        it 'calculates total weight when strings' do
            expect(TotalWeightCalculator.new("1","1","1","1").calculate).to eql(1.0)
            expect(TotalWeightCalculator.new("3","3","30","100").calculate).to eql(100.0)
            expect(TotalWeightCalculator.new("100","100","100","10").calculate).to eql(200.0)
        end

        it 'calculates total weight when floats' do
            expect(TotalWeightCalculator.new(1.0, 1.0, 1.0, 1.0).calculate).to eql(1.0)
            expect(TotalWeightCalculator.new(100.0,100.0,100.0,10.0).calculate).to eql(200.0)
        end

        it 'calculates total weight when ints' do
            expect(TotalWeightCalculator.new(1, 1, 1, 1).calculate).to eql(1.0)
            expect(TotalWeightCalculator.new(100,100,100,10).calculate).to eql(200.0)
        end


    end
end