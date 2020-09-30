
class ComparisonApp
  attr_writer :name
  attr_reader :bank_statement, :payslips, :orphan_bank_statements, :orphan_payslips, :table

  def initialize(name)
    @name = name
    @bank_statement = import_csv
    @payslips = []
    @orphan_bank_statements = []
    @orphan_payslips = orphan_payslips=[]
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
    SmarterCSV.process('bank_statement.csv')
  end

  def enter_user_data
    i = @bank_statement.length
    loop do
      if @payslips[i].nil?
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
    if @payslips.length == 0
      puts "Please enter payslip data"
      return
    end 
    if @bank_statement.eql? @payslips
      puts 'Data 1 matches Data 2'
    else
      i = 0
      loop do
        @payslips.each do |pdata|
          if @bank_statement[i] == pdata
            puts 'bank and payslips match'.colorize(:green)
            next
          else
            puts 'no match'.colorize(:red)
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
        rows = @orphan_bank_statements.map do |statements|
          [statements[:date], statements[:amount]]
        end
        @table = TTY::Table.new(rows: rows)
        puts "These are the dates and amounts that don't have a match - please follow up with Gail"
        puts @table.render(:ascii)
      else 
        puts "You'll need to enter data to compare"
      end 
    end   
end 