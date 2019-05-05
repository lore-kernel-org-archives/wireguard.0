Return-Path: <SRS0=zOjE=TG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9A69C04AAD
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 May 2019 20:37:54 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5110B206BF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 May 2019 20:37:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ownmail.net header.i=@ownmail.net header.b="Cgs07tqq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="uHULVYpo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5110B206BF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ownmail.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7cfe604b;
	Mon, 6 May 2019 20:28:44 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 847c05a2
 for <wireguard@lists.zx2c4.com>; Sun, 5 May 2019 00:33:24 +0000 (UTC)
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
 [66.111.4.28])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b33dd5fd
 for <wireguard@lists.zx2c4.com>; Sun, 5 May 2019 00:33:24 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id B3D23210A8
 for <wireguard@lists.zx2c4.com>; Sat,  4 May 2019 20:33:23 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
 by compute3.internal (MEProxy); Sat, 04 May 2019 20:33:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ownmail.net; h=
 from:content-type:content-transfer-encoding:mime-version:subject
 :message-id:date:to; s=fm3; bh=F3rniHg8kUllfVqbf6suZdRu/PSDNM6Vw
 k4Jh9Sfu1A=; b=Cgs07tqqTXOF1iqYE72szNcAKBiTmsLjIAVm9J9siXF5CV6ov
 KnDNg4rAmmE8rrthVrQTksTFgLkLwNcLAdvPqWiR95rEwitYn0N0JG8gfUv6O2Yc
 Ttf7TLQtIlISdtBbjh1SBKTTIfHfGYts7bQW+UdRLXPFY0w8Ta592HdXXn4/8zu3
 eFROsd8ZlgjgIO9NPfPEI8LjZp8wQGWxZkEkU5ZhnxIJtPtibFQf5Dc6i0V/jydE
 gMurWjQ5+XAzKtRSK5dbZ6n2NYyeygdp//3GepnHzYuPaqKeaoJ1Qok4l2s6Czhw
 HOvTaOFVox4Z2GBLBIqYqsiFotLlHT9KFp6Qw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:message-id:mime-version:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=F3rniH
 g8kUllfVqbf6suZdRu/PSDNM6Vwk4Jh9Sfu1A=; b=uHULVYpoH7qxLmfOgVa0Ii
 UR2HLiivt87REiGUz6gk+4Yx7JKBCEpOsnl4Qiu8+pHh7HQD4yzsHHLj3pBiUJKL
 pYIvjMwrQUVLrm47lVD8AQ0ItzMJkNoCa2BKrpIj2BUWlOUgdeLiPQkiggNV8hhW
 Zneckz7FVPK2Ita3fuv9Z34idwnwVqnmhlMrOWke/iNdwricFFslK91g0thhE7hb
 RBsMOixQkVWl7MNq6m39ShN89GyFpBF0lSCTng0omiIVuM3Pu1lipy7DL7Ko3lbR
 7GZfXaCiCpqjiLfKDlUF7SPxrNBJyvYZ2F6+YQO23W0jOsTi84q1PXsa5voOkfnw
 ==
X-ME-Sender: <xms:Uy_OXPFENW_jDqH_1tTTFh_hFMsCBXErPDn71OWuksbFgHdNkDdXCg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrjeeggdefjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhephfgtgfgguffkfffvofesthhqmhdthh
 dtjeenucfhrhhomhepkfhgohhrucforghrthhinhhovhhskhhiuceoihhgohhrsehofihn
 mhgrihhlrdhnvghtqeenucfkphepudekgedrudegledrfeelrdduvdegnecurfgrrhgrmh
 epmhgrihhlfhhrohhmpehighhorhesohifnhhmrghilhdrnhgvthenucevlhhushhtvghr
 ufhiiigvpedt
X-ME-Proxy: <xmx:Uy_OXDNcLCzJo5-p2gauB4zQjlnDjx0sPphxCV_14fUz5MnShRR9-A>
 <xmx:Uy_OXOGUTu19NJY-Lq9uGAHFwSUiUaPD0Rb2UunuCukIPN9Rjo6DAQ>
 <xmx:Uy_OXKOTdm9TL7S_-H16r3-kDPWFsd0UsbcLMcnF9O7Sk43gomgg8A>
 <xmx:Uy_OXORWJcFhejpekYLcfiTEgbOJaQStEdnjXa0DvQdFKIUnQMukcQ>
Received: from [10.0.9.221] (toroon12-3096782716.sdsl.bell.ca [184.149.39.124])
 by mail.messagingengine.com (Postfix) with ESMTPA id 2BB94103D2
 for <wireguard@lists.zx2c4.com>; Sat,  4 May 2019 20:33:23 -0400 (EDT)
From: Igor Martinovski <igor@ownmail.net>
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.8\))
Subject: build.bat fails on Windows (tar does not extract .zip files)
Message-Id: <48E728A9-10D0-469F-8B6C-B6F44CF01016@ownmail.net>
Date: Sat, 4 May 2019 20:33:22 -0400
To: wireguard@lists.zx2c4.com
X-Mailer: Apple Mail (2.3445.104.8)
X-Mailman-Approved-At: Mon, 06 May 2019 22:28:35 +0200
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

SGksCkkgd2FzIGF0dGVtcHRpbmcgdG8gcnVuIHF1aWNraW5zdGFsbC5iYXQgb24gd2luZG93cyBh
bmQgZ290IGEgZmFpbHVyZSB3aXRoIHRhci5leGUgKEdOVXdpbjMyIGJ1aWxkKS4gSXQgY2Fu4oCZ
dCBleHRyYWN0IHppcCBmaWxlcy4KCkkgbWFuYWdlZCB0byByZXBsYWNlIHRoZSB0YXIgY2FsbHMg
d2l0aCA3emlwIGFuZCB0aGUgd2lyZWd1YXJkLXdpbmRvd3MgYnVpbGQgd29ya2VkLgoKRG8gSSBu
ZWVkIGEgc3BlY2lmaWMgdGFyLmV4ZSBidWlsZCBmb3IgdGhpcyB0byB3b3JrPwoKUmVnYXJkcywK
SWdvcgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpXaXJl
R3VhcmQgbWFpbGluZyBsaXN0CldpcmVHdWFyZEBsaXN0cy56eDJjNC5jb20KaHR0cHM6Ly9saXN0
cy56eDJjNC5jb20vbWFpbG1hbi9saXN0aW5mby93aXJlZ3VhcmQK
