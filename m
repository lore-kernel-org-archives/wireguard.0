Return-Path: <SRS0=QHSY=WV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 431F3C3A5A1
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 19:37:09 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95C51206E0
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 19:37:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=althea.net header.i=@althea.net header.b="ssgftsM4";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="akDBcSbu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 95C51206E0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=althea.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fbf8deb1;
	Sun, 25 Aug 2019 19:36:51 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7d7d72ad
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 19:36:49 +0000 (UTC)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1c619273
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 19:36:48 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id AF0BB21B36
 for <wireguard@lists.zx2c4.com>; Sun, 25 Aug 2019 15:36:48 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Sun, 25 Aug 2019 15:36:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=althea.net; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm1; bh=9xVAO2ip9I1tJuedGATFNI8zKnuNUh0
 6VqsOJgjdr0c=; b=ssgftsM4OSjMKCyLigUXlN/kzAV+XShzbK9NXeGnU/fOVDK
 0pEMMWEMvi5n4EiZyHOXiINujb36vRV96wuXz8w6x6Meo9x2P/oU4u8y8rhliBKJ
 EwG+zVkUqYMHB9c1fosXbGCciuWv2Bor7rLrqtVihKZ2zo2HpD9q7ya9GzE98feP
 W9fZJJi8RknPxl+lQWgp5RdZjyghfZZQilKJDPy/5aZBSEdw2P9T/zGuBf0m5sht
 Piiq59ffVoghd2uwLLZNae4vxYMtn98+gagzcC9k/jTicAIvGJ/nwpSd6bhoCnbH
 fskEWLoNmolwelxB1qEWgmGzFY4gzAiHhFJMy6Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=9xVAO2
 ip9I1tJuedGATFNI8zKnuNUh06VqsOJgjdr0c=; b=akDBcSbu7LE3XWZLalt2XV
 /UujGK2DlobsWkZPoxN68Rw252NyOz/He2e4n9eKwSni0KUorqCFOTLH6CRn5YTh
 ty/QTMuf+9sxjmZTKZ9DkSkNIZ00yiHwFcPN6OKoNR4iNOFowvG8Y4ok3nzPDuIP
 US47FmPdwOhKaByqezA0HN7uoedLude0qKcFU5jRfQdpXVRMv3UzPMphk+pFGZj8
 O8D+XLnGnHB+TdSbNy64APTQm1zo0zMkc9msvschosMo09kkxwqLBtzkmvXvjnXS
 tNTUaKGiI5jInYWRt6JyBk4qCpw/zZBcfGbrDtgys7XqE9h2mZD45NtlBreWAh7A
 ==
X-ME-Sender: <xms:UONiXXvWutOfGIAKD8KosAP_b1fu3GE4wdqWaHDw6j2JPMORLb6p4w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrudehvddgudegudcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvffutgesth
 dtredtreertdenucfhrhhomhepfdfluhhsthhinhcumfhilhhprghtrhhitghkfdcuoehj
 uhhsthhinhesrghlthhhvggrrdhnvghtqeenucffohhmrghinhepuggrthgrtggvnhhtvg
 hrlhhighhhthdrtghhpdiigidvtgegrdgtohhmnecurfgrrhgrmhepmhgrihhlfhhrohhm
 pehjuhhsthhinhesrghlthhhvggrrdhnvghtnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:UONiXTWJ3hgRkSoVR8_IIWgLNrgYW9S_KPNIsgE5uwduH6f0SAavRQ>
 <xmx:UONiXdolxhoNQJLU6kOHUxrGnlyzGAWz-2JvTOT1dG_-ggw8BSQxPw>
 <xmx:UONiXf6u-Sd4F-yHDi1FuTutNBX2XEtz-i4LhdeslM6yevjul8q2Dg>
 <xmx:UONiXXMPXO1OhFXxpgPIgt8iWRqEXNf7G46BO8nAVHCATM9wfU5Gtw>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 5F081E00A3; Sun, 25 Aug 2019 15:36:48 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-916-g49fca03-fmstable-20190821v7
Mime-Version: 1.0
Message-Id: <717a87e7-6bd3-42d9-91d9-e2ee2f1c4b85@www.fastmail.com>
In-Reply-To: <87ftlzq4kw.fsf@line.ungleich.ch>
References: <87ftlzq4kw.fsf@line.ungleich.ch>
Date: Sun, 25 Aug 2019 15:36:28 -0400
From: "Justin Kilpatrick" <justin@althea.net>
To: wireguard@lists.zx2c4.com
Subject: Re: Status of Bird<->wireguard integration
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

I run a Babel/Wireguard combo which is pretty similar to what your imagining. I have an implemented and (somewhat) working solution to do what you describe that's currently in production. 

Wireguard in it's current form can not do fast fail-over in a practical way. This isn't really WireGuard's fault so mach as it is a consequence of the security model.

Imagine for a moment you have two WireGuard servers and a client. Exactly like your ASSCI example. The client determines that it's connection to server 1 is degraded or otherwise failed and starts directing packets to server 2. 

Since the client has a valid handshake with server 1, it's sending packets symmetricly encrypted with a key server 2 does not have. All packets get discarded until the handshake expires a minute later and is renegotiated with server 2. 

Obviously this makes the clients very unhappy. 

I'm not familiar enough with the cryptography design of WireGuard to really comment on a good solution. Ideally the server could recognize this situation and do an immediate handshake without compromising security. 

-- 
  Justin Kilpatrick
  justin@althea.net

On Sun, Aug 25, 2019, at 11:48 AM, Nico Schottelius wrote:
> 
> Hello again,
> 
> I was wondering what the status is of the integration of wireguard into
> bird and whether there is any help needed?
> 
> I am wondering, because integrating wireguard into bird would easily
> allow to create wireguard server clusters that would announce only the
> connected clients via BGP:
> 
> client
>   | \               |
>   | --------------- |
> server1              server2
> [wireguard+bird]     [wireguard+bird]
>   \                   /
>   BGP               BGP
>    -------- | -------
>             |
>      upstream router
> 
> This would not only to easily create any number of failover VPN
> endpoints, but also allowing to easily implement load balancing.
> 
> Best regards,
> 
> Nico
> 
> --
> Your Swiss, Open Source and IPv6 Virtual Machine. Now on www.datacenterlight.ch.
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
