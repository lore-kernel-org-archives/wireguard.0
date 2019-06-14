Return-Path: <SRS0=O0ly=UR=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B6EAC31E5D
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 18 Jun 2019 15:10:59 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 88746213F2
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 18 Jun 2019 15:10:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=labo.rs header.i=@labo.rs header.b="bBesbBP7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="kQ5jW/S4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 88746213F2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=labo.rs
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d41561bf;
	Tue, 18 Jun 2019 15:10:41 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7a6346b5
 for <wireguard@lists.zx2c4.com>;
 Fri, 14 Jun 2019 21:14:44 +0000 (UTC)
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com
 [66.111.4.29])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4dcf4aff
 for <wireguard@lists.zx2c4.com>;
 Fri, 14 Jun 2019 21:14:44 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 9D828220BA;
 Fri, 14 Jun 2019 17:14:43 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Fri, 14 Jun 2019 17:14:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=labo.rs; h=
 subject:to:cc:references:from:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm3; bh=8
 AmKJJRxJtgiNZbA6EOap0N1RpRPjLWsKMvGCLLCPHw=; b=bBesbBP77o9yVfknz
 rVb43NlcBEC3t5IVZpL6WH5goFiEi4HoBJRCWDDgc+kSKd4PdZvLOogSNuShzsNU
 KGTeeCpj9Mur21aBVjeWyDhUxV3X2HHvbxoyctFzXlO4RAAMICqRusfQ39r1QQ4e
 TD1UloziURipgocVNh0YEO1LnxbgqXtxlZhxF65JuLc6UW6n5t39B7QsdgXffIDJ
 hYzSljmOeMAr4AFDhTXxQoQs/oaT4QzOtkuYfJEDSH06fopvcVA5+xUg2syXAYxt
 CiPHM+/R4efcWMZvCy66A/MP1NkyUwT0M+lWA9cV24fyrxvClgKUIDjFvFbgKJEl
 24Owg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm3; bh=8AmKJJRxJtgiNZbA6EOap0N1RpRPjLWsKMvGCLLCP
 Hw=; b=kQ5jW/S42U9GofCGUKn1G2QqjsWXOVfrvzmbQIvFishtbY6n7WcmMiGER
 kqMl/TKMZlcDyTFn40w60FtfzDLvYcYqvgM3vtfMmI99pFE0dErLwoZAF8iK9Lid
 iaFr2E0sDCUtqGTBMLHB4vb2NCkZ1Ja6tARYlSmxCHNjYea/ZTccDlGw5PFbREx3
 bJRLUznOccwpzTCTyxig/2xrlo75h8p/6CuEE6X3FFBXoBfJM0CwI3pwzplIp2KB
 KVhl2QAwswJ2h0yZjSh1EMc80/zvrLb80Cc89vq1zuhSYFjoTRE2wKksmJ6U9bnr
 DL4nvxjpTHBQjHbBt/o+Oqv9iqhpw==
X-ME-Sender: <xms:QQ4EXQnXZhbIK5ptNCkV__FaT5kyUxvovImWkVG28uqx40SFTLlHsA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduuddrudeiuddgudeivdcutefuodetggdotefrod
 ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
 necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
 enucfjughrpefuvfhfhffkffgfgggjtgfgsehtjeertddtfeejnecuhfhrohhmpefkvhgr
 nhgpnfgrsgojthhhuceofihgsehlrggsohdrrhhsqeenucffohhmrghinhepiiigvdgtge
 drtghomhenucfkphepudekhedrudelgedrvdefledrkedunecurfgrrhgrmhepmhgrihhl
 fhhrohhmpeifgheslhgrsghordhrshenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:QQ4EXXGuJhF6FnTkUtWGh-fuYUFcB546kc6G5cVQmLTW6PmvV8Bhgg>
 <xmx:QQ4EXTVLZbIvz5HfHp0KjiCEfmqnHRlHEwIIP24DXqZGjWfGkDUyOg>
 <xmx:QQ4EXZSD6uoBJCDfye9k3eDAYYAUaruW9v1PNi3rDVKl0E9CKIrvfw>
 <xmx:Qw4EXa7jYkOGJsJGLMcDU0DzIRePHYJQuWviISWjEOZB8YRbuO7WvQ>
Received: from [0.0.0.0] (lada.labath.rs [185.194.239.81])
 by mail.messagingengine.com (Postfix) with ESMTPA id F33B98005A;
 Fri, 14 Jun 2019 17:14:40 -0400 (EDT)
Subject: Re: RFC: wg syncpeers wg0 wireguard.conf
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Lonnie Abelbeck <lists@lonnie.abelbeck.com>, Luis Ressel <aranea@aixah.de>,
 Steven Honson <steven@honson.id.au>
References: <6BFBD58C-ACC2-45FD-9986-63CEA1143BA6@lonnie.abelbeck.com>
 <CAHmME9r3QVVWRu=36Yx6wmfuHm5CCA3Dg+JdZknpnNAmnj=ATQ@mail.gmail.com>
 <CAHmME9qpp5pkP3RAENJfWjdaL61T7J1C5dDLCM+OM-U_DxRz_Q@mail.gmail.com>
From: =?UTF-8?Q?Ivan_Lab=c3=a1th?= <wg@labo.rs>
Message-ID: <43a193a5-bc33-3c12-37f6-d461ee5ef18a@labo.rs>
Date: Fri, 14 Jun 2019 23:14:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAHmME9qpp5pkP3RAENJfWjdaL61T7J1C5dDLCM+OM-U_DxRz_Q@mail.gmail.com>
Content-Language: en-US
X-Mailman-Approved-At: Tue, 18 Jun 2019 17:10:39 +0200
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hi,

walk_remove_by_peer does seem inefficient. Judging by the stack, I guess
it walks the tree looking for addresses from a specific peer. That would
be roughly O(A log A) operations for A addresses, in total O(N A log A)
if removing all of them.

A simple fix would be to know what you want to remove. Then you can find
it fast in the search tree. Does showing peer configuration also scan
the entire tree? If you need to store a list of addresses associated
with a peer (seems like a good idea), memory needed should be no more
and probably less than the tree itself.

I can explain an algorithm, or tell you how to fix it, but I'm not
saying I will code it (yet).


WRT setconf/addconf/syncconf

From a user point of view, I do not see a reason to disconnect peers
which are not modified when changing confguration. It seems excessive
and not quite useful.

After reading wg man page [1], I do have questions about what these
commands do.

1) When setconf-ing an interface without optional parameters, and the
interface was configured with a non-default values, do they remain or
are they reset to defaults?
I guess either would be fine as long as it is consistent. Both interface
and peer configuration.

a) Listen port - if not specified, I would leave as is. It has already
been chosen (perhaps) randomly.

2) If a peer is connected and the configured endpoint changes, does the
endpoint change? Does the peer get disconnected?
If a peer has roamed, you edit another peer and run setconf, it doesn't
seems nice to disconnect the roaming peers. OTOH, if you want change the
address (e.g. to a another valid one), it would be nice if the peers
moved to the new addresses in a reasonable time.

3) Regarding addconf - after reading the man page, I'm not sure what the
intent is, or what does it do.
a) It says only one interface section can be in a file, is changing the
interface configuration permitted? If not, it should probably be called
addpeers.
b) Are multiple definitions of the same peer permitted? If so, what is
the result - can I split the definitions, or are the previous ones
discarded? What about ips, are they summed or overriden?

Regards,
Ivan

[1] https://git.zx2c4.com/WireGuard/about/src/tools/man/wg.8


On 14. 6. 2019 20:09, Jason A. Donenfeld wrote:
> Hey Lonnie,
> 
> If your changes are user-facing, it's probably not a good idea to
> create confusion by introducing distro-specific subcommands.
> 
> I'm leaning toward Steven's suggestion of nixing addconf and making
> setconf behave like syncconf. But two hurdles remain:
> 
> - walk_remove_by_peer is very inefficient. That *must* be to be
> improved for this to be feasible. There's some interesting algorithms
> programming in allowedips.c to be tackled for that. Maybe
> node->peer_list can be used. (CC'ing Ivan in case he wants to put his
> mind to work on that.)
> - A decision needs to be made on consistency: do we want to read back
> the end result and compare it? Or will that kind of looping logic lead
> to other types of DoS or latency spikes?
> 
> Jason
> 
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
