Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 488E9C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 26 May 2022 10:36:47 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id cc33cbaf;
	Thu, 26 May 2022 10:36:45 +0000 (UTC)
Received: from sonic312-25.consmr.mail.ir2.yahoo.com
 (sonic312-25.consmr.mail.ir2.yahoo.com [77.238.178.96])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 8b0761ff
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 26 May 2022 10:36:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.uk; s=s2048;
 t=1653561403; bh=/JAKTiktGoNLEc9RFhb9Ju5Yi2OZ1xw8Df18VTXhtG4=;
 h=Date:To:From:Subject:References:From:Subject:Reply-To;
 b=bLfp6+S9eE4f8i8qEtP/k1nD5sAz1sejSu1kt404eOtCo/y5TzAWbQwuHnet18Xrst7hcRlK+iOFHH72WjZ3lTDFqb2Llwt9436gwFN3j2goDTX01Liph+I0jF33uRza55hROooAE+dFcZQXi4uwtwMAZYKhZTKBoivG/P3syWtOQs+ZAdmB12bfqiYolBFRjo3echcxpnDh3ZkZuKntL5t/2ECVOYUA1KT/UJILyQaTaiGQ2rf+/qqEXU2ZYSB1JHjg/YF+06s40lOuo51lOd5NofsAMMjfMImxgeeZEWE74WQeZodHC2+QLpmPO7Qa10Cht8wXHH28R9oHzu0mjw==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1653561403; bh=sfXn4G7IH+9dnXHPuuhvxSXdYjcUVPZTqg6+r85RSXT=;
 h=X-Sonic-MF:Date:To:From:Subject:From:Subject;
 b=Yc+0C+9zYL86nYuCLDGKmQk9dG+lnHLV176OWiKlO6PT8V18Mx+5jVkLu6J/v0k0WH6h9thd9vUtUWfpAYkqKskH9kYWkSOSZbjlM0Elet4uCzWjrYBS/WRi1Aa4er+REzw7+8Xg/ZQTW4DDaXw52zm+0x5B3JOwP/sEoGRWMxjP8Xrm3JmreuE1bjdMd6cv3LbpcvwyHz/9GGDHSLLA5bV6gQIODI0TeR5v7mZgLbKMsOWGTSaiyWo3HC2YBd+K3/SjuMDiurVKHjmaFahGxFvL36dg6bLzFkhn/2idpcYw9m6Df/cJfk8wqUCuvx793NUmtty/qxFbe5beWLetGQ==
