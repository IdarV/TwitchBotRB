require 'firebase'

base_uri = 'https://twitchworddata.firebaseio.com/words'

firebase = Firebase::Client.new(base_uri)

# backbone.js
firebase.delete('bunny')
a = firebase.get('bunny')
puts 'firebase after deleting bunny:'
puts a.body
puts a.raw_body
puts a.body.nil?
puts '--'
response = firebase.set('bunny', 12)
puts response.success? # => true
puts response.code # => 200
puts response.body # => { 'name' => "-INOQPH-aV_psbk3ZXEX" }
puts response.raw_body # => '{"name":"-INOQPH-aV_psbk3ZXEX"}'

a = firebase.get('bunny')
puts a.body
puts a.raw_body
puts a.body.nil?

# a = File.readlines('stopwords.txt').grep(/^about/);
# puts !a.empty?