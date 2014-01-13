module Unionpay
  class Errors
   attr_accessor :errors
    include Enumerable

    def initialize()
      @errors  =  []
    end

    def << value
      @errors << value
    end

    def each(&block)
      @errors.each do |error|
        block.call(error)
      end
    end

  end
end
