require 'curb'
module Unionpay
  class Http
    attr_accessor :params, :config

    def self.setup(params, config)
      new(params, config)
    end

    def initialize(params, config)
      @params = params
      @config = config
    end

    def post
      Curl.post(config.front_pay_url, params)
    end
  end
end
