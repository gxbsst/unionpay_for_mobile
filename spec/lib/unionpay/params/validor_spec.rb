require 'spec_helper'

describe Unionpay::Params::Validator do 
  let(:params) do 
    {
      "customerIp" => '127.0.0.1',
      "frontEndUrl" => 'http://www.test.com',
      "backEndUrl" => "http://www.test.com",
      "orderTime" => "", 
      "orderCurrency" => "", 
      "transType" => "",
      "signature" => "",
      "signMethod" => "",
      "version" => "",
      "charset" => "",
      "merId" => "",
      "merAbbr" => "" }
  end

  let(:params_1) {
   {}
  }
  
  before(:each) do 
   @validator = Unionpay::Params::Validator.new(params)
  end

  it "count of errors be = 0" do 
    expect{@validator.execute}.to_not change{ @validator.errors.count}
  end

  it "count of errors be > 0" do 
    @validator = Unionpay::Params::Validator.new(params_1)
    expect{@validator.execute}.to change{ @validator.errors.count}.from(0).to(12)
  end
  
end
