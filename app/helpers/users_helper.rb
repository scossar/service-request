# Helper methods defined here can be accessed in any controller or view in the application

module TestelevenHomepage
  class App
    module UsersHelper
      def clean_name(name)
        name.split(' ').join('_').downcase
      end

      def random_string(length = 6)
        charset = %w{ 2 3 4 6 7 9 a c d e f g h j k m n p q r t v w x y z }
        (0...length).map { charset.to_a[rand(charset.size)] }.join
      end

      def random_name(name)
        clean_name(name) + '_' + random_string
      end

      def process_user(params)
        errors = []
        user_created = false

        unless params[:name]
          errors.push 'A username must be supplied'
          errors
        end

        name = params[:name]
        email = params[:email]
        password = params[:password]
        message = params[:message]
        username = random_name(name)

        # Create a Discourse user
        begin
          discourse_user = @client.create_user(
              name: name,
              email: email,
              username: username,
              password: password,
              active: true
          )

          user_created = discourse_user['success']
          raise Error unless user_created
        rescue
          errors.push "A user could not be created."
        end

        if user_created

          puts 'WE HAVE A USER!'
          discourse_user.each do |key, value|
            puts "#{key}: #{value}"
          end

          # Create a group for the client
          begin
            discourse_user_group = @client.create_group(name: username)
            discourse_user_group_id = discourse_user_group['basic_group']['id']
          rescue
            errors.push "The group #{username} could not be created."
          end

          # Create a category for the user
          begin
            discourse_user_category = @client.create_category(
                name: username,
                color: "%06x" % (rand * 0xffffff),
                text_color: "000000"
                # parent_category_id: "5"
            )
          rescue
            errors.push "The category #{username} could not be created."
          end

          # Add the user to the group
          begin
            @client.group_add(discourse_user_group_id, user_id: discourse_user['user_id'])
          rescue
            errors.push "The user #{username} could not be added to the group #{username}."
          end

          # Add a topic to the user's category
          begin
            discourse_user_topic = @client.create_topic(
                category: username,
                title: "A contact enquiry from #{name}",
                skip_validation: true,
                auto_track: false,
                raw: message
            )
          rescue
            errors.push "The topic for #{username} could not be created."
          end

          errors
        end
      end
    end

    helpers UsersHelper
  end
end
