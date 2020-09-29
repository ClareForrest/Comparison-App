require 'colorize'
require 'tty-table'
require 'tty-prompt'
require 'smarter_csv'
require 'rspec'

require_relative 'comparison_app'

test = ComparisonApp.new("test")
test.router