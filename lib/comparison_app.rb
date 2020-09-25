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
      #change the @payslips[index] back to 3
      if @payslips[1] == nil
        puts "please enter your payslip date"
        p "> "
        date = gets.chomp
        amount = gets.chomp
        date_hash={:date => date, :amount => amount}
        @payslips << date_hash
      else
        break
      end
    end
  end 

    def compare_method
      i = 0
      loop do
        while i < @bank_statement.length
          i = i + 1  
          if @bank_statement[i][:date] == @payslips[i][:date]
            puts "you have a match"
          else 
            puts "no match"
            i += i+1
          end
        end 
      end 
    end
   
    
  
  #I want to compare the key values from one hash against the key values of the second hash
  # def compare(bank_data, user_data)
    
  # end 
  
end

sept = Test.new("september")
sept.import_csv
sept.bank_statement
sept.enter_user_data
sept.payslips
sept.compare_method

# puts "string colour".colorize(:blue)
# puts "This is light blue with red background".colorize(:color => :light_blue, :background => :red)