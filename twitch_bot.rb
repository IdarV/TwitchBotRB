require 'cinch'
require 'yaml'

config = YAML.load_file('config.yml')


bot = Cinch::Bot.new do
  configure do |c|
    c.server = config['HOST']
	c.nick = config['NICK']
    c.channels = ["##{config['CHANNEL']}"]
  end

  on :message, "hello" do |m|
     m.reply "Hello, #{m.user.nick}"
   end
end

 bot.start

 puts 'HELLO WORLD'