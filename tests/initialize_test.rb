class Test
  attr_accessor :name, :bank_statement, :payslips

  def initialize(name)
    @name = name
    @bank_statement=[{:date => 1, :amount => 1234}, {:date => 2, :amount => 1234}]
    @payslips=[{:date => 1, :amount => 1234}, {:date => 3, :amount => 123}]
    @compare_outcome = []
  end 
  def to_s
    puts "Test name for new class"
  end 
end

sept = Test.new("september")

puts sept