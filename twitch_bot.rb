require 'cinch'
require 'yaml'
require_relative './config/config.rb'
Dir["./modules/*.rb"].each {|file| require file }

config = load_config

bot = Cinch::Bot.new do
	configure do |c|
		c.server = config['HOST']
		c.nick = config['NICK']
		c.channels = ["##{config['CHANNEL']}"]
		c.plugins.plugins = [Hello]
	end
		
end

bot.start
 