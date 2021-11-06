Return-Path: <SRS0=nQDx=PZ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29429C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  6 Nov 2021 04:57:40 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 471DF61056
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  6 Nov 2021 04:57:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 471DF61056
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=natulte.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 88df1a81;
	Sat, 6 Nov 2021 04:55:06 +0000 (UTC)
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com
 [66.111.4.27])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a266487c
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 6 Nov 2021 04:55:04 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.nyi.internal (Postfix) with ESMTP id C93515C00F4
 for <wireguard@lists.zx2c4.com>; Sat,  6 Nov 2021 00:55:03 -0400 (EDT)
Received: from imap42 ([10.202.2.92])
 by compute3.internal (MEProxy); Sat, 06 Nov 2021 00:55:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=natulte.net; h=
 mime-version:message-id:in-reply-to:references:date:from:to
 :subject:content-type; s=fm3; bh=5XjlbzTBwL8AFfiuzPint0Gr/a5nGd2
 kdxgC2fRg/kY=; b=bG++BU9cKR5Uk7Q71NSdVjfvdyB5KNVKywOLrJQpXZHbjEe
 lfeaqRcgHFYt3bI0kjSjLEmeuyZpFzztMVK2F0b2ATgOlzS3h3TRQ3t+Sqs+UmP3
 EXG9d5CdADuMQbSQEov1i9IVB/BL/XKtuICgnE/Eb3LxTGicFf7Scn9mXAZSKm09
 l8dUzAeovwxfN3E9bMc2DGF/bN3vYnFWPQHgZ+2ith4I0v3LLoe41vMK7jeWoRjA
 2B8MGMNLTmammcjOw5WZr92H9RLdY/2tXPU6yqF7M6dsuC84CISmvMRl9odroBee
 OkWt6+F7OEvyvQpP0mBN865cSSHWAdE5knwUoQA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=5Xjlbz
 TBwL8AFfiuzPint0Gr/a5nGd2kdxgC2fRg/kY=; b=gabKr2qp1pmNrWgia8p3qs
 BDmyRFDQvlugNb5r1C6P8PeTy9t9ZX/y6i6Eu66NKpo9PXMMHgi//KHQau8f/jf6
 aFrzT2pVwcE2fP6II+WRLqOfrFFVhJFwTEwJGheENoXa1VqZUAUU5l1t2VmRosWa
 Ep0d+K51P7JwHXnlqcdECPGDhbDB3jt6Zw501/EfxSMmd1P2rhX/E9OwUI96SVtu
 S1EmOkg0cV+Md1LLNtF6Zcd/JOOuz/iPMLHExORrIFuf3hf8JE09NV+NYUSij/5r
 8H60D/wgFPYhBSOrWCHgRKQWiSLFObqSP1Ssgu1nbII840BVPkcHLYrIaI4xDKnA
 ==
X-ME-Sender: <xms:pwqGYfyyLkZnBEe8nJi_AN5RAdaGEL0CpzNTu5bkWxJYK66VBmpGIA>
 <xme:pwqGYXS59qbUbOAocn7q6ap4AmJMd5L_4NnaNvSvO8xNr9502uNxonNNKeC0NKCW5
 JO4UL30reM0Wz5PAYM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvuddrtdejgdejgecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvffutgesthdtre
 dtreertdenucfhrhhomhepfdffrghvihguucetnhguvghrshhonhdfuceouggrvhgvsehn
 rghtuhhlthgvrdhnvghtqeenucggtffrrghtthgvrhhnpefgtdehveeiudevteeigeeife
 eiudejgfejjefhuefhjeelhefhgefhgeelgfekfeenucffohhmrghinhepghhithhhuhgs
 rdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
 epuggrvhgvsehnrghtuhhlthgvrdhnvght
X-ME-Proxy: <xmx:pwqGYZWG-0fiLcq-dMvFWifJXi2ONQ_6svPGNGdMHj6_fytylccMhw>
 <xmx:pwqGYZiXQS3EWL2wdGBO9eB0Jc_mxZgii_F6I9zfEROdRrc6rUeBmQ>
 <xmx:pwqGYRDgg_8N3BD78tTKoQ3ViV5WmoHp2ZLi25vTVfshnvTLQcedtg>
 <xmx:pwqGYQNLrFPt-ihMYYeQfEqPROWVSeKNoLNGWdHTnILrb_PQKPdBSg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 99EBE2180078; Sat,  6 Nov 2021 00:55:03 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.5.0-alpha0-1369-gd055fb5e7c-fm-20211018.002-gd055fb5e
