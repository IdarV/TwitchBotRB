require 'cinch'
require 'yaml'
Dir["./modules/*.rb"].each {|file| require file }

config = YAML.load_file('config/config.yml')

bot = Cinch::Bot.new do
	configure do |c|
		c.server = config['HOST']
		c.nick = config['NICK']
		c.channels = ["##{config['CHANNEL']}"]
		c.plugins.plugins = [Hello]
	end
		
end

bot.start
 