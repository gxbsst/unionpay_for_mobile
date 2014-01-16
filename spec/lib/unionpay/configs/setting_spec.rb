require "spec_helper"

describe Unionpay::Configs::Setting do 

  before(:each) do 
    ::Unionpay.env = :dev
  end
  it "env is :dev" do 
   expect(::Unionpay.env).to eq(:dev) 
  end
  it{ should respond_to :env }
  it{ should respond_to :charset}
  it{ should respond_to :front_pay_url}
  it{ should respond_to :back_pay_url}
  it{ should respond_to :front_callback_url}
  it{ should respond_to :back_callback_url}
  it{ should respond_to :version}
  it{ should respond_to :merchant_id}
  it{ should respond_to :merchant_name}
  it{ should respond_to :sign_method}
  it{ should respond_to :transtype}
  it{ should respond_to :currency}
  it{ should respond_to :security_key}
  its(:env) { should eq(:dev) }
  its(:charset) { should eq("UTF-8") }
  its(:front_pay_url) { should eq("http://58.246.226.99/UpopWeb/api/Pay.action") }
  its(:back_pay_url) { should eq("http://58.246.226.99/UpopWeb/api/BSPay.action") }
  its(:front_callback_url) { should eq("http://localhost:3000/notify") }
  its(:back_callback_url) { should eq("http://localhost:3000/notify") }

  its(:version) { should eq("1.0.0") }
  its(:merchant_id){ should eq("105550149170027") }
  its(:merchant_name){ should eq("商户名称") }
  its(:sign_method){ should eq("md5") }
  its(:transtype){ should eq("01") }
  its(:currency){ should eq("156") }
  its(:security_key){ should eq("88888888") }

  context "pre" do 
    subject { ::Unionpay::Configs::Setting.new }
    before(:each) do 
        ::Unionpay.stub(:env => :pre)
    end

    it "env is :dev" do 
      expect(::Unionpay.env).to eq(:pre) 
    end
    its(:front_pay_url) { should eq("http://www.epay.lxdns.com/UpopWeb/api/Pay.action") }
    its(:back_pay_url) { should eq("http://www.epay.lxdns.com/UpopWeb/api/BSPay.action") }
  end

  context "pro" do 
    before(:each) do 
        ::Unionpay.stub(:env => :pro)
    end
    its(:front_pay_url) { should eq("https://unionpaysecure.com/api/Pay.action") }
    its(:back_pay_url) { should eq("https://besvr.unionpaysecure.com/api/BSPay.action") }

  end
end
