Return-Path: <SRS0=Udva=H5=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DADD2C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 27 Feb 2021 17:15:15 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84B1F64E83
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 27 Feb 2021 17:15:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 84B1F64E83
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=carmickle.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 03810a56;
	Sat, 27 Feb 2021 17:15:11 +0000 (UTC)
Received: from mail.carmickle.com (mail.carmickle.com
 [2600:3c03::f03c:91ff:fe6e:212c])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2460e5ef
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 27 Feb 2021 17:15:09 +0000 (UTC)
Received: from [192.168.1.66] (pool-72-90-94-67.syrcny.fios.verizon.net
 [72.90.94.67])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.carmickle.com (Postfix) with ESMTPSA id E08047798DFA;
 Sat, 27 Feb 2021 17:15:07 +0000 (UTC)
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.17\))
Subject: Re: Nested Wireguard tunnels not working on Android and Windows
From: Frank Carmickle <frank@carmickle.com>
In-Reply-To: <CAMS0tn2Pq65UAVWqjV6mNd1hGqvUxVhVgmR3s2h+kh=XF8jyKA@mail.gmail.com>
Date: Sat, 27 Feb 2021 12:16:47 -0500
Cc: wireguard@lists.zx2c4.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <E8F8664E-3C8A-45B9-B9B8-1A1E2873289B@carmickle.com>
References: <CAMS0tn2Pq65UAVWqjV6mNd1hGqvUxVhVgmR3s2h+kh=XF8jyKA@mail.gmail.com>
To: i iordanov <iiordanov@gmail.com>
X-Mailer: Apple Mail (2.3445.104.17)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=carmickle.com;
 s=20160808-mail; t=1614446107; bh=q63vs+6MEzu3hRabdyl4Vohu+m6m71Zg3C6zXkzy4/0=;
 h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:Content-Transfer-Encoding:Message-Id:References:To;
 b=k7pVxBzkaxizVUlFoZIKXy0heRRobGCN5ETPywf9GkAyRr9H8Yel/MYpMIAMXSTUz8uKYMs1MKlHTTcxJcKxSo386XmNu9HO2zLmw0CIo4IwPrXjPDcRI3tQnm7GF1IDBhxb94zCEpmraQhfMznmVbJ5UqyLzobjPu9sWVGipk0=
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

Iordan,

It's not totally clear to me how you are trying to achieve this, however =
I'm pretty certain that you want to be creating a second interface that =
routes the traffic to the endpoint reachable inside the other tunnel,=20

You say that it's possible to run a nested configuration on Linux and =
Macos with just a single interface each,. Have you done a packet capture =
to prove that that is in fact what is happening? That doesn't seem like =
how it would act given the design goals.

--FC

On Feb 25, 2021, at 12:48 PM, i iordanov <iiordanov@gmail.com> wrote:
>=20
> Hello!
>=20
> In order to allow traffic to assist devices that cannot reach each
> other directly, I am setting up wireguard tunnels through a server
> with a public IP (40.30.40.30 in the example below).
>=20
> For reasons of privacy, I'd like for the server to not be able to
> decrypt my traffic. As a result, I would like for one encapsulating
> Wireguard tunnel (subnet 10.1.2.0/24) to be peered through the server,
> while a second nested Wireguard tunnel (subnet 10.1.3.0/24) to be
> established through the first tunnel, peered only at the two devices
> (Android and Linux in this case) that need to communicate.
>=20
> An attempt was made to use a single Wireguard interface. Doing it this
> way works between two Linux machines and even between Linux and Mac OS
> X, but does not work between a Pixel 3a XL running Android 11 with the
> GoBackend Wireguard implementation and my Linux laptop. I also tried
> the same config on Windows 10 to no avail.
>=20
> The config on the Android device, obtained with toWgQuickString():
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>    [Interface]
>    Address =3D 10.1.2.5/24, 10.1.3.5/24
>    ListenPort =3D 46847
>    MTU =3D 1200
>    PrivateKey =3D PRIVATE_KEY
>=20
>    [Peer]
>    AllowedIPs =3D 10.1.2.0/24
>    Endpoint =3D 40.30.40.30:10000
>    PersistentKeepalive =3D 3600
>    PublicKey =3D VF5dic+a+6MllssbV+ShVwEBRrX9gr4do2iNylWrPGs=3D
>=20
>    [Peer]
>    AllowedIPs =3D 10.1.3.1/32
>    Endpoint =3D 10.1.2.1:51555
>    PersistentKeepalive =3D 3600
>    PublicKey =3D 0Awdb451Z4+3Gezm7UlbRquC1kcF52r68J9wG1x/zUE=3D
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> The 10.1.2.0/24 subnet is the one that is "visible" to the public
> server. The 10.1.3.0/24 subnet is the one that is private to the two
> devices.
>=20
> The devices can actually reach each other with netcat over UDP at
> 10.1.2.5:46847 and 10.1.2.1:51555 respectively. So the "encapsulating"
> tunnel is working, and iperf3 were used to test it over UDP and TCP
> successfully.
>=20
> The "nested" tunnel does not get established.
>=20
> The following permutations of the above config have the commented =
problems:
>=20
> # Only 10.1.2.0/24 works, 10.1.3.0/24 does not.
>    Address =3D 10.1.2.1/24, 10.1.3.1/24
>=20
> # Only 10.1.2.0/24 works, 10.1.3.0/24 (as expected) does not.
>    Address =3D 10.1.2.1/24
>=20
> # Neither network works
>    Address =3D 10.1.3.1/24, 10.1.2.1/24
>=20
> This looks like a bug that is triggered when multiple addresses are
> assigned to the interface.
>=20
> Any suggestions on what to try are welcome.
>=20
> Thanks!
> iordan
>=20
>=20
> --=20
> The conscious mind has only one thread of execution.

