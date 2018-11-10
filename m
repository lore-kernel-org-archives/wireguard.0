Return-Path: <SRS0=kIRS=NV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2F0CC43441
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 10 Nov 2018 17:41:14 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E38020858
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 10 Nov 2018 17:41:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sholland.org header.i=@sholland.org header.b="JlsII5Oj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="LeAkpCrr"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E38020858
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sholland.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 97619382;
	Sat, 10 Nov 2018 17:36:19 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 543883f4
 for <wireguard@lists.zx2c4.com>;
 Sat, 10 Nov 2018 17:36:17 +0000 (UTC)
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 57661daf
 for <wireguard@lists.zx2c4.com>;
 Sat, 10 Nov 2018 17:36:17 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.west.internal (Postfix) with ESMTP id A6C3C9F6;
 Sat, 10 Nov 2018 12:41:08 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Sat, 10 Nov 2018 12:41:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 subject:to:cc:references:from:message-id:date:mime-version
 :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=/
 1CQvdfI6kaSrr6+1kzLowUchbshHb0CGy2P0ab3xng=; b=JlsII5OjEw+twBpfu
 +vfH+fCsJ3Iv8A3BIC60cfWd8PXzww4bhlBahpFw5x97GPkU77IOuujEXDMs0k06
 3jMfyl6VSp8sZ8iZZreV+92jVquKQ+M/cBajGHbUtQdC5nxdfwuhq3MLqlM7k664
 wz6CHsd3S8u7TD92GLMMTlSgipA618WN1M/iYCaqmt9nMUCX5GdcZ7SJvXRPbXXI
 ych8sJU6zMviW+Nt4znGMmNc0fryB70QURK2CbUR1iItYei+GeDh/hvac229DOQT
 LNvvtoN93CYxmhoh2qHbEmsqiKWtuHuqreUAzFDSEk0GwGiRgkC7/e9KARcGAKkU
 /3Z9g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:content-transfer-encoding:content-type
 :date:from:in-reply-to:message-id:mime-version:references
 :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
 :x-sasl-enc; s=fm1; bh=/1CQvdfI6kaSrr6+1kzLowUchbshHb0CGy2P0ab3x
 ng=; b=LeAkpCrrcP/LK6hMu6HJXPQRHtig/gTBMnKY5YFBCvJLb6R0bJ5MhwM/r
 U4nyNqwojAusov1SnIkfijAVuZVgdzeAXk4ubd/HVE3ztNuNzRda6IY9XA9BTi3X
 g0t6rOK+1hdLkF3dexd6//PpNmJZiDp4Zj4qbTP2jyPYu57hx2boWYA9jLEI/Nnd
 viLnG6swSvYzJKH3Czje3BxKGNuTEW36ov9QBKcxFKtFMKA6DNCtfdVB4LuBE3sA
 ksQ2SpSCox25HW/ppgQM8tqxgAmnpHsdFl4GZDc47IK4MArdYQt6oVTibPVpXQvy
 N1IVpxx2XAs43OQEXhw8p2sMe13Xw==
X-ME-Sender: <xms:MxjnW7vJCndUsRezw4gkOriFGzG493MAaduPTjdnt8T5HB7EEF6oZQ>
X-ME-Proxy: <xmx:NBjnW-dJCO28J_wcl6DAmnl5p3Hm7Ubr3RN5xTp5wJX7A2EHkGUlRw>
 <xmx:NBjnW128gB8ICDbsyXETD7OmObueshuevOnv5iOX5dlJfYWHApxBRg>
 <xmx:NBjnW25TAC595LPWDTKPwpTeGbDzUAtsiErOWDTmQJTL563UX-5wXA>
 <xmx:NBjnW0ImqAC0ZrLnvXx0FGfes0QNvYvSDonTbebgPW73czqbooXlkQ>
 <xmx:NBjnWyZOt-QbRY5Q9PWKpKnrlgeYT4Km5jz5_g6xpeNPZv7WDiYd6g>
 <xmx:NBjnWwf80JjAOFCNVxGzYm6OnDFzXRreLohBSC4NLclH7KFdzKPCUw>
Received: from [192.168.50.162]
 (70-135-148-151.lightspeed.stlsmo.sbcglobal.net [70.135.148.151])
 by mail.messagingengine.com (Postfix) with ESMTPA id B0AB2E4430;
 Sat, 10 Nov 2018 12:41:07 -0500 (EST)
