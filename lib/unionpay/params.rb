require File.join(File.dirname(__FILE__), 'config')
module Unionpay
  class Params

    attr_accessor :order_number, :amount, :options
   
    def self.build(order_number, amount, hash = {})
      params = new(order_number, amount, hash)
      params.wrap_params
    end

    def initialize(order_number, amount, hash)
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
      @config ||= Unionpay::Config.new
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
        "signature" => build_signature,
        "signMethod" => config.sign_method
      }        
    end

    def [] key
      options[key]
    end
   
    def valid?
     validator = Validator.valid?(wrap_params)  
     @errors = validator.errors
     @errors.count > 0 ? false : true
    end

    def errors
     @errors ||= []
    end

    private

    def md5_security_key
      Digest::MD5.hexdigest(config.security_key)
    end

    def build_signature
      string = need_set_fields.map do |k,v|
        "#{k}=#{v}&" 
      end.join
      Digest::MD5.hexdigest(string + md5_security_key)  
    end

  end
end
