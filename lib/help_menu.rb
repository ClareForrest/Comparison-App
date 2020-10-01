require 'optparse'
VERSION = '1.0.0'

class KissClass
  def kiss_request 

  end
end 

options = {}

parser = OptionParser.new do |opts|
  opts.banner = "Welcome to the Compare App! Usage: app [options]"
  opts.on('-v', '--version', 'Display the Version') do
    puts "You are on Version #{VERSION}"
  end

  opts.on('-nNAME', '--name=NAME', String, 'Name of Comparisons') do
    options[:name] = name
  end 

  opts.on('-kKISSES', '--kisses=KISSES', 'How many kisses would you like?') do |kisses|
    options[:kisses] = kisses
  end

  opts.on('-h', '--help', 'Display this Help') do
    puts opts
    exit
  end
end

parser.parse!

if options.has_key?(:kisses)
  alan = KissClass.new
  alan.kiss_request
    options[:kisses] do
      puts "I want #{:kisses[kisses]} kisses"
    end
end