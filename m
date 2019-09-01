Return-Path: <SRS0=Lcmb=XB=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69BB9C43331
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  6 Sep 2019 19:06:15 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B54942081B
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  6 Sep 2019 19:06:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=ungleich.ch header.i=@ungleich.ch header.b="M2d/RQVk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B54942081B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ungleich.ch
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 800d9319;
	Fri, 6 Sep 2019 19:06:13 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 633cb8cb
 for <wireguard@lists.zx2c4.com>; Sun, 1 Sep 2019 13:36:03 +0000 (UTC)
Received: from smtp.ungleich.ch (smtp.ungleich.ch
 [IPv6:2a0a:e5c0:0:2:400:b3ff:fe39:7956])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2a2fec8e
 for <wireguard@lists.zx2c4.com>; Sun, 1 Sep 2019 13:36:03 +0000 (UTC)
Received: from nico.schottelius.org (localhost [IPv6:::1])
 by smtp.ungleich.ch (Postfix) with ESMTP id 6BA2D1FFEF;
 Sun,  1 Sep 2019 15:36:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ungleich.ch; s=mail;
 t=1567344961; bh=+yl3k+hqsGOJ9EaFKbSmlE2u5fNO8lLPiBKgxSC2omU=;
 h=From:To:Subject:Date:From;
 b=M2d/RQVksZgVGiz6tOMkCX/LFwJSoaTy4nn+T7FEikzJoRg2j0hzP+grD1h84h69C
 x0bnZzwhkAA+DO2mrAsiFnb4UpmLobT85T3CPMKaaInacfMqlqzI13JkA5Nz+lDiu1
 fq3TfJXfFArIp9gADgreZ9ooAFlGG+tCbZLN7VHc=
Received: by nico.schottelius.org (Postfix, from userid 1000)
 id 69AD61A01027; Sun,  1 Sep 2019 15:26:03 +0200 (CEST)
User-agent: mu4e 1.0; emacs 26.1
From: Nico Schottelius <nico.schottelius@ungleich.ch>
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: IPv6 VPN: Routing issue with macos client
Date: Sun, 01 Sep 2019 15:26:03 +0200
Message-ID: <877e6sb11w.fsf@line.ungleich.ch>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 06 Sep 2019 21:06:10 +0200
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


Hello,

when using IPv6 only VPNs on macos, IPv4 traffic outside of the local
network stops working. I am using the latest macos client as found in
the app store.

I have seen similar issues with the Android client
before, where DNS resolution will fail with IPv6 only VPNs, because the
regular IPv4 nameservers are not being used or reachable anymore - there
the "fix" was to add IPv6 nameservers to the wireguard configuration.

Is there any way to only send IPv6 traffic through wireguard with macos?

Best,

Nico


# Wireguard on:
--- 185.203.112.17 ping statistics ---
2 packets transmitted, 0 packets received, 100.0% packet loss
lily:.ctt verysanghee$ ping6 -c2 ungleich.ch
PING6(56=40+8+8 bytes) 2a0a:e5c1:113::42 --> 2a0a:e5c0::2:400:b3ff:fe39:795c
16 bytes from 2a0a:e5c0::2:400:b3ff:fe39:795c, icmp_seq=0 hlim=61 time=27.821 ms
16 bytes from 2a0a:e5c0::2:400:b3ff:fe39:795c, icmp_seq=1 hlim=61 time=34.119 ms

--- ungleich.ch ping6 statistics ---
2 packets transmitted, 2 packets received, 0.0% packet loss
round-trip min/avg/max/std-dev = 27.821/30.970/34.119/3.149 ms
lily:.ctt verysanghee$ ping -c2 ungleich.ch
PING ungleich.ch (185.203.112.17): 56 data bytes
ping: sendto: No route to host
ping: sendto: No route to host
Request timeout for icmp_seq 0

--- ungleich.ch ping statistics ---
2 packets transmitted, 0 packets received, 100.0% packet loss

lily:.ctt verysanghee$ traceroute -n 185.203.112.17
traceroute: findsaddr: write: No such process


# Wireguard off
lily:.ctt verysanghee$ ping6 -c2 ungleich.ch
ping6: UDP connect: No route to host
lily:.ctt verysanghee$ ping -c2 ungleich.ch
PING ungleich.ch (185.203.112.17): 56 data bytes
64 bytes from 185.203.112.17: icmp_seq=0 ttl=46 time=36.526 ms
64 bytes from 185.203.112.17: icmp_seq=1 ttl=46 time=25.020 ms

--- ungleich.ch ping statistics ---
2 packets transmitted, 2 packets received, 0.0% packet loss
round-trip min/avg/max/stddev = 25.020/30.773/36.526/5.753 ms
lily:.ctt verysanghee$



--
Your Swiss, Open Source and IPv6 Virtual Machine. Now on www.datacenterlight.ch.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
