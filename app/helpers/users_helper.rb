# Helper methods defined here can be accessed in any controller or view in the application

module TestelevenHomepage
  class App
    module UsersHelper
      def process_user(params)
        puts "this is working"
      end
    end

    helpers UsersHelper
  end
end
