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
    puts 'Invalid file name or file path. Please re-enter'.colorize(:red)
    retry
  end

  def enter_user_data
    begin
    raise("You haven't imported a csv file yet.".colorize(:red)) if @bank_statement.length <1
  rescue StandardError => e
      p e
      import_csv 
  end 
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
          raise('Invalid entry. Please re-enter date and amount'.colorize(:red)) if date == '' || amount.zero?
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
      enter_user_data
    elsif @bank_statement.eql? @payslips
      puts 'Comparison is complete - there are no discrepancies'.green.blink
    else
      mismatch
    end
  end

  def mismatch
    @orphan_payslips = @payslips
    i = 0
    while i < @bank_statement.length
      j = 0
      k = 0
      while j < @orphan_payslips.length
        if @bank_statement[i] == @orphan_payslips[j]
          puts 'Match'.colorize(:green)
          @orphan_payslips.delete_at(j)
          k = 1
          break
        end
        j += 1
      end
      if k == 0
        puts 'No match'.colorize(:red)
        @orphan_bank_statements << @bank_statement[i]
      end
      i += 1
    end
  end

  def display_data
    if @orphan_bank_statements.length >= 1
      row1 = @orphan_payslips.map do |statements|
        [statements[:date], statements[:amount]]
      end
      row2 = @orphan_bank_statements.map do |statements|
        [statements[:date], statements[:amount]]
      end
      @table = TTY::Table.new(rows: [row1, row2])
      puts "These are the payslips that don't have a match".colorize(:yellow)
      puts @table.render(:ascii)
    else
      puts "There were no unmatched payslips".colorize(:yellow)
    end
  end
end
