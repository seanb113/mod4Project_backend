class ApplicationController < ActionController::API
  
      def secret_key
          "h3ll0"
      end

      # def session_user
      #   decoded_hash = decoded_token
      #   if !decoded_hash.empty?
      #     User_id = decoded_hash[0]['user_id']
      #     @user = User.find_by(id: user_id)
      #   else
      #     nil
      #   end
      # end

      def encode(payload)
        JWT.encode(payload, secret_key, 'HS256')
      end

      def decode(token)
        JWT.decode(token, secret_key, true, { algorithm: 'HS256' })[0]
      end
end
