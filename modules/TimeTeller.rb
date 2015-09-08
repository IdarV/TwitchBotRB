class TimeTeller
	include Cinch::Plugin

	match 'time'

	def execute(m)
		m.reply("Current time is #{Time.now.strftime("%H:%M:%S")}")
	end
end
