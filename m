Return-Path: <SRS0=qPON=AZ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4756EC433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 14 Jul 2020 10:11:29 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9101521897
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 14 Jul 2020 10:11:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9101521897
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=emdete.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id df3e040f;
	Tue, 14 Jul 2020 09:49:51 +0000 (UTC)
Received: from emdete.de (emdete.de [46.4.107.251])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 9d6125e0
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 Jul 2020 09:49:48 +0000 (UTC)
Received: from emdete.de (no-rdns.free.clues.ro [185.216.33.117])
 by emdete.de (OpenSMTPD) with ESMTPSA id c3e2fc17
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO); 
 Tue, 14 Jul 2020 10:11:16 +0000 (UTC)
Received: from localhost (emdete.de [local])
 by emdete.de (OpenSMTPD) with ESMTPA id 535bd634;
 Tue, 14 Jul 2020 10:11:14 +0000 (UTC)
Date: Tue, 14 Jul 2020 12:11:14 +0200
From: "M. Dietrich" <mdt@emdete.de>
Subject: Re: two client connections -> crash?
To: wireguard@lindenberg.one, 'WireGuard mailing list'
 <wireguard@lists.zx2c4.com>
References: <08a201d65946$e9c84f90$bd58eeb0$@lindenberg.one>
In-Reply-To: <08a201d65946$e9c84f90$bd58eeb0$@lindenberg.one>
MIME-Version: 1.0
User-Agent: astroid/v0.14-85-g540a5707 (https://github.com/astroidmail/astroid)
Message-Id: <1594720777.ugfhft3s9b.astroid@morple.none>
Content-Type: text/plain; charset=utf-8
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


Quotation from wireguard@lindenberg.one at Juli 13, 2020 20:53:
> I am trying to configure one client system (Ubuntu 18.04.4=20
> LTS (GNU/Linux 5.3.0-62-generic x86_64)) against two=20
> servers. The configuration is very similar:
>=20
> root@Mailcow:/home/joachim# cat /etc/wireguard/wg0-client.conf
> [Interface]
> Address =3D 10.200.200.2/24
> PrivateKey =3D ***
> DNS =3D 8.8.8.8 #10.200.200.1
>=20
> [Peer]
> PublicKey =3D qn6CTz578gbrYpzYkvV2okoqkIFHKye+mRj4i/I8Sz8=3D
> Endpoint =3D fire.lindenberg.one:51820
> AllowedIPs =3D 0.0.0.0/0
> PersistentKeepalive =3D 21
>=20
> root@Mailcow:/home/joachim# cat /etc/wireguard/wg1-client.conf
> [Interface]
> Address =3D 10.200.201.2/24
> PrivateKey =3D ***
> DNS =3D 8.8.8.8 #10.200.200.1
>=20
> [Peer]
> PublicKey =3D QAJANxtuAvdT+HR3fP1I2DXq0Azl0T3jF5s+cW7foSA=3D
> Endpoint =3D nc.lindenberg.one:51820
> AllowedIPs =3D 0.0.0.0/0
> PersistentKeepalive =3D 21
>=20
> Wg-quick up wg0-client ist at system startup. Now=20
> unfortunately when I do wg-quick up wg1-client the network=20
> stack kind of crashes. The command does not terminate, and=20
> connectivity on all interfaces is broken.
> Is this a configuration issue? Should I change ports to be=20
> different? Is there some other issue?

The ports are fine because the IPs are different. You use the=20
same AllowedIPs for both. And they cover the whole network.=20
This cannot work. What is the intention of that config?

> Do I have to define two interfaces or could I have just one=20
> with multiple peers? But how could I then specify which=20
> tunnel to use?

Depends on what you want to achieve. Sure you can use multiple=20
peers for one interface.
