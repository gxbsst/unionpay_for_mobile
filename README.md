# Unionpay

# 这个是一个银联支付的Gem，请记住现在这个版本是未完成版本， 慎用。

## Installation

Add this line to your application's Gemfile:

    gem 'unionpay'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install unionpay

## Usage
    1. 
	 # pay_controller new 
	 
	 Unionpay.env = :dev # :dev, :pre, :pro
	 
	 params = Unionpay::Params.build("20111108150703858", 1111) # 20111108150703858 为订单号, 1111为订单金>额
	 @form = Unionpay.render_form(params)
	 
	 2. 在config/intializer 添加 unionpay.rb
	 
	 Unionpay.setup do |config|
	 
	  # TODO: 你可以根据不同的环境定义不同的URL
	  
     config.back_callback_url = "http://localhost:3000/notify/"
     config.front_callback_url = "http://localhost:3000/notify/"
    end
    
	 
	 
	

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
