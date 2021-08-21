Return-Path: <SRS0=QM1B=NM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B95DC4338F
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 21 Aug 2021 20:29:10 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C214761212
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 21 Aug 2021 20:29:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C214761212
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=romanrm.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 91e8e033;
	Sat, 21 Aug 2021 20:27:58 +0000 (UTC)
Received: from rin.romanrm.net (rin.romanrm.net [51.158.148.128])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 6749c43f
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 21 Aug 2021 20:27:55 +0000 (UTC)
Received: from natsu (natsu2.home.romanrm.net [IPv6:fd39::e99e:8f1b:cfc9:ccb8])
 by rin.romanrm.net (Postfix) with SMTP id 8A9DF628;
 Sat, 21 Aug 2021 20:27:54 +0000 (UTC)
Date: Sun, 22 Aug 2021 01:27:53 +0500
From: Roman Mamedov <rm@romanrm.net>
To: S Bauer <sanderbauer@gmail.com>
Cc: wireguard@lists.zx2c4.com
Subject: Re: enabling WG0 allows telegram but impedes browsing
Message-ID: <20210822012753.27447e9f@natsu>
In-Reply-To: <CA+MSESn8FSHVmOjHQGsNsQqu89ijP3uGiz3ohE3Lbh6LHM3meA@mail.gmail.com>
References: <CA+MSESn8FSHVmOjHQGsNsQqu89ijP3uGiz3ohE3Lbh6LHM3meA@mail.gmail.com>
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

On Fri, 20 Aug 2021 13:16:34 +0200
S Bauer <sanderbauer@gmail.com> wrote:

> Hello team,
> 
> Hoping you could help me out with a foggy situation.
> The past week I have been struggling to get the Wireguard VPN working
> smoothly. Everything seems to work on paper, except in a specific way
> it doesn't. I am using Pop!_OS 21.04 (Ubuntu Hirsute).
> 
> SitRep;
> I work as a freelance consultant and want to be careful about the
> local networks' peeping tom when accessing sensitive work documents
> from 'out of office', e.g. at a friend's place or at a hotel. So my
> objective is to access my home network via PiHole and then continue
> onward to access my work-related documents on a fileserver.
> I was hoping this could be easily achieved with Wireguard.
> 
> Using the Wireguard VPN wg0 with wg-quick worked perfectly when I
> connected to my brother's phone hotspot (4G). I could access our home
> via VPN as expected and could work on my documents without any
> problems.
> The trouble is that I am now at a different location, working with a
> fixed router from Ziggo NL. For some reason the WG0 still connects
> perfectly, but after that a small mystery occurs. I did not make any
> modifications to WG0.conf, so I remain stumped.
> With WG active, I am no longer able to access any webpage. So no
> access to protonmail\gmail, reddit or anything else. Telegram,
> however, is still working fine. Internal machines on the home's local
> network (IP-camera) can also be accessed directly.
> Disabling the WG gives me full access to any webpage as usual. So
> something is amiss that affects my browser only (Firefox 91.0).

What's your MTU on the wg0 interface? Try reducing that to 1400, or if
that doesn't help, to 1280.

-- 
With respect,
Roman
