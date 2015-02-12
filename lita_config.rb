require 'yaml'
creds = YAML.load_file('authentication.yml')

Lita.configure do |config|
  config.robot.name = "#{creds["bot_name"]}"
  config.robot.log_level = :info
  config.robot.adapter = :shell
  config.redis.host = "#{creds["redis_host"]}"
  config.http.port = 8181

  config.robot.name = "#{creds["bot_name"]}"
  config.robot.adapter = :irc
  config.adapters.irc.server = "irc.freenode.net"
  config.adapters.irc.channels = creds["irc_channels"].split
  config.adapters.irc.user = "#{creds["bot_name"]}"
  config.adapters.irc.realname = "#{creds["bot_name"]}"
  config.adapters.irc.cinch = lambda do |cinch_config|
    cinch_config.max_reconnect_delay = 123
  end
  config.handlers.weather.api_key = "#{creds["weather_api_key"]}"
  config.handlers.static_meme.mapping = {
    /deal with it/i => ["http://i.imgur.com/ykDuU.gif", "http://i.imgur.com/3PWHn.gif"]
  }
  config.handlers.memegen.command_only = false
  config.handlers.memegen.username = "#{creds["meme_username"]}"
  config.handlers.memegen.password = "#{creds["meme_password"]}"

end
