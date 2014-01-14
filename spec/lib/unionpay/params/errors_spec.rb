require 'spec_helper'

describe Unionpay::Params::Errors do 
  subject { Unionpay::Params::Errors.new }
  it{ should respond_to :count }
end
