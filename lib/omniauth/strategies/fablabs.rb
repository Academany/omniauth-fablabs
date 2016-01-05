require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Fablabs < OmniAuth::Strategies::OAuth2
      # change the class name and the :name option to match your application name
      option :name, "fablabs"

      option :client_options, {
        :site => "https://api.fablabs.io"
        # :authorize_path => "/oauth/authorize"
      }

      uid { raw_info["user"]["id"] }

      info do
        {
          :email => raw_info["user"]["email"],
          :first_name => raw_info["user"]["first_name"],
          :last_name => raw_info["user"]["last_name"],
          :name => raw_info["user"]["username"],
          :avatar => raw_info["user"]["avatar"]
          # and anything else you want to return to your API consumers
        }
      end
	  
	  extra do
        {
          'raw_info' => raw_info["user"]
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/v0/me.json').parsed
      end
    
    end
  end
end