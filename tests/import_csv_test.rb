require_relative '../lib/comparison_app'

test = ComparisonApp.new("test")
p test.import_csv

# Act
class Test
def import_csv
  puts "Please enter the file path of your stored csv file"
  users_text = gets.strip
  stored_file = File.open(users_text)

  @bank_statement = SmarterCSV.process(stored_file)
end
end 

# # Assert
# if @bank_statement == SmarterCSV.process('test_file.csv')
#   puts 'Test Passed'
# else
#   puts 'Test Failed'
# end
