require 'colorize'
require 'tty-table'
require 'tty-prompt'
require 'smarter_csv'
require 'rspec'
require 'set'

require_relative 'comparison_app'

test = ComparisonApp.new("test")
table = TTY::Table.new
test.router