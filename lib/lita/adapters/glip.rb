require 'lita'
require 'lita/adapters/glip/connector'
require 'lita/adapters/glip/message_handler'
require 'lita/adapters/glip/room_creator'
require 'lita/adapters/glip/user_creator'

module Lita
  module Adapters
    class Glip < Adapter
      namespace 'glip'

      # Required attributes
      config :app_key, type: String, required: true
      config :app_secret, type: String, required: true
      config :server_url, type: String, default: 'platform.devtest.ringcentral.com'

      config :username, type: String, required: true
      config :extension, type: String
      config :password, type: String, required: true
      config :token, type: String

      def initialize(robot)
        super
        @connector = Connector.new(
          robot,
          config.app_key,
          config.app_secret,
          config.server_url,
          config.username,
          config.extension,
          config.password,
          config.token
        )
      end

      def run
        @connector.connect
        sleep
      rescue Interrupt
        shut_down
      end

      def send_messages(target, strings)
        Lita.logger.info 'Sending Messages via Glip'
        @connector.message target.room_object.id, strings
      end

      def shut_down
        robot.trigger :disconnected
      end
    end

    Lita.register_adapter :glip, Glip
  end
end
