module Unionpay
  module Configs
    class Setting
      attr_accessor :version, :merchant_id, :merchant_name, :sign_method, :transtype, :currency, :security_key, :front_pay_url, :back_pay_url, :front_callback_url, :back_callback_url, :charset

      def env
        @env ||= ::Unionpay.send(:env)
      end

      def charset
        @charset ||= CHARSET
      end

      def front_pay_url
        case env 
        when :pre
          "http://www.epay.lxdns.com/UpopWeb/api/Pay.action"
        when :pro
          "https://unionpaysecure.com/api/Pay.action"
        else
          "http://58.246.226.99/UpopWeb/api/Pay.action"
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
        @front_callback_url ||= "http://localhost:3000/notify" 
      end

      def back_callback_url 
        @back_callback_url ||= "http://localhost:3000/notify"
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
end
