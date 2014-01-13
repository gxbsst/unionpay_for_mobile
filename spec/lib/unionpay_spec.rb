# encoding: utf-8
require "spec_helper"
require File.join(File.dirname(__FILE__),'../../lib/unionpay')

# require '../lib/unionpay'
# <form method="post" action="http://114.113.159.222:8080/orderPushPlatform/postServer/submitOrder.action" name="threePayForm">
# 	<input id="merchantName" type="hidden" value="测试商户" name="merchantName">
# 	<input id="merchantId" type="hidden" value="898000000000002" name="merchantId">
# 	<input id="merchantOrderId" type="hidden" value="20120918000052" name="merchantOrderId">
# 	<input id="merchantOrderTime" type="hidden" value="20120919142342" name="merchantOrderTime">
# 	<input id="merchantOrderAmt" type="hidden" value="18000" name="merchantOrderAmt">
# 	<input id="backEndUrl" type="hidden" value="http://sz.i56star.com/bh/portal/servlet/GetBgReturnServlet" name="backEndUrl">
# 	<input id="payResultUrl" type="hidden" value="http://sz.i56star.com/bh/portal/servlet/GetPageReturnServlet" name="payResultUrl">
# 	<input id="orderSource" type="hidden" value="2" name="orderSource">
# 	<input id="payMent" type="hidden" value="1" name="payMent">
# 	<input id="payChannel" type="hidden" value="7" name="payChannel">
# 	<input id="sign" type="hidden" value="UO7R5tjldpgiyOO9KzC+QSFUO9GG6/XBKvE14L9+v2Wux1OCHTO8CkOiwhpzedsjyf8CDCRG+aMxEc7n6gJTaAsMmGqtiMubtIx46hKzublKbvuM0soIpb1KOB2ssq6NQ6C9Tzakmjr6/Wr4teYnwQT3W72md0f0R7PgXzyWHFI=" name="sign">
# 	<input id="phoneNumber" type="hidden" value="" name="phoneNumber">
# </form>

# BASE64(RSA(MD5(src),privatekey))，其中src为商户名称、商户代码、商户订单号、商户订单时间、商户订单金额、商户订单描述、交易超时时间域依次以key=value格式和&符号拼接形成的字符串：merchantName=****&merchantId=****&merchantOrderId=****&merchantOrderTime=****&merchantOrderAmt=****&merchantOrderDesc=****&transTimeout=****，privatekey是商户的CFCA证书私钥。

# （1）开发联调环境地址：
# 前台支付：http://58.246.226.99/UpopWeb/api/Pay.action
# 后台交易：http://58.246.226.99/UpopWeb/api/BSPay.action
# 查询请求：http://58.246.226.99/UpopWeb/api/Query.action
# （2）PM测试环境（准生产环境）地址：
# 前台支付：https://www.epay.lxdns.com/UpopWeb/api/Pay.action
# 后台交易：https://www.epay.lxdns.com/UpopWeb/api/BSPay.action
# 查询请求：https://www.epay.lxdns.com/UpopWeb/api/Query.action
# （3）生产环境地址：
# 前台支付：https://unionpaysecure.com/api/Pay.action
# 后台交易：https://besvr.unionpaysecure.com/api/BSPay.action
# 查询请求：https://query.unionpaysecure.com/api/Query.action




describe Unionpay do
	before(:each) do
			# 必填
			@params             = {
				"merchantName"      => "TEST", # 商家名称
				"merchantId"        => "", # 商户代码；测试时为测试证书号，商用时从CFCA申请的数字证书号。
				"merchantOrderId"   => "", # 商户订单号，需要满足前8位为订单日期，格式yyyyMMdd
				"merchantOrderTime" => "", # 商户订单时间 格式为：yyyyMMddHHmmss
				"merchantOrderAmt"  => "", # 商户订单金额（单位：分）
				"backEndUrl"        => "", # 交易通知地址商户用来接收交易结果通知的URL,是以post方式提交给商户服务器端
				"payResultUrl"      => "", # Wap支付后，跳转页面。
				"orderSource"       => "", #订单来源 1.	代表来自网络 即通过web提交订单2.	代表来自手机 即通过wap提交订单3.	代表来自电话 即通过电话拨号提交4.	代表来自现场收款  无网上商城
				"payMent"           => "", #支付方式1.	代表立即支付2.	代表货到付款
				"payChannel"        => "", # 支付渠道1.	代表信用卡2.	代表借记卡3.	代表信用卡、借记卡4.	代表储值卡5.	代表信用卡、储值卡6.	代表借记卡、储值卡7.	代表借记卡、信用卡、储值卡
				"sign" => "UO7R5tjldpgiyOO9KzC+QSFUO9GG6/XBKvE14L9+v2Wux1OCHTO8CkOiwhpzedsjyf8CDCRG+aMxEc7n6gJTaAsMmGqtiMubtIx46hKzublKbvuM0soIpb1KOB2ssq6NQ6C9Tzakmjr6/Wr4teYnwQT3W72md0f0R7PgXzyWHFI=" # 参见本节签名说明
			}
			@option_params      = {
				"merchantAlias"     => "", #商品名称
				"merchantOrderDesc" => "", #商户订单描述
				"phoneNumber"       => "", #用户手机号码
				"transTimeout"      => "", #商户订单超时时间 格式为：yyyyMMddHHmmss
				"redemptionMark"    => "", #兑换码标记
				"redemptionCodeUrl" => ""  #兑换码地址
			}

			@test_params = {
				'orderAmount' => 11000,
				'orderNumber' => Time.now.strftime("%Y%m%d%H%M%S"),
				'customerIp' => '127.0.0.1',
				'frontEndUrl' => "http://www.example.com/sdk/utf8/front_notify.php",
				'backEndUrl' => "http://www.example.com/sdk/utf8/back_notify.php",
        'origQid'     => '201110281442120195882' #原交易返回的qid, 从数据库中获取
    }


	end
	it "test" do 

		VCR.turn_off!
		WebMock.allow_net_connect!
		
		PayParams = {
			'version' => '1.0.0',
    'charset' => 'UTF-8', #UTF-8, GBK等
    'merId'   => '88888888', #商户填写
    'acqCode' => '', #收单机构填写
    'merCode' => '', #收单机构填写
    'merAbbr' => '商户名称'
  }
  PayParamsCheck = [
    "version",
    "charset",
    "transType",
    "origQid",
    "merId",
    "merAbbr",
    "acqCode",
    "merCode",
    "commodityUrl",
    "commodityName",
    "commodityUnitPrice",
    "commodityQuantity",
    "commodityDiscount",
    "transferFee",
    "orderNumber",
    "orderAmount",
    "orderCurrency",
    "orderTime",
    "customerIp",
    "customerName",
    "defaultPayType",
    "defaultBankNumber",
    "transTimeout",
    "frontEndUrl",
    "backEndUrl",
    "merReserved"
  ]

		conn = Faraday.new(:url => Unionpay::DEV_POST_HOST) do |faraday|
			faraday.request  :url_encoded             
			faraday.response :logger                  
			faraday.adapter  Faraday.default_adapter  
		end

		# VCR.use_cassette('dev_back_url') do 
			response = conn.post Unionpay::DEV_POST_URL, @test_params
			expect(response.body).to include("...")
		# end
	end

  describe ".env" do 
    before(:each) do 
     Unionpay.env= :dev
    end
   
    it "env is :dev" do 
     expect(Unionpay.env).to eq(:dev)
    end
 
  end

end

