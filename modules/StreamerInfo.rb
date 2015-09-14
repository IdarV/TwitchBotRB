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
    stream = Twitch.users.get(channel_name).stream
    m.reply(stream.nil? ? "#{channel_name} is not live, can't fetch viewers." : "#{channel_name} has #{pretty_number(stream.viewer_count)} viewers")
  end

  private
  def pretty_number(number)
    number.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1.').reverse
  end
end
