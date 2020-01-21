require "./lib/utils/unit_conversor"
RSpec.describe UnitConversor do

    context 'with errors' do
        it 'raises error when recieve a invalid string' do
            expect{UnitConversor.convert("text", :in, :cm)}.to raise_error(NameError)
        end

        it 'raises error when no formula available' do
            expect{UnitConversor.convert("text", :in, :km)}.to raise_error(StandardError)
        end

    end

    context 'basic conversions' do
        it 'in to cm' do
            expect(UnitConversor.convert(1, :in, :cm)).to eql(2.54)
            expect(UnitConversor.convert(100, :in, :cm)).to eql(254.0)
            expect(UnitConversor.convert("100", :in, :cm)).to eql(254.0)
            
        end

        it 'lb to kg' do
            expect(UnitConversor.convert(1, :lb, :kg)).to eql(1/2.205)
            expect(UnitConversor.convert(101, :lb, :kg)).to eql(101/2.205)
            expect(UnitConversor.convert("101", :lb, :kg)).to eql(101/2.205)
        end
    end
end