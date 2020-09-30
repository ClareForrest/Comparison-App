require_relative '../lib/comparison_app'
require 'tty-table'

# test = ComparisonApp.new("test")

# p test.display_data
# def compare 
# table = TTY::Table.new(["header1","header2","header3"], [["a1", "a2", "a3"], ["b1", "b2", "b3"]])
bank_statement = [{ date: 1120, amount: 1234 }, { date: 2220, amount: 5678 }, { date: 3320, amount: 91_011 }]
bank_statement.each do |hash|
  # table << bank_statement
  # header: ["date", "amount"],
  table = TTY::Table.new(rows: [hash])

  # table = TTY::Table.new(header: ["h1", "h2"], rows: [["a1", "a2"], ["b1", "b2"]])

  p table.render(:basic)
  
end  

