Return-Path: <SRS0=nhTB=GJ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEE63C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  6 Jan 2021 01:17:37 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E649022CB1
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  6 Jan 2021 01:17:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E649022CB1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sholland.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 53f9d7d4;
	Wed, 6 Jan 2021 01:17:34 +0000 (UTC)
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 9a11d2e9
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 6 Jan 2021 01:17:32 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 461DC5C01C2;
 Tue,  5 Jan 2021 20:17:31 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Tue, 05 Jan 2021 20:17:31 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 to:cc:references:from:subject:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=p
 Frv1oFGRL2ToKXug1Cf3DR2l+FANIL9qbmmfdpettQ=; b=qcLf20MXylmzAXd2M
 58/X3bsllXfTFtTqlGBBAqF3sqZyRxTFTo2lVkNPdA1uWnXuypRNLgNcFDHlHSpH
 g5q2dPm2uFka+Q/wGvDl+ZpMchcXjJnlV2jvwuypBoikbk7CQ8WbKm2oVVh6zjEj
 nXHpZgiEvTQzm2HJCO75bZAaQJ7ryPrTLrjV9zhFL5ekYAl/X3KHtIAOXR1jc4Bd
 s0ImbiB9ah5cUN0Rb5nqGI+t6dosWWitJ2feu6y34wYyurNdbO5y5bVzlVicVJGp
 hKdlUNN9tiotwjPddpZrspBoOawtsSj4kBz1z4G8bHDiuaMTa4RBkezw/HboAk/s
 bol2g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=pFrv1oFGRL2ToKXug1Cf3DR2l+FANIL9qbmmfdpet
 tQ=; b=nimRqEEtGe1eo4n5bLszpn8yAqGTHNmFmMNgNMct+Kr7WjqwFVoaqhO6V
 zpF29hcybIE/gGiv1lu0FsgOhGNtdXVhi4U99MtVjxd/mx9mmfnDJXALRcv2O5uO
 YPT/431kwt2BKatpsgW1XEjLFYzLKDLSkBc1BHToqudtQRG5ECnFB0WrjHHrCw24
 PNUnQOhk1NQyw//RR7SMK35B5UbF0ZhNHqjye/KNbJscaT4XcCloNeTJBsnuS5Oj
 sK+58c1+FfAzkd66XGPY8g5AzbG0oJQgJnZ/03evj/6DtrQ5u2G8Hs42Q+s8grU6
 RESRzZI700uUJVW6S9W5KHncdP9WA==
X-ME-Sender: <xms:qg_1Xx3SSZHSm53ZyW83VT6GN9pK9n_RhxOtWjGA_fR0IzhfwIHa3Q>
 <xme:qg_1X4Gg5k_1rbfZQh-5AT1JuBJJn89x2AG5h7S67AC-awglJM0UWA4dScJlAvRhs
 Uetq1oBg_9HsdZMzg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdefkedgfedvucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
 cujfgurhepvfhfhffukffffgggjggtgfesthekredttdefjeenucfhrhhomhepufgrmhhu
 vghlucfjohhllhgrnhguuceoshgrmhhuvghlsehshhholhhlrghnugdrohhrgheqnecugg
 ftrfgrthhtvghrnhephfehudekteduueehkeejgedvvedvgedufeeufedtieffgeekveet
 udefleefvddunecuffhomhgrihhnpeifihhrvghguhgrrhgurdgtohhmnecukfhppeejtd
 drudefhedrudegkedrudehudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhep
 mhgrihhlfhhrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:qg_1Xx6VsgVv8moOzm7FPOeBOrqNsSY4k3F02HzHWG5dJ2mJaKzuGA>
 <xmx:qg_1X-3djZ8O4FrpWI9TEEx_KudTJ5XNW_So2YC5bbcdvPAY5RKNUw>
 <xmx:qg_1X0Ewir0-2ySBIztcAvP0su8HUP-wMBxawuPaobI8FsqkPiXDGA>
 <xmx:qw_1X-PZtw8ybpGS1k2egcRmIgZRRqagELBIlcShfpLc09uqLSNJzQ>
Received: from [70.135.148.151]
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id 3469C24005B;
 Tue,  5 Jan 2021 20:17:30 -0500 (EST)
To: Chris Osicki <wg@osk.ch>, Roman Mamedov <rm@romanrm.net>
Cc: Gijs Conijn <egc112@outlook.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <20210103215441.GA24251@server>
 <AM7P191MB088330591C4788BAEA9591888FD20@AM7P191MB0883.EURP191.PROD.OUTLOOK.COM>
 <20210105201212.GA31054@server> <20210106012530.2754726a@natsu>
 <20210105211301.GC31054@server>
From: Samuel Holland <samuel@sholland.org>
Subject: Re: WG default routing
Message-ID: <9c84d905-f707-bdf1-edff-afb50e3da6e1@sholland.org>
Date: Tue, 5 Jan 2021 19:17:29 -0600
User-Agent: Mozilla/5.0 (X11; Linux ppc64; rv:78.0) Gecko/20100101
 Thunderbird/78.4.0
MIME-Version: 1.0
In-Reply-To: <20210105211301.GC31054@server>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
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

On 1/5/21 3:13 PM, Chris Osicki wrote:
> On Wed, Jan 06, 2021 at 01:25:30AM +0500, Roman Mamedov wrote:
>> On Tue, 5 Jan 2021 21:12:12 +0100
>> Chris Osicki <wg@osk.ch> wrote:
>>
>>> As far as I can see after few tests, AllowedIPs config file option has nothing to do with routing and I hope 
>>> it will stay like this.
>>
>> wg-quick uses AllowedIPs to also set up matching entries in the system routing
>> table. This can be disabled in its config.
>>
>>> It is just a filter
>>
>> It is not only a filter on incoming packets, but also WG's internal routing
>> table for knowing which packets should be sent to which peer.
> 
> I'm sorry to contradict you but after some more readig I have to :-)
> WG has no "internal routing table", wg-quick (which, BTW, is not the subject of my query) uses it to modify

Did you read this part of the home page?

https://www.wireguard.com/#conceptual-overview

	At the heart of WireGuard is a concept called Cryptokey Routing,
	which works by associating public keys with a list of tunnel IP
	addresses that are allowed inside the tunnel.

	[...]

	In the server configuration, when the network interface wants to
	send a packet to a peer (a client), it looks at that packet's
	destination IP and compares it to each peer's list of allowed
	IPs to see which peer to send it to.

	[...]

	In other words, when sending packets, the list of allowed IPs
	behaves as a sort of routing table, and when receiving packets,
	the list of allowed IPs behaves as a sort of access control
	list.

WireGuard itself does indeed have an internal routing table. And you
should really read that whole section.

> kernel routing tables, from the wg-quick man page:
> 
>        It infers all routes from the list of peers' allowed IPs, and automatically adds them to  the  system  routing
>        table.  If  one  of  those  routes is the default route (0.0.0.0/0 or ::/0), then it uses ip-rule(8) to handle
>        overriding of the default gateway.
> 
> So, in my test config I have a server, 10.10.10.1 and two clients, 10.10.10.2/3
> If on the server I remove the AllowedIPs option, no one can connect.
> Giving AllowedIPs = 10.10.10.0/24 both clients can connect and routing in them stays as it was.
> The same for the clients, without AllowedIPs = 10.10.10.0/24 cannot connect.
> 
> Thus, my question still remains: why this filtering function?

Because, as the WireGuard website explains, a tight, static binding
between a peer's identity and its IP address range is an extremely
useful building block, both for security and for designing a network
topology.

Cheers,
Samuel
