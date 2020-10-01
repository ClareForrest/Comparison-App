# frozen_string_literal: true

require 'colorize'
require 'tty-table'
require 'tty-prompt'
require 'smarter_csv'
require 'rspec'
require 'set'
require 'optparse'

require_relative 'comparison_app'

# if ARGV == help_options
#     help_options
#   else 
#     ARGV = name
#   end 

name = ComparisonApp.new(name)
table = TTY::Table.new
name.router
