require 'glip_sdk'
require 'ringcentral_sdk'
require 'multi_json'

require 'lita/adapters/glip/message_handler'
require 'lita/adapters/glip/room_creator'
require 'lita/adapters/glip/user_creator'

module Lita
  module Adapters
    class Glip < Adapter
      class Connector
        attr_reader :robot

        def initialize(robot, app_key, app_secret, server, username, extension, password, token)
          @robot = robot
          @logger_prefix = " -- #{self.class.name}: "
          @rc_sdk = RingCentralSdk::REST::Client.new do |config|
            config.app_key = app_key
            config.app_secret = app_secret
            config.server_url = server
          end
          @glip_sdk = GlipSdk::REST::Client.new @rc_sdk
          @username = username
          @extension = extension
          @password = password
          @token = token
        end

        def connect
          client_connect
        end

        def client_connect
          Lita.logger.info("#{@logger_prefix}Authorizing with RingCentral.")
          if @token.nil?
            @rc_sdk.authorize_password @username, @extension, @password
            token = MultiJson.encode @rc_sdk.token.to_hash
            Lita.logger.debug("#{@logger_prefix}Authorized with token: #{token}.")
          else
            @rc_sdk.set_token @token
          end

          @glip_sdk = GlipSdk::REST::Client.new @rc_sdk
          observer = Lita::Adapters::Glip::MessageHandler.new @robot, @glip_sdk
          @glip_sdk.posts.observe observer
        end

        def message(group_id, strings)
          strings.each do |s|
            @glip_sdk.posts.post groupId: group_id, text: s
          end
        end

      end
    end
  end
end