module YellowNumber
  module Input
    class AddressParser
      def self.call(address_line)
        # TODO: Validate Input
        street, number, city = address_line.split(',')
        { street: street.strip, number: number.strip.to_i, city: city.strip }
      end
    end
  end
end

