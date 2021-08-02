Return-Path: <SRS0=V78u=MZ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2EC5C4338F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  2 Aug 2021 17:27:51 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F046960F9C
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  2 Aug 2021 17:27:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F046960F9C
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 65ec39f8;
	Mon, 2 Aug 2021 17:27:49 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f634c78c
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 2 Aug 2021 17:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1627925262;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type;
 bh=M35r3RPrIVNahgzasol2nz3xaMJkyZsiR9EavJomvzI=;
 b=RTrFTLEBAzAnG5DtzfHOWePo84QR+wZbs9LSCPclag0NGI2gJIRMgh+WqdDeW5Abxis/ah
 weY6/2uo+ZMQcI5R8j41vzJ6ebki2Qcxqc3nLLNPgqd3Jp/kbyDeqRo/B4TdUratKZl6LT
 vej+NwJFtntVnQIut5L2UPPZkrTR1Pc=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 6168f6cb
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 2 Aug 2021 17:27:41 +0000 (UTC)
Date: Mon, 2 Aug 2021 19:27:37 +0200
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: wireguard@lists.zx2c4.com
Subject: [ANNOUNCE] WireGuardNT, a high-performance WireGuard implementation
 for the Windows kernel
Message-ID: <YQgrCfqIL2SWfF6G@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
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

Hey everyone,

After many months of work, Simon and I are pleased to announce the WireGuardNT
project, a native port of WireGuard to the Windows kernel. This has been a
monumental undertaking, and if you've noticed that I haven't read emails in
about two months, now you know why.

WireGuardNT, lower-cased as "wireguard-nt" like the other repos, began as a
port of the Linux codebase, so that we could benefit from the analysis and
scrutiny that that code has already received. After the initial porting
efforts there succeeded, the NT codebase quickly diverged to fit well with
native NTisms and NDIS (Windows networking stack) APIs. The end result is a
deeply integrated and highly performant implementation of WireGuard for the NT
kernel, that makes use of the full gamut of NT kernel and NDIS capabilities.
You can read about the project and look at its source code here:

    https://git.zx2c4.com/wireguard-nt/about/

For the Windows platform, this project is a big deal to me, as it marks the
graduation of WireGuard to being a serious operating system component, meant
for more serious usage. It's also a rather significant open source release, as
there generally isn't so much (though there is some) open source crypto-NIC
driver code already out there that does this kind of thing while pulling
together various kernel capabilities in the process.

To frame what WireGuardNT is, a bit of background for how WireGuard on Windows
_currently_ works, prior to this, might be in store. We currently have a
cross-platform Go codebase, called wireguard-go, which uses a generic TUN
driver we developed called Wintun (see wintun.net for info). The
implementation lives in userspace, and shepherds packets to and from the
Wintun interface. WireGuardNT will (eventually) replace that, placing all of
the WireGuard protocol implementation directly into the networking stack for
deeper integration, in the same way that it's done currently on Linux,
OpenBSD, and FreeBSD.

With the old wireguard-go/Wintun implementation, the fact of being in
userspace means that for each RX UDP packet that arrives in the kernel from
the NIC and gets put in a UDP socket buffer, there's a context switch to
userspace to receive it, and then a trip through the Go scheduler to decrypt
it, and then it's written to Wintun's ring buffer, where it is then processed
upon the next context switch. For TX, things happen in reverse: userspace
sends a packet, and there's a context switch to the kernel to hand it off to
Wintun, which places it into a ring buffer, and then there's another context
switch to userspace, and a trip through the Go scheduler to encrypt it, and
then it's sent through a socket, which involves another context switch to send
it. All of the ring buffers -- Wintun's rings and Winsock's RIO rings --
amortize context switches as much as possible and make this decently fast, but
all and all it still constitutes overhead and latency. WireGuardNT gets rid of
all of that.

While performance is quite good right now (~7.5Gbps TX on my small test box),
not a lot of effort has yet been spent on optimizing it, and there's still a
lot more performance to eek out of it, I suspect, especially as we learn more
about NT's scheduler and threading model particulars. Yet, by simply being in
the kernel, we significantly reduce latency and do away with the context
switch problems of wireguard-go/Wintun.

Most Windows users, however, don't really care what happens beyond 1Gbps, and
this is where things get interesting. Windows users with an Ethernet
connection generally haven't had much trouble getting close to 1Gbps or so
with the old slow wireguard-go/Wintun, but over WiFi, those same users would
commonly see massive slowdowns. With the significantly decreased latency of
WireGuardNT, it appears that these slowdowns are no more. Jonathan Tooker
reported to me that, on his system with an Intel AC9560 WiFi card, he gets
~600Mbps without WireGuard, ~600Mbps with wireguard-go/Wintun over Ethernet,
~95Mbps with wireguard-go/Wintun over WiFi, and ~600Mbps with WireGuardNT over
WiFi.  In other words, the WiFi performance hit from wireguard-go/Wintun has
evaporated when using WireGuardNT. Power consumption, and hence battery usage,
should be lower too.

And of course, on the multigig throughput side of things, Windows Server users
will no doubt benefit.

The project is still at its early stages, and for now (August 2021; if you're
reading this in the future this might not apply) this should be considered
"experimental". There's a decent amount of new code on which I'd like to spend
a bit more time scrutinizing and analyzing. And hopefully by putting the code
online in an "earlier" stage of development, others might be interested in
studying the source and reporting bugs in it.

Nonetheless, experimental or not, we still need people to test this and help
shake out issues. To that end, WireGuardNT is now available in the ordinary
WireGuard for Windows client -- https://www.wireguard.com/install/ -- with the
0.4.z series, in addition to having full support of the venerable wg(8)
utility, but currently (August 2021; if you're reading this in the future this
might not apply) it is behind a manually set registry knob. There will be
three phases of the 0.4.z series:

  Phase 1) WireGuardNT is hidden behind the "ExperimentalKernelDriver"
           registry knob. If you don't manually tinker around to enable it,
           the client will continue to use wireguard-go/Wintun like before.

  Phase 2) WireGuardNT is enabled by default and is no longer hidden.
           However, in case there are late-stage problems that cause
           downtime for existing infrastructure, there'll be a new hidden
           knob called "UseUserspaceImplementation" that goes back to
           using wireguard-go/Wintun like before.

  Phase 3) WireGuardNT is enabled, and wireguard-go/Wintun is removed from
           the client. [Do note: as projects and codebases, both Wintun and
           wireguard-go will continue to be maintained, as they have
           applications and uses outside of our WireGuard client, and Wintun
           has uses outside of WireGuard in general.]

The leap between each phase is rather large, and I'll update this thread when
each one happens. Moving from 1 to 2 will happen when things seem okay for
general consumption and from 2 to 3 when we're reasonably sure there's the
same level of stability. Since we don't include any telemetry in the client, a
lot of this assessment will be a matter of you, mailing list readers, sending
bug reports or not sending bug reports. And of course, having testers during
the unstable phase 1 will be a great boon. Instructions on enabling these
knobs can be found in the usual place:

    https://git.zx2c4.com/wireguard-windows/about/docs/adminregistry.md

[ If you're reading this email in the future and that page either does not
  exist or does not contain mention of "ExperimentalKernelDriver" or
  "UseUserspaceImplementation", then we have already moved to phase 3, as
  above, and none of this applies any more. ]

So, please do give it a whirl, check out the documentation and code, and let
me know what you think. I'm looking forward to hearing your thoughts and
receiving bug reports, experience reports, and overall feedback.

Enjoy!
Jason
