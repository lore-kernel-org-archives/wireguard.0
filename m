Return-Path: <SRS0=QHSY=WV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C414DC3A5A4
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 15:37:32 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5E36B2080C
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 15:37:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ownmail.net header.i=@ownmail.net header.b="P5fJ+wdW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="mGorJaPo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5E36B2080C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ownmail.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4514f340;
	Sun, 25 Aug 2019 15:36:25 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4dc2219e
 for <wireguard@lists.zx2c4.com>;
 Thu, 25 Jul 2019 22:38:20 +0000 (UTC)
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com
 [64.147.123.24])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9f5b162d
 for <wireguard@lists.zx2c4.com>;
 Thu, 25 Jul 2019 22:38:20 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id E7150604
 for <wireguard@lists.zx2c4.com>; Thu, 25 Jul 2019 18:38:18 -0400 (EDT)
Received: from imap25 ([10.202.2.75])
 by compute3.internal (MEProxy); Thu, 25 Jul 2019 18:38:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ownmail.net; h=
 mime-version:message-id:date:from:to:subject:content-type; s=
 fm1; bh=USfUCTYiNH82YIV8a8J2xU+bCukXun5h764ZbrhvtFs=; b=P5fJ+wdW
 llm9+X5YaCYhs4QEVhUw7nunwIf9zv8Lwki/1wJ44/YN0WS4sKzqx8ZSCffICFYM
 Spkzh5ilJ+WSDNZcPibmN4C0dmYs6xXyQ9rq7luztgSNcvG3qf6xYTf/7nT6tjNY
 qV9Tnp2FTh2AArT+j4lCgKLPcgAPMWdub7Njms/MWk+0+EJUQzzH2DHkzkB3LTAt
 OSUPpSpqWAmpuMNd1JtFvgFR6lBFuMUmOT7sKdD3blHGUa4JfF5g7c4MzNh4FIVg
 8I8zVYsbny4HvWHo6bkq3LGJMGpNP95esYR13xMdvYsRkrI2qK9m6xLmtJSshQ6Q
 pS/BBgWUkgZ0UQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=USfUCTYiNH82YIV8a8J2xU+bCukXu
 n5h764ZbrhvtFs=; b=mGorJaPo14hkF/2h+iil9QTV1dyUelmTfIGt9LVyiESHa
 ycwNXjwpXK/SjmMT9hFaDCVumM9FCNck7uSXi9WCLJnT/gtlHTELEKzA0eYTA181
 DVeHfWPy5bdxaWmO0ABpjEuZcBWHvu6dfDZU9HbuVmKNRocTF2nQL+jHYc9TGICS
 Al6m/JhlBhKSE4xA23VCQh27CkQjNHyCZhsILT10DdF7z1VVyA0bSAgxZ5LUGp3O
 Ogd9XiYlK70OjJ/V9yJs8cFWF6lLoeCscKwSy9fVa1wkPABCVfwaZDGV1gSQwaMZ
 0dKcu4rfwkuQfFZDcqQh4dgFDeu2no13q/XGEwHig==
X-ME-Sender: <xms:Wi86Xa8wqHYt6kEACPKYBFpXKlfBk0aVi6QtX0F69LQqrlIIpOnwWw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrkeefgdduudcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkfffhvffutgesthdtredtre
 ertdenucfhrhhomhepfdfkghhorhcuofgrrhhtihhnohhvshhkihdfuceoihhgohhrseho
 fihnmhgrihhlrdhnvghtqeenucfrrghrrghmpehmrghilhhfrhhomhepihhgohhrsehofi
 hnmhgrihhlrdhnvghtnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:Wi86XaIYFWBlEIRbCce4JlqYecplnECMQ0ofC3FvzBfl2sTLCVqzBA>
 <xmx:Wi86XREOoKJyF58wq6CMRnoZaWDKeAdSMsgcPhuSjRA8872lhbZOtw>
 <xmx:Wi86XWy2H_Sffh177oa_zvzVynvZuQk0cqLoZW4BcgHB18GuWxnH1Q>
 <xmx:Wi86Xb5LcDtOBGQwbShm39bjE1ySTZTUtEMWJ-J3NshRSTvaUBHkJA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 2CE53BC00D7; Thu, 25 Jul 2019 18:38:18 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-736-gdfb8e44-fmstable-20190718v2
Mime-Version: 1.0
Message-Id: <beaf5d99-cca4-4980-a1d8-ba0444117a4a@www.fastmail.com>
Date: Thu, 25 Jul 2019 18:38:16 -0400
From: "Igor Martinovski" <igor@ownmail.net>
To: wireguard@lists.zx2c4.com
Subject: Feature Request: Add "include" directive to config file
X-Mailman-Approved-At: Sun, 25 Aug 2019 17:36:17 +0200
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

It would be nice if the config parser could support an include directive such that each peer configuration can be kept in a separate file. 

This would allow easier management of a large number of peers. It would also serve as a way of having a friendly name for each peer or peers by the file name.

Sample below:

[Interface]
Address = 10.22.22.2/24
PrivateKey = ...


[Peer]
PublicKey =...
AllowedIPs = 0.0.0.0/0
Endpoint = ...

# append a config file
include='/usr/local/etc/wireguard/family.conf'

# include all files in this directory
include='/usr/local/etc/wireguard/friends/'


-- 
  Igor M.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
