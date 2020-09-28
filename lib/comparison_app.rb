require_relative "run"

class Comparison_app
  #update attrs to be either read or write, not necessarily both
  attr_accessor :name, :bank_statement, :payslips, :orphan_bank_statements, :orphan_payslips

  def initialize(name)
    @name = name
    @bank_statement
    @payslips=[]
    @orphan_bank_statements = orphan_bank_statements
    @orphan_payslips = orphan_payslips
  end 
  #need to expand on the below so that the smartercsv.process becomes an actual method 
  #ask user to advise on where csv file is stored. Pass this to the .process method 
  def menu_selection
  end 
  
  def import_csv
    @bank_statement = SmarterCSV.process('bank_statement.csv')
  end 

  def enter_user_data 
    loop do
      #change the @payslips[index] back to 3
      #or maybe use the number of items in the bank_statement to advise on number of entries
      if @payslips[1] == nil
        puts "please enter your payslip date"
        p "> "
        date = gets.chomp
        puts "please enter your paysip amount"
        p "> "
        amount = gets.chomp
        date_hash={:date => date, :amount => amount}
        @payslips << date_hash
      else
        break
      end
    end
  end 

  def compare_method
    orphan_bank_statements=[]
    orphan_payslips=[]
    if @bank_statement.eql? @payslips
      puts "Data 1 matches Data 2"
    else 
      i=0
      loop do 
        while i < @bank_statement.length
          @bank_statement[i] 
            @payslips.each do |pdata|
              if @bank_statement[i] == pdata
                puts "bank and payslips match".colorize(:green)
                next 
              else 
                puts "no match".colorize(:red)
                orphan_bank_statements << bank_statement[i]
                orphan_payslips << pdata 
              end 
              i += 1
            end 
            break 
          end 
        end 
    end
  end 
   
  def display_data

  end 
    
end 
  

sept = Comparison_app.new("september")
sept.import_csv
sept.bank_statement
sept.enter_user_data
sept.payslips
sept.compare_method

# puts "string colour".colorize(:blue)
# puts "This is light blue with red background".colorize(:color => :light_blue, :background => :red)