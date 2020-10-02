require 'colorize'
require 'tty-table'
require 'tty-prompt'
require 'smarter_csv'
require 'optparse'

require_relative 'help_menu'
require_relative 'comparison_menu'
require_relative 'comparison_app'

comparison_app = ComparisonApp.new
router_name = ComparisonMenu.new
router_name.router(comparison_app)
