def load_config
	require 'yaml'
	y = YAML::load_file(File.join(__dir__, 'config.yml'))
	
	raise 'NICK not found in config' if y['NICK'].nil? or y['NICK'] == ''
	raise 'HOST not found in config' if y['HOST'].nil? or y['HOST'] == ''
	raise 'CHANNEL not found in config' if y['CHANNEL'].nil? or y['CHANNEL'] == ''
	
	y
end