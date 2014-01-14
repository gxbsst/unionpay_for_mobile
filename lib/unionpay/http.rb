require "unionpay/http/post"

module Unionpay
  module Http
    def self.post(params, config)
      Post.new(params, config).post
    end
  end
end
