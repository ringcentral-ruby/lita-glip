module Lita
  module Adapters
    class Glip < Adapter
      class UserCreator
        class << self
          def find_or_create_user(user_id, glip_sdk)
            Lita::User.find_by_id(user_id) || create_user(user_id, glip_sdk)
          end

          def create_user(user_id, glip_sdk)
            res = glip_sdk.persons.get personId: user_id
            if res.status == 200
              glip_user_name = real_name res.body
              return Lita::User.create(
                glip_user['id'],
                name: glip_user_name,
                mention_name: glip_user_name
              )
            end
            User.create user_id
          end

          def real_name(glip_user)
            "#{glip_user['firstName']} #{glip_user['lastName']}".gsub(/\s+/, ' ').strip
          end
        end
      end
    end
  end
end
