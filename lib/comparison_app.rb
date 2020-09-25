# require_relative "run"
require 'smarter_csv'

class Test
  attr_accessor :name, :bank_statement, :payslips

  def initialize(name)
    @name = name
    @bank_statement
    @payslips = payslips
    @compare_outcome = []
  end 
  #need to expand on the below so that the smartercsv.process becomes an actual method 
  def import_csv
    @bank_statement = SmarterCSV.process('test_file.csv')
  end 

  def enter_user_data
    puts "please enter your first payslip"
    p "> "
    p payslips=[] << gets.chomp
  end 

end


sept = Test.new("september")
sept.import_csv
sept.bank_statement
sept.enter_user_data
sept.payslips
# def enter_user_data(argv)
#   p ARGF.read
# end 
  # def compare()
  # end 

  # def display_comparison()
  # end 
# end 

# puts "string colour".colorize(:blue)
# puts "This is light blue with red background".colorize(:color => :light_blue, :background => :red)
