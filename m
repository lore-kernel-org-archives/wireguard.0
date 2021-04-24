Return-Path: <SRS0=IBFn=JW=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65D0AC433B4
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Apr 2021 04:32:26 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 649E7611ED
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Apr 2021 04:32:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 649E7611ED
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=yahoo.co.uk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 04a3872f;
	Sun, 25 Apr 2021 04:32:23 +0000 (UTC)
Received: from sonic302-20.consmr.mail.ir2.yahoo.com
 (sonic302-20.consmr.mail.ir2.yahoo.com [87.248.110.83])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 982b18a3
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 24 Apr 2021 10:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.uk; s=s2048;
 t=1619259113; bh=+0HzWoY80RCfUMblA8cZySISHPeyIYmckv9fak0r+Po=;
 h=To:From:Subject:Date:References:From:Subject:Reply-To;
 b=thKOferIMs7zyTKT86Xj/jZHjhm3/3BpQnGxhq+VzJvd3mo7gJb5jpQEJio6Ojk6QoRrBKUr+yjFj0Z9ddhvgR0INae1yTcu823aT8Wx+jAOnn/xEfkFa/8Al2YNvsADCa10K5N4PGQgf286egvXokzw+viEY9TUVt1EVzgDDe33hmz5EIvs9/n6wF/cid3XkI/FCjBkT+MbcBJ6EVBcL+Wo3VEU405p89yzn+6X5b1oo7punMy5Df4RQ2s9d5tP2dJL6XZAPZnoMeZeZPfhVDXfacHuOU+NFpmKfCabTR0bNElth9sVu8Mtt03q4WZhIDFDcLvTPKSkIfyFRL7qhA==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1619259113; bh=hgwg/s84RXx8HU1h7yTqQrMnVv52c5GscvNv9h/r4D5=;
 h=X-Sonic-MF:To:From:Subject:Date:From:Subject;
 b=eUuOFbahkflOCYKeK1PHgw7Pi+u1Ft771nMPJZObvOTpabGZQ232nOtiw5r9FZrPUXjGPzlD9QAObPmXYvUw3de05jh1mavwj23u+//M56ZDMnBsOCkfQDnbilANtZ85hUnbxWwDJdTJenEqgUrVO57Nae2FG/XFfqdTilQ5g/igdrREAvMmsJQySCeqJ13pkTA4kTLkG5L//q/eTofsq6vqdsP8KZdGZpGegEwZRk1gLyi6E3Hrek1BDCNHc//s1U0Kgr/leERSdYLFJsv+3gv774/KUhuzIiisJSt45V/V0VibZ7LVHn5qnHvCLoxszgB+yB1jaPdrJBh21IKmAw==
