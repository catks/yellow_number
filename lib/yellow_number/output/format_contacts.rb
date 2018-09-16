 module YellowNumber
   module Output
     class FormatContacts
       def self.call(contacts, formatter: Formatters::CsvFormatter)
         formatter.call(contacts)
       end
     end
   end
 end
