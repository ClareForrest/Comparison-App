require_relative '../lib/run.rb'
require_relative '../lib/comparison_app.rb'

#Arrange
sept = Comparison_app.new("september")

#Act
def import_csv
  @bank_statement = SmarterCSV.process('test_file.csv')
end

#Assert
if @bank_statement == SmarterCSV.process('test_file.csv')
  puts "Test Passed"
else 
  puts "Test Failed"
end 