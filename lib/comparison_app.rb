class ComparisonApp
  attr_reader :payslips, :orphan_bank_statements, :orphan_payslips, :table
  attr_accessor :bank_statement

  def initialize
    @payslips = []
    @orphan_bank_statements = []
    @orphan_payslips = []
  end

  def import_csv
    puts 'Please enter the file path for the csv file you wish to use.'
    file_path = gets.chomp
    @bank_statement = SmarterCSV.process(file_path)
  rescue Errno::ENOENT
    puts 'Invalid file name or file path. Please re-enter'
    retry
  end

  def enter_user_data
    i = @bank_statement.length - 1
    loop do
      if @payslips[i].nil?
        begin
          p
          puts 'Please enter your payslip date followed by the payslip amount'
          print 'Date: '
          date = gets.chomp
          print 'Amount: '
          amount = gets.chomp.to_i
          raise('Invalid entry. Please re-enter date and amount'.colorize(:red)) if date == '' || amount == 0
        rescue StandardError => e
          p e
          retry
        end
        @payslips << { date: date, amount: amount }
      else
        break
      end
    end
  end

  def compare_method
    if @payslips.length.zero?
      puts 'Payslips file empty - Cannot compare'.colorize(:red)
      self.enter_user_data
  elsif @bank_statement.eql? @payslips
      puts 'Comparison is complete - there are no discrepancies'
    else
      self.mismatch
    end
  end

  def mismatch 
    @new_bank_statement = @bank_statement.reverse
    i = 0
    while i < @bank_statement.length do
      j = 0
      while j < @payslips.length do 
        if @new_bank_statement[i] == @payslips[j]
          puts "Match".colorize(:green)
          @new_bank_statement.pop
          break 
        else
          puts "No match".colorize(:red)
          @orphan_payslips << payslips[j]
        end 
        j += 1
      end 
      i += 1
    end 
  end

  def display_data
    if @bank_statement.length > 1
      row2 = @orphan_payslips.map do |statements|
        [statements[:date], statements[:amount]]
      end
      @table = TTY::Table.new(rows: [row2])
      puts "These are the dates and amounts that don't have a match".colorize(:yellow)
      puts @table.render(:ascii)
    else
      puts "You'll need to enter data to compare".colorize(:yellow)
    end
  end
end
