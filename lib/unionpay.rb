require "unionpay/version"
require "base64"
require "digest"
require "openssl"

# require 'unionpay/params'
# require 'unionpay/post'

module Unionpay
	# DEV_POST_URL = "http://58.246.226.99"  # http://58.246.226.99/UpopWeb/api/BSPay.action# url orderPushPlatform/postServer/submitOrder.action
	PRO_POST_URL = "http://shouyintai.umpay.com" # orderPushPlatform/postServer/submitOrder.action
	DEV_XML_URL = "http://114.113.159.222:8080/orderPushPlatform/server/merchantDeal.action"
	PRO_XML_URL = "http://shouyintai.umpay.com/" # orderPushPlatform/server/merchantDeal.action

	DEV_POST_HOST = "http://58.246.226.99"
	DEV_POST_URL = "UpopWeb/api/BSPay.action"

	def self.rsa_sign(private_file, src)
		# OpenSSL::PKey::RSA.new(File.read('private_key'), 'passphrase')

		OpenSSL::PKey::RSA.new(File.read(private_file), src)
	end

	def self.base64_src(rsa)
		Base64.encode64(rsa)
	end

	def self.md5(src)
		Digest::MD5.digest(src)
	end

	def self.wrap_gen_sign(private_file, src)
		base64(rsa_sign(private_file, md5(src)))
	end
end
