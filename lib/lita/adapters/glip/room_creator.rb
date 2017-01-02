module Lita
  module Adapters
    class Glip < Adapter
      class RoomCreator
        class << self
          def find_or_create_room(room_id, glip_sdk)
            Lita::Room.find_by_id(room_id) || create_room(room_id, glip_sdk)
          end

          def create_room(room_id, glip_sdk)
            res = glip_sdk.groups.get groupId: room_id
            if res.status == 200
              glip_room = res.body
              return Lita::Room.create_or_update room_id, name: glip_room['name']
            end
            Lita::Room.create_or_update room_id
          end
        end
      end
    end
  end
end
