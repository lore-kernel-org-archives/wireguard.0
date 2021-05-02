Return-Path: <SRS0=NC//=J5=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56109C433B4
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  2 May 2021 11:45:52 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4252661244
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  2 May 2021 11:45:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4252661244
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=romanrm.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 021de985;
	Sun, 2 May 2021 11:43:48 +0000 (UTC)
Received: from rin.romanrm.net (rin.romanrm.net [51.158.148.128])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 9d12d312
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 2 May 2021 11:43:46 +0000 (UTC)
Received: from natsu (natsu2.home.romanrm.net [IPv6:fd39::e99e:8f1b:cfc9:ccb8])
 by rin.romanrm.net (Postfix) with SMTP id B0D65627;
 Sun,  2 May 2021 11:43:45 +0000 (UTC)
Date: Sun, 2 May 2021 16:43:44 +0500
From: Roman Mamedov <rm@romanrm.net>
To: Nico Schottelius <nico.schottelius@ungleich.ch>
Cc: wireguard@lists.zx2c4.com
Subject: Re: Multiple Keys per Peer
Message-ID: <20210502164344.039fe960@natsu>
In-Reply-To: <87wnshs8jf.fsf@ungleich.ch>
References: <87wnshs8jf.fsf@ungleich.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Sun, 02 May 2021 13:02:28 +0200
Nico Schottelius <nico.schottelius@ungleich.ch> wrote:

> when running a lot of VPN connections using wireguard, there are some
> questions we see quite often from users, two of which I'd like to
> discuss here:
> 
> Multiple keys per Peer
> ----------------------
> 
> Users often ask for sharing their connection with multiple
> devices. The obvious solution is for users to setup their own VPN
> endpoint with the first key and then reshare themselves. However, this
> is not feasible in many end user situations.

The prime and the most straightforward solution is to give each user multiple
keys, and let them connect from each endpoint as an independent Peer.

The rest of what you propose appears to be a set of bizarre hacks because
you don't want to do the above, because "(reasons)". Maybe start with
detailing those reasons first, or reconsidering if they are *really* that
important and unsurmountable :)

> Conceptually I see it problematic to assign multiple keys per Peer as
> the routing from outside ("where should this packet go to"?) might
> become ambiguous. One counter option would be to allow a peer to signal
> that it uses a certain part of the AllowedIPs. In comparison to layer 2
> networks, I see two approaches: 1) a bit similar to ARP/NDP, client
> addresses are learned 2) similar to dhcp-pd, clients "requesting" (in
> this context more: announcing) that they use a certain sub-range.
> 
> Protocol wise I'd imagine this to be rather simple:
> 
> side a: I want to use 2001:db8:a:b::/64
> side b:
>      - checking your allowed IPs covers that prefix -> no ignore
>      - checking whether the amount of sub routes is not exceeded
>      - and/or checking whether the sub-prefix length is of minimum size
>      (especially import for IPv6)
>      - yes: adjust routing table, insert more specific route
>      (with/without confirm probably should be modeld in tamarin)
> 
> What are your thoughts about an extension of wireguard with this?
> 
> If there are other suggestions to allow users to decide themselves how
> to split a range, let's say a /48 IPv6 network, without setting up their
> own redistribution node, I'd also be interested in hearing that.

-- 
With respect,
Roman
