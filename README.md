# Unionpay

# 这个是一个银联支付的Gem，请记住现在这个版本是未完成版本， 慎用。

## Installation

Add this line to your application's Gemfile:
```ruby
gem 'unionpay'
```
And then execute:

```zsh
  $ bundle
```
Or install it yourself as:

```zsh
  $ gem install unionpay
```
## Usage

### 1
```ruby
  # pay_controller new 
  order_number = "20111108150703858"
  amount = 11111
  @form = Unionpay.build_form(params)
```

### 2 在(config/intializer) 添加 (unionpay.rb)
 ```ruby
 Unionpay.setup do |config|
 
   # TODO: 你可以根据不同的环境定义不同的URL
   config.back_callback_url = "http://localhost:3000/notify/"
   config.front_callback_url = "http://localhost:3000/notify/"
 end
 ```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request