Return-Path: <SRS0=AHPd=I4=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61772C433C1
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 30 Mar 2021 08:38:21 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27D6361987
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 30 Mar 2021 08:38:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27D6361987
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=babioch.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id efd377cd;
	Tue, 30 Mar 2021 08:38:18 +0000 (UTC)
Received: from mail.babioch.de (mail.babioch.de [144.76.131.5])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d87250f1
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 25 Mar 2021 22:35:08 +0000 (UTC)
To: wireguard@lists.zx2c4.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=babioch.de; s=24406;
 t=1616711708;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=hkUT8xIF07dvPRNBue8WqDVh7MxBkV3awxCSdzZ9ejM=;
 b=lktmtloTOIsemyxAXYw2LCeUWG6T43K3OXc5e5iOAQYqg58Z7xNPgtW/TTCnKOQpIXuNcO
 375ZGghDur/1sRKNVS6cdehCYjtNW2L5kl2b0JQ5Msw/17IBCLK60poxui02hqxC/kb/5T
 Np3XN/cp3PYQ317A3F3EuoJ2QmkULKoSKWFFNMwoPoXX8yt0jkwSEj3VF1M1CK00wdRL4E
 9RLiS8IvesZ6KthBYhgQ8+o25qxPy1r4mpz8ySweZOmaQQFtHsUiJCOrwfY6DnEdnFCGGS
 rCBVp4IhbFzJQ2wtGiACSD1rq6oV1V9tIRZo5gej4sQgXqkh+CK7orQsOtxqcg==
From: Karol Babioch <karol@babioch.de>
Subject: Best strategy for multiple point-to-point tunnels
Message-ID: <93213ae2-3ad1-7f8a-1e21-57f672738e18@babioch.de>
Date: Thu, 25 Mar 2021 23:35:06 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: 7bit
X-Mailman-Approved-At: Tue, 30 Mar 2021 08:38:17 +0000
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

Hi all,

first of all: Let me thank you for Wireguard, and all of the
discussion(s) and support here on this mailing list. It's super helpful
and getting started is actually quite easy!

I'm currently wondering what the best (TM) strategy for setting up
multiple point-to-point tunnels is. I'm actually not referring to "how
to manage this" (i.e. configuration management, etc.), but about whether
there is any recommendation on having multiple Wireguard instances (with
dedicated interfaces) vs. setting up a single Wireguard instances (with
multiple peers).

The reason I'm asking is that I'm coming from "OpenVPN world" and for
some reasons I'm actually used to setting up dedicated instances for
each tunnel. Essentially I have multiple OpenVPN instances running on
different ports - independent of each other.

Obviously this is no good for a typical "many clients, one server"
setup, but it has quite a few advantages for simple point-to-point tunnels:

a.) Better performance, since every instance has it's own process.
OpenVPN is notoriously CPU-bound and multi-threading has always been an
bottleneck.

b.) Easier to manage and understand firewall rules, as they can be based
on interface names (rather than IP addresses within a bigger subnet, etc.).

c.) Easier to manage TLS certificates. I'm used to generate "One-time
CAs" [2], i.e. there are only two certificates signed by a single CA. No
revocations and other complexities. This can be automated quite easily
and in case something is wrong, I can easily replace the certificate(s)
for this one tunnel without any effect on all of the other peers.

d.) Maybe the most important: Individual control for all settings (UDP
vs. TCP, MTU, cryptographic primitives, etc.). Sometimes it's hard to
find good, secure and modern settings for all clients, since not all of
them can be upgraded at once. For instance, some clients already support
TLS 1.3, while others do not, etc. OpenVPN allows for quite some
flexibility in that regard (e.g. peer-specific settings), but it was
always easier to have a configuration for every peer, rather than trying
to find the common denotator and/or deal with "client configuration
snippets", etc.

Now, looking at Wireguard, I'm wondering whether those thoughts are
still valid. I guess a.) and c.) are no longer valid concerns.

However b.) still is. For me it's still easier to write, understand and
manage firewall rules that are based on an interface name (i.e.
`wg-peername` vs. some seemingly "random" source IP from `wg0`).

The biggest concern on my end, though, currently is the "backwards
compability". So far Wireguard is the new kid in town and everything
works fine and is compability with each other, i.e. there are no
imcompatible versions / implementations, etc. That's great, of course.
Obviously, this is not a coincidence, but a design choice of the protocol.

However, the original whitepaper [1] also states:

> Finally, WireGuard is cryptographically opinionated. It intentionally lacks cipher and protocol agility. If
> holes are found in the underlying primitives, all endpoints will be required to update. As shown by the continuing
> torrent of SSL/TLS vulnerabilities, cipher agility increases complexity monumentally.

While I can understand (and agree with) this reasoning, I'm wondering
what this will mean in the future, when there will be either new
versions / features and/or some security vulnerability that will require
a breaking change on the protocol level.

What will happen to my tunnels, when I update the "server". Will only
compatible clients be able to connect? Will there be some switch to
still allow connections from some old peer(s). Will it make a difference
whether I have only one interface or multiple interfaces?

I'm basically trying to prevent a situation, where I update the server,
and some/most of my peers will no longer be able to connect, because of
some breaking change. Upgrading everything at once will always be a
challenge: Sometimes you don't have access and/or are not control over
some systems, sometimes there might be other restrictions and/or simply
no update available for some (older) appliance, etc.

I know that most of this is still hypothetical at the current time and
that no one has experience with such situation(s) yet. However, maybe
there are some recommendations on how to deal with this?

What are your thoughts about this? Are you taking any additional
measures to make sure to not be affected by a breaking change later on?
What is your recommendation on handling multiple peer-to-peer tunnels?
Should I go for multiple interfaces or for one interface with multiple
peers?

Thank you for your input, already appreciated in advance.

Best regards,
Karol Babioch

[1]: https://www.wireguard.com/papers/wireguard.pdf
[2]: https://github.com/kbabioch/otca
