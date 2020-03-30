Return-Path: <SRS0=1oQw=5P=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FE96C2D0ED
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 30 Mar 2020 02:31:32 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A671A20780
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 30 Mar 2020 02:31:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ericlight.com header.i=@ericlight.com header.b="Ih8Y0mp5";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="c/pzoYQU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A671A20780
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ericlight.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a6101737;
	Mon, 30 Mar 2020 02:12:51 +0000 (UTC)
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 62c7c262
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Mar 2020 02:12:47 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id F188D5C0931
 for <wireguard@lists.zx2c4.com>; Sun, 29 Mar 2020 22:20:36 -0400 (EDT)
Received: from imap7 ([10.202.2.57])
 by compute4.internal (MEProxy); Sun, 29 Mar 2020 22:20:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ericlight.com;
 h=mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm2; bh=4SaLWcqT9Pn85Xd0eCVV2RfZd6qORGS
 kJhAUzVmrhSc=; b=Ih8Y0mp5FLEUS4ap3iTUYaS6+wjT1fOUTDyNtjJPzakIuI/
 YGU0uGUmAhusVa5pRFLyJQ5LsSkOVmoG3ZyOgAM2W3fZsjcX7GJOeM2CsNUkTi3m
 p0NMAAQhQcIYVl6TbVeIRQPn1+2/JU4jK+adXtq5Zro+Q9yI56Bq4J7QQJzIr8UY
 1Fw4m/Css24Wm/kSP1VHF10bIdzcByYYNSryfZqS2161rmyFhQEVmmQLP8SUaFnL
 BlUWFENob9goRvZF+CexRFNHnADifsT5c/W03PB9H/jPqrrLPicqUwwGeoIPNyNa
 reHSffXYMUe8T2jhF4IsUzNysVBYL7lXKVhUDEQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=4SaLWc
 qT9Pn85Xd0eCVV2RfZd6qORGSkJhAUzVmrhSc=; b=c/pzoYQUvJ8y8Y78U8fWRL
 XkGCZAa2yN6FiTbLjAiSMqHJQB8rkUmq33IwdyouAB5RLvp2QSF571LvqdJRy7VJ
 h1DGacUnwYuLd+ZgcUhaTqZzh58f5dM0h4PdZbw83gB8LGOK3ldK4MG5wP5BiQsO
 /rtCXwyRFq5GBDhx/XQFlz2GH3ssFjnf+x3oDc8cB/92LJ0CsMi1EoeWBd/OxJNS
 B4heTsB+riKMAPDYp5ygnsVi3ZaUeVbVWjapkmNNXyB0PxrHNVZgjJhWG+R9Wh7x
 s4lPvxkRGpb47Y/dTdPMox4R/2Xvi52TsKsXt1HhQIBjKSMWNAmk8RkGbHw3MulA
 ==
X-ME-Sender: <xms:dFeBXpqr-F-JBLdCW14wX2LFRIuO90ZnMkTbKxmcuPKdn6v_3yrs0w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedugedrudeigedgheekucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtsehttd
 ertderredtnecuhfhrohhmpedfgfhrihgtucfnihhghhhtfdcuoegvrhhitgesvghrihgt
 lhhighhhthdrtghomheqnecuffhomhgrihhnpehsvghnthgvnhgtrdgvshdpkhgvrhhnvg
 hlrdhorhhgpdiigidvtgegrdgtohhmpdhlrghunhgthhhprggurdhnvghtpdguvggsihgr
 nhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpegvrhhitgesvghrihgtlhhighhhthdrtghomh
X-ME-Proxy: <xmx:dFeBXjDjDROitVjw_4qftjw9HNOYFQIo3zGGd9b1m1SHN1WWKYLDQg>
 <xmx:dFeBXrzfFKYcCMgbAQXRi_YzwF3zBOCrle9Ts39bUvCKi4ooCVw1yA>
 <xmx:dFeBXg0HeqyN3mje9jrpD0PiGYNLFOfV2I_D-CYuZMBFyEh-vFQLRg>
 <xmx:dFeBXusUCzBbf_6mzquaTVHDeXSjiL5vj00bkygcaE4YObVSW9MjEA>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 4EF67180090; Sun, 29 Mar 2020 22:20:36 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.7-1021-g152deaf-fmstable-20200319v1
Mime-Version: 1.0
Message-Id: <7a0b9f59-0f17-4f7a-a174-272955706b2e@www.fastmail.com>
In-Reply-To: <CAHmME9qOpDeraWo5rM31EWQW574KEduRBTL-+0A2ZyqBNDeYkg@mail.gmail.com>
References: <CAHmME9qOpDeraWo5rM31EWQW574KEduRBTL-+0A2ZyqBNDeYkg@mail.gmail.com>
Date: Mon, 30 Mar 2020 15:20:15 +1300
From: "Eric Light" <eric@ericlight.com>
To: wireguard@lists.zx2c4.com
Subject: Re: [ANNOUNCE] WireGuard 1.0.0 for Linux 5.6 Released
Content-Type: text/plain
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

Oh, Jason, that is outstanding news!  Congratulations to you and the whole team of people who have contributed - be it developing, blog posts, or financially.  

Well done, you lot!

E

--------------------------------------------
Q: Why is this email five sentences or less?
A: http://five.sentenc.es

On Mon, 30 Mar 2020, at 15:16, Jason A. Donenfeld wrote:
> Hi folks,
> 
> Earlier this evening, Linus released [1] Linus 5.6, which contains our
> first release of WireGuard. This is quite exciting. It means that
> kernels from here on out will have WireGuard built-in by default. And
> for those of you who were scared away prior by the "dOnT uSe tHiS
> k0de!!1!" warnings everywhere, you now have something more stable to
> work with.
> 
> The last several weeks of 5.6 development and stabilization have been
> exciting, with our codebase undergoing a quick security audit [3], and
> some real headway in terms of getting into distributions.
> 
> We'll also continue to maintain our wireguard-linux-compat [2]
> backports repo for older kernels. On the backports front, WireGuard
> was backported to Ubuntu 20.04 (via wireguard-linux-compat) [4] and
> Debian Buster (via a real backport to 5.5.y) [5]. I'm also maintaining
> real backports, not via the compat layer, to 5.4.y [6] and 5.5.y [7],
> and we'll see where those wind up; 5.4.y is an LTS release.
> 
> Meanwhile, the usual up-to-date distributions like Arch, Gentoo, and
> Fedora 32 will be getting WireGuard automatically by virtue of having
> 5.6, and I expect these to increase in number over time.
> 
> Enjoy!
> Jason
> 
> 
> [1] 
> https://lore.kernel.org/lkml/CAHk-=wi9ZT7Stg-uSpX0UWQzam6OP9Jzz6Xu1CkYu1cicpD5OA@mail.gmail.com/
> [2] https://git.zx2c4.com/wireguard-linux-compat/
> [3] 
> https://lore.kernel.org/netdev/20200319003047.113501-1-Jason@zx2c4.com/
> [4] 
> https://git.launchpad.net/~ubuntu-kernel/ubuntu/+source/linux/+git/focal/tree/debian/dkms-versions?h=master-next
> [5] 
> https://salsa.debian.org/kernel-team/linux/-/tree/master/debian%2Fpatches%2Ffeatures%2Fall%2Fwireguard
> [6] https://git.zx2c4.com/wireguard-linux/log/?h=backport-5.4.y
> [7] https://git.zx2c4.com/wireguard-linux/log/?h=backport-5.5.y
>
