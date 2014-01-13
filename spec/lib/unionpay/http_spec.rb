require 'spec_helper'
require File.join(File.dirname(__FILE__),'../../../lib/unionpay/http')
require File.join(File.dirname(__FILE__),'../../../lib/unionpay/params')
require File.join(File.dirname(__FILE__),'../../../lib/unionpay/config')

describe Unionpay::Http do 
  let(:params) { Unionpay::Params.build("111111", 111) }
  let(:config) { Unionpay::Config.new }

  before(:each) do 
   Unionpay.stub(:env => :dev)
  end

  describe ".post" do 
   it "return 0" do 
     VCR.turn_off!
     WebMock.allow_net_connect!
     response = Unionpay::Http.post(params, config)
     expect(response.body).to eq("...")
    end
  end

end
