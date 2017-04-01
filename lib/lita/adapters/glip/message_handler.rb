require 'multi_json'

module Lita
  module Adapters
    class Glip < Adapter
      class MessageHandler
        TYPE_PROPERTY_A = 'eventType'
        TYPE_PROPERTY_B = 'messageType'

        attr_reader :robot

        def initialize(robot, glip_sdk)
          @robot = robot
          @glip_sdk = glip_sdk
          @logger_prefix = " -- #{self.class.name}: "
        end

        def update(message)
          m = message

          Lita.logger.debug("#{@logger_prefix}Glip Lita: Glip Message Received: #{MultiJson.encode(m)}")

          unless m.is_a?(Hash) && m.key?('event') && m['event'].index('/glip/posts').is_a?(Integer)
            return
          end

          unless m.key?('body')
            Lita.logger.warn("#{@logger_prefix}Glip Lita: Glip Message Received without body: #{MultiJson.encode(m)}")
            return
          end

          unless (m['body'].key?(TYPE_PROPERTY_A) && m['body'][TYPE_PROPERTY_A] == "PostAdded") ||
            (m['body'].key?(TYPE_PROPERTY_B) && m['body'][TYPE_PROPERTY_B] == "PostAdded")
            return
          end

          post = m['body'].key?('post') ? m['body']['post'] : m['body']

          user_id = post['creatorId']
          user = UserCreator.find_or_create_user user_id, @glip_sdk

          room_id = post['groupId']
          room = RoomCreator.find_or_create_room room_id, @glip_sdk

          source = Lita::Source.new user: user, room: room
          post = post['text'].to_s
          msg = Lita::Message.new @robot, post, source

          Lita.logger.debug("#{@logger_prefix}Glip Lita: Robot Message Built")
          @robot.receive msg
        end
      end
    end
  end
end
