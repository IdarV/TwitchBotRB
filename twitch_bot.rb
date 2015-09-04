require 'cinch'
require 'yaml'

class Hello
	include Cinch::Plugin
	
	match "hello"
	
	def execute(m)
		m.reply("Hello from module, #{m.user.nick}")
	end
end

config = YAML.load_file('config.yml')

bot = Cinch::Bot.new do
	configure do |c|
		c.server = config['HOST']
		c.nick = config['NICK']
		c.channels = ["##{config['CHANNEL']}"]
		c.plugins.plugins = [Hello]
	end
		
end



 bot.start
 