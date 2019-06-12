Return-Path: <SRS0=0DfD=UL=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49AC9C31E44
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 12 Jun 2019 00:22:19 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5225B208C4
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 12 Jun 2019 00:22:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="w8wG3eQb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5225B208C4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=honson.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 696e2e32;
	Wed, 12 Jun 2019 00:22:16 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cd788a74
 for <wireguard@lists.zx2c4.com>;
 Wed, 12 Jun 2019 00:22:13 +0000 (UTC)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7cc6752b
 for <wireguard@lists.zx2c4.com>;
 Wed, 12 Jun 2019 00:22:13 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id 7C27C21857
 for <wireguard@lists.zx2c4.com>; Tue, 11 Jun 2019 20:22:13 -0400 (EDT)
Received: from imap1 ([10.202.2.51])
 by compute3.internal (MEProxy); Tue, 11 Jun 2019 20:22:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=zy30Hf
 /jMhWKz8Z4QHK2nWJbIrjCOppoQjBkMSdSBAI=; b=w8wG3eQbu66MlG1gk2JCIv
 JjbQx5urSsTD5t+YN/i2kZzw5af9Da6OL4WFLRhgtDGSMECd+c1o2A6TlzZkpwG/
 9a6VpV1/pjsFUE0oIa2VoVF9U/C1qdj4rdo6HSbZ8IHcf87KwGTPPxWV52lbiwQ1
 t9OdzU9s1hLywZFuTov2/NJISN1ymI4hBJpb3KMyNGPy7iZGyA0AT1STajbfFKgr
 L515gYREAUP4dBu6GP2YS3XLHSEpSal2+sdVZa0rL0RDNO0M6OuQPVHsoVQoEtkF
 JJafRdGpcapPgzywud5++IvxOEUH4gnqUh/j/hfi0Ts3W38Szo2S2weUYsVOub2w
 ==
X-ME-Sender: <xms:tEUAXXc2FXo4OAqsT-ZypU_vhBpxMiuykH5TeGGG_-75g3-mVi8ZKA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudehiedgfeduucetufdoteggodetrfdotf
 fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefofgggkfgjfhffhffvufgtsehttd
 ertderredtnecuhfhrohhmpedfufhtvghvvghnucfjohhnshhonhdfuceoshhtvghvvghn
 sehhohhnshhonhdrihgurdgruheqnecurfgrrhgrmhepmhgrihhlfhhrohhmpehsthgvvh
 gvnheshhhonhhsohhnrdhiugdrrghunecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:tEUAXYk56o-4xyb5z4gMsTfA-zYhTv0gSIaWM7QmVCB2WuPr9NDLEw>
 <xmx:tEUAXZ6baLsn01sUJEDydbHaQ7OjBWUv5h64Hzh0hbdZP73OT0FruQ>
 <xmx:tEUAXQt-bbTZi_jUcXZkIkpQoXDG2bUpnQ6Omsyo7pKJAb8PkDLPGw>
 <xmx:tUUAXdtJSwLCu-ESVk63iuzwq9yITu3dmqa6uMsThD1oE2iAZ_ZY6A>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 845FBC200A4; Tue, 11 Jun 2019 20:22:12 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-663-gf46ad30-fmstable-20190607v1
Mime-Version: 1.0
Message-Id: <16a64aa0-924c-4497-8252-cc965a04a740@www.fastmail.com>
In-Reply-To: <CAHmME9r3QVVWRu=36Yx6wmfuHm5CCA3Dg+JdZknpnNAmnj=ATQ@mail.gmail.com>
References: <6BFBD58C-ACC2-45FD-9986-63CEA1143BA6@lonnie.abelbeck.com>
 <CAHmME9r3QVVWRu=36Yx6wmfuHm5CCA3Dg+JdZknpnNAmnj=ATQ@mail.gmail.com>
Date: Wed, 12 Jun 2019 10:22:13 +1000
From: "Steven Honson" <steven@honson.id.au>
To: wireguard@lists.zx2c4.com
Subject: Re: RFC: wg syncpeers wg0 wireguard.conf
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

On Wed, 12 Jun 2019, at 3:56 AM, Jason A. Donenfeld wrote:
> The other thing I was wondering is: aside from performance and races
> as described above, why not just make this the functionality of
> `setconf`? Then there's be no need to introduce a new subcommand. In
> otherwords, the idea would be to make `setconf` not destroy existing
> peers if we're going to be re-adding them again.

I'm very much in favour of this (updating `setconf` to use this new syncronisation approach), if anything it feels more logical and is how I initially (wrongly) assumed `setconf` behaved when starting out with WireGuard a while back.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
