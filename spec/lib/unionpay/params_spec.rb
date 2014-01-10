# encoding: utf-8
require 'spec_helper'
require File.join(File.dirname(__FILE__),'../../../lib/unionpay/params')
require File.join(File.dirname(__FILE__),'../../../lib/unionpay/validator')
describe Unionpay::Params do 

 subject { Unionpay::Params }
 it { should respond_to :new }
 it { should respond_to :build }

 describe "instance should respond to some methods" do 
   subject{ Unionpay::Params.new("11111", 55.02, :ip => '127.0.0.1')}
   it { should respond_to :order_number }
   it { should respond_to :amount }
   it { should respond_to :customer_ip}
   it { should respond_to :options}
   it { should respond_to :config}
 end

 describe "#need_set_fields" do 
   subject{ Unionpay::Params.new("11111", 55.02, :ip => '127.0.0.1')}
   it "should have need set keys" do 
     Unionpay::Validator::NEED_SET_KEYS.delete("signature")
     Unionpay::Validator::NEED_SET_KEYS.delete("signMethod")
     Unionpay::Validator::NEED_SET_KEYS.each do |key|
       expect(subject.need_set_fields).to have_key(key)
     end
   end  
 end

 describe "#wrap_params" do 
   before(:each) do 
    @params = Unionpay::Params.new("11111", 55.02, :ip => '127.0.0.1') .wrap_params
   end
   it "return params " do 
     expect(@params).to be_a Hash
   end 
 end

 describe "#valid?" do 
  subject { Unionpay::Params.new("11111", 55.02, :ip => '127.0.0.1') }
  its(:valid?) { should be_true } 
 end

 describe "#options" do 
   subject{ Unionpay::Params.new("11111", 
                                 55.02, 
                                 :ip => '127.0.0.1')}
   its(:options) { should have_key(:customerIp)}
   its(:options) { should have_key(:frontEndUrl)}
   its(:options) { should have_key(:backEndUrl)}
   its(:options) { should have_key(:orderTime)}
   its(:options) { should have_key(:orderCurrency)}
   its(:options) { should have_key(:transtype)}
   its(:options) { should have_key(:signature)}
   its(:options) { should have_key(:signMethod)}
   
 end

end