X-YMail-OSG: O2MIwUsVM1kA5ezf8YgfwEQbk.PifL4J6b3K8kYOjhe_IE5npTSNs15R6dkiJkW
 0ijBAS.KcTY7UhbJoC.3ErlysU4p0uwZcCogwuUXTyz5aKXtLttKYzBOEwXSx0W0r6hwFb9ddm1e
 uXLzDKfcQMd2vFCpLwYo3mYzD08oLg0_xkiCwjPdUGheZ9ceCMGXDWjG0wUVQND_7EFCOeLbUPPu
 2l6liZk1eT.b6XekeR.g699d9oxQyZNv0uUrbIgaOMtvksN2L28bzE1TcaBY85BRJD.9ENlHjlze
 RdXpVHtFMbbA6lijG5F8t5X5V9WwlblGF3egjAoB_ARqrfeUQsE3hy.z_O2rMQ7uuPvmBFWkEzow
 q0mMSnkk101LFYCAtUAUWznF6h9gvpDXKzBoXER3JWxswiAtwOPOnwa5DLFE0pygYrKOZLPpFfoJ
 TCOI1vuc3_GwJG_RHWQL4nKo0ZkZDxDLPF.T8CNPXuZjz2sUk809Kcs0yVNVMwBhC1QrvHuNMzjq
 BOdQOAPNPk7goTi01Lmk3OKWPa9B3PC12Onc_Qh3yzv19M0LHbYB1o1VFU49aQbJPt.XSw.fSRlF
 Zwtclb0YgP2pVJkD3pikxAW7Pdm2gjUlnhiPnTn6.zkoOixhYLqlt1AOYIQizxbkUpUQpQi0XGib
 .KxVu2rN.vNN8SSeWfH7c_UpvL4I70ZeCjnLhbSwvTAkOH62MeDEH.wmsKo6Ik5nHaHtaaFH0Jme
 unV7Lxk.DxzQgSaqvaWV3_MqkUnLPndjiTy7u32pFvXn3SPIT9aZIe2ygwucR97u7oNc5IOk0rIc
 1bzyaKzRIYhTzKr8Z3kkChHzHNPKuodU.vr4ifipdRmT7pkZUheJIsLZ8Csm0RGlgXYVQEOvJr5t
 SgiV29ckVazUq1wKRd4iHbwHZCiiT.Do7ARWDHnS.MWKZ3duyECA3d8L0B_GVII9Joxw9mFucu_n
 YplXW_GWqfgTBLDlLkFuFJ8YQCA7GkFQGveKQkRzjzO2TR5bFQXzzIfGKnZsLBS5NGZUsRmZT3bc
 DJJeoeZJqG_.1fJEGJxtBF38ortFGc5DOd.P85EbwnLnr7knTtgvSmcJrL3pO9tda_FF5clVl42b
 RCGH6ISFHBFdypGcFc6BMgOXU4TktYnC02CBnBRzaMwsiHR91XBCdJdnfHLo5RMdEHlnzs1bnPT9
 9jo1Pu8BkYrQ3PsgqoEL4crkqVIB7bHmdWP2MMNKc5TsQSbTwXe3XXeaIft5sX9Pxzi319CdALww
 EUOodLbHXVHJKAPv9XzGBv1bRziQSCVdlYX5k2kHcXgVg7S9M_ohr4BFM71JdxTrWpjsvXvqpltT
 oqxESI8WrIE_0SIKtFEnhNRKqK1X0BwxVmArhS2vk3sRYARr2SSKJqCBqh5ilFJiS2Rdn5W_O3gM
 zWSkp3xJBKpecdep_uJFS.aoAW1FCqzA6yrdBGejRi3gVouZv3VjWOPdiwJ8FMF8aC2JAElAPN3K
 .IAiwqmulo9eNaf8X0hR8SFIoRK6e3sLpqPeqRE5KNkDFeLKG8bPBJk6SyCrOGVStvspU4MD3Ego
 PNKfZkx4NmRpVzk4p1KByg9b9OIBt5JH9u5ANWry5AYea3k2kaX_ESuokG6i9ngZx8TnYet2cszS
 1F9a4CuOy8GEWV_6gFc6U7GJONeSs1aUTy1KCoHFBtpq84Xo5RV1SaDctwFCaprzgpzV4MMu.gIH
 SAXUBoVw5hg0_XoIIv0Rs4SgKUcTakVMfuXdqKSARPsxPesA5Zb.XLGXOTCHSOFIf5YuCpaWkY7w
 ObdCAAu5gHtG6c645yDUsfkw0u9f.kStQMv381kY50Ww30TwihxgtM_aVjjVaIX9EhU7FIGkoZbH
 1GoBsCtSPUEkiO4PHOIQhiKwrkcpoNzRRLY363.5.8AGljcRea744N9ru2DkxcHVCySjZxLB28vL
 a35W4XUo3.uMDFS1CYERpDf1z8r58JjpY4mIEMEdIUgMiXNvifk9hNf2xwJppGzVsbbHHIl5x_4A
 d7MOfCkX4hVYKVlx9RUmizHd3ZfDifWvCowuQbHQXS2F8iGgNP7n9YRD3.THL_gchIQ8FU7n3fHu
 Mxv9CaIdIoLXOrxlYdyyJ0646WMpy_lhh3t050MpdTDG6kRSaMWMjvJNPjinyWz9JYn6E54BH4Na
 1RLaOpDHx04Qg11EUv9n0mWQWRJiXFnxI3GIgJHMzzWB5xSPmG7h1t2C90e2q8UFYtSSQ74Y2iA1
 _QSr4gSKpIK1eArJPoYGnT9TiXvVSY9IfJEWMYauG5Y_EagULPJ5iBUT26exHQFcfYlwshEr705M
 4.G1LyFzfxkMfkEU9_O1DHoXompa71kcq1NT0_1tlZYImvsyxgXavyz060c96KgVQc8VkeJbKADS
 hln60Jet3MBd2_avlvxQtAdQqW8w961nlZKwW4vOi4EVT6Oqcyxw8iq_xCvMln60eHTtpZ0uj8Ui
 T
X-Sonic-MF: <peljasz@yahoo.co.uk>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic302.consmr.mail.ir2.yahoo.com with HTTP; Sat, 24 Apr 2021 10:11:53 +0000
Received: by kubenode541.mail-prod1.omega.ir2.yahoo.com (VZM Hermes SMTP
 Server) with ESMTPA ID 3ab5459314880f739c9020fc177c7c22; 
 Sat, 24 Apr 2021 10:11:52 +0000 (UTC)
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
From: lejeczek <peljasz@yahoo.co.uk>
Subject: wgX iface as slave to a bridge - Linux
Message-ID: <0c8b4be5-ee9d-4f19-7179-ad08a28d0574@yahoo.co.uk>
Date: Sat, 24 Apr 2021 11:11:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
References: <0c8b4be5-ee9d-4f19-7179-ad08a28d0574.ref@yahoo.co.uk>
X-Mailer: WebService/1.1.18138
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo
 Apache-HttpAsyncClient/4.1.4 (Java/16)
X-Mailman-Approved-At: Sun, 25 Apr 2021 04:32:21 +0000
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hi guys.

Apologies, I'll bother you guys as I failed to find some 
better places to ask, I searched for forums etc. but failed.

Can wiregurard ifaces be enslaved by LInux bridge? I tried 
but it did not work for me. Similarly "mavclan" - 
would/should wireguard work that way?
What I've tried and failed was on CentOS stream with 
4.18.0-294.el8.x86_64.

many thanks, L.
