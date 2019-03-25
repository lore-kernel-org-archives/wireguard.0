Return-Path: <SRS0=k94t=R4=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9E51C43381
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 25 Mar 2019 12:13:04 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27DC02085A
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 25 Mar 2019 12:13:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27DC02085A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=rfc2549.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9f91e832;
	Mon, 25 Mar 2019 12:11:51 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f1a23765
 for <wireguard@lists.zx2c4.com>;
 Mon, 25 Mar 2019 10:22:21 +0000 (UTC)
Received: from mail.blinkt.de (mail.blinkt.de
 [IPv6:2001:638:502:390:20c:29ff:fee4:80a3])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3229a53c
 for <wireguard@lists.zx2c4.com>;
 Mon, 25 Mar 2019 10:22:21 +0000 (UTC)
Received: from p200300d027105d00c831ebe65ffdbfd5.dip0.t-ipconnect.de
 ([2003:d0:2710:5d00:c831:ebe6:5ffd:bfd5] helo=styx.fritz.box)
 by mail.blinkt.de with esmtpsa (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128)
 (Exim 4.91 (FreeBSD)) (envelope-from <arne@rfc2549.org>)
 id 1h8Ml1-000GGG-Pe; Mon, 25 Mar 2019 11:23:07 +0100
Subject: Re: [Openvpn-devel] [ANNOUNCE] Wintun: Layer 3 TUN Driver for Windows
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>,
 openvpn-devel@lists.sourceforge.net, dev@nmap.org,
 Simon Rozman <simon@rozman.si>
References: <CAHmME9r1VmJLSqrb8vQN3HOqeVX2QLs1-9wPYQL-UwNU6EJNLA@mail.gmail.com>
From: Arne Schwabe <arne@rfc2549.org>
Openpgp: preference=signencrypt
Message-ID: <0fe186bb-7df2-e3c4-cccd-b3b624fbc1bf@rfc2549.org>
Date: Mon, 25 Mar 2019 11:23:06 +0100
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
 Gecko/20100101 Thunderbird/60.5.3
MIME-Version: 1.0
In-Reply-To: <CAHmME9r1VmJLSqrb8vQN3HOqeVX2QLs1-9wPYQL-UwNU6EJNLA@mail.gmail.com>
Content-Language: en-GB
X-Mailman-Approved-At: Mon, 25 Mar 2019 13:11:51 +0100
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

Am 23.03.19 um 02:04 schrieb Jason A. Donenfeld:
> Hi everybody,
> 
> [Cross-posting to WireGuard, OpenVPN, and Nmap/npcap mailing lists.]
> 
> Simon and I are pleased to announce the start of a new project, made
> for WireGuard and for others too: Wintun, a layer 3 TUN driver for
> Windows.

I wish you good luck in this endeavour and welcome the prospect of
having a better tun driver for Windows. We know that our own TAP/TUN
driver is a pain point for us as well and having a better alternative is
something we would definitively like to have/support a more modern driver.

> Wintun is our attempt at making a dumb layer 3 pipe, that doesn't do
> anything fancy, and just shuffles bundles of packets between userspace
> and the kernel driver. It's being used for WireGuard's Windows port.
> We'd like to make it available and easy to use for other projects too
> that need layer 3 userspace tunneling capabilities, like OpenVPN and
> SoftEther. (Also, it may be just a matter of time before somebody
> takes the tiny base of it, sticks the crypto in the kernel, and makes
> WireGuard super fast on Windows.)

If someone does that, it would be nice to have a bit more generic so we
can also push our openvpn keys to the driver. Our AEAD-GCM data format
and Wireshark's data format are reasonable close to use the same code
for it.

The lack of tap is not a big deal for OpenVPN anymore. The world shifted
quite a bit and tap support is not needed that much anymore. Android
does not support it. MacOS client supports tun natively (utun) and tap
requires extra kext. And so on...

> Have we succeeded in accomplishing our goals? Certainly not yet. At
> the present moment [folks reading this in the future: check the date
> of this email], I'd except for Wintun to be slower, buggier, and lower
> quality than anything else out there. But we thought it'd be a good
> idea to release sooner rather than later in order to have some more
> eyeballs on it. It's the kind of codebase that _certainly_ needs some
> cleanup and a thorough security audit. On the plus side, cloc(1) tells
> me that it's only 950 lines. Still, NT programming is hard, and I'm
> pretty certain we've made mistakes and left ugly corners. Consider
> this email a statement of intent rather than an announcement of a
> completed project.

I am afraid our project members are currently busy and cannot really
contribute much to your new shiny driver. We barely have enough time for
OpenVPN itself. But if you have something that is good enough at least
for testing and has a reasonable stable API just an extra mail and I
think we can implement it as alternative to our own driver.

> Details are over on https://www.wintun.net/ where you may also find
> rabbits bringing windows into tunnels. Enjoy!

Frome the site: The source code is provided under the GPL 2.0 and is
available via git:

One detail here. If you have/add a file that defines the API for
external programs, to license it under a freeer license for 3rd party to
include that API file without license worries. Like our tap-windows.h
(https://github.com/OpenVPN/tap-windows6/blob/master/src/tap-windows.h).
This was primarily requested by the Freeswan developer iirc.

Arne
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
