# Require all files in yellow_number folder
Dir[File.join(__dir__, 'yellow_number/**/*.rb')].each {|file| require file }

module YellowNumber
end
