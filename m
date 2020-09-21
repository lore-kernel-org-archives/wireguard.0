Return-Path: <SRS0=UBEJ=C6=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1FCBC43463
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 21 Sep 2020 11:18:34 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E1A0B207BC
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 21 Sep 2020 11:18:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E1A0B207BC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dev.xod.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c0441877;
	Mon, 21 Sep 2020 10:47:33 +0000 (UTC)
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a21e8d07
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 21 Sep 2020 10:47:31 +0000 (UTC)
Received: from KZ3 ([77.21.160.93]) by mrelayeu.kundenserver.de (mreue012
 [213.165.67.97]) with ESMTPSA (Nemesis) id 1Mtxxk-1kakBi3Llk-00uHB0; Mon, 21
 Sep 2020 13:17:54 +0200
From: "Florian Werner" <florian.werner@dev.xod.de>
To: "'Derrick Lyndon Pallas'" <derrick@pallas.us>,
 "'WireGuard mailing list'" <wireguard@lists.zx2c4.com>
References: <9b4ba85a-633a-04ed-ca15-eb29d476cd57@pallas.us>
In-Reply-To: <9b4ba85a-633a-04ed-ca15-eb29d476cd57@pallas.us>
Subject: AW: Interest in adding multicast support to Wireguard?
Date: Mon, 21 Sep 2020 13:17:49 +0200
Message-ID: <000401d69008$dae4bc90$90ae35b0$@dev.xod.de>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Microsoft Outlook 14.0
Content-Language: de
Thread-Index: AQHSjJpzpj6O91mL1joiIEBSz5HTA6l69jlw
X-Provags-ID: V03:K1:+Fsl8BCAbFdUqWPh+6jHaZSlalLOKCS91mhM/o6tcqkzd4f1HCr
 83KzDcO9wZm4XdlgLbfvI6b5WTOYqCbaoQIs6tiv86nskw1IpRridR8/OU2CttACrUv53fB
 Dj+2owUzPE6ydDeqIy7MfD2IgbxtBYa3oxCBanTG9KbSYdv1VvxyetrkN/lkWRxUUu8JoQD
 1NX/2PMjHhM2NObGM2kMA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:iXcONO5/N6M=:WDrbC4p+k3Yy8uOkd0xlKM
 2Ia1eoDqf39i1cLtM5RcgSj/r1GKTrhnK9awxG3olBsBzvtfbN7ik19Uiq2Krt2QhK1uqlNIk
 2gDeRcifJjrJCf23YWOZiB4I6alL00+2vn6vMMy0doksRy5CwYhQ0/yo/iqKXPy/c1+XwlgD5
 +cJxrLpwrAh/gmzGv5hWctqwrPMIdPcwEPPb07ShQlZYSjAEM9WFfswom5GM8NYvSZNXGLmOY
 zmqd3peKOSvTdrctDY3ChV2HlUuEuDPBusbcUZLnS1QneUZY5hwkM7fFhEiWVLidbpljy4hIE
 8M4Wo/7NDKURbfDt6QT8694nH747NboueEj984uCB08JDdSBNKmdFu3ls5/cl41Kbt9eFa7wH
 y1vd/b9hnd9Hl9Lo0KnnXeztcJjqOR274A3s8rLRQDeSSZnC2ilOYl0NQznMNtGMuoxcCjQJB
 IN3KggAakgY0HBhW6yOe2ypoq8kA+9aRYMkLbjR57iHgwlYLFGjapSKpNT06lC55Y7k1oy9/X
 wkaQyJNgC5gcqqy/rzAHxRjgCVc1iYN+KKZcmBEX1R1BfBLsG8Yk9WgP3cc5kw5Wm8PN2vc0h
 6Nz7AjCAe8Bda68tGE0T+ocaTQvn/XDjmedC0DfGNdhYoBiUFMZGTert3RN/6yTfQXFRjoFhs
 Bz+qKyTKfStj3Pb+FLn5gU3rQ6spD9yQDbAstY6uXScUessnQx5WG58g/VR6TgvKZy8DTNdEP
 INj8vCF6k07yyXoQGng71bD99OgUhZQ8McC9hh9Wgm0NUW+zt9Pfmdgv+ZbjfwNoWadiSV43N
 f9gr/fNDErBFwrHZM4S/1Nwa4A5qWV1WMsoTRb1ftmAT4umPebaWSl2Q2tsXkADGQKyiV50x4
 qBmbROZ/YN9WMF2x/qOw==
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

I would appreciate multicast support for Wireguard. My wish and use-case =
would be full support for in band dynamic address assignment, i.e. =
without any external protocol or other shared information except the =
public key.

At least for the IPv6 case (with I only consider here, but IPv4 can be =
added too), link-local scope multicast (FF02::/64) and the unspecified =
address (::) are enough to bootstrap any address assignment and to =
enable learning of self-assigned addresses (e.g. FE80::/64) of peers and =
eventually dynamic assignment (and learning) of global unicast =
addresses. This could all be accomplished only by standard protocols =
(IPv6 Neighbor Discovery, SLAAC, DHCPv6). The only modification would be =
for Wireguard to (optionally) send all packages with a multicast =
destination address to all peers and for Wireguard to receive packages =
with a (all or only some) multicast destination address from any peer. =
(if someone wants a detailed explanation of this, just ask)

There are multiple ways to implement multicast addresses:
(1) always make FF00::/8 and 224.0.0.0/4 special: send it to all peers =
and receive it from all
(2) like (1) but opt in for multicast per Wireguard interface
(3) like (1) but opt in for multicast per peer
(4) make FF00::/8 and 224.0.0.0/4 special, but only send/receive them if =
listed in AllowedIPs
(5) like (4) but allow smaller subnets (e.g. FF02::/64)
(6) make FF00::/8 and 224.0.0.0/4 special and allow for fine grained =
filtering for sending and receiving, i.e. AllowedIPs but separate =
between send and receive.

Regards,
Florian=20

> I know this has come up a few times before, but if there was =
resolution,
> I couldn't find it.
>=20
> I am trying to set up a hub-and-spoke network with many clients
> connected to a single concentrator. One application I need to support
> relies on mDNS. Because Wireguard does not allow overlapping ranges =
(for
> understandable reasons), this works on point-to-point links with two
> peers but not on hub-and-spoke or other multi-peer setups. This would =
be
> possible if every peer had its own hub interface, but that seems like =
an
> inelegant, error-prone workaround.
>=20
> Some have suggested running vxlan or another encapsulation method on =
top
> of Wireguard, but that's not possible in this situation because I do =
not
> control the software running on the peers. Typically, they'll just be
> running the official Wireguard apps for MacOS or Windows.
>=20
> Hacking Wireguard to understand the multicast range and to
> clone-and-forward this traffic to all peers does work. If there is =
wider
> interest in that specific feature, I'm happy to work what I have into
> something that could be upstreamed. Currently the range is global and
> hard-coded, but I could imagine wanting fine-grained control over =
which
> peers were interested in specific multicast addresses, e.g., for a
> user-space daemon managing IGMP subscriptions. However, before I spent
> time on any of the above, I wanted to gauge whether there was interest
> and whether that kind of feature might be accepted at all.
>=20
> Thanks, ~Derrick
>=20