Subject: WireGuard and IPv6 Source Address Selection (was: ipv6 tunnels and
 babel's source specific routing)
To: Dave Taht <dave.taht@gmail.com>, =?UTF-8?Q?Dave_T=c3=a4ht?= <dave@taht.net>
References: <87h8grrulr.fsf@taht.net>
 <CAA93jw7UyGfQCL8FhAPo2sCUUZNG==nWcQNRKW-9vqcDoVsWjQ@mail.gmail.com>
From: Samuel Holland <samuel@sholland.org>
Message-ID: <b91ac643-60e5-d2ed-78d9-d0640f1b7f63@sholland.org>
Date: Sat, 10 Nov 2018 11:41:06 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.0
MIME-Version: 1.0
In-Reply-To: <CAA93jw7UyGfQCL8FhAPo2sCUUZNG==nWcQNRKW-9vqcDoVsWjQ@mail.gmail.com>
Content-Language: en-US
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

This isn't quite the same situation you're in (I'm not using a routing daemon),
but I have also had issues with WireGuard and IPv6 source address selection, and
I thought I'd share my solution for the benefit of the list. This might be the
"some better way to deprioritize a given set of ipv6 addrs" you're looking for.

My VPN topology consists of two fixed sites with native IPv6, plus some road
warriors without IPv6. Site A has a DHCPv6 IA-PD subnet we'll call
2605:aaaa:aaaa:aa::/56, and Site B has a DHCPv6 IA-PD subnet we'll call
2600:bbbb:bbbb:bbb::/60. Because Site A was the original site, and it has the
larger prefix, I use a /64 from that subnet ("2605:aaaa:aaaa:aacc::/64") to
connect all of the WireGuard peers in a mesh. So my configuration looks
something like this (ignoring IPv4), where the first IP address given for each
peer is the one assigned (with prefix length 64) to wg0:

    [Peer]
    PublicKey = <Site_A_Router_Key>
    AllowedIPs = 2605:aaaa:aaaa:aacc::10/128, 2605:aaaa:aaaa:aa::/56

    [Peer]
    PublicKey = <Site_B_Router_Key>
    AllowedIPs = 2605:aaaa:aaaa:aacc::20/128, 2600:bbbb:bbbb:bbb::/60

    [Peer]
    PublicKey = <Road_Warrior_1_Key>
    AllowedIPs = 2605:aaaa:aaaa:aacc::81/128

    [Peer]
    PublicKey = <Road_Warrior_2_Key>
    AllowedIPs = 2605:aaaa:aaaa:aacc::82/128

This works great for every machine *except* the router at Site B, which also
happens to be my main workstation. Linux always chooses 2605:aaaa:aaaa:aacc::20
as the source address when sending packets to the Internet, and of course that
gets dropped by my ISP, because they only delegated me 2600:bbbb:bbbb:bbb::/60.

I tried to set `preferred_lft 0` on 2605:aaaa:aaaa:aacc::20, but that caused
other issues (it's been a couple of months so I don't remember the details). The
solution actually turned out to be really simple:

    ip addrlabel add prefix 2605:aaaa:aaaa:aa::/56 label 100

One of the rules for IPv6 source address selection is to prefer source addresses
with the same label as the destination. Normally, the whole publicly routable
IPv6 space is one label (while link-local, loopback, IPv4-mapped, etc. are
unique), but you can create arbitrary labels. Just pick any ID that's not
already in use (`ip addrlabel` shows the list of existing labels).

Having Site A's subnet on its own label does exactly what I want. Traffic to
Site A from the router at Site B always uses its address from wg0, and traffic
*outside* Site A's subnet *never* uses the address from wg0.

Hope this helps,
Samuel

On 11/08/18 20:57, Dave Taht wrote:
> I figured out the first two bits of using source specific routing for
> ipv6 with wireguard...
> 
> The first trick was to watch what wg-quick wanted to do and change it.
> So I setup my vpn client (deep within
> my network) thusly:
> 
> [Interface]
> #Address = 2600:8211:e001:9300::2/60
> ListenPort = 51820
> PrivateKey = neveryoumind
> 
> [Peer]
> PublicKey = notdoingthat
> AllowedIPs = 2600:8211:e001:9300::/60, ::/0
> Endpoint = tun.taht.net:51820
> 
> This tells wireguard to let any ipv6 address through and treat it like
> a default route. We don't really want this but I fix this later.
> 
> The server is setup similarly, but no ::/0 and an address of ::1/60
> 
> Then I changed the default startup to look like this:
> 
> #!/bin/sh
> ip link add wg0 type wireguard
> wg setconf wg0 /etc/wireguard/wg0.conf
> # preferred_lft 0 makes sure you don't use this address for anything
> you don't explicitly bind to
> # Otherwise *because* it is static, with a preferred_lft of forever,
> it gets chosen as
> # a default ipv6 addr over the dynamic ipv6 addresses. I only want the vpn for
> # specific tools...
> ip address add 2600:8211:e001:9300::2/60 dev wg0 preferred_lft 0
> ip link set mtu 1420 dev wg0
> ip link set wg0 up
> ip route add 2600:8211:e001:9300::/60 dev wg0
> # the default line generated by wg-quick inserts a default route for everything
> # which disables my native ipv6 addrs and routing
> # The trick - note the from and the proto
> ip -6 route add ::/0 from 2600:8211:e001:9300::/60 dev wg0 proto 48
> 
> then I setup babeld.conf to have
> 
> redistribute proto 48 allow
> 
> which exports that "from default" to the rest of my network without
> doing a default default route that RA picks up
> 
> I can then do stuff anywhere else on my net (running babel rfc61236bis) , like
> 
> ip address add 2600:8211:e001:9301::1/64 dev whichever preferred_lft 0
> 
> which gives me a valid_lft of forever... and
> 
> this lets me use my native, dynamic, ipv6 ips from comcast in the general case,
> and the vpn tunnel'd ipv6 address ranges only when I explicitly specify it.
> 
> I have no idea if dhcpv6-pd can be configured (with a valid_lft of a
> lot, constantly renewed, and a prefeered of 0) this way or hnetd, or
> if there was some better way
> to deprioritize a given set of ipv6 addrs, but...
> 
> Now that I have a whole /56 I can finally fiddle more with hnetd
> again. This also gives me cheap failover if one of my gws goes down...
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
