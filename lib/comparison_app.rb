# require_relative "run"
require 'smarter_csv'

class Test
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
        puts "please enter your payslip"
        p "> "
        @payslips << gets.chomp
      else
        break
      end
    end
  end 
  
  # def compare(bank_file, user_file)
  #   bank_file.each do |line|
  #   p line
  #     end
  #   user_file.each do |number|
  #     p number
  #     end 
  #   end 
  # def compare(bank_file, user_file)
  #   bank_file.each do |key, value|
  #     p key.include? user_file[0]
  #   end

end

# arr=[1,2,4,3,4]
# example=[3,4,3,2,1,3,4]

sept = Test.new("september")
sept.import_csv
sept.bank_statement
sept.enter_user_data
# sept.payslips
# sept.compare(sept.bank_statement, sept.payslips)


  # def display_comparison()
  # end 
# end 

# puts "string colour".colorize(:blue)
# puts "This is light blue with red background".colorize(:color => :light_blue, :background => :red)
