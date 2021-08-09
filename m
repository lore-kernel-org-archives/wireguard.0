Return-Path: <SRS0=EM+o=NB=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 218D1C4338F
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Aug 2021 00:24:15 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4384861004
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 10 Aug 2021 00:24:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4384861004
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=slarew.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 91a37b6e;
	Tue, 10 Aug 2021 00:24:12 +0000 (UTC)
Received: from mail.q42a.com (mail.q42a.com [2001:19f0:5:dcf::a:3])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 4b8d2ca8
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 9 Aug 2021 16:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=slarew.net;
 s=149703c5; t=1628525527;
 bh=RIG0a81WNS0YY1dOs7alGp5q07OgTi/N3AxeTJhOre4=;
 h=Mime-Version:From:Message-Id;
 b=JXwLHCLnhMagOIJKIiIE7MHUlP6WJcf+alpOrK5GTDrE6FFk9kNKCAhWyOuZpN16O
 I5658uLDlWOigERaz2mGvoVBEu6+xSW9MR+jbXP+85d9TYThV04amPrsfBoEwlnkUJ
 P6Z7kd8HLC2TCA9WvjGJ1701pVvmE8y5PzeWagiYQWGRBm/gi+dq/b1H7HLFcGSLvB
 jkTZ/inZhfeIIB89ZFg4ZPmpwYr1wi46w3NzWzFQL+z+q0OKVCjqu9bqpocOrDEFkF
 AMCTX+gvyRVUxFQyYeDFQaLyBxHGDPqkmjgIXC5awz2bcEmAGZY21eNVAzKwl2fVRF
 huQbGP4Y50nOA==
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: Mac APP DNS Search Domain
From: Stephen Larew <stephen@slarew.net>
In-Reply-To: <20210717100909.lzi5mwsv5hb57w3w@svensmacbookair.sven.lan>
Date: Mon, 9 Aug 2021 09:12:05 -0700
Cc: wireguard@lists.zx2c4.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <B8A851EA-FF19-4ED3-836A-92A054028935@slarew.net>
References: <20210717100909.lzi5mwsv5hb57w3w@svensmacbookair.sven.lan>
To: Sven Auhagen <sven.auhagen@voleatech.de>
X-Mailer: Apple Mail (2.3654.120.0.1.13)
X-Mailman-Approved-At: Tue, 10 Aug 2021 00:24:11 +0000
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

On Jul 17, 2021, at 03:09, Sven Auhagen <sven.auhagen@voleatech.de> =
wrote:
>=20
> Hi,
>=20
> the DNS search domain in the Wireguard Mac APP does not seem to work =
properly.
> The search domain is added properly and I can see it in the DNS =
configuration
> for the scoped query:
>=20
> resolver #2
> search domain[0] : mytestdomain.com
> nameserver[0] : 192.168.6.1
> if_index : 17 (utun4)
> flags    : Scoped, Request A records
> reach    : 0x00000002 (Reachable)
>=20
> but the global resolver is using a mix of my LAN and Wireguard DNS =
resolver:
>=20
> resolver #1
> search domain[0] : sven.lan
> nameserver[0] : 192.168.6.1
> if_index : 17 (utun4)
> flags    : Supplemental, Request A records
> reach    : 0x00000002 (Reachable)
> order    : 102200
>=20
> I found a discussion on Github about the issue here:
> =
https://github.com/tailscale/tailscale/issues/101#issuecomment-639286398
>=20
> suggesting that the following will fix it:
>=20
> --- a/Sources/WireGuardKit/PacketTunnelSettingsGenerator.swift
> +++ b/Sources/WireGuardKit/PacketTunnelSettingsGenerator.swift
> @@ -88,7 +88,7 @@ class PacketTunnelSettingsGenerator {
>             let dnsSettings =3D NEDNSSettings(servers: =
dnsServerStrings)
>             dnsSettings.searchDomains =3D =
tunnelConfiguration.interface.dnsSearch
>             if !tunnelConfiguration.interface.dns.isEmpty {
> -                dnsSettings.matchDomains =3D [""] // All DNS queries =
must first go through the tunnel's DNS
> +                dnsSettings.matchDomains =3D [""] + =
dnsSettings.searchDomains // All DNS queries must first go through the =
tunnel's DNS
>             }
>             networkSettings.dnsSettings =3D dnsSettings
>         }
>=20
> I do not have an Apple Developer Account so I am not able to compile =
the code and test it.
> Can anyone take a look as this would be a great help.
>=20
> Best
> Sven

Sven,

I have a patch for Wireguard Mac app that enables proper split DNS =
support. It works well in my usage.  I should properly submit the patch =
for review by Wireguard folks.  Until then, you can get the patch here:

=
https://github.com/slarew/wireguard-apple/commit/6ebc356d9e11ab91443e06de5=
e89f1af57fcdff8

> Enable "split DNS" configurations for an interface
>=20
> By adding a tilde prefix to a domain name entry in the DNS=3D line, =
the
> domain is interpreted as a "matching domain" for DNS routing instead =
of
> a "search domain."  This corresponds to setting a non-empty
> NEDNSSettings.matchDomains property for the network tunnel.  Using =
tilde
> as a prefix is borrowed from systemd-resolved's equivalent usage.
>=20
> If one or more match domains are specified, then the specified DNS
> resolvers are only used for those matching domains instead of acting =
as
> the first resolver before the system's primary DNS resolvers.

-Stephen=
