# encoding: utf-8
require 'spec_helper'

describe Unionpay::Configs do 
  subject(:config) { Unionpay::Configs.new }
  before(:each) do 
   config.front_callback_url = "http://www.test.com"
   config.back_callback_url = "http://www.test.com"
  end
  its(:version) { should eq("1.0.0")} 
  its(:charset) { should eq("UTF-8")} 
  its(:front_callback_url) { should eq("http://www.test.com")} 
  its(:back_callback_url) { should eq("http://www.test.com")} 
  its(:merchant_id) { should eq("105550149170027")} 
  its(:merchant_name) { should eq("商户名称")} 
  its(:sign_method) { should eq("md5")} 
  its(:transtype) { should eq("01")} 
  its(:currency) { should eq("156")} 
  its(:security_key) { should eq("88888888")} 

  context ":dev" do 
    before(:each) do 
      Unionpay.stub(:env => :dev)
    end
    its(:front_pay_url) { should eq("http://58.246.226.99/UpopWeb/api/Pay.action")} 
    its(:back_pay_url) { should eq("http://58.246.226.99/UpopWeb/api/BSPay.action")} 
  end
end
