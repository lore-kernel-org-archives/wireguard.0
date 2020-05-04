Return-Path: <SRS0=IpBN=6S=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA9C6C47257
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  4 May 2020 13:33:52 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 869872073B
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  4 May 2020 13:33:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=yahoo.ca header.i=@yahoo.ca header.b="AF24Zl/C"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 869872073B
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=yahoo.ca
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b4053f16;
	Mon, 4 May 2020 13:21:25 +0000 (UTC)
Received: from sonic309-20.consmr.mail.gq1.yahoo.com
 (sonic309-20.consmr.mail.gq1.yahoo.com [98.137.65.146])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 84314df8
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 4 May 2020 13:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.ca; s=s2048;
 t=1588599226; bh=dM3o8yaHSuNUP04KmQnsMX3Fx/fbxtunWCPaGN/enT4=;
 h=Date:From:Subject:To:References:In-Reply-To:From:Subject;
 b=AF24Zl/Cii56uxKumhf09xzmi6RgJsmV3FDXc+XOBS9DWOrwUvyKvfC11XGC6gQlQ0nRDyN996wSQ3olmmWLdyCb1bGb+KNaHJ5skNDeJsKUHZ8HSh8gfCjMWsCKCP5+xfbs2geCHXO+x/qvnYmW5CD5k0V0NzP1WgyP96hcbDbpt6w4xwP5iwcThDL5iDiL9tXOwmuVgZ+u1EXvkyVlzEuTA9YoCmSweWdSOY1sTNhIWW4KPAweSaRJ/Vfrnq2hb9YzXyXaVdfJuOGN6jLlpNtvPQ+Qo0qxwr2ngY7y7a1P7mkGDdw06Cxy67bSceHi3VagtDE0O4GNRVi+idWl8A==
X-YMail-OSG: WdYJFFQVM1l0snbz2K.3w2jQSAGsaZEA3M3rRVsFVPEqut26UAgmCrbLQr.81aP
 E91ttQx4bd5_hFEirJSrIzdCz9.mrYsf8wHk24yPU0V2XmlZfwYcd6C0aaXVje1SzSzIJVDFcosT
 MnA2lM1tTUZU8h7IaN7rWCdssB1isU1OHqrWVwskqFrZYibz2MZqNDBIKWVfOW6aaeNoDTepPK2I
 hTPU3C2nDu6aLFf1IkLkGRP30D.ZWhXMhYUHT8DUak1SzZnTSr.cT.qoKuFfq_A6Mosxg0T949D4
 W7Jv51KZefwqtCRMIAlwrq6aTicuSmwd8U1Cstn80FNQJTkoiEg_2BxJBezZcN4oZGTvbNZuzYEs
 AdDYyLVWRczr0NCmpZT3NMlOu3E3R8Mkm0h4yD8q4MeUnD4_pqQh83.Qwt2Ob7XbqeUBOuwrofUb
 MuwEAAPYxOB8Cn6gyycbKtbPne2eVQ4muK12YcgYP78EqbhA3TAyxAQWOTLPD30jmFlljoDjSt5Z
 fygmJgEb9S0Q6__JpmMmI1BxicSwn54Hl2QvlnbMckhto5o1badsRlP6sp759FmQdi5lVmGJx5BJ
 OomenGXhAeruaD8OycoyvTfu7iJqEN4qgpTF_3hMEYaafhxOtyh6oQZdQU1UM.3Gtpy_Ltv5qMfz
 .XDO2rJ6EIoxodzw06F2RWvsjD62IIYLzfuO7dWk5NywPme5PpIK5KmWNWovHeWnSIekOynHLANJ
 irFztEz55ZDQ7mFIX3_YiBplzZAQG3NqAv.w08r1UXeZsrGgnClrBPQGXX17fBwpSq1IFHoB1JtY
 GvX7WPipb1VXdyqDvj679msJjlhwKdOpK6YrN51QMfbB.LjgNEyR0bvT.lyIRGx2jD8NktssInVS
 2KH.uyGde0ShZr1QH.8CngWI34.gxw6yDRdx2rtV.pfkLNhNE0p_TYUXFRL_xKsS9kpzALG8SGZi
 xNw_iNdGVseZnk6bGGKyev7nRTSRcGSgkYXyvS7nBA7EqX7_QSeNxCbYJw7_5JIPEObjmwmpZtZ_
 yGHrRAnQRC.3yErPKYAvdwvzv0iokPVET5GkaN.SuNg9qYZUDkcpSrmACOiRy.1J_U9GQ81KHPIH
 Ik2gCfa4a9tdht.zYYCib5bpdpBI4xvG1BVhpun3AcIEsf6fbNldrNQ.OQ7EWITYxOBY9BqSGWoy
 qGSAaP0KKR_8Y8ariMEFhUFHTichyGugLvckCnqSn2hvUZIFuSTh2wuLf8w1LZCnBTX1iOMvFHfd
 RK8OWg.ZoCmHw9IjEYnyFXBYo_QancnYkZQ_zdMQ5wbGHfApi66gk.UA1HVqHoKE_Nv42bIvvmcT
 NFYJlVLuy4lQx4Bgf1KmtnWyfYR8lhmP.ELhwXyTag4vFMQTNHpuZJOuR5tqrGu94OadCT9Q.3GZ
 bNUaUImDdoHXuO6UxN20Fv2lgn6OQvYuo..bFnyU-
