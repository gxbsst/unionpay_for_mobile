require 'spec_helper'
require 'pry'
require File.join(File.dirname(__FILE__),'../../../lib/unionpay/helpers')

describe Unionpay::Helpers::Signature do 
  subject { Unionpay::Helpers::Signature }
  it "respond_to" do 
    expect(subject.sign({"a" => 1}, "1111")).to eq("111")
  end
end
