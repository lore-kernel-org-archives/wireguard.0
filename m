Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26C31C7EE23
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  8 Jun 2023 09:30:35 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id af00f7de;
	Thu, 8 Jun 2023 09:30:34 +0000 (UTC)
Received: from sonic301-21.consmr.mail.ir2.yahoo.com
 (sonic301-21.consmr.mail.ir2.yahoo.com [77.238.176.98])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id acc22710
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 8 Jun 2023 09:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.uk; s=s2048;
 t=1686216631; bh=TPUJfM1B/zUsvbQ/qoNUgzUDcmh8jdcuugN0usJngGI=;
 h=Date:To:From:Subject:References:From:Subject:Reply-To;
 b=SVscFImuslFYjoOS/mr4iqkWLwS4L/nBQnhCB7KyzJAAkltSkcXqIdkXM/ZEofJZevAnMlJQM4yA7j+fE4Yol9u4l+ZQkiBYRW9cZ5oZUXiALTU1K0fscq8tgzkeThUmkK5oRBUaWYA79aZm4uWxhxZ/TckurmUSxQwAbcyB25KC0yFQWmmBQy94upgNl0niL8o/8kGyndgChA6xIcVCJsbuXPGfFRjTo+5WXupzBixvYggv/r/2EPbmkY/2+T3EvqBvae7WqqVMeSI3SMRyEE9X7a3iaLVwhGOaUFXBEuZHsUPXr2pIHDW9lPkzZenkB+QW7HvpslkuOsMPy8Ug0Q==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1686216631; bh=0nv9L4kpsYTlUFS9WwUVraiAOyv7WHKz8wlvSJoVcGV=;
 h=X-Sonic-MF:Date:To:From:Subject:From:Subject;
 b=pah+NHAjEKZEnFBWAAu+uvxgJwFmKgU595rd+snvsAqDQCOWpYbf9YzgSxvAx9QLuQrbXs1cK1DWkcwCB/y/zifK8VYWFa55czkIcbr1GGOxC9uzfy+U4XBAYuG/FPoLLuAmS5FEek1jUr0Hqia4jLdkuFvM07CM3PJg7qH80utLOQjRyAFRijaITo0FdJ44z3VY8JnjkOEt0LbMD7ZjMy453rtRCyDNuQZ1Dnh5jnQCPEevImSufXJaRanEiAWAjw6q38ChLg4dEe8OJSC9MZy6HM/IQVXJNGF1f6A0E9IE2QCqou3ZpBMWr2nQGfN693PMWPPeXBAIGpmWNTsnNA==