Mime-Version: 1.0
Message-Id: <c700d141-5348-4ce5-9398-dfb281383607@www.fastmail.com>
In-Reply-To: <E3607380-8E46-42CC-80B5-BB38F206E9BC@slarew.net>
References: <20211028071638.88001-1-stephen@slarew.net>
 <0e80daf1-b4c2-b177-28ca-79e6575a339c@baywinds.org>
 <ED3FB4B3-96AD-4B98-86EC-D9F7999A530F@slarew.net>
 <K25247-14.1635527002@spamhaus.org>
 <E3607380-8E46-42CC-80B5-BB38F206E9BC@slarew.net>
Date: Fri, 05 Nov 2021 21:54:43 -0700
From: "David Anderson" <dave@natulte.net>
To: wireguard@lists.zx2c4.com
Subject: Re: Split DNS for macOS
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

On Fri, Oct 29, 2021, at 14:07, Stephen Larew wrote:
> As I understand it, under some circumstances, the Tailscale macOS app also implements split DNS in roughly the same manner as done in my patch. Namely, the tailscale app appears to use the Network Extension APIs to directly integrate with the macOS DNS resolution machinery. Perhaps the relevant difference is that tailscale approaches configuration differently (not based on wg-quick) than the WireGuard macOS app.

Hi, Tailscale person here.

Yes, the Tailscale macOS app supports configuring either split DNS. It's situationally popular for things like "direct anything under amazonaws.com to the AWS VPC internal resolver on the other side of my tunnel", which makes your AWS VMs and such magically resolve correctly without shoveling all your unrelated requests through AWS.

The semantics of NEDNSSettings I've worked out so far:
  * `searchDomains` sets interface-scoped search domains only, which appear to not be used at all for single-label DNS query expansion. IOW, it seems to do mostly nothing - or at least, I've not discovered anything it affects.
  * `matchDomains` specifies what DNS suffixes should be sent to your resolvers (specified in `servers`). Specifying a list of suffixes here implements split-DNS. Specifying "" (the empty suffix, which matches all names) captures all queries.
  * `matchDomains` _also_ installs any non-empty string you specify in the global search path.
  * `matchDomainsNoSearch` lets you make `matchDomains` be just match domains, without modifying the global search path. You don't get more granularity than that, either all `matchDomains` are search paths, or none.
  * If you want to fully capture all DNS traffic but also set some global search domains, you can list both the empty string and non-empty strings in `matchDomains`, and you'll get that behavior.
  * You only get a single set of resolver IPs. This means you can have many DNS suffixes with `matchDomains`, but all of them will go to the pool of `servers` you provided. You can't route foo.com to 1.2.3.4 and bar.com to 2.3.4.5 without having another intermediate proxy to break things out further.
  * Apple's DNS management service only installs the "default" resolver into the legacy /etc/resolv.conf, so a bunch of commandline tools inherited from BSD will be completely unaware of split DNS configurations, because they don't use whatever the "correct" resolution API is (I presume mach port something something).
  * Apple doesn't have a public API for reading back the OS DNS settings, because they don't want other applications poorly reimplementing the OS's algorithm for selecting among contributed configuration. There is presumably an undocumented API that scutil et al. can use to read things out, but I've not dug into that at all.

Regarding upstreaming: OS-level DNS capabilities vary wildly across linux, apple and windows, and across versions of same (e.g. Windows 8+ can do split DNS, Windows 7 cannot - but WSL/WSL2 can't on any version to date). I can ramble at length about each OS if desired, but the bottom line is "send all DNS to these servers" is the only configuration that can be implemented reliably on all of them.

So, the question would be: do you want upstream WireGuard applications to have consistent behavior on all platforms? If so, you have to either forego split DNS, or do a lot of work to polyfill missing features on each platform (Tailscale's attempt at this is https://github.com/tailscale/tailscale/tree/main/net/dns). Or expose the uneven feature surface to the user, and delegate the pain of non-portability to them.

- Dave
