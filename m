Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7322EFA373D
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  1 Nov 2022 09:39:32 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 27014bf8;
	Tue, 1 Nov 2022 09:39:29 +0000 (UTC)
Received: from eu-smtp-delivery-151.mimecast.com
 (eu-smtp-delivery-151.mimecast.com [185.58.86.151])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 26b31da9
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 1 Nov 2022 09:39:26 +0000 (UTC)
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-187-iRoj6YtCMo2VjsB38UYWMQ-1; Tue, 01 Nov 2022 09:39:24 +0000
X-MC-Unique: iRoj6YtCMo2VjsB38UYWMQ-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 1 Nov
 2022 09:39:22 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.042; Tue, 1 Nov 2022 09:39:22 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: "'Jiri Slaby (SUSE)'" <jirislaby@kernel.org>, "Jason@zx2c4.com"
 <Jason@zx2c4.com>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "Martin
 Liska" <mliska@suse.cz>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>, 
 "netdev@vger.kernel.org" <netdev@vger.kernel.org>
Subject: RE: [PATCH] wireguard (gcc13): cast enum limits members to int in
 prints
Thread-Topic: [PATCH] wireguard (gcc13): cast enum limits members to int in
 prints
Thread-Index: AQHY7R5F39fDc134tkipsCBRXoDaea4p0HMQ
Date: Tue, 1 Nov 2022 09:39:22 +0000
Message-ID: <dde406ed000b41d4985599aff0916e2b@AcuMS.aculab.com>
References: <20221031114424.10438-1-jirislaby@kernel.org>
In-Reply-To: <20221031114424.10438-1-jirislaby@kernel.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
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

From: Jiri Slaby (SUSE)
> Sent: 31 October 2022 11:44
>=20
> Since gcc13, each member of an enum has the same type as the enum [1]. An=
d
> that is inherited from its members. Provided "REKEY_AFTER_MESSAGES =3D 1U=
LL
> << 60", the named type is unsigned long.
>=20
> This generates warnings with gcc-13:
>   error: format '%d' expects argument of type 'int', but argument 6 has t=
ype 'long unsigned int'
>=20
> Cast the enum members to int when printing them.
>=20
> Alternatively, we can cast it to ulong (to silence gcc < 12) and use %lu.
> Alternatively, we can move REKEY_AFTER_MESSAGES away from the enum.

I'd suggest moving the 'out of range' value out of the enum.
Otherwise integer promotion to 'long' might happen elsewhere
and the effects might not be desirable.

It is a shame that gcc doesn't force you to add the type
to 'big enums' (or emit a warning) so that the behavioural
change is properly detected.

From reading the gcc bug it seems that C++ has a syntax for that.

=09David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1=
PT, UK
Registration No: 1397386 (Wales)

