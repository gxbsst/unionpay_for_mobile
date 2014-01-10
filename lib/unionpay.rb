require "unionpay/version"
require "base64"
require "digest"
require "openssl"

# require 'unionpay/params'
# require 'unionpay/post'

module Unionpay

  def self.process(order_number, amount,*hash)
    params = build_params(order_number, amount, hash)  
  end

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
