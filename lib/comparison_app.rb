# frozen_string_literal: true

class ComparisonApp
  attr_writer :name
  attr_reader :payslips, :orphan_bank_statements, :orphan_payslips, :table
  attr_accessor :bank_statement

  def initialize(name)
    @name = name
    @bank_statement = import_csv
    @payslips = []
    @orphan_bank_statements = []
    @orphan_payslips = orphan_payslips = []
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
      # user_entry = gets.chomp
      SmarterCSV.process('/Users/clareforrest/Desktop/bs_desktop.csv')
    # raise Errno::ENOENT
    #   puts "Please upload a bank statement for comparison in CSV format".colorize(:red)
  end

  def enter_user_data
    i = @bank_statement.length
    loop do
      if @payslips[i].nil?
        puts 'Please enter your payslip date'
        print '> '
        date = gets.chomp
        loop do
          if date == ""
            puts "Invalid entry. Please enter your payslip date"
            date = gets.chomp
          else 
            break
          end 
        end 
        puts 'Please enter your payslip amount'
        print '> '
        amount = gets.chomp
        loop do
          if amount == ""
            puts "Invalid entry. Please enter payslip amout"
            amount = gets.chomp
          else 
            break
          end 
        end 
        date_hash = { date: date, amount: amount }
        @payslips << date_hash
      else
        break
      end
    end
  end

  def compare_method
    if @payslips.length.zero?
      puts 'Payslips file empty - Cannot compare'
      self.enter_user_data
      return
    end
    if @bank_statement.eql? @payslips
      puts '#{@name.capitalize} comparison is complete - there are no discrepancies'
    else
      i = 0
      loop do
        @payslips.each do |pdata|
          if @bank_statement[i] == pdata
            puts 'Bank and payslips match'.colorize(:green)
            next
          else
            puts 'No match'.colorize(:red)
            @orphan_payslips << pdata
            @orphan_bank_statements << @bank_statement[i]
          end
          if i == @bank_statement.length - 1
            break
          else
            i += 1
          end
        end
        break
      end
    end
  end

  def display_data
    if @orphan_bank_statements.length > 1
      row1 = @orphan_bank_statements.map do |statements|
        [statements[:date], statements[:amount]]
      end 
        row2 = @orphan_payslips.map do |statements|
          [statements[:date], statements[:amount]]
        end
      @table = TTY::Table.new(rows: [row1, row2])
      puts "These are the dates and amounts that don't have a match".colorize(:yellow)
      puts @table.render(:ascii)
    else
      puts "You'll need to enter data to compare".colorize(:yellow)
    end
  end
end
