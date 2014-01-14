require 'pry'
require 'spec_helper'
describe Unionpay::Http do 
  let(:params) { Unionpay::Params.build("20111108150703852", 11111) }

  before(:each) do 
   Unionpay.stub(:env => :dev)
  end

  describe "#post" do 
   it "return 0" do 
     VCR.turn_off!
     WebMock.allow_net_connect!
     response = Unionpay::Http.post(params, ::Unionpay.config)
     expect(response.body).to include('form')
    end
  end

end
