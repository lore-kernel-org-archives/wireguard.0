Return-Path: <SRS0=byLw=NS=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F2DDC432BE
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 27 Aug 2021 16:14:21 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4306860ED5
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 27 Aug 2021 16:14:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 4306860ED5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=romanrm.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a95f5f5f;
	Fri, 27 Aug 2021 16:14:18 +0000 (UTC)
Received: from rin.romanrm.net (rin.romanrm.net [2001:bc8:2dd2:1000::1])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f78785dc
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 27 Aug 2021 16:14:14 +0000 (UTC)
Received: from natsu (natsu2.home.romanrm.net [IPv6:fd39::e99e:8f1b:cfc9:ccb8])
 by rin.romanrm.net (Postfix) with SMTP id A76985F9;
 Fri, 27 Aug 2021 16:14:12 +0000 (UTC)
Date: Fri, 27 Aug 2021 21:14:12 +0500
From: Roman Mamedov <rm@romanrm.net>
To: Daniel <tech@tootai.net>
Cc: wireguard@lists.zx2c4.com
Subject: Re: ipv6 connexion fail - ipv4 OK
Message-ID: <20210827211412.3ed5f170@natsu>
In-Reply-To: <e4b50341-6f90-92fe-7728-a518768a1b51@tootai.net>
References: <ec8fe61d-06a9-9544-ab2c-3dfc26905d74@tootai.net>
 <e4b50341-6f90-92fe-7728-a518768a1b51@tootai.net>
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

On Thu, 26 Aug 2021 13:14:00 +0200
Daniel <tech@tootai.net> wrote:

> Correction
>=20
> Le 25/08/2021 =C3=A0 17:25, Daniel a =C3=A9crit=C2=A0:
> > Hi list,
> >=20
> > I setup wireguard on a server running Debian 11 and get it to work with=
=20
> > 2 clients (Debian 11 and Ubuntu 20.04). Clients and server are on=20
> > separate networks, one client behind a FW the other direct on Internet,=
=20
> > no FW at all (VPS).
> >=20
> > With this setup and ipv4 connection to the public IP of the server,=20
> > everything is working as expected, ipv4 as well as ipv6 are passing=20
> > smoothly.
> >=20
> > Now I want to connect using the ipv6 address of the wg interface as bot=
h=20
> > clients and server have ULA ipv6.
>=20
> Here is GUA to read.
>=20
> > This fail, wg show that connection is=20
> > established but VPN is not usable. It's not a FW problem as I can ssh t=
o=20
> > the ipv6 address, as well as a netcat test from/to server IP -from each=
=20
> > client- on an UDP port is working properly. Also,=20
> > net.ipv6.conf.all.forwarding=3D1 is activated in sysctl.conf
> >=20
> > All network stuff is done in /etc/network/interfaces which call the=20
> > config file. The ipv6 address of the server is affected _to the=20
> > wireguard interface_ (in ipv4 it's another interface who take care of=20
> > the public address)
> >=20
> > Server version is wireguard-tools v1.0.20210223.
> >=20
> > If someone have any hint, thanks to share ;)
>=20

IPv6 requires the in-WG MTU to be 20 bytes less than when running over IPv4.
Try reducing it accordingly.

--=20
With respect,
Roman
