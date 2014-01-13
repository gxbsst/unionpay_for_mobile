# encoding: utf-8
module Unionpay
  class Config

    # TODO: alias_method : back_end_url, back_callback_url
    #
    VERSION = "1.0.0"
    MERCHANT_ID = "105550149170027"
    MERCHANT_NAME = "商户名称"
    SIGN_METHOD = "md5"
    TRANSTYPE = "01"
    CURRENCY = "156"
    CHARSET = "UTF-8"
    SECURITY_KEY = "88888888"
     
    attr_accessor :version, :merchant_id, :merchant_name, :sign_method, :transtype, :currency, :security_key, :front_pay_url, :back_pay_url, :front_callback_url, :back_callback_url, :charset

    def env
      @env ||= ::Unionpay.send(:env)
    end
    
    def charset
      @charset ||= CHARSET
    end

    def front_pay_url
      case env
      when :dev
        "http://58.246.226.99/UpopWeb/api/Pay.action"
      when :pre
        "http://www.epay.lxdns.com/UpopWeb/api/Pay.action"
      when :pro
        "https://unionpaysecure.com/api/Pay.action"
      end
    end

    def back_pay_url
      case env
      when :dev
        "http://58.246.226.99/UpopWeb/api/BSPay.action"
      when :pre
        "http://www.epay.lxdns.com/UpopWeb/api/BSPay.action"
      when :pro
        "https://besvr.unionpaysecure.com/api/BSPay.action"
      end
    end

    def front_callback_url 
      @front_callback_url 
    end

    def back_callback_url 
     @back_callback_url
    end

    def version
      @version ||= VERSION
    end
    
    def merchant_id
     @merchant_id ||= MERCHANT_ID 
    end

    def merchant_name
     @merchant_name ||= MERCHANT_NAME
    end
  
    def sign_method
      @sign_method ||= SIGN_METHOD
    end
    
    def transtype
      @transtype ||= TRANSTYPE
    end

    def currency 
     @currency ||= CURRENCY
    end

    def security_key
     @security_key ||= SECURITY_KEY
    end
    
  end
end
