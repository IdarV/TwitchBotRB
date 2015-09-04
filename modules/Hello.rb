class Hello
	include Cinch::Plugin
	
	match "hello"
	
	def execute(m)
		m.reply("Hello from module, #{m.user.nick}")
	end
end