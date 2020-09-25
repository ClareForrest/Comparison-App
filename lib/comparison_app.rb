# require_relative "run"
require 'smarter_csv'

class Test
  #update attrs to be either read or write, not necessarily both
  attr_accessor :name, :bank_statement, :payslips

  def initialize(name)
    @name = name
    @bank_statement
    @payslips=[]
    @compare_outcome = []
  end 
  #need to expand on the below so that the smartercsv.process becomes an actual method 
  def import_csv
    @bank_statement = SmarterCSV.process('test_file.csv')
  end 

  def enter_user_data 
    loop do
      if @payslips[3] == nil
        puts "please enter your payslip date"
        p "> "
        date = gets.chomp
        amount = gets.chomp
        date_hash={:datekey => date, :amount_key => amount}
        @payslips << date_hash
      else
        break
      end
    end
  end 
  
  

end

sept = Test.new("september")
sept.import_csv
sept.bank_statement
sept.enter_user_data
p sept.payslips

# puts "string colour".colorize(:blue)
# puts "This is light blue with red background".colorize(:color => :light_blue, :background => :red)
