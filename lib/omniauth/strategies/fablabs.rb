require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class Fablabs < OmniAuth::Strategies::OAuth2
      # change the class name and the :name option to match your application name
      option :name, "fablabs"

      option :client_options, {
        :site => "https://fablabs.io"
        # :authorize_path => "/oauth/authorize"
      }

      uid { raw_info["id"] }

      info do
        {
          :email => raw_info["email"]
          # and anything else you want to return to your API consumers
        }
      end
	  
	  extra do
        {
          'raw_info' => raw_info
        }
      end

      def raw_info
        @raw_info ||= access_token.get('/api/v0/me.json').parsed
      end
    
    end
  end
end