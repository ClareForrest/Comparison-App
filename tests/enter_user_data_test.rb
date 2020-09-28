require_relative 'initialize_test'

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

self.enter_user_data