X-YMail-OSG: tfPj8GAVM1nA37Sd6339LbWcyWq310WU_01JiYVKED9elFMBRtNM0n_N3mPw_t3
 2NzOJ52UClG_AD8_H6GQuUVcMzbFzxXXYchu5CH7tzvdDPgNlHk8B5PnXG3chFhMltG5k6JmIA7C
 swJ3q7RYHvcTEasWUstw0guIFihpO4_nrWe4_xGQ_OGrGJzH6QC6e0QiTAftDQLr9f2w2SU7c69k
 QxvQxUpfDjEHjCL__FYPYvYcXQ32uG1rZ4YQ4qRAQhgBVuZB.0T4tvibp0RDEwzPwcS4Smho.ZHf
 8Y8pHOqi7geZwSTuBCkallEsaHoVAoXvx0EKIZdn6xInTEDwZyKXslWljk75w59kEHct7xEte2uX
 dMx8seRoqU8.439D3USb8gQwEu7.w8.p.vqUmR9iyxq32l5r9Ye57_rEUxVCczOdvd4epm8z6xRt
 bdc6fPAuDErW1tc59aJ1HynpLc5VqQM.AUssF_VNnfCDJFHnQO8kXf7REfmMn6R1jKUjOJwMdkkC
 YB8vIB3EVhn20UtHU341YfEzqdBtsUTojvKfb5pi8k8AMKk3yIJp1uqEHQ1vsun0CdEdLbSjd.30
 T44gz1tzQLD9DrjQKPNo_ho5UTcoDGN1L4EsKlYDBER5S.fM61PHGws.1wlsZAoDV6atWuaTgkye
 P7MTi2bEf1MhLJU.Vd7V.HQWffTYXbgwEGcXd3CdEgWHJ1xmn5m4Fecx6AxeaO7V0iT4ot7kQLRM
 TVBO7fe0TBEqn4jxEpTmsKK.g1fF8kWJCCb.bECmDc0KSpuJYaxVef166DQHydqnQMgsNQmBJdtL
 QADNKQY_h7yePIrsuuc4EeaHjCPe2zmf1WfF9uOvL5rCXr.eK0AY6t4SmYQn9GqwMDRNM_mSZkV3
 DsQLfIp0f5a5gMOZcZ02_.bgyfi9CmKtIchZ8hWYlGd3X32AYuQboX7lpWE5NjzAINn54ufQcVkv
 loKKWh7KS7Hgyt07tVOyBlaHkBtr0747mb6bE2Xh25u3lXMYVpqHHkVzKfVpI0aBl8eAV_QLmm0Z
 ORImp_x6MYOECl3I3KAUzNXacbd9exIK9NmdaiDlRErPqcyyaC25bPd83YjriPZai9TuW1Bc_.uc
 YENnxv0FZOm38wAmWt010GrPlQDSHedLF0.907nqdzIWo5sA4VTRmpjnLGYy6qFvY5cnWvwudl1F
 lLNX7_JpuIlWtVQBT3Aj5NgPheuRi0xDlt_PxHsVh7XHrABpZ0aYJpYH2v23DIy3HpJFufcBAyE4
 CWEVpJ7kjNXFB2BqaFoVi8cY2ARz1wf.8HOI5Kg1oFcNxkWpEtX832i.tLjXR8jQgwPV6GDSXEiW
 qJPstrrURsUmZQM1gB6iaLexCHbZdcNHKf_Lv7VL7xPcXtIRAeLHJLzuRXGUosrBiw34uF8whfnU
 d1ltVCweIyrgFFIzPlG83VXTbhfoLPkZXD_RYUr67lrWcvnCgMSvzC4LLou99Vv6KrWey52vYzHD
 xtEIjgEotjjrBjslujKtteqTB5GQu3eGEIQG1h2ap7.ySChjs1cBTq5A_qHHBRWVFw8GK1H_o1sV
 elQWkusLcRBfad9zvCbQI3NRTF7mT6r2_1USGuTBNyrQI.ElwQMoVOVnX_MASPrBRI1pvHYQZNwa
 n3AFZhBjQBQn5xqBb2SzTA8SVG0ZccCCFEyX8p40QUfvC8rLNfXO28AYYhhYgMnbnfqfZtyxQ4Tn
 BTcpQpBluTG3rrP1Yoh8uccWmVPzDkCUZB137jg2rjHxR0wPM5GR7KbbxrM1ylAUg8P5LoUNMUuJ
 OFcSrmzJ2ORdw1MjBUY.t70QV.fLODhytSvu63SvSfk7Nts3uDGi.ZA5oZRIdgr8bzTcz_TyUobS
 3aUga9o2qxVu2Xo.ykRurIkGKP6BLwypTofB4UIZhTcrXrnFD3ZQaQ6.2lbEbco00ocrON4jIF.J
 pICYhqjC23Y_UGQXwOS9OGz_iKZa53eqWW1bjaAzEfIdxfFAM6Jmkq9CNcGU0FUEoWK.zRzoMSxD
 .yVRiVCIIkDWchusLZ.N7SpPLbgrTxr0NZEfbXxqQ8LZsG7Ggb6.knJLqnGwFsxfG2xFAK_GQtnI
 ahcyWd2rAjxMDKCYBEU6BGpuA.lJNAG1yaP4MpyeW1fQjOFJrvwAts0n9BY1VCGBz124JOWICYyx
 Sz6e5x1DNl3gj70XuYJ.e2_Y0.kXSaxOD2luzCFyqcOPPz7185LTX5pGX0xfkte4PTg3CQyc0UdH
 cTHG5M.rR9WvTFNPf8cgD2ag1MdRJE2LDqj_L3Qz2b4rxxxuFO_NLW.4F5aPXIESGCLVOPcQnSTY
 B8WaBVA--
X-Sonic-MF: <peljasz@yahoo.co.uk>
X-Sonic-ID: 0d3b72a2-e77f-467b-8e02-3b69c59f3f6e
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic301.consmr.mail.ir2.yahoo.com with HTTP; Thu, 8 Jun 2023 09:30:31 +0000
Received: by hermes--production-ir2-7867f454fc-8nkq6 (Yahoo Inc. Hermes SMTP
 Server) with ESMTPA ID 41e1ddfb3d374d087ba04c23b292cfe2; 
 Thu, 08 Jun 2023 09:30:27 +0000 (UTC)
Message-ID: <980aa33e-4bb4-e746-b45a-c0ab0ea7e371@yahoo.co.uk>
Date: Thu, 8 Jun 2023 11:30:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Content-Language: en-US
To: wireguard@lists.zx2c4.com
From: lejeczek <peljasz@yahoo.co.uk>
Subject: IP which is not there but wg0 replies - ?
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
References: <980aa33e-4bb4-e746-b45a-c0ab0ea7e371.ref@yahoo.co.uk>
X-Mailer: WebService/1.1.21516
 mail.backend.jedi.jws.acl:role.jedi.acl.token.atz.jws.hermes.yahoo
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

Purely accidentally I stumbled uppon:

-> $ ping 10.1.101
PING 10.1.101 (10.1.0.101) 56(84) bytes of data.
64 bytes from 10.1.0.101: icmp_seq=1 ttl=64 time=0.148 ms
64 bytes from 10.1.0.101: icmp_seq=2 ttl=64 time=0.415 ms

-> $ ip a ls dev wg0
17: wg0: <POINTOPOINT,NOARP,UP,LOWER_UP> mtu 8920 qdisc 
noqueue state UNKNOWN group default qlen 1000
     link/none
     inet 10.1.0.99/24 scope global wg0
        valid_lft forever preferred_lft forever
peer:
14: wg0: <POINTOPOINT,NOARP,UP,LOWER_UP> mtu 8920 qdisc 
noqueue state UNKNOWN group default qlen 1000
     link/none
     inet 10.1.0.100/24 scope global wg0
        valid_lft forever preferred_lft forever

This a wg0's IP.
Someone could shed a bit more light on that - I'd imagine 
many will appreciate, I will.
I'm thinking - is my ipcalcing messed up..
many thanks, L.

