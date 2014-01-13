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

			def render_form(params, config)
				::Unionpay::Helpers::Html.render_form(params, config)
			end

		end

		module InstanceMethods
		end

	end
end


