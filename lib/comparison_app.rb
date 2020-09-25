# require_relative "run"
require 'smarter_csv'

class Test
  attr_accessor :name, :bank_statement

  def initialize(name)
    @name = name
    @bank_statement
    @payslips = {}
    @compare_outcome = []
  end 
  #need to expand on the below so that the smartercsv.process 
  def import_csv
    @bank_statement = SmarterCSV.process('lib/test_file.csv')
  end 

  def
end

sept = Test.new("september")
sept.import_csv
p sept.bank_statement


  # def enter_user_data()
  # end 

  # def compare()
  # end 

  # def display_comparison()
  # end 
# end 

# puts "string colour".colorize(:blue)
# puts "This is light blue with red background".colorize(:color => :light_blue, :background => :red)
