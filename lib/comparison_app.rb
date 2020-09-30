require 'tty-table'
require 'smarter_csv'

class ComparisonApp
  # update attrs to be either read or write, not necessarily both
  attr_accessor :name, :bank_statement, :payslips, :orphan_bank_statements, :orphan_payslips

  def initialize(name)
    @name = name
    @bank_statement
    @payslips = []
    @orphan_bank_statements = []
    @orphan_payslips = orphan_payslips=[]
    # @table = table
  end

  def menu_selection
    prompt = TTY::Prompt.new
    puts 'Welcome to the Comparison App'
    prompt.select('Please make a selection from the below') do |menu|
      menu.choice({ name: 'Upload CSV', value: '1' })
      menu.choice({ name: 'Enter user data', value: '2' })
      menu.choice({ name: 'Compare databases', value: '3' })
      menu.choice({ name: 'View comparison', value: '4' })
      menu.choice({ name: 'Exit', value: '5' })
    end
  end

  def router
    loop do
      case menu_selection
      when '1'
        import_csv
      when '2'
        enter_user_data
      when '3'
        compare_method
      when '4'
        display_data
      when '5'
        exit
      end
    end
  end

  # need to expand on the below so that the smartercsv.process becomes an actual method
  # ask user to advise on where csv file is stored. Pass this to the .process method
  def import_csv
    # puts "Please enter the file path of your stored csv file"
    # stored_file = gets
    @bank_statement = SmarterCSV.process('bank_statement.csv')
  end

  def enter_user_data
    loop do
      # maybe use the number of items in the bank_statement to advise on number of entries
      if @payslips[3].nil?
        puts 'please enter your payslip date'
        print '> '
        date = gets.chomp
        puts 'please enter your payslip amount'
        print '> '
        amount = gets.chomp
        date_hash = { date: date, amount: amount }
        @payslips << date_hash
      else
        break
      end
    end
  end

  def compare_method
    if @bank_statement.eql? @payslips
      puts 'Data 1 matches Data 2'
    else
      i = 0
        while i < @bank_statement.length
          @bank_statement[i]
          @payslips.each do |pdata|
            if @bank_statement[i] == pdata
              puts 'bank and payslips match'.colorize(:green)
              next
            else
              puts 'no match'.colorize(:red)
              # table = TTY::Table.new
              # table << bank_statement[i]
              # table << pdata
            end
            i += 1
          end
          break
        end
    end
  end
  
  def display_data
    @bank_statement.each do |hash|
      table = TTY::Table.new(rows: [hash])
    p table.render(:basic)
    end  
    
    # table = TTY::Table.new(new_table)
    # puts table.render(:ascii)
  end 
end 