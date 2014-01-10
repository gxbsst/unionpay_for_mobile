module Unionpay
	module Post
		module ClassMethods

			def post(params)
				conn = Faraday.new(:url => Unionpay::PRO_POST_URL) do |faraday|
					faraday.request  :url_encoded             
					faraday.response :logger                  
					faraday.adapter  Faraday.default_adapter  
				end
				conn.post(POST_URL, params)
			end
			
		end
		
		module InstanceMethods
			
		end
		
		def self.included(receiver)
			receiver.extend         ClassMethods
			receiver.send :include, InstanceMethods
		end
	end

end