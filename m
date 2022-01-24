Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2365C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 24 Jan 2022 13:28:26 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 931be6d5;
	Mon, 24 Jan 2022 13:28:24 +0000 (UTC)
Received: from bullseyemail.carmickle.com (bullseyemail.carmickle.com
 [2600:3c03:e000:644:f03c:91ff:feee:b908])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 95f4f0c2
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 24 Jan 2022 13:28:23 +0000 (UTC)
Received: from [IPv6:2600:3c03:e000:3c2::91:66] (unknown
 [IPv6:2600:3c03:e000:3c2::91:66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by bullseyemail.carmickle.com (Postfix) with ESMTPSA id B0F94382B97E;
 Mon, 24 Jan 2022 13:28:21 +0000 (UTC)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.21\))
Subject: Re: apologies if this DNS conditional forwarding query is a daft
 question
From: Frank Carmickle <frank@carmickle.com>
In-Reply-To: <c0520a00-cd2b-db1d-b678-4134593e7206@gmail.com>
Date: Mon, 24 Jan 2022 08:28:20 -0500
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <E8EC188A-7643-4843-8289-473D4ACBCE7E@carmickle.com>
References: <c0520a00-cd2b-db1d-b678-4134593e7206@gmail.com>
To: Simon McNair <simonmcnair@gmail.com>
X-Mailer: Apple Mail (2.3445.104.21)
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

Greetings Simon,

> On Jan 24, 2022, at 4:59 AM, Simon McNair <simonmcnair@gmail.com> =
wrote:
>=20
> Hi,
> Again apologies if this is networking newb question
> I have just spent the weekend laboriously learning about wireguard =
windows and finally powershell & internet connection sharing. My usage =
case is supporting a parents network and/or sharing resources in a small =
site(s) to site(s) network.
> My question is this.  Without buying any extra commodity hardware, or =
installing any more software is it possible to set up conditional DNS =
forwarding per peer for DNS ?  I would like each subnets DNS server (in =
this case isp router) to handle DNS for that subnet.
>=20
> i.e. if the dns request is for a subnet on peer A use DNS server =
192.168.100.254 defined in peer A config
>        if the dns request is made a subnet on peer B use DNS server =
192.168.110.254 defined in peer B config

I'm not totally understanding the topology you are implementing, =
internet sharing and site to site, that usually means that both sites =
have internet service. It does seem as though you can accomplish having =
systems in each subnet use there own DNS by not configuring a DNS =
directive in the wireguard config at all.

HTH,
--FC


>=20
> Similar to this:
> [Interface]
> PrivateKey =3D pkhere
> ListenPort =3D 12345
> Address =3D 10.250.250.4/24
>=20
> [PeerA]
> PublicKey =3D peerpkhere
> AllowedIPs =3D 192.168.100.0/24, 10.250.250.0/24
> Endpoint =3D my.ddnsalias.net:5678
> DNS =3D 192.168.100.254
>=20
> [PeerB]
> PublicKey =3D peerpkhere
> AllowedIPs =3D 192.168.110.0/24, 10.250.250.0/24
> Endpoint =3D my.ddnsalias.net:5678
> DNS =3D 192.168.110.254
>=20
> I know we already have the Interface level DNS option but that would =
fail for peers unless conditional forwarding was configured which isn't =
possible on most home routers.  I know I can fix this with dnsmasq or a =
pihole but that requires another machine on all the time.  I was just =
wondering if anything clever could easily be done within wireguard.  I =
know it's a big ask but it would be appreciated as an enhancement =
request.
>=20
> Likewise, for the windows version of wireguard it would be cool if =
there was an option to enable internet connection sharing on the client. =
 I have done this successfully (I am happy to share the steps if =
required) although it was a huge pita and required dangerousscripts =
enabling which I'm not keen on.
> Thanks again for all the hard work Jason, I love the app, and it is =
running happily on my ER-X and making my life better.
>=20
> Regards
> Simon
>=20

