Return-Path: <SRS0=/lAp=SQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6EA9C10F13
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 14 Apr 2019 11:40:00 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA1A32084D
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 14 Apr 2019 11:39:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=gmx.net header.i=@gmx.net header.b="Chq+l/dQ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA1A32084D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gmx.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3a4c72c0;
	Sun, 14 Apr 2019 11:39:32 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 93cca9c9
 for <wireguard@lists.zx2c4.com>;
 Sun, 14 Apr 2019 11:39:29 +0000 (UTC)
Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8c2d89d6
 for <wireguard@lists.zx2c4.com>;
 Sun, 14 Apr 2019 11:39:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1555241966;
 bh=r6UtRRAQGqz81lMo9ykzgaMUTeAfh0+6sZYdqseEy+0=;
 h=X-UI-Sender-Class:Subject:From:In-Reply-To:Date:Cc:References:To;
 b=Chq+l/dQ8cKJkk3uN9BIepwyB+oPpAlaMT1lZp2pmOukRX4i6dxotSwwZg9x6fWur
 zOfTYoNM+V/PEQOBKNP4BsD0HXZgg8+oMheoUqMruQhk8xfq/t6Y22kDCYJpoGiNOm
 om+rsJL4Y2T9EqHivTHxqU5vYowoxKxDgvQ76f3M=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from [10.0.0.20] ([62.47.183.173]) by mail.gmx.com (mrgmx001
 [212.227.17.190]) with ESMTPSA (Nemesis) id 0M0h9K-1h0zAm2WI2-00unNf; Sun, 14
 Apr 2019 13:39:26 +0200
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.8\))
Subject: Re: compile error on WireGuard Kernel/ROM Integration
From: Robert Walli <rwalli@gmx.net>
In-Reply-To: <CAHmME9oax4=RVQhKaJtaJbAXSq42DFw+QT8fxA2onoymq8ziUw@mail.gmail.com>
Date: Sun, 14 Apr 2019 13:39:24 +0200
Message-Id: <24E29B23-A9B0-40D3-9851-47A23BA42EC9@gmx.net>
References: <068214E5-B780-4A6C-AE79-BD772177EBCB@gmx.net>
 <CAHmME9ojqhKDRGkEqmaP-bCXPjgpjwRKKvQL1Z9Gu+bx018jyQ@mail.gmail.com>
 <A989EC48-2676-4C2A-8F1E-D9782F8D3B18@gmx.net>
 <CAHmME9oax4=RVQhKaJtaJbAXSq42DFw+QT8fxA2onoymq8ziUw@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
X-Mailer: Apple Mail (2.3445.104.8)
X-Provags-ID: V03:K1:FHo7Gj2pMbijtHHXh9i9RefoZa7odnGOuPpNiiN2a3jWk5vPOTa
 A3dcVhannXFY2EfEJEs8EHhLbXsUxk13st2a5hMvBqYc5SMHNEL6AWenD4pXsVNbNP54Ur7
 B0Z1RaDUzm9mA0uNZo/msH+yftCRrbi8+Kcj0pTgtAAcZWQKb4Cm7Zcrzp0VbPokkNjKsCs
 LN27xNJCUVVA9PSa7Fczg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:QaOP0LAeOW0=:NgNfumNcMCnkuPaE2m/Z6r
 gD3c0tNkBuWDNmJOwcpBQ/mimZzqvhculAbeEMCSTiwymaOkM5lfMzUN8nO2B6rPCCVRRpIQK
 J0GgNJDzOLuprUh/GpAIYNJIK+LLn2YFM4WvihhkZnVdJF23w74jgGcb5qbc2QqdwYR2jR3I4
 Y+ytZoPcbJSPKWZuoZXb1wNtEPJm89UZ4/hTcY+ktb2Yp++/kkfVIAUixO3WbYcdh7E1OvMKv
 9CMmE/ODGekoQKsJAo95dMwIo3BfaP7TxBVT8ZsTnymMDDUup+X8tc+nyylNRE5MMlPF96Jva
 5OIlMlaz2jmnLXO+oF1RL0pIs40lNZrja+/rJeMLPT19thniy+Md8kAiEImqsYTc6MLtLF1m1
 LHBVNHkVAamih3215Z2O7ojQu+5wYlOOsRAIhnswqnQQL9AoWcqcDhPs4WWl0xFvHPj6WPko2
 vD1h6oW/T1Wqmmu3LrbXWJ9qTc+uKIFt9bIR/E8Z18sWw79EzaDXqQFKW66w/Nh2WYu85h5wv
 qtE6qC0B97D7DorVeMEKP/MhZSIO3uB4e3QP+vzMXPaDxdaqmfQcAm4gP+Mp08M3IdSuUUw2p
 YouVhv3zGIPffFDAlU58pl19Pq0nUdDrHv/hlnX40RsT7mbeMTtUbsdWDGDqpzh7qBRYtnThz
 vrA7zvU3oDkThP8pgMPzTDSFsqMGQ9sBNFL1Umf6C4tyVwwDpQAq/P+w1sEyNPKkIWi03Qx66
 2zt2/zIvgECu65SOlubPZUDX1osgWIxImNKh8vUBe3S+820f2USDSjzQIiDE/RZdxaiO7Y3ln
 l1K4q5+l3QloCuGsLKnUnfdSOMKlPEguBvw1UhI/p/Tos1ZcZCEwfs5cLUS9YDPo1SUUKkgVj
 8kjNGBavW+t6MQqXL0SbBnE4kQs9vu00rZC1bMY5FPcBNTezjKUP82csSpWTGBCvNdNrTUS/b
 QPSwpjZsyRA==
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Cj4gT24gMTQuMDQuMjAxOSwgYXQgMTA6NTQsIEphc29uIEEuIERvbmVuZmVsZCA8SmFzb25Aengy
YzQuY29tPiB3cm90ZToKPiAKPiBMb29rcyBsaWtlIHNvbWUgdGVycmlibGUgdmVuZG9yIG1hZGUg
cmFuZG9tIGJhY2twb3J0cyB0aGF0IGFyZW4ndCBhCj4gcGFydCBvZiBrZXJuZWwub3JnJ3Mgc29j
ay5oOgo+IGh0dHBzOi8vZ2l0Lmtlcm5lbC5vcmcvcHViL3NjbS9saW51eC9rZXJuZWwvZ2l0L3N0
YWJsZS9saW51eC5naXQvdHJlZS9pbmNsdWRlL25ldC9zb2NrLmg/aD1saW51eC0zLjEwLnkKPiAK
PiBBcHBseSB0aGlzIHRvIHlvdXIga2VybmVsLCBhbmQgdGhpbmdzIF9taWdodF8gd29yayB3aXRo
b3V0IGV4cGxvZGluZzoKPiBodHRwczovL3huLS00ZGIuY2MvQUdDMFNzajYvZGlmZgoKSXTigJlz
IGNvbXBpbGluZyBub3cgYW5kIG5vdCBleHBsb2RpbmcgYnV0IHVuZm9ydHVuYXRlbHkgdGhlIHdp
cmVndWFyZCBrZXJuZWwtbW9kdWxlIGRvZXMgbm90IHdvcmsuCgpUaGFuayB5b3UgYW55d2F5ICBm
b3IgbG9va2luZyBhdCBpdC4uLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KV2lyZUd1YXJkIG1haWxpbmcgbGlzdApXaXJlR3VhcmRAbGlzdHMuengyYzQu
Y29tCmh0dHBzOi8vbGlzdHMuengyYzQuY29tL21haWxtYW4vbGlzdGluZm8vd2lyZWd1YXJkCg==
