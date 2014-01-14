require "unionpay/params/validator"
require "unionpay/helpers/signature"
require "pry"

module Unionpay
  module Params
    class Builder
      attr_accessor :order_number, :amount, :options

      def initialize(order_number, amount, hash = {})
        @order_number = order_number   
        @amount = amount
        @options = hash
      end

      def wrap_params
        need_set_fields.merge!(options).merge!(signature)
      end

      def need_set_fields
        {
          "version" => config.version,
          "merId" => config.merchant_id,
          "merAbbr" => config.merchant_name,
          "customerIp" => customer_ip,
          "frontEndUrl" => config.front_callback_url,
          "backEndUrl" => config.back_callback_url,
          "orderTime" => order_time,
          "orderCurrency" => config.currency,
          "transType" => config.transtype,
          "charset" => config.charset,
          "orderAmount" => amount,
          "orderNumber" => order_number
        }
      end

      def config
        @config ||= ::Unionpay.config
      end  

      #===============================================
      # MUST SET VALUE
      #===============================================

      def customer_ip
        options[:customerIp] || '127.0.0.1' 
      end

      def order_time
        options[:orderTime] || Time.now.strftime('%Y%m%d%H%M%S')
      end

      def signature
        {
          "signature" => sign(need_set_fields, config.security_key) ,
          "signMethod" => config.sign_method
        }        
      end

      def [] key
        options[key]
      end

      def valid?
        validator = validater.valid!
        @errors = validator.errors
        @errors.count > 0 ? false : true
      end

      def errors
        @errors ||= []
      end

      def validater
          @validator ||= Validator.new(wrap_params)        
      end

      def sign(need_set_fields, security_key)
        ::Unionpay::Helpers::Signature.sign(need_set_fields, security_key)
      end

    end
  end
end
