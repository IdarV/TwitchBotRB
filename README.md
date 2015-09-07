# TwitchBotRB
ruby twitch bot. 

Go to a IRC client that is connected to your server, example uses irc.freenode.net (i.e. go to https://webchat.freenode.net/) 

The script will respond with the with the modules, whick are fairly easy to set up. Currently it restponds to / with:


```!hello``` -> ``` 'Hello from module, %USERNAME%'```


```!google %SOMETHING%``` -> ```*GOOGLE LINK WITH SOMETHING*``` 

This is simply a spare-time project.
# Config


1) Install required gems
```
gem install bundler
bundle install
```
2) Follow the steps in config_example.yml

3) Finally, run
```
ruby twitch_bot.rb
```