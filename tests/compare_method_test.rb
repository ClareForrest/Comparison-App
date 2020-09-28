
bank_statement = @bank_statement=[{:date => 1120, :amount => 1234}, {:date => 2220, :amount => 5678}, {:date => 3320, :amount => 91011}]
# payslips_test_1 = @payslips=[{:date => 1120, :amount => 1234}, {:date => 2220, :amount => 5678}]
# payslips_test_2 = @payslips=[{:date => 1120, :amount => 1234}, {:date => 2220, :amount => 12}, {:date => 2220, :amount => 5678}]
payslips_test_3 = @payslips=[{:date => 1120, :amount => 1234}, {:date => 2220, :amount => 5678}, {:date => 2220, :amount => 5678}]


  def compare_method(bank_statement, payslips)
    orphan_bank_statements=[]
    orphan_payslips=[]
    if bank_statement.eql? payslips
      puts "Data 1 matches Data 2"
    else 
      i=0
      loop do 
        while i < bank_statement.length
          @bank_statement[i] 
            @payslips.each do |pdata|
              if @bank_statement[i] == pdata
                puts "bank and payslips match"
                next 
              else 
                puts "no match"
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
    
  # self.compare_method(bank_statement, payslips_test_1)
  # self.compare_method(bank_statement, payslips_test_2)
  self.compare_method(bank_statement, payslips_test_3)