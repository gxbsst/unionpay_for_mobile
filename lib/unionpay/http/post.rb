require 'curb'

module Unionpay
  module Http
    class Post

      attr_accessor :config, :params

      def post
        Curl.post(config.front_pay_url, params)
      end

      def initialize(params, config)
        @params = params
        @config = config
      end

    end
  end
end
