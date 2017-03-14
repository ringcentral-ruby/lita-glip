module Lita
  module Adapters
    class Glip < Adapter
      class MessageHandler
        attr_reader :robot

        def initialize(robot, glip_sdk)
          @robot = robot
          @glip_sdk = glip_sdk
          @logger_prefix = " -- #{self.class.name}: "
        end

        def update(message)
          m = message

          unless m.is_a?(Hash) && m.key?('event') && m['event'].index('/glip/posts').is_a?(Integer)
            return
          end
          unless m.key?('body') && m['body'].key?('messageType') && m['body']['messageType'] == "PostAdded"
            return
          end

          user_id = message['body']['post']['creatorId']
          user = UserCreator.find_or_create_user user_id, @glip_sdk

          room_id = message['body']['post']['groupId']
          room = RoomCreator.find_or_create_room room_id, @glip_sdk

          source = Lita::Source.new user: user, room: room
          post = message['body']['post']['text'].to_s
          msg = Lita::Message.new @robot, post, source

          @robot.receive msg
        end
      end
    end
  end
end
