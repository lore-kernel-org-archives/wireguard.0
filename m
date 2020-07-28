Return-Path: <SRS0=JBbb=BH=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MIME_QP_LONG_LINE,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC23AC433E1
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 28 Jul 2020 21:13:01 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E9602070A
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 28 Jul 2020 21:13:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=tomcsanyi-net.20150623.gappssmtp.com header.i=@tomcsanyi-net.20150623.gappssmtp.com header.b="0kf7zr8G"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E9602070A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=tomcsanyi.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5cd2a1cb;
	Tue, 28 Jul 2020 20:49:19 +0000 (UTC)
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [2a00:1450:4864:20::530])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 3cf642c4
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Jul 2020 20:49:17 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id n2so15851264edr.5
 for <wireguard@lists.zx2c4.com>; Tue, 28 Jul 2020 14:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tomcsanyi-net.20150623.gappssmtp.com; s=20150623;
 h=content-transfer-encoding:mime-version:subject:from:in-reply-to:cc
 :date:message-id:references:to;
 bh=1LH7aGmVTLm2hIDbn1XPKLtfPtNYSZihGoSxOZJio0E=;
 b=0kf7zr8Gy00MQ51Rt1zYkEzRMFC7+Rxg3OgWbhjYamWFcq5zuS1Rdy8dEw+gNqThc7
 78lrkcbftHsCo7v03vTkYVSRI5qVP6Gn90j2YDYx0DAjQxNC1RKuOPNkzWuBbijD4wmN
 tMnouOCeLXgIr+7QZNN0W6ziMMNFBgFrUaUOEwyt8oNyx3kLbEREqrR6LqojuZtaXU+9
 gp3M8fdVoSiecm0Y1PCsP1EnAV/2QEBU+Um4X/PBR5bYyg4oUK7KWiIVWcY1GiunRdN9
 86cUvNwKCsZeJubfcBRrwwY0gdLjnoCsw18zwwhU9r/kZIOvczCsMFtrMGD+MgBaOR/f
 rQ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:content-transfer-encoding:mime-version:subject
 :from:in-reply-to:cc:date:message-id:references:to;
 bh=1LH7aGmVTLm2hIDbn1XPKLtfPtNYSZihGoSxOZJio0E=;
 b=Er7nOkuVKYCwDCutk3tA7Jn0FQiLK9B6bYgTuiu5Btxaqj50x48ikuwAbIWlU5F6qK
 cdCY/tSXfgvJaMvGZmT9jWZ2jAnSQbd6bDcPi8PJtTSYhj2UCDug+uSYoymEeOgmbqSM
 ARvoW8SZkdCED+IcH0VzLefzMq777DIu1+ghCxb7fs03KLL7uquPWapMPNQADVMB8nWM
 96CVw7sNJfs6ClxrJu6NmzcTF4g7My8FK8A8iPS4qO5nB8igEEDjQRTVECOYIsAsvo1n
 nmGvTHX2R//Z9Pfm7hhTFjWDig4SBTZj/OOA7jPWBeE29i4TGKgDY3oyf1uJjLLmrkEM
 R1dw==
X-Gm-Message-State: AOAM532+d5VYf9nzJMjNNzVhOaSMn5MHp+dYN6Mz9vwFrs86Y9+6GHPz
 JVgPhw2QQiF33ze0MEZ74Q404Q==
X-Google-Smtp-Source: ABdhPJw/dMCR2PT8Gl4wR5mHRJTfeLiak7IVNPV1ZH3IVtTLq/C7cxRxuRjL9D2MnQIQChWgifWxsA==
X-Received: by 2002:a50:fe18:: with SMTP id f24mr27947791edt.14.1595970765705; 
 Tue, 28 Jul 2020 14:12:45 -0700 (PDT)
