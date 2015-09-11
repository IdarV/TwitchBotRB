# MODULE FOR TESTING STUFF
require 'cgi'

class Google
	include Cinch::Plugin

	match /google (.+)/

	def execute(m, query)
		m.reply("http://www.google.com/search?q=#{CGI.escape(query)}")
	end
end