Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 841EAC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  2 Apr 2022 17:43:38 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 61325932;
	Sat, 2 Apr 2022 17:41:20 +0000 (UTC)
Received: from sonic301-22.consmr.mail.ir2.yahoo.com
 (sonic301-22.consmr.mail.ir2.yahoo.com [77.238.176.99])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 5a81f3ca
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 2 Apr 2022 17:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.co.uk; s=s2048;
 t=1648921278; bh=NQetTYwOrW8xoHPNQcPWtedQGhb0GheofD+wpo7wWwo=;
 h=Date:To:From:Subject:References:From:Subject:Reply-To;
 b=eQhmKQLWmHEx66Rwmmo8DWF5yy8qE8BC/gHXFDdFn6+oSpiCeUA8l1ce/maPQbwOHoGnCDcTbU0M792LyRNl3x/261kmNs7irbKSWMrsU2p4XIgRabuVlLtQaEfvgpC3Pr2i8fmCjMu06AyJTyUuzgpAoqJSOuWNYrdNd6wkBUg5W5rVf6bo9hHRGM/wOewuHJjaqDLed9h3DI4mSWDDQ/mOKmXzqCZuyk7jNWFxEdVOrRAcB6aSPQ7cGb7CHHxAAbVMTSLh1ZLsfF0UeghWGTJd071KvN8fIABykit5nYFBys4NGELcsxoxO9ODFHtL/A+i5hwotbFGWLiI+8VpSQ==
X-SONIC-DKIM-SIGN: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1648921278; bh=nNE1b15CsWlUEWSWZr9WxDI9jGNR7plv04FMTHhhs0Y=;
 h=X-Sonic-MF:Date:To:From:Subject:From:Subject;
 b=Ct2lSg+JyfnkIg/6CjelIVgwl4Y5BTKluQGjLLafGF7d9xgVLNXCViR20Wik93ymg5GAMd4MjQXrGpGZCC0T8YA+ujFGcug3mv6aU0MnxO9e8vH4pMx5OzIfmR39hOK4wAvNjhamUSM0PVT5nUyBCFO+dewmFHsl0LU5KcdcQy7EKLVYxRcvj3CC7NzvC8sH90zDGwv40fkfkvqkNr79erBiDfVnxb1yaBKTLZf+dO2z9Cc7QYmtbfBMzWswjXNRhJ9aCR9aItqjwnaG5i3tIoI1gwiTwIKUBCYIcJ7W2m6JObpy92d27cPdM/AOMRAhJkiZsFDH1i3VM6pEgOxJsA==
