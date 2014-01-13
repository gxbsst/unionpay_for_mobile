require 'curb'
module Unionpay
	class Http
			def self.post(params, config)
        Curl.post(config.back_pay_url, params)
      end
	end
end
