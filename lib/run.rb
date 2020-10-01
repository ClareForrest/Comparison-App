# frozen_string_literal: true

require 'colorize'
require 'tty-table'
require 'tty-prompt'
require 'smarter_csv'
require 'set'
require 'optparse'

require_relative 'help_menu'
require_relative 'comparison_app'

name = ComparisonApp.new('name')
name.router
