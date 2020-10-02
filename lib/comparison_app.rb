class ComparisonApp
  attr_writer :name
  attr_reader :payslips, :orphan_bank_statements, :orphan_payslips, :table
  attr_accessor :bank_statement

  def initialize(name)
    @name = name
    @payslips = []
    @orphan_bank_statements = []
    @orphan_payslips = []
  end

  def import_csv
    begin
    puts 'Please enter the file path for the csv file you wish to use.'
    file_path = gets.chomp
    @bank_statement = SmarterCSV.process(file_path)
    rescue Errno::ENOENT
      puts 'Invalid file name or file path. Please re-enter'
      retry
    end 
  end

  def enter_user_data
    i = @bank_statement.length - 1
    loop do
      if @payslips[i].nil?
        begin
          puts 'Please enter your payslip date followed by the payslip amount'
          print 'Date: '
          date = gets.chomp
          print 'Amount: '
          amount = gets.chomp.to_i
          raise('Invalid entry. Please re-enter date and amount') if date == '' || amount == ''
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
      puts 'Payslips file empty - Cannot compare'
      self.enter_user_data
      return
    end
    if @bank_statement.eql? @payslips
      puts "#{@name.capitalize} comparison is complete - there are no discrepancies"
    else
      self.mismatch
    end
  end

  def mismatch
    i = 0
    @payslips.each do |pdata|
      if @bank_statement[i] == pdata
        puts 'Bank and payslip match'.colorize(:green)
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
