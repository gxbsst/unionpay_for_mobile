require 'spec_helper'
require File.join(File.dirname(__FILE__),'../../../lib/unionpay/helpers')
require File.join(File.dirname(__FILE__),'../../../lib/unionpay/params')
require File.join(File.dirname(__FILE__),'../../../lib/unionpay/config')

describe Unionpay::Helpers::Signature do 
  subject { Unionpay::Helpers::Signature }
  it "respond_to" do 
    expect(subject.sign({"a" => 1}, "1111")).to eq("111")
  end
end

describe Unionpay::Helpers::Html do 
  let(:config) { Unionpay::Config.new }
  let(:params) { Unionpay::Params.new("20111108150703852", 11111) }
  before(:each) do 
   Unionpay.stub(:env => :dev)
   config.back_callback_url = "http://192.168.0.1"
   config.front_callback_url = "http://192.168.0.1"
   params.config = config
   @params = params.wrap_params
  end
  describe ".render_form" do 
    it "render form" do 
      VCR.turn_off!
      WebMock.allow_net_connect!
      expect(Unionpay::Helpers::Html.render_form(@params, config)).to eq("...")
    end
  end  
end
