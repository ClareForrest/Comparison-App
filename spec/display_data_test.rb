require_relative '../lib/comparison_app'
require 'tty-table'

def compare
  table = ''
  payslips_test_3 = [{ date: 1120, amount: 1234 }, { date: 2220, amount: 5678 }, { date: 2220, amount: 5678 }]
  bank_statement = [{ date: 1120, amount: 1234 }, { date: 2220, amount: 5678 }, { date: 3320, amount: 91_011 }]
  bank_statement.each do |hash|
    table = TTY::Table.new(rows: [hash])
    payslips_test_3.each do |another_hash|
      table << another_hash
    end
  end
  p table.render(:basic)
end

p compare
