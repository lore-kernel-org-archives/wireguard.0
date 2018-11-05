Return-Path: <SRS0=DDek=NQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.4 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FORGED_YAHOO_RCVD,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69465C0044C
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Nov 2018 14:26:35 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CDEFE2085A
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  5 Nov 2018 14:26:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=yahoo.com header.i=@yahoo.com header.b="UMUUaRdU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CDEFE2085A
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=yahoo.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f9f9e878;
	Mon, 5 Nov 2018 14:22:03 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7bbb19a2
 for <wireguard@lists.zx2c4.com>; Mon, 5 Nov 2018 14:22:02 +0000 (UTC)
Received: from sonic304-49.consmr.mail.ir2.yahoo.com
 (sonic304-49.consmr.mail.ir2.yahoo.com [77.238.179.174])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8b4fe64d
 for <wireguard@lists.zx2c4.com>; Mon, 5 Nov 2018 14:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048;
 t=1541427975; bh=1xmNBFRMh9h5mR8GTvHhX/kd3UlBEexsA1YLWHSeU+w=;
 h=From:To:Cc:Subject:Date:From:Subject;
 b=UMUUaRdU8a8cb385GzozSF+O0KmtdIYFfVVY3h2+wZ/1T+lcFHO1mBclbuIjwgSKMR8SI+BcIjWIsTDXLLQPhTrTGAOYL+8Sq46D4sUzq1VboCCGeoNqOUdbcwpYzPRxw2UR6i4RieHXgpW4O5PbNJFIJ1LPA/+SfQfSx2JEAOthjHvyJ03XPTO2kxYN6A5ZDaNYDckIrlVlRNsxP2M795IQYbzfR0nBqrhH3u9QBvz1tZuyqbBDvaxgNXqxWBhjDHYL7E/X1LYgENChrFb8V61XNbn8paOFOt7zTKZfuV0n56nzjhqyawzjQkY1f1rya6GGI6td1+/GFwLHJY0nVw==
X-YMail-OSG: UA.Vg_cVM1lPNY_hwTgWk63MjGCwSD.Oqi4CXXw1Oe32ULNU_BIoqHhsyTGakJb
 cunNStu6a6NOdXq8Vk9_8_mkokJjVk0YHLBudXhH7JBEJg1bc82WawmtKgKxUCSZ6N5w2p7zrwA9
 WpHugzh4BiIPWyNKNynE7S.1KWAPrxVG9xC3Jkg.EVPsCCzn0u2QK_JiwtJ.GJjkaj4H6YPfhPMj
 r7UwpxKxkGUZulmCXfUfgrEbQ9BIs0BzMWNXhsBHbMGa6YvhcKbJ9TAlJ8AjB88Jt629tBqMkJl7
 jlRVIjxpbugXkMpm46cD6h8jKndXtZBtIINpgCoxC_EG_GyE0ALyznQFUeaJpkwxGyOBL4IRFziX
 NmqASxMsZ67b6AML2k66U6msGztBJ6Ma4xqYZJaMXEazzxHG.7c1lu1Z3Swwu2gvfSIJt_OtXvcl
 HwwAqSF4FkNc3vmoresWo9niRqt95vk99GPAnFKa0CWi2yFWCvckxqCQsv2NGoyE9c_ctpFUGMd1
 TcbySt4_OByyH6WCDTS464X9fcX1sbcz6B1CIZTgDjwHJvQeQTpCRSRt0Ze81Xjxyv572QG_CBy3
 okyUW2g34Q8vdvkt6HPZYYVUEd3Xp7HeQlxB6niw42K2T7JwXeJwE3YG3SiTJaHFZEha3vvshC2k
 mvlhp5jhce43Jf6b6TxBTdBlaXNc3F.1maHz3Hl1M2fD8khPca60dQSu39oowRoLyoaDZwyqsMHv
 wtMIjVOIdD6FuRaKNMyEc8WPkb.fLnP9b3BOraStuvbMFataF3BVfZgkcyf.dI02lRMgV6n4PiY_
 pYoqFPuvB1nhxA4_F4tzNDyuBvcALUn1sfdBZM9lPLgeQp7w8DzKERZ4G3A4JGDEEskUWMFH_4d7
 fmIdB._FyX1oTaSKxbiKFVQTdsKgXiNbvob7U79S5u6QYEFbPCPeFwo6W7q3Vtf32DMf5IF.s_LW
 8nPRZIBB3l4Tomh2xY4qIBts7F1kjoXocNCEPDjSzQmiFsxbzxiRe0J79TAilAYOcwMfI2bOIAtk
 GnKQC0B0FpSJCJn2TlsDT8B8PpBca.KBPWiAwl2uOKL4DqIfzTL_xK6H7CPZm5cJn2VWusb.sq6a
 JuhewRa1vD4_t9Mxah.086AXji4yjYHeU1FlnCNm22kYnQ7E-
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic304.consmr.mail.ir2.yahoo.com with HTTP; Mon, 5 Nov 2018 14:26:15 +0000
Received: from 5.226.141.240 (EHLO scorpbook.localnet) ([5.226.141.240])
 by smtp412.mail.ir2.yahoo.com (Oath Hermes SMTP Server) with ESMTPA ID
 0ede5989440f347bec76ce9c4aba3464; 
 Mon, 05 Nov 2018 14:22:14 +0000 (UTC)
From: Saeid Akbari <saeidscorp@yahoo.com>
To: Adrian Sevcenco <adrian.sev@gmail.com>
Subject: Re: match on wg packets and redirect
Date: Mon, 05 Nov 2018 17:52:06 +0330
Message-ID: <7729526.hCRZ1bQ3Gc@scorpbook>
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

Hi,

I understand you're multiplexing kind of thought (like sslh), so I did some 
experiments with u32 module, and came up on this:

iptables -t nat -A PREROUTING -i eth0 \! -f -p udp \! --dport 51820 -m length 
--length 176 -m u32 --u32 "0 >> 22 & 0x3C @ 8 = 0x1000000" -j DNAT --to-
destination :51820

I tested it on a server and it worked as expected. this way I intercept all 
wireguard initiator messages on all udp ports and redirect them to the 
listening (real) port of wireguard (51820); and because of DNAT, all follow-up 
packets get through as well. however, I didn't try having any other udp port 
open to test the actual "multiplexing". there is only packet length and first 4 
bytes of udp payload check wich correspond to wireguard's initiator message 
(type 1).

Hope this would be useful to some people :))

P.S: I know that you don't need this stuff for your use case (there is no 
other udp port open on 443), but I thought it might be interesting to you.


_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
