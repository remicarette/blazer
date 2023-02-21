module Blazer
    class SmartVariable < Record
        validates :key, presence: true, uniqueness: true
        validates :value, presence: true
        
        def self.to_hash_key_value 
            h = {}
            self.all.each do |smart_variable|
                value = smart_variable.value
                if smart_variable.value[0] == "{" || smart_variable.value[0] == "["
                    value = JSON.parse(smart_variable.value)
                end

                h[smart_variable.key] = value
            end
            h
        end
    end
  end