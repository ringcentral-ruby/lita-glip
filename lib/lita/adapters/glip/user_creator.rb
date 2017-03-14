require 'multi_json'

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
            Lita.logger.debug("Glip API Response Status: #{res.status}.")

            if res.status == 200
              glip_user_name = real_name res.body
              Lita.logger.debug("Glip API Response: User Name: #{glip_user_name}/#{res.body['id']}.")
              user = Lita::User.create(
                res.body['id'],
                name: glip_user_name,
                mention_name: glip_user_name
              )
              Lita.logger.debug("Created New User With User Name [#{glip_user['id']}][#{glip_user_name}]")           
              return user
            end
            Lita.logger.debug("Create New User [#{user_id}]")
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
