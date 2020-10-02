VERSION = '1.0.0'.freeze

options = {}

parser = OptionParser.new do |opts|
  opts.banner = 'Welcome to the Compare App! Usage: app [options]'
  opts.on('-h', '--help', 'Display this Help') do
    puts opts
    exit
  end

  opts.on('-v', '--version', 'Display the Version') do
    puts "You are on Version #{VERSION}"
  end

  opts.on('-kKISSES', '--kisses=KISSES', 'How many kisses would you like?') do |kisses|
    options[:kiss_request] = kisses
    puts "You get #{kisses} kisses!".white.on_red.blink
  end
end

parser.parse!
