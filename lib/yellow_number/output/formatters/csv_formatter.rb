require 'csv'

module YellowNumber
  module Output
    module Formatters
      class CsvFormatter
        def self.call(contacts)
          CSV.generate do |csv|
            csv << ["Nome", "Número", "Endereço"]
            contacts.each do |contact|
              csv << [contact[:name], contact[:number], contact[:address]]
            end
          end
        end
      end
    end
  end
end
