module Unionpay
  module Helpers
    module Html

      def self.included(receiver)
        receiver.extend ClassMethods
      end

      module ClassMethods
        def render_form(params)
          html = [
            "<form action='#{::Unionpay.config.front_pay_url}' method='post'>"
          ]
          params.each do |k,v|
            html << "<input type='hidden' name='#{k}' value='#{v}' />"
          end
          html << "<input type='submit' />"
          html << "</form>"
          html.join
        end
      end

    end
  end
end
