Return-Path: <SRS0=8Q1O=NR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FORGED_YAHOO_RCVD,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92058C46465
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  6 Nov 2018 20:52:02 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E815520882
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  6 Nov 2018 20:52:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="dTHP4t0Z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E815520882
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=yahoo.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a3e16011;
	Tue, 6 Nov 2018 20:47:22 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2fe17d0d
 for <wireguard@lists.zx2c4.com>; Tue, 6 Nov 2018 20:47:19 +0000 (UTC)
Received: from sonic308-19.consmr.mail.ir2.yahoo.com
 (sonic308-19.consmr.mail.ir2.yahoo.com [77.238.178.147])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ae694221
 for <wireguard@lists.zx2c4.com>; Tue, 6 Nov 2018 20:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1541537501; bh=tRIWQ3h8iyDV6pVNEc7S2VfSN+r3KRQ56lif0cHo4bY=;
 h=From:To:Cc:Subject:Date:From:Subject;
 b=dTHP4t0ZLmOlOJLfLfPNHFTzZDfx/HXJjaYQ+qUFTSt8yreazsQO9RwFnbnK0fYGNPikZISTRDEI+rjiPTdXrP1NkLchhZyfBE2UZ+kX9/7YRxrUckbHPBisrFrMfKzgks7vX1ouQH0hH0VUp6axpuKTXLBlaOBYL4EV56m7goT7RK+iwX9NN/7Xr3Cq80SG65mL60Cn2eHiNB/0DZSczNoQxxE9lYlbZIQsrpt0H9UdpWHvvsAeDqs51eiFhRCjEG4ue0xk4uNh3BiiThXq2Ivzpub2mYI91DxxXva9oqoV9dBlKJNkTGQyn/uUbXKVMApbRaNSvUHj3yn5VrdD3Q==
X-YMail-OSG: gyUjGJUVM1kvuGpMZGZYeEUJNKChRJTtERDb3Ib0e.zyFGHFaolGJwGn4K3i9.6
 E.jcl9FVIEu.8aTLivBJgfRlpQb5udcoqPamHrBqr3CHYjxxQ7zkOEUBuFXSu.hUISkA3zJYdJvS
 tI0ebDdeQFWFHql5sQEE40cf83ygT6UR_lZsSytF3P2m5r8KRuFP.zvlGiLHYOe26643Y.K.erFt
 qNBMDVX9ctjTTKZj6WYUj0ms_1if_C6y_fa5JbeWkieZ5FKLMk4r4BoSutcBOLOltZt7HbQT4.fz
 tptpPxttYyi2nkuueSxbZZuZGxN78gX2laIRXaxDL2HnRE3LiehwO9Itfm05Z01Yo1dAw5tLAyJc
 0SgoNVUDWYnIt7vUlheqICDUZPvQkG_7B.8C4NiH7bCiTiXF91oBEEb8d7JdDr_gM3iQ.eElPlIq
 ywW7qfgWx1y4Q3PKDJBw12rQL.uWC0SLlzcCLNdwFxjQg1LvKyFVngTgkFO9yaPWoKH1I3RgE1kg
 w1ySFl93makc6mbdXtTHXbQOZfuwn8pXmIg3udOZ6iYykJcc8__XL7IEasQyF.DfiHXRqmKq_i0Z
 C8Ee4ra0VmmRsnKSLqnMocTmBoaUbtHPftDg__KqWWxgCgbFY9HNo790IJ5LsweiTx7i9ztI_gP0
 j8O0e9uZ9AG.AhmOTuEXbrx5XYYy8rgzANqVcfWTI98nxUF1s6t5GHlwcuWp9wtTH7D4pe0XsgQC
 GGo7KSn6t5.iQIGY6j5OtfUaJHFaE6QEO2wPb9yQWlsMxNbRQWE2NvzId00AcXt71SEAnjGlPlaV
 1NCbLH7Oz8wt.KIqj.zZx3yJv01lDFsFv2A.4ljm2NKxx_hEQhIP_ZHCTETUKMnQCMnaSM3FlAcD
 WDheBkXixF_VRVMZFJH1Fb7gM30n5y7NI_1t6RQu.8mmTS_gGd40HYD5cZMZ8Bf9oOM0UGfOtIHp
 96EwQOEZhZAnv0aqIqjigXT_VBUuTNTVWcegrfpAslsR6UcopCBov..tdIT5ClwpvyzI4L.IDm6R
 3TfvjMZbAKWEW0uc0UDiG5ZXxbrLUKs_X
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic308.consmr.mail.ir2.yahoo.com with HTTP; Tue, 6 Nov 2018 20:51:41 +0000
Received: from 5.226.141.240 (EHLO scorpbook.localnet) ([5.226.141.240])
 by smtp423.mail.ir2.yahoo.com (Oath Hermes SMTP Server) with ESMTPA ID
 9838b0ab3e8ce763b058aa41b761a9ec; 
 Tue, 06 Nov 2018 20:51:41 +0000 (UTC)
From: Saeid Akbari <saeidscorp@yahoo.com>
To: GMX John Thomson <john.thomson81@gmx.com>
Subject: Re: Channel/Tunnel bonding with wireguard
Date: Wed, 07 Nov 2018 00:21:32 +0330
Message-ID: <1663832.AtHhDoWA3l@scorpbook>
MIME-Version: 1.0
Cc: wireguard@lists.zx2c4.com
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hey John,

Unfortunately no, I don't quite remember it, but each attempt failed somehow. 
At first, I tried with a single swg0 interface on the server, which had two 
peers with different ip addresses (cwg0 and cwg1 on the client machine). Used 
qdiscs to split packets between the cwg0 & cwg1, but I couldn't manage to 
combine them on the server-side.
Then went on with two swg0 and swg1 interfaces, each with a peer corresponding 
to client cwg0 and cwg1, and bonded the two with a bridge on the server. 
Again, because of different IPs, it really didn't make sense to the kernel to 
see them as one, and I couldn't make it so. Eventually, I ran out of ideas and 
gave up.

However, the VTrunkD really seemed promising. (it implements the bonding in 
user-space, meaning it can actually work, and is more *smart* than a simple 
qdisc, and takes into account the underlying connections' properties). But I 
simply gave up on the whole idea, mainly because there was no longer a need 
for such a thing, plus I didn't have the time to investigate it. You should 
look into it though :)

Regards,
Saeid


_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
