module Meta_Functions
    def make_accessor_bool(*params)
        params.each do |param|
            define_singleton_method("#{param}") do
                return !(self.getter("#{param}")).zero?
            end
            define_singleton_method("#{param}=") do |value|
                self.setter("#{param}", value ? 1 : 0)
            end
        end
    end
end