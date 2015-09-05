# MODULE FOR TESTING STUFF
require 'cgi'

class Google
	include Cinch::Plugin


	match /google (.+)/

	def execute(m, query)
		#puts "m.class: #{m.class}"
		#puts "m.action_message: #{m.action_message}"
		#puts "m.command: #{m.command}"
		#puts "m.message: #{m.message}"
		#puts "queuery: #{queuery}"
		#puts "m.params: #{m.params.inspect}"
		m.reply("http://www.google.com/search?q=#{CGI.escape(query)}")
	end

end