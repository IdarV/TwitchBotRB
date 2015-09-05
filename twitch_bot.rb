require 'cinch'
require 'yaml'
require_relative './config/config.rb'
Dir["./modules/*.rb"].each {|file| require file }

config = load_config

bot = Cinch::Bot.new do
	configure do |c|
		c.password = config['PASS'] unless config['PASS'].nil?
		c.nick = config['NICK']
		c.server = config['HOST']
		c.channels = ["##{config['CHANNEL']}"]
		c.plugins.plugins = [Hello, Google]
	end
end

bot.start
 