Received: from sonic.gate.mail.ne1.yahoo.com by
 sonic309.consmr.mail.gq1.yahoo.com with HTTP; Mon, 4 May 2020 13:33:46 +0000
Received: by smtp428.mail.ne1.yahoo.com (VZM Hermes SMTP Server) with ESMTPA
 ID cedfb84edc2388cd1f9c471704e375a0; 
 Mon, 04 May 2020 13:33:41 +0000 (UTC)
Date: Mon, 04 May 2020 09:33:38 -0400
From: "Alex Xu (Hello71)" <alex_y_xu@yahoo.ca>
Subject: Re: Newbie - WireGuard per systemd on Debian Buster
To: Hans Kraus <hans@hanswkraus.com>, wireguard@lists.zx2c4.com
References: <cf665c35-adf9-6f74-b360-1c3cfd723963@hanswkraus.com>
In-Reply-To: <cf665c35-adf9-6f74-b360-1c3cfd723963@hanswkraus.com>
MIME-Version: 1.0
Message-Id: <1588599175.18qb4zf4yk.none@localhost>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: WebService/1.1.15756 hermes Apache-HttpAsyncClient/4.1.4
 (Java/11.0.6)
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

Excerpts from Hans Kraus's message of April 16, 2020 12:23 pm:
> I'm a newbie to wireguard and trying to install a working environment,
> starting with one server and one client. First I used the example in
> <https://github.com/pirate/wireguard-docs/tree/master/example-simple-clie=
nt-to-server>
> and got it working.
>=20
> To get a more persistent installation I followed the example in
> <https://wiki.debian.org/Wireguard>, with one server and one client,
> "Step 2 - Alternative C - systemd". My server has a fixed ip4 address,
> my client(s) get their addresses via DHCP (home network and road
> warrior). My two "/etc/systemd/network" files on my server are:
>=20
> /etc/systemd/network/wg0.netdev
> ---------------------------------------------
> [NetDev]
> Name=3Dwg0
> Kind=3Dwireguard
> Description=3DWireguard kraush
>=20
> [WireGuard]
> PrivateKey=3D<private key server>
> ListenPort=3D#####
>=20
> [WireGuardPeer]
> PublicKey=3D<public key client>
> AllowedIPs=3D<free range>.0/24
> ---------------------------------------------
>=20
> /etc/systemd/network/wg0.network
> ---------------------------------------------
> [Match]
> Name=3Dwg0
>=20
> [Network]
> Address=3D<free range>.1/24
> ---------------------------------------------
> I omitted the "Endpoint=3D<remote IP or hostname>:<remote port>" part
> because I don't know (at least at server startup) the IP address of my
> client(s).
>=20
> That doesn't work. wg0 is up, ip addr show shows an address bound to the
> interface. But it seems that the server doesn't recognize the peer
> because "wg show wg0 peers" gives an empty list back.
>=20
> Any help appreciated,
> Hans
>=20
> --=20
> Diese E-Mail wurde von Avast Antivirus-Software auf Viren gepr=C3=BCft.
> https://www.avast.com/antivirus
>=20
>=20

It could be that your public key is in the wrong format. Check journal=20
to see if systemd-networkd outputs any information.
