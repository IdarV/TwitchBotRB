require 'cgi'

class Misc
	include Cinch::Plugin

	match 'time', method: :time
	match 'info', method: :info
	match 'help', method: :info

	def time(m)
		m.reply("Current time is #{Time.now.strftime('%H:%M:%S')}")
	end

	def info(m)
		m.reply('Helpers: !viewers, !streaming, !time, !hello, !google')
	end
end
