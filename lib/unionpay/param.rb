module Unionpay
	module Params
		DEFAULT_PARAMS        = {
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

		OPTION_PARAMS = {
				"merchantAlias"     => "", #商品名称
				"merchantOrderDesc" => "", #商户订单描述
				"phoneNumber"       => "", #用户手机号码
				"transTimeout"      => "", #商户订单超时时间 格式为：yyyyMMddHHmmss
				"redemptionMark"    => "", #兑换码标记
				"redemptionCodeUrl" => ""  #兑换码地址
			}

		def params(params)
				params.merge!(DEFAULT_PARAMS)
		end

	end
end