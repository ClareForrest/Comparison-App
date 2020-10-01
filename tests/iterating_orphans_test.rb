VERSION = '1.0.0'

options = {}

class Dice
  def roll 
    rand(1..6)
  end
end 

parser = OptionParser.new do |opts|
  opts.banner = "Welcome to Dice app! Usage: app [options]"
  opts.on('-v', '--version', 'Display the Version') do
    puts "You are on Version #{VERSION}"
  end

  opts.on('-rNUM', '--roll=NUM', Integer, 'Number of times to roll dice') do |num|
    options[:count] = num
  end

  opts.on('-dDICE', '--dice=DICE', Integer, 'Number of dice to roll') do |dice|
    options[:dice] = dice
  end

  opts.on('-h', '--help', 'Display this Help') do
    puts opts
    exit
  end
end

parser.parse!

if options.has_key?(:count)
  die = Dice.new
  options[:count].times do
    if options.has_key?(:dice)
      total = 0
      options[:dice].times do
        total += die.roll
      end
      puts " You rolled a total of #{total}"
    else
      puts " You rolled a #{die.roll}"
    end
  end
end