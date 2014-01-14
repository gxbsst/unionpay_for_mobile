require "unionpay/params/builder"

module Unionpay
  module Params

    def self.build(order_number, amount, hash = {})
      params = Builder.new(order_number, amount, hash)
      params.wrap_params
    end

  end
end
