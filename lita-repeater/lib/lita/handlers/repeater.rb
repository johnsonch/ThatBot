module Lita
  module Handlers
    class Repeater < Handler
      route(/(a|A)ll:/, :reply, command: true, help: {
        "all:" => "Pings everyone in the room"
      })

      def self.default_config(handler_config)
      end

      def reply(response)
        #names = response.message.channel.users.keys.map(&:nick).reject{|n|[$settings['settings']['nick'],m.user.nick].include?(n)}
        
        #response.reply names.join(' ') unless names.empty?
        response.reply response.inspect
      end
    end
#https://github.com/napcs/jeeves/blob/master/plugins/repeater.rb
    Lita.register_handler(Repeater)
  end
end
