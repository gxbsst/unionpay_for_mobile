require 'spec_helper'
require File.join(File.dirname(__FILE__),'../../../lib/unionpay/errors')

describe Unionpay::Errors do 
  subject { Unionpay::Errors.new }
  it{ should respond_to :count }
end
