module Unionpay
  module Unionpay
    def self.included(receiver)
      receiver.send(:include, InstanceMethods) 
      receiver.send(:extend, ClassMethods)
    end

    module ClassMethods

      def env=(env)
        @env ||= env 
      end

      def env
        @env  
      end

      def render_form(params)
        ::Unionpay::Helpers::Html.render_form(params)
      end

      def config
        @config ||= Config.new
      end

      def setup
        yield config
      end

    end

    module InstanceMethods
    end

  end
end


