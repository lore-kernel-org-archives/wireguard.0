Return-Path: <SRS0=xb9C=EX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A05FBC63777
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 17 Nov 2020 21:06:36 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CE1AD24181
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 17 Nov 2020 21:06:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CE1AD24181
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=fastmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f79b7a8e;
	Tue, 17 Nov 2020 21:01:28 +0000 (UTC)
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f087afef
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 17 Nov 2020 16:02:48 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 1B7C45C02AB
 for <wireguard@lists.zx2c4.com>; Tue, 17 Nov 2020 11:07:26 -0500 (EST)
Received: from imap22 ([10.202.2.72])
 by compute5.internal (MEProxy); Tue, 17 Nov 2020 11:07:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.com; h=
 mime-version:message-id:date:from:to:subject:content-type; s=
 fm1; bh=0geYdsfItnqtmrZBYQyH8pbxTVAMQlWFFrrOAxV67Jg=; b=qSPdpPM3
 HX/8JZrTKo+iw2CU1by/quFDpQqzz8DHPrBTKactoT6o+xXVbRoUZYVeR1MV5NZj
 8c2R+n4Y1Cy4TLWynNRgXIDLabtpd0OK21nGlO7p5Ip8B3UXFhXzbyz7erbPS7vZ
 30EBtPAd8au5S0RrfG+Wg+x8QZA+mW2sTeIi2g5djXzi6VnaFu01tNSA4VqlXtv/
 ezBDBykT9Kvx46Hp5cAvunrc8FsypCUKBziwUlcLxyBzcZccJvtC2KmZ0PrTaiQ5
 gdzI62/RYCuE6U7ro3H5NFcKMKa6Z7AFL3iIfCT680GRO5cciH2SzFARF0p9OfYa
 fHcTeBpu9YnGSA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm1; bh=0geYdsfItnqtmrZBYQyH8pbxTVAMQ
 lWFFrrOAxV67Jg=; b=JQzWKTdNQaYN/TjZgb/l0ReDBrJoYoKKrh7ju4ytJpufS
 z4bXi2TKUS90adEtgiVxcYFzpuatSO4t+ZViOH75uVXO+BrTh+M9ykkiMFgrERwS
 1/X6TFyBMbPpvjhwubOCeDDLlnIoYA1NwphV3cNYMwZKGM5RUbcsq0bVISVTcWZW
 Xa8mqvu3Q6Csg/gQLL+YKEY2i2ctxI5tN1vYbTyDr95fl2H0PXGuYdMeE1KTajoy
 ywuFV2k2fa4Rkmn4auMc+A+J1fe+jtPtqU9XpuyD9bijpueFa7cyy5Epk61vObEq
 08Zpzd54yV7LFc8VI9Rl/0INzXdzMBwb6vUFnRmKQ==
X-ME-Sender: <xms:PfWzX49mVu9muzLhvqYE_3bsZYgGPpKOyR60GshyxThztjB2dhB6AA>
 <xme:PfWzXwtBuF1_8Z7bjZb9CNObvpKz3Mefu4AwSaIbkRWnbSru7452wSHiSmju6dyKj
 flqj1hQfe9dGQ175R4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrudeffedgkeegucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfffhffvufgtsehttdertd
 erredtnecuhfhrohhmpefoihhkvgcuoegurhgvgihlsehfrghsthhmrghilhdrtghomheq
 necuggftrfgrthhtvghrnhepjeffgfejgffffeevjeffleeggfdvuedtffefkedtfefgve
 ekueffgfdvheevkeeinecuffhomhgrihhnpehthhgvnhgvgihtfigvsgdrtghomhdphigt
 ohhmsghinhgrthhorhdrtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
 epmhgrihhlfhhrohhmpegurhgvgihlsehfrghsthhmrghilhdrtghomh
X-ME-Proxy: <xmx:PfWzX-DrZ-kwnEvr1e3CJIT1R8ulxLURjVFF2TkHYId_8hsVOfqdtQ>
 <xmx:PfWzX4cajrZ-dWRjU48vnWYKQ7d73Lcg_mOzGIwPq-JTTYl4DZTb5A>
 <xmx:PfWzX9NZDildfnCMGfCR7Oz1UyI4ExrAU--CmegprWrSsp6D9Fj5AA>
 <xmx:PvWzXzZ00bMyzySl9LGcL1N9qJt95j5sgRCD4psaypSJxzg-0pzmcw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 83D1B6680078; Tue, 17 Nov 2020 11:07:25 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.3.0-622-g4a97c0b-fm-20201115.001-g4a97c0b3
Mime-Version: 1.0
Message-Id: <6cd68546-4a9d-460d-b40f-2e1156d45d76@www.fastmail.com>
Date: Tue, 17 Nov 2020 16:06:21 +0000
From: Mike <drexl@fastmail.com>
To: wireguard@lists.zx2c4.com
Subject: Wireguard on Big Sur
Content-Type: text/plain
X-Mailman-Approved-At: Tue, 17 Nov 2020 22:01:25 +0100
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

Hey all,

First of all big thanks to Jason and all the contributors for the awesome project!

There is a story making the rounds [1] that claims that in macOS 11 (Big Sur) Apple processes are able to bypass VPN tunnels. However there is a comment thread on HN [2] that claims that this is only the case for "per app" VPNs (using NEAppProxyProvider) but you can still implement system wide tunnels that route all traffic.

What is the case with Wireguard on macOS Big Sur. Will it route all the traffic or will apple processes be able to bypass it?

[1] https://thenextweb.com/plugged/2020/11/16/apple-apps-on-big-sur-bypass-firewalls-vpns-analysis-macos/
[2] https://news.ycombinator.com/item?id=25113039
