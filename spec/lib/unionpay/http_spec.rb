require 'pry'
require 'spec_helper'

require File.join(File.dirname(__FILE__),'../../../lib/unionpay/http')
require File.join(File.dirname(__FILE__),'../../../lib/unionpay/params')
require File.join(File.dirname(__FILE__),'../../../lib/unionpay/config')

describe Unionpay::Http do 
  let(:config) { Unionpay::Config.new }
  let(:params) { Unionpay::Params.new("20111108150703852", 11111) }

  before(:each) do 
   Unionpay.stub(:env => :dev)
   config.back_callback_url = "http://192.168.0.1"
   config.front_callback_url = "http://192.168.0.1"
   params.config = config
   @params = params.wrap_params
  end

  describe ".post" do 
   it "return 0" do 
     VCR.turn_off!
     WebMock.allow_net_connect!
     http = Unionpay::Http.setup(@params, config)
     response = http.post
     expect(response.body).to eq("...")
    end
  end

end
