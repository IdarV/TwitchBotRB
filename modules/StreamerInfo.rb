require 'kappa'

class StreamerInfo
  include Cinch::Plugin

  match /streaming (.+)/, method: :streaming
  match /viewers (.+)/, method: :viewers
  match /top (\W*((?i)games(?-i))\W*)/, method: :top_games
  match /top (\W*((?i)channels(?-i))\W*)/, method: :top_channels

  def streaming(m, channel_name)
    channel = Twitch.channels.get(channel_name);
    m.reply "#{channel_name} is #{channel.streaming? ? "streaming #{channel.game_name}" : 'not streaming'}."
  end

  def viewers(m, channel_name)
    stream = Twitch.users.get(channel_name).stream
    m.reply(stream.nil? ? "#{channel_name} is not live, can't fetch viewers." : "#{channel_name} has #{pretty_number(stream.viewer_count)} viewers")
  end

  def top_games(m)
    Twitch.games.top(limit: 3) do |game|
      m.reply("#{game.name}: #{game.viewer_count} in #{game.channel_count} channels. (avg. ~#{(game.viewer_count / game.channel_count).floor }/channel)")
    end
  end

  def top_channels(m)
    top_games = []
    top_channels = Hash.new {0}
    Twitch.games.top(limit: 6) { |game| top_games.push(game.name) }
    top_games.each do |game|
      Twitch.streams.find(game: game, limit: 10) do |stream|
        top_channels[stream.channel.name] = stream.viewer_count
      end
    end
    top_channels.sort_by {|k, v| v}.reverse.to_h.take(3).each {|key, value| m.reply("%-15s: %d\n" % [key, value])}
  end

  private
  def pretty_number(number)
    number.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1.').reverse
  end
end
