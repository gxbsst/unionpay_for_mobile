# encoding: utf-8
require "unionpay/configs/setting"

module Unionpay
  module Configs

    #mattr_accessor :settings

    # TODO: alias_method : back_end_url, back_callback_url
    #
    VERSION = "1.0.0"
    MERCHANT_ID = "105550149170027"
    MERCHANT_NAME = "商户名称"
    SIGN_METHOD = "md5"
    TRANSTYPE = "01"
    CURRENCY = "156"
    CHARSET = "UTF-8"
    SECURITY_KEY = "88888888"
    REFUND_TRRANSTYPE= "04"

    def self.new
      settings
    end

    def self.settings
      @settings ||= Setting.new
    end

  end
end
