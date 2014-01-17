require "base64"
require "digest"
require "openssl"

require "unionpay/params/builder"
require "unionpay/params/validator"
require "unionpay/params/errors"

require "unionpay/params"
require "unionpay/helpers"
require "unionpay/unionpay"
require "unionpay/configs"
require "unionpay/http"

require "unionpay/version"

module Unionpay

	include self::Unionpay

  def self.build_form(order_number, amount)
     params = Params.build(order_number, amount) 
     Helpers.render_form(params)
  end

  # TODO:
  #
  def self.refund(order_number, qid)

  end

  def self.query(qid)
    
  end

	# def self.process(order_number, amount,*hash)
	# 	params = build_params(order_number, amount, hash)  
	# end

	# def self.rsa_sign(private_file, src)
	# 	# OpenSSL::PKey::RSA.new(File.read('private_key'), 'passphrase')

	# 	OpenSSL::PKey::RSA.new(File.read(private_file), src)
	# end

	# def self.base64_src(rsa)
	# 	Base64.encode64(rsa)
	# end

	# def self.md5(src)
	# 	Digest::MD5.digest(src)
	# end

	# def self.wrap_gen_sign(private_file, src)
	# 	base64(rsa_sign(private_file, md5(src)))
	# end
end
