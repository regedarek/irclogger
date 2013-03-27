# -*- coding: utf-8 -*-
require 'cinch'

bot = Cinch::Bot.new do
  configure do |c|
    c.server = "irc.freenode.net"
    c.password = ""
    c.channels = ["#dino-rb"]
    c.nick     = "dino-logger"
    #c.plugins.plugins = [Hello]
  end

  on :message do |m|
    Log.create({
      name: m.user.nick,
      text: m.message,
      time: Time.now.to_s
    })
  end

end

bot.start