X-YMail-OSG: u4EZdgAVM1lA8g9lwIdf7Le_qL1DUgbMqFswfHAFZ16NqrL4ePLt_M0YWx2JKYW
 F_gBPrja_Gb.llzgxXEDRQgIo1ICdud0zdNXIiwrkri_DUMYTic4GjHxT4zFtRyHovVCN2anCIuR
 EcH7zbdHfnyQPSgrNbd2aeZip6DrroLQFmsDnpKL6nh731F.nLL_xxBwUkkJM7isrdq2INDDXBc.
 OamhCPKTZQOx.T5OIxwSSN6fNQZoD03GUraiN8o4zcMeHo8XToVAPg2gYpATUCYLRLvTVKde8TY3
 ZtsOmYXjlowis.RwGUQhQThJnEYxH_7SOL0TpdqdrkhurA7HkptmKsnAvFYV99LrpxSdwE1eiRaY
 MX1qiJW7WYjLuwfK8sMvgIlAhnOuIuf6mo.3uft3_VZMiy7ozSJyszTp9UZs6EopT_dh8.wkX9kT
 Q8EqW3bJ_9jvTyvk7zBSMsYI6xzp3QVDFTkzWiMalh6VF9a_KgsezDDesfSr2TuZo7E3fep93zJa
 xCQYtaKNY8KjFwV5pF22zX5h1zaPiV51mOuXIbP3JnfKRwgkdSh1gJwGwvxfSKfZ3U.s.iGyC0Jy
 AFLuy0Rb6CYbkn_4NRYNMnRzWZ3uWwsK1LhQXpqIhbNFDExGqxnWcROWOoKC5I2FeS7fhq6sxLBN
 i.02mZi5r3.uwwnC0PcWPwjSD0a83yJcP.K.RCwL3qPRnjs7d.uDmcDcxY0w5PJrSU8Uk6AtydKR
 oCfaHXWGEPqZMRmN_CtK3gk4WujwwB1zHhpSF140KlcyZ71pFGBkaLJQA6yG1uRBAcGhqqqDkAUW
 JaiLg8IY4RB0dQjyqTwObHaZBPUnkmwHH9JHeZJA_mVf6WnMdIe5GYR1a6rD4UQfFO8Cikr7eBbE
 HeV8JYfM9SnJBK8gMRBSYxj1LZ_mbXJyJNtj16kJG2FiKy5LskdmKnDlPPQBEWLz_fDIKlTuHhiS
 qpNf1wjgQyffsW2jB_6djIbI99vSVA3RpTd1p97nVtjbCW5REdOlL7DmBdBfmAxqa.pFD2u8XeFk
 gYQU21Um_VbHll3cNamdamvjMViqeufoHSXUbIwUfLdUiB.VOfzTHYTxoScf6WZm.YNbLI6533Ja
 VhWJTjnXwaaOOYIQSyTmOGkaMhp_ca6AJUal_Uh1AkjTKiw_vK0k.bvWoz5agrn2kaWulcHlQLwX
 Zzbc9nuzA8NhXpMg1f2ytKSN4wHNO_9l.TCLCnYCv2v_zv5Lk1gVLY3S58RrI4yhev1D3JKP9FYw
 QCUlt5c2.evOoLATnPtmTmVgsVgmi4qQAxexUOWv5pueJda1Avd8Fi9upJIiQLV6mZLhlGRzz5Rz
 283yGWKJNvMxGu3yGlLW965vWGT0DED_903knXW21hsYtzFbhDMMuWIahOGHC7K.c581AP8TnK9E
 hHN1UR6EUjpjvgS5BGOMAWVNd8gEVh.jwB4D8VnC79z9Raa9eSZ1eRDxpHOJZOOIi2c8T5_NhSP7
 zxdsjF_MXZ07n2_xOOMbIN_K2EP8rOVz7ytp0JBihZsp3UT2NQQ5kLt0PJT.2afOSd3jF2BU5PQ4
 zAqmZCmQtV99QClfYD2qDQYlSMSiT.x9YOK7t9g4llL4FJoze8b.i4Stur5jGkgs8hc38EdYNGIX
 2LlxVvsxo0cvcSzFnUin4nSXkEESKYW57CyEilaGt4kBU8FSvql07i8YGjPBpkD_cq8hSKbzkvEt
 MoJq5i2tnl0gNZOQ6vaFYKeEps06APd_e_AgcB4UBI2jLsStDZWTrq3ZsX3QsXEIJPLIZTtlsedf
 baVVolJaSXY4MCs8_gi5WGpSPQ16Ymr6RF3HRrgOt8eUPz_xDFxQ6mGRFra8HE81pa1xeutX01Ly
 4Jcn9ZUzuWPEyKZJZM84BOv3ogjWBijGORX8kdfbYYBaYuljfLH44aDYeQpGLsLZCHPhGVFawCTR
 hvAzrdO94tb_gZGNwXTpVraUWyJc27b9dCId5Xljn5sI16vBSYgcHwy5Lkqf914ByZouK_uwJXrL
 YhlEVd6V.vVALTH6Nfb5gSfDTd3GN5CJDNOoHe0YWjFc10aKwTn6a6w8llg.Cj3SicuOwiiByLQt
 BAWorNbKrm8yNaQcJBiqjpCn0x0DdluVfIRik5yhZxzlTQxssaS.rFrolfalkS.mUmLTpb_kqlWZ
 ID7dvC6lHcGiH7Q4Vh1RXfu54l2BR5eI.QAk7mXLhLPcTHCbXNbtoEMeXVbbH1UMv4zdsQuBvaWc
 buZQEg7jJzdAaigDBJdbt6QDwdYrtTK_aqoyWiTOH3Nh9pzKyBf9EPfyAUw4p
X-Sonic-MF: <peljasz@yahoo.co.uk>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic312.consmr.mail.ir2.yahoo.com with HTTP; Thu, 26 May 2022 10:36:43 +0000
Received: by hermes--canary-production-ir2-6c7595c778-tbh7g (Yahoo Inc. Hermes
 SMTP Server) with ESMTPA ID 8f033c0ddc5b4d6f8805c9401109b94f; 
 Thu, 26 May 2022 10:36:38 +0000 (UTC)
Message-ID: <84e28e50-caec-072e-f916-870b63110432@yahoo.co.uk>
Date: Thu, 26 May 2022 11:36:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
To: wireguard@lists.zx2c4.com
Content-Language: en-US
From: lejeczek <peljasz@yahoo.co.uk>
Subject: something affects wg iface - how to troubleshoot ?
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
References: <84e28e50-caec-072e-f916-870b63110432.ref@yahoo.co.uk>
X-Mailer: WebService/1.1.20225
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

I have quite a peculiar case which possibly might interest 
anybody - as oppose to just resolving an issue.
I use a very popular monitoring tool 'monit' to monit my wg0 
iface and that works okey, meaning 'monit' does not see any 
issue with wg0, but _only_ if 'qbittorrent' is _not_ running!
When 'qbittorrent' is running 'monit' is reporting:

'wg0' 5 upload errors detected
'wg0' trying to restart
'wg0' stop: '/usr/bin/systemctl stop wg-quick@wg0.service'
'wg0' start: '/usr/bin/systemctl start wg-quick@wg0.service'
'wg0' download errors check succeeded

in my case monit's action is to restart wg0 iface.
'qbittorrent' is not, should not be, particularly interested 
in wg0 iface.

What do you think is happening there? I'm on Centos 9. Is 
some kind of leakage or something more sinister happening there?
Lastly, how to investigate this, how to tell what is 
happening to wg iface?

many thanks, L.