Received: from [192.168.0.102] (195-38-113-250.pool.digikabel.hu.
 [195.38.113.250])
 by smtp.gmail.com with ESMTPSA id g10sm9826426ejm.120.2020.07.28.14.12.44
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Jul 2020 14:12:44 -0700 (PDT)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (1.0)
Subject: Re: Confused about AllowedIPs meaning?
From: "Tomcsanyi, Domonkos" <domi@tomcsanyi.net>
In-Reply-To: <02830f08-9e6f-a9f1-54c3-43758e95758f@gmail.com>
Cc: wireguard@lists.zx2c4.com
Date: Tue, 28 Jul 2020 23:12:44 +0200
Message-Id: <26A86FD2-5A2D-49DC-A140-2E4B43213936@tomcsanyi.net>
References: <02830f08-9e6f-a9f1-54c3-43758e95758f@gmail.com>
To: Gunnar Niels <gunnar.s.niels@gmail.com>
X-Mailer: iPhone Mail (17F80)
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


> 2020. j=C3=BAl. 28. d=C3=A1tummal, 18:02 id=C5=91pontban Gunnar Niels <gun=
nar.s.niels@gmail.com> =C3=ADrta:
>=20
> =EF=BB=BFHello, I'm new to wireguard and have been experimenting with it i=
n my home lab.
> I'm interesting in using it to join two home networks (192.168.2.0/24 and
> 192.168.4.0/24). They're typical home networks in two physically different=

> locations, each with their own gateways to the internet. I'd like for the
> machines on each network to use their default gateway for internet access,=
 but
> configure things so they use a simple linux machine (raspberry pi) to rout=
e
> to the other subnet over wireguard is the destination is the opposite subn=
et.
>=20
> One wireguard node is exposed via an endpoint with a dns A record (I'm por=
t
> forwarding to the internal machine). On the other subnet, the rpi node is b=
ehind
> NAT and pointed to that endpoint.
>=20
> I have been able to get the wireguard nodes to connect and route machines o=
n
> their opposite networks, but I haven't been able to get non-wireguard node=
s
> to communicate with non-wireguard nodes across the tunnel. I have a few qu=
estions
> I'm trying to clear up:
>=20
> * Is it true that there isn't really a notion of a server/client from wire=
guard's
> perspective, they're really just nodes, and I've applied the semantic desi=
gnation
> of the node behind the endpoint as a server, and the node behind the NAT a=
s the client?
>=20
> * Here's my "server" config on 192.168.2.0/24:
>=20
> =3D=3D=3D
>=20
> [Interface]
> Address =3D 10.2.0.1/24
> ListenPort =3D 34777
> PrivateKey =3D <server_priv_key>
>=20
> [Peer]
> PublicKey =3D <client_pub_key>
> AllowedIPs =3D 10.2.0.2/32
>=20
> =3D=3D=3D
>=20
> Here's my "client" config on 192.168.4.0/24
>=20
> =3D=3D=3D
>=20
> [Interface]
> Address =3D 10.2.0.2/24
> PrivateKey =3D <client_priv_key>
>=20
> [Peer]
> PublicKey =3D <server_pub_key>
> AllowedIPs =3D 0.0.0.0/0
> Endpoint =3D <server_host>:34777
> PersistentKeepalive =3D 15
>=20
> =3D=3D=3D
>=20
>=20
> The simplicity of the wireguard config is one of the best features about i=
t,
> but the only thing I'm unclear about here is: exactly what is the "Allowed=
IPs"
> field configuring? I'm not sure how to configure these fields for my use-c=
ase.
> I'm guessing the server configuration is explicitly whitelisting the clien=
t,
> but I'm not sure what 0.0.0.0/24 on the clientside is saying. It feels lik=
e
> I should have my subnets as part of this field, but I'm not sure where bec=
ause
> I'm not sure exactly what the field represents.
>=20
> If someone could elaborate on it and point me in the right direction given=
 my
> objective, that would be much appreciated!
>=20
> -GN


I think mainly you need to decide whether you want to just route the traffic=
 between the two networks or you want to use NAT as well.
In case you are just routing then you=E2=80=99d need at minimum the range of=
 the other network, because after decrypting the source IP will be from that=
 range. Otoh if you are using NAT you can just use an arbitrary IP address i=
nbetween the two tunnel endpoints, because the traffic will be modified, jus=
t like when you go out to the interner via a router.
Also don=E2=80=99t forget to add the respective routes to either the local d=
efault gw or each host in case you are not using NAT - otherwise you won=E2=80=
=99t get any of the answers.
I hope this helped.

Cheers
Domi=
