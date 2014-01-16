require "unionpay/params/errors"

module Unionpay
  module Params
    class Validator

      attr_accessor :errors

      NEED_SET_KEYS = [
        "customerIp",
        "frontEndUrl",
        "backEndUrl",
        "orderTime", 
        "orderCurrency", 
        "transType",
        "signature",
        "signMethod",
        "version",
        "charset",
        "merId",
        "merAbbr"
      ]

      def self.valid?(params)
        new(params).execute
      end

      def initialize(params)
        @params = params
      end

      def errors
        @errors ||= Errors.new
      end

      def execute
        NEED_SET_KEYS.each do |key| 
          self.errors << "#{key}: not set value"  unless @params.has_key? key
        end
        self
      end 

      alias_method :valid!, :execute

    end
  end
end
