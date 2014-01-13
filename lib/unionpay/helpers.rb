require 'pry'
require File.join(File.dirname(__FILE__), 'http')
module Unionpay
  module Helpers
    module Signature
     def self.sign(params, security_key)
      md5_security_key = Digest::MD5.hexdigest(security_key)
      string = params.sort.map do |k,v|
        "#{k}=#{v}&" 
      end.join
      Digest::MD5.hexdigest(string + md5_security_key)  
     end
    end

    module Html

     def self.render_form(params, config)
       http = Unionpay::Http.setup(params, config)
       response = http.post
       response.body
     end

    end
  end
end
