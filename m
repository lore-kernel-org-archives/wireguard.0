Return-Path: <SRS0=Af8f=VO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEE13C76192
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jul 2019 20:44:50 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65A4C218BE
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jul 2019 20:44:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=althea.net header.i=@althea.net header.b="ox0XbDr8";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="ZGJrpIKo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 65A4C218BE
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=althea.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id de7c3222;
	Wed, 17 Jul 2019 20:44:01 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0e28fc74
 for <wireguard@lists.zx2c4.com>; Mon, 8 Jul 2019 15:10:40 +0000 (UTC)
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b6fd3980
 for <wireguard@lists.zx2c4.com>; Mon, 8 Jul 2019 15:10:40 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id C881E2207F
 for <wireguard@lists.zx2c4.com>; Mon,  8 Jul 2019 11:10:39 -0400 (EDT)
Received: from imap2 ([10.202.2.52])
 by compute4.internal (MEProxy); Mon, 08 Jul 2019 11:10:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=althea.net; h=
 mime-version:message-id:date:from:to:subject:content-type; s=
 fm1; bh=3z/xJLJ40uWcZi3qC68TdKPItMgMB+ttWPQkOCbL5hc=; b=ox0XbDr8
 06F6N+yX68ynFR4qiFKqxSa8HAAg7Gi8tpph1hnkjTAgnlzXOkV5U5vYMzYBKZCx
 wQvS+RapCAjb233mrC8A5qiLaRU9HyFxXpR6LMOKXUYhBLzff+0GqVWe+UVj5lwv
 ZsieezbJbVH9YsLwQY7vjseQE7MKk+LGlTXyAu+zi2MDcHlJIrMuApzjeSx1TXbM
 ig7FsSQdbnI5M5/hgCQSh2QyS/ymWXSrWKf8ai99NbmPAbbeJ+48vHB2F6iXKpr6
 V++FSgvhQ+CWHkLYm+tGR3bZ3CFppuPRPfqvPC2+4pb6GLLTpxTB98bM4z53AdSe
 p1MsOjVJkhMyQg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:message-id
 :mime-version:subject:to:x-me-proxy:x-me-proxy:x-me-sender
 :x-me-sender:x-sasl-enc; s=fm3; bh=3z/xJLJ40uWcZi3qC68TdKPItMgMB
 +ttWPQkOCbL5hc=; b=ZGJrpIKoV0PeF3FR9HS+/cEC6SV56dnW8Of6OTNM7EAu9
 chqDFNrpvr4XT6edxNPFgxwrYXiwHYMeFwAAoVyumZSnG/0Mx/lDuNYqPBTMtD11
 NmJfZsPJx6WiF/TBD2mgQUJrBCoODgtjq+QewU+ifstAbOQPDwDJwCb3PD78nOQL
 fKXIVv+ddoCpjJ3n7TZFDHHo6X1dS1qMyCz/NGxvyK7TYV2mPC0pjVFGSEdIdepP
 CGac8yc38aVwJm6zXvKjTGQSQmNHL/hOaSWJ1VcnwDMan5HAgUllKKXLPWK0XPCr
 rYeKCaLCg7suo3nB8SK2X7OkBMpB4WsjxQBs/3gZw==
X-ME-Sender: <xms:71wjXegykApciDKkF4l4T6Ez_PQe3haT0pZxd_ZzeATvzerWxRB1PQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrgedtgdekjecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkfffhvffutgesthdtredtre
 erjeenucfhrhhomhepfdfluhhsthhinhcumfhilhhprghtrhhitghkfdcuoehjuhhsthhi
 nhesrghlthhhvggrrdhnvghtqeenucfrrghrrghmpehmrghilhhfrhhomhepjhhushhtih
 hnsegrlhhthhgvrgdrnhgvthenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:71wjXTZWU_M3TLXQolcEx1VlY8Wi10VGSLvCbb4xxUb4LFx5tazCoQ>
 <xmx:71wjXT92ZvoBFjDedOigIVDcvKYbpMcmMCpPseDx6ryZ5hJ5fUOKzQ>
 <xmx:71wjXVOJe5aU8TtzzxlpxO0kln6GEkSNZelhLl4xsg2gMiUdnt0vBQ>
 <xmx:71wjXZmolqtupQUP2ITA74ylYRR8cWlgH0VdRf6rYS-U3zkZq7w4YA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 33867E019C; Mon,  8 Jul 2019 11:10:39 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-731-g19d3b16-fmstable-20190627v1
Mime-Version: 1.0
Message-Id: <ce091f70-099f-4c15-a791-624ddb41a8d5@www.fastmail.com>
Date: Mon, 08 Jul 2019 11:10:29 -0400
From: "Justin Kilpatrick" <justin@althea.net>
To: wireguard@lists.zx2c4.com
Subject: =?UTF-8?Q?Fast_failover_and_handshake_renegotiation_for_multihomed_WireG?=
 =?UTF-8?Q?uard_servers?=
X-Mailman-Approved-At: Wed, 17 Jul 2019 22:44:00 +0200
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

I'm running a small fleet of WireGuard servers and clients, the clients use the Babel routing protocol to detect the latency and packet loss to any of the servers and select the best one accordingly. 

The WireGuard servers are multihomed, they share a user list, keys, and an ip address. Babel will insert a route to the same destination ip but a different actual server whenever that server becomes the better option. 

Sadly I've had to keep this feature out of production because switching between two servers involves around a minute of zero connectivity and that's simply too disruptive to expose to customers. The client continues to send packets using the handshake data from the previous server, the new server dutifully discards them as incorrect packets and everyone involved waits around for the old handshake to time out and a new one to be renegotiated. 
 
Is there any way to trigger a handshake renegotiation quickly that is also secure? Ideally I would like users to be able to roam between servers without any detectable change, much as they can roam between routes inside of a babel network. 

-- 
  Justin Kilpatrick
  justin@althea.net
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
