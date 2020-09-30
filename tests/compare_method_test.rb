require_relative '../lib/comparison_app'
require 'colorize'
require 'set'
require 'tty-table'

bank_statement = [{ date: 1120, amount: 1234 }, { date: 2220, amount: 5678 }, { date: 3320, amount: 91_011 }]
# # payslips_test_1 = [{:date => 1120, :amount => 1234}, {:date => 2220, :amount => 5678}]
# # payslips_test_2 = [{:date => 1120, :amount => 1234}, {:date => 2220, :amount => 12}, {:date => 2220, :amount => 5678}]
payslips_test_3 = [{ date: 1120, amount: 1234 }, { date: 2220, amount: 5678 }, { date: 2220, amount: 5678 }]

test = ComparisonApp.new("test")
test.bank_statement = bank_statement
test.payslips = payslips_test_3
# p test.compare_method
# table = TTY::Table.new



test.compare_method