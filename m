Return-Path: <SRS0=6BFc=56=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFCE2C2BA19
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 14 Apr 2020 15:17:21 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5113220768
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 14 Apr 2020 15:17:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5113220768
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=romanrm.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0e736425;
	Tue, 14 Apr 2020 15:07:03 +0000 (UTC)
Received: from len.romanrm.net (len.romanrm.net [2001:41d0:1:8b3b::1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 1b6f2638
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 Apr 2020 15:07:01 +0000 (UTC)
Received: from natsu (natsu.40.romanrm.net
 [IPv6:fd39:aa:c499:6515:e99e:8f1b:cfc9:ccb8])
 by len.romanrm.net (Postfix) with SMTP id 43945400BD;
 Tue, 14 Apr 2020 15:16:49 +0000 (UTC)
Date: Tue, 14 Apr 2020 20:16:48 +0500
From: Roman Mamedov <rm@romanrm.net>
To: ajs124 <wireguard@ajs124.de>
Cc: <mike@pmfarmwald.com>, <wireguard@lists.zx2c4.com>
Subject: Re: Is there a way to use wireguard as a non-encrypted VPN?
Message-ID: <20200414201648.0c6eb3ae@natsu>
In-Reply-To: <20200414170241.2d9d5d6d@desk>
References: <9a3401d61035$4d6b5840$e84208c0$@pmfarmwald.com>
 <20200414170241.2d9d5d6d@desk>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
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

On Tue, 14 Apr 2020 17:02:41 +0200
ajs124 <wireguard@ajs124.de> wrote:

> On Sat, 11 Apr 2020 12:13:36 -0700
> <mike@pmfarmwald.com> wrote:
>=20
> > I have some older routers that run OpenWRT just fine, but are a bit slo=
w at
> > Wireguard (3-5 MBytes/s for SMB transfers) and which are too slow for
> > playing HD movies.
> > For these routers/uses I don't care about security, I just want a VPN to
> > tunnel (thru Comcast, and other ISPs that block lots of ports.)
> > If there was a way to use Wiireguard=C2=A0with encryption disabled, I'm=
 pretty
> > sure my performance would be closer to 20-50 MB/s which would be more t=
han
> > adequate.
> > Thanks.
> > Mike Farmwald
> >=20
>=20
> If you're actually just looking for an unencrypted tunnel, there is some =
standardized stuff like GRE[1] or IP in IP[2] out there.
>=20
> The Linux Kernel supports both of those natively and it looks to me like =
OpenWRT should be able to configure at least one of them through its interf=
ace.
>=20
> 1: https://en.wikipedia.org/wiki/Generic_Routing_Encapsulation
> 2: https://en.wikipedia.org/wiki/IP_in_IP

Those both require dedicated IP on both ends of the connection, which is not
always the case on residential ISPs' IPv4 now.

I'd suggest to check out L2TP instead, which doesn't, and can be used witho=
ut
encryption too, that one can work.

Or PPTP as mentioned, but it's more complex (separate signaling and data
protocols) for no good reason and has more issues traversing NATs/firewalls.

--=20
With respect,
Roman
