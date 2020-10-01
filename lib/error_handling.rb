@bank_statement = [{ date: 1120, amount: 1234 }, { date: 2220, amount: 5678 }, { date: 3320, amount: 91_011 }]
@payslips = []

def enter_user_data
    i = @bank_statement.length
    loop do
      if @payslips[i].nil?
        begin
          puts 'Please enter your payslip date'
          print '> '
          date = gets.chomp
          puts 'Please enter your payslip amount'
          print '> '
          amount = gets.chomp
          raise('Invalid entry. Please re-enter date and amount') if date == '' || amount == ''
        rescue StandardError => e
          p e
          retry
        end
        date_hash = { date: date, amount: amount }
        @payslips << date_hash
      else
        break
      end
    end
  end

  enter_user_data