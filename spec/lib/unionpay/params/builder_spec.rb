require 'spec_helper'
require 'pry'

describe Unionpay::Params::Builder do 
  subject { Unionpay::Params::Builder }
  it { should respond_to :new }

  describe "instance should respond to some methods" do 
    subject{ Unionpay::Params::Builder.new("11111", 55.02, :ip => '127.0.0.1')}
    it { should respond_to :order_number }
    it { should respond_to :amount }
    it { should respond_to :customer_ip}
    it { should respond_to :options}
    it { should respond_to :config}
  end

  describe "#need_set_fields" do 
    subject{ Unionpay::Params::Builder.new("11111", 55.02, :ip => '127.0.0.1')}
    it "should have need set keys" do 
      Unionpay::Params::Validator::NEED_SET_KEYS.delete("signature")
      Unionpay::Params::Validator::NEED_SET_KEYS.delete("signMethod")
      Unionpay::Params::Validator::NEED_SET_KEYS.each do |key|
        expect(subject.need_set_fields).to have_key(key)
      end
    end  
  end

  describe "#wrap_params" do 
    before(:each) do 
      @params = Unionpay::Params::Builder.new("11111", 55.02, :ip => '127.0.0.1') .wrap_params
    end
    it "return params " do 
      expect(@params).to be_a Hash
    end 
  end

  describe "#valid?" do 
    subject { Unionpay::Params::Builder.new("11111", 55.02, :ip => '127.0.0.1') }
    before(:each) do 
      subject.valid?
    end
    it "errors" do 
      expect(subject.valid?).to be_true
    end
  end

  describe "#options" do 
    subject{ Unionpay::Params::Builder.new("11111", 
                                  55.02, 
                                  :ip => '127.0.0.1')}
    its(:options) { should have_key(:ip)}

  end

end


