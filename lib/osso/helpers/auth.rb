module Osso
  module Helpers
    module Auth
      def decode(_token)
        @current_user = {
          email: 'admin@oss-demo.com',
          scope: 'admin',
          id: SecureRandom.uuid,
        }
      end
    end
  end
end
