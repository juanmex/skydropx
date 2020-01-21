class UnitConversor

    FORMULAS = {
        "in-cm"=>"DATA * 2.54",
        "lb-kg"=>"DATA / 2.205"
    }

    class << self

        def formula(current,target)
            key_str = "#{current}-#{target}"
            raise StandardError, "No available formula for conversion #{current} to #{target}" unless FORMULAS.key?(key_str)
            FORMULAS[key_str].dup
        end

        def unit_code(unit)
            unit.to_s.downcase
        end

        def convert(data, current_unit, new_unit)
          formula_str = formula(unit_code(current_unit), unit_code(new_unit))
          formula_str = formula_str.gsub! 'DATA', data.to_s
          eval(formula_str)
        end
    end
end