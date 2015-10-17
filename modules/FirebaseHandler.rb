require 'cgi'
require 'firebase'

def uri?(string)
  string.match(%r{\Ahttps?.*})
end

def is_stopword(word)
  return true if word[0] == '!' or word[0] == '/'
  return true if uri?(word)
  !File.readlines('stopwords.txt').grep(/^#{word}/).empty?
end

class FirebaseHandler
  include Cinch::Plugin

  # no prefix and match anything. This allows everything to flow trough and use the asynch module for updates
  set :prefix, //
  match /.*/, method: :update

  def update(m)
    base_uri = 'https://twitchworddata.firebaseio.com/words'

    firebase = Firebase::Client.new(base_uri)
    words = m.message.gsub(/\s+/m, ' ').strip.split(' ')
    for word in words
      word.downcase!
      word.gsub!(/[^0-9A-Za-z]/, '')
      unless is_stopword(word)
        a = firebase.get(word)
        if a.body.nil?
          firebase.set(word, 1)
        else
          firebase.set(word, a.body.to_i + 1)
        end
      end
    end
  end
end