X-YMail-OSG: Jsd2J1AVM1nvkrkcc9Pb9cJEwF8ols4Fvmapwvd.VL9QxR640yQsPweIqbwrcxk
 pYsfaMnn.JR4I8ztiHgan1OK7ZNXYfAVDhEWtOV1MhmUY_JaURZ2syViFoE87SWRI2ukj7c1Lkog
 5OQAc.XDKl5dImyfa0_qhdlVndLa2W4tZNLANeijPAYF2z_vAVKr2ACQ1klfdbF5OuFMaVZsXnxA
 SVFqU95kKDE_BNF_4rEb4ezccB2wNRfcuj7iLRCfu0yp7mf3XvMroBFBatdeaj4pXgeil8aAObp_
 5s5VGEUZ5VSQwV.KK0.PZP.IblMVRJKCL.MNECcYtnFvA2r4LiS3_1PoHxK70XqM1W1EwIhzwA.w
 oGtnzQtmBiRCyxU9esYK5zo0SoafUQGOQfoS2dQYSfPSeh68bjieShMGTmecsaet7qcSWEBKbkUE
 7XNk5Dg0O_Sf2GaEkN1aVPFn_O08tu1fpnA8hJr.iH.p2Wl9YKOLFVMo5MQJ4dKR31yDektzSc77
 MT3aDhKc1wWEZhvIWbUJ5mrQDNoya9k7jxPMR6bNF_zioDeXl_fHoqFpYAVuS9.koeE9QUeoPUGr
 V4Ehn62jUx5c39bU88pZteTVcM_Srd0Ivp2VuQaKkxIKC.Hhiln36DioRGeF0qN_BN5ILx7aSU9f
 0Ivnb_KriRKOM6V.4mh.o3luntmg5DkT.5CuH.NBymif_VP36GhaL0hubLAHuVwAezsH3.Eif5Eb
 J55ff8aMN_vGcX6il4kw4zb5m4najYwM8IfGVxGD5E6A6W569qM1CRhYz92nDB5zCRktvmsFAx.W
 DRhrSgKAM9OIpYNSbOi2.ddcRxZnrv.xQp8HGr2mS1eEKOblmzVgKfwjYHqc_NRzMmY4u_SzICyB
 h39YRMkBKP8rwDUwJSSr_bYAUKQnVDz7mWDbqe8RrvDJbllUVugc5uJSnrk4wpwfWQYegTkehiRB
 .2VYSfrEndBKxYxqGQevy44vmk8baY4_f9ObeWmBARb9f2LVAXue4gR00P2.0FdIDQB_Ls2mdgVH
 ob5LhGkSX6LbHdzx58mhJQ4wKJstyfQY9YFtrRUJoYM_1.5Mjb6EnsJPL5qlyIPW_w4j9L7DONzI
 PZnWXZFqO0V1hDWE1bE4NjcXO2Nts8mrfyDKLtpPDc3iZEmrmvgFcF1g7PMJzsTVH_6hEr9ic.CR
 CYcQ_tUFYm9qJ9cGSdeB1eiDNMKmGlI8eq63Bx9gjtVHQzRm6JIZ7Uo2SkZOIPuSw3FTCV_Y.4X6
 Iw._SHSRsFCAZRnVK0AayPbG9k.1tKs0rrRXO5Gmg1V6XgmJtyNOHgtL6ZRPESBwPuZ27BDJCVqS
 71c8yL5.lXIZcZIzSuaHEkGuIwgFrISxU0KuLaEIg.vI21MTE3YKu25bHj5Yodw1nVQSYdT_zgD_
 X.MMGl9FoqTndgwbcQk0vvf366.uMJo0pHuHe21uQNdnSYIIxCoLVe8xzRf0admX2FkLtEC0pHdh
 Bu43hwAR0T2M2damqJgqJrT0tW16XP_QYr8w64pvLKqdZypqkaUGr4HBYmtmn3PWGTmi_G5zfQA1
 .bmNNIn3g2c2PxGksVbogczBoHsBRFFMiTNvhXAmaHreQn9AXrZyQh7hVwXaFqT8ETDYb3rlB62x
 jyBpWsDp4_2D4QGzgCGqzIjPaFDW9EeB3vqP0gQ8eVKooR5sHluces5TLYS_srM4Y08t7T0BAMXP
 CFJ3DU6ukEPS1gvcucUp1Gjvj81ffBVd6NewupnZud6cHlhtf7xLXuczGrycts302rm6Vdpu5tCr
 gDfUz7jNFIJWuv91h7MTXroQsSsQO.KKRguFA3vuIMo2clnFVdfGY_KaZlFA38kaJ4iTL6xt0YsN
 895EYq7kwnt5qCDJre7UP.IBlCrTjInr0q6mIi5uxrcQJDCL21Pj7SoeD25uolrKcVrJG7bIIVtA
 cvbxfpNxNpcgAmeX_09O4MAcyc1cSRr22WZ9iH48A7QFYU0.j9RRukZhbqDY5YacQ3buEs65CFTp
 17Nc3JWbPhXr1HhqU9bk161ngVVPVLZ6HIpjsEXEcaZ48qgnoGEJXuhbc7uu1wUciJAm8ea6qF.8
 k0lfmI5RpMrUxKTnvYDJ16.TiENR1Fai7iqnZdnJcxMxlrAK4C88Y.grbEp1hySzPaWGTN2XoXMw
 d4rjcVt5FcwqgDXJXBaeOfXgtAtdaOGGkfKp4UsiMGSgZpvRBBBwwAKp.JkEls.RNJwrwErUxQAn
 ZiEFQ8qsUc7Rvo5ckCgx1xcXZoMraQyQAO1XIv3GxcTmjYgYIWfR3kXg1KlrlD02WHA--
X-Sonic-MF: <peljasz@yahoo.co.uk>
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic301.consmr.mail.ir2.yahoo.com with HTTP; Sat, 2 Apr 2022 17:41:18 +0000
Received: by kubenode501.mail-prod1.omega.ir2.yahoo.com (VZM Hermes SMTP
 Server) with ESMTPA ID 28742b50b3fddb49f2fb13f205bc67f4; 
 Sat, 02 Apr 2022 17:41:13 +0000 (UTC)
Message-ID: <c8f39df3-e207-2dfb-c65d-5c6b4267f159@yahoo.co.uk>
Date: Sat, 2 Apr 2022 18:41:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
To: wireguard@lists.zx2c4.com
Content-Language: en-US
From: lejeczek <peljasz@yahoo.co.uk>
Subject: MTUs go strange ways - ?
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
References: <c8f39df3-e207-2dfb-c65d-5c6b4267f159.ref@yahoo.co.uk>
X-Mailer: WebService/1.1.20001
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

Hi guys

I thought there was no better place to ask but here so - 
both ends are centOS and end up having different MTUs for 
'wg' interfaces and that I thought, was wrong.
1370 (server) VS 1320 (client)
I expected that would be negotiated between nodes without 
user involved, right?
Moreover if I from the client do:

-> $ ping server -M do -s 1300
PING 10.3.3.1 (10.3.3.1) 1300(1328) bytes of data.
ping: local error: message too long, mtu=1320

Could some expert or two shed more light on what & why is 
happening?
many thanks, L.
