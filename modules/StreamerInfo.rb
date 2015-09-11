require 'kappa'

class StreamerInfo
  include Cinch::Plugin

  match /streaming (.+)/, method: :streaming
  match /viewers (.+)/, method: :viewers

  def streaming(m, channel_name)
    channel = Twitch.channels.get(channel_name);
    m.reply "#{channel_name} is #{channel.streaming? ? "streaming #{channel.game_name}" : 'not streaming'}."
  end

  def viewers(m, channel_name)
    stream = Twitch.streams.get(channel_name)
    m.reply("#{channel_name} has #{stream.viewer_count.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1.').reverse} viewers")
  end
end
