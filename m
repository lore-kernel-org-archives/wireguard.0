Return-Path: <SRS0=S6z6=OR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C465C433FE
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 27 Sep 2021 15:29:22 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2EA2660EB4
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 27 Sep 2021 15:29:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2EA2660EB4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=poorlab.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e5bd9609;
	Mon, 27 Sep 2021 15:29:19 +0000 (UTC)
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
 [64.147.123.21])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id e7f6f6c4
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 27 Sep 2021 15:29:16 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id 2E03E3200F3F
 for <wireguard@lists.zx2c4.com>; Mon, 27 Sep 2021 11:29:14 -0400 (EDT)
Received: from imap46 ([10.202.2.96])
 by compute3.internal (MEProxy); Mon, 27 Sep 2021 11:29:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorlab.com; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type:content-transfer-encoding; s=fm2; bh=VsGGU
 p1ykfmVGvgtFWMQ8DXlvnMbO12H29Qo37hHIwQ=; b=v0acPwnTBcRKU6eRl3VKG
 L9FB8/bdBuUaUdJFaSnE3l1pcrRYFImvQ5VcuQDQSM1xR+icVTB4otCAJIhdd/xZ
 m7aL3+y/F+NUgTgI6RE+VvrBzJkq6KfKoD1w4qpqEkrRF27QS+TdSdDvJ5VTfPbt
 6ZfE/023Q7PWVnpE1t1YYCsC87HYPrVHE/D7NokdOv4FeUDzB6SvuD09CzQMbrbc
 QoDA8uvNLH+hzHQnhrh2X83ykwnV0pAtJdl1ktqPtsgjSzUxV30QOxeRVdtL7KD+
 Jtau5anFXRGNjnS40geKnCxejRCdrLKioovWjbOzNyBqLPJYTuB5WpNuk9qXmho1
 w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=VsGGUp1ykfmVGvgtFWMQ8DXlvnMbO12H29Qo37hHI
 wQ=; b=wfbyuyB28EXVPq35Q1luIBboEFwiWq8K4gTqCqZmJYk5QGMYQXaxj1YiM
 /BGZfZAYfYOVg/R1MoHqCSLtn6eXxDC4aMSG5x0xSDcYgLr7r/WLQSfSB5sENf86
 eM0UcJOuA867QHFWsQfVtX18HXHEJQJNQfvwKmyOW1HBm0aAAleHdiyBDgrZ3yl3
 hy6rWE4vRwS9QqxNOFyt/mS1WYkhalrmoiWJc4e37LC0LM6b2iKuAupHy+1GB8Z5
 UsyWM/F3N3OvDAK+NSW+OIHp2B76yF1+vEDZHz8GI3k0hVecXDUJCKFDGBkIbGOl
 eKSoULv+g+AA1IH9Rmk3meXSiDJBw==
X-ME-Sender: <xms:SeNRYQolzA3fH9sPTduLge6HKkag2GOkSsO_-3N0OLkxQczTBkfqug>
 <xme:SeNRYWrdYGLVbVH5KZhqKpWnxvtnSdQddBgruv7Aj79INKAKko-Rx8IyTduzB4Hux
 YuKKZfK6SgpS6Tg2Ws>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrudejkedgkeekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtgfesth
 hqredtreerjeenucfhrhhomhepufhtrghruehrihhllhhirghnthcuoegtohguvghrsehp
 ohhorhhlrggsrdgtohhmqeenucggtffrrghtthgvrhhnpeffgeetfedvueetlefhvedttd
 eihefgtdethfegueetheeugfekuedvffejieevhfenucevlhhushhtvghrufhiiigvpedt
 necurfgrrhgrmhepmhgrihhlfhhrohhmpegtohguvghrsehpohhorhhlrggsrdgtohhm
X-ME-Proxy: <xmx:SeNRYVPaQ-v701IrfxS9lErqcugABzK_ldez_BZd_OZf1dlIYtYJhA>
 <xmx:SeNRYX7zcaXjUUp1Hb1XmTuhTq8MPGVakzGBXj5LAiAe27_eeY7_TA>
 <xmx:SeNRYf6ks8racAKOZYZd2HDSp7_nAi_HAqkLg1jBQefdMvekb_v3aA>
 <xmx:SeNRYRFnFK_KyRN0LM_u5D5NJFuX2VOwPDTVRH5njujRNtj3thrj0w>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 856EE1EE0074; Mon, 27 Sep 2021 11:29:13 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-1303-gb2406efd75-fm-20210922.002-gb2406efd
Mime-Version: 1.0
Message-Id: <d071a9ed-a1cf-4b4c-85ba-8a918a6e331a@www.fastmail.com>
In-Reply-To: <20210927102157.GA23755@wolff.to>
References: <XhEJRjPvvlk57PFUWApI0RPX2-dCuDbQ9RYxw9Y5GxzMs8YEpwVc4U-fR3avC-NT1X2UlBNQerMkOxgqrue_EEOtyZR18V329KuKev_i3aE=@protonmail.com>
 <877df2d5px.fsf@ungleich.ch> <20210927071130.GA13681@wolff.to>
 <20210927123439.7a551913@nvm> <20210927091435.GA10234@wolff.to>
 <20210927143628.36c2ceab@nvm> <20210927102157.GA23755@wolff.to>
Date: Mon, 27 Sep 2021 15:28:52 +0000
From: StarBrilliant <coder@poorlab.com>
To: wireguard@lists.zx2c4.com
Subject: Re: WireGuard with obfuscation support
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Mon, Sep 27, 2021, at 10:21, Bruno Wolff III wrote:
> If your ISP is blocking your Wireguard traffic call them up and compla=
in.

All ISPs in China is blocking Wireguard traffic. If you call any of them=
 up, you will end up in jail. There was a case where one user sued their=
 ISP for blocking Google, and got prosecuted until disappear in public.

I believe the original poster is located in China rather than other coun=
tries, because the word =E2=80=9CShadowsocks=E2=80=9D was mentioned, whi=
ch is the only operable proxy software there -- its obfuscation is stron=
g, but is slow and never cryptographically proved safe.

I would highly recommend you to test Wireguard on a virtual host in Chin=
a to experience how the DPI is carried out, or to run a VPN service for =
Chinese users. The DPI system tries to create evidences to fool the user=
 into believing it to be a network congestion, rather than an interferen=
ce. The traffic will get interrupted after a few days, with increased pa=
cket loss rate each day. After a certain number of days, all packets wil=
l get dropped.

For any of you who is curious: The DPI system uses a statistical model, =
which means you get a higher chance of blocking if the source ASN is fro=
m a data center rather ran residential Internet; or if your size / timin=
g / number of packets also match the characteristics of web browsing in =
addition to the usual Wireguard pattern. The sensitivity can even be tun=
ed so the interference becomes stronger during June, August, and October.

It is so unfortunate this situation affects 1/5 of the world population.=
 The Chinese users used to be too optimistic about Wireguard. Developing=
 an obfuscation plugin framework is not sufficient to fight against it, =
but there aren't too much that one can do.
