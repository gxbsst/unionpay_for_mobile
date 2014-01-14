require 'spec_helper'

describe Unionpay::Helpers::Signature do 
  subject { Unionpay::Helpers::Signature }
  it "respond_to" do 
    expect(subject.sign({"a" => 1}, "1111")).to eq("09d93ac86712f01622a1f72aa4940e47")
  end
end

describe Unionpay::Helpers::Html do 
  let(:params) { Unionpay::Params.build("20111108150703852", 11111) }
  before(:each) do 
   Unionpay.stub(:env => :dev)
   #@params = params.wrap_params
  end
  describe ".render_form" do 
    it "render form" do 
      VCR.turn_off!
      WebMock.allow_net_connect!
      expect(Unionpay::Helpers.render_form(params)).to include("form") 
    end
  end  
end
