Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FA3BC27C4F
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 13 Jun 2024 14:50:59 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a82e7e67;
	Thu, 13 Jun 2024 14:42:56 +0000 (UTC)
Received: from cynic.org (harbard.cynic.org [75.144.22.203])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2ac17737
 for <wireguard@lists.zx2c4.com>;
 Thu, 13 Jun 2024 14:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cynic.org;
 s=default; t=1718289774;
 bh=ITE/8C4IE1uUJvyVGUp30iUwNA4IjCq7JsjdVVI0/xI=;
 h=Subject:From:Date:To;
 b=UiwdnBUDQRfp/7zepFdcAHM9/Mo3ZyPuTFjpi3xmTySS0f9JSBMkRHMZvMKY1ZPQu
 ybXefKwUhKHD3nsywtLRBdxDnGfeOezO7Cv7HZ5UHUOOTb9402f4l9ypM7B2poeqKS
 PpDOsQdO3s5i4qUNyPfQh5y8e8gWRYLL4u6GwtkpAmlcGeR6whE0Ck9UQFGpCdwN2r
 jL1wQFJkdMV5Z4dYvAlSTZ+TiJjyeTDTf4zmvxtJUikWFKqx/Vn99xsUih1Yqfnj9I
 GjdDNicpWhUXSLmAnAK18v5XPE3r9XBaegZINGodS5l8KX4VS9e4goj8AvBb51PfVv
 78e9PAZHolkVQ==
X-Default-Received-SPF: pass (skip=loggedin (res=PASS)) x-ip-name=10.10.10.100;
 envelope-from=<perry@cynic.org>; 
Received: from smtpclient.apple (unverified [10.10.10.100]) 
 by cynic.org (SurgeMail 7.8b) with ESMTP (TLS) id 10690-1278429 
 for multiple; Thu, 13 Jun 2024 07:42:51 -0700
Content-Type: text/plain;
	charset=utf-8
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3774.500.171.1.1\))
Subject: Re: Wireguard, iPhone, and cruise ships
From: Perry The Cynic <perry@cynic.org>
In-Reply-To: <CAOG=JUJ=TWZicAd1zfa36GwFBh8EU3bgsO5JRJiEhdhQ1VWf+Q@mail.gmail.com>
Date: Thu, 13 Jun 2024 07:42:41 -0700
Cc: wireguard@lists.zx2c4.com
Content-Transfer-Encoding: quoted-printable
Message-Id: <2A8A3A9D-82CD-451B-B693-3FD01CF5861C@cynic.org>
References: <60B826FA-3FCA-40B5-9771-8FFEDA6278AB@cynic.org>
 <CAOG=JUJ=TWZicAd1zfa36GwFBh8EU3bgsO5JRJiEhdhQ1VWf+Q@mail.gmail.com>
To: Amir Omidi <amir@aaomidi.com>
X-Mailer: Apple Mail (2.3774.500.171.1.1)
X-Qnum: 10690
X-Authenticated-User: perry@cynic.org 
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

I=E2=80=99m basically coming to the conclusion that it=E2=80=99s not a =
wg core issue, but it IS an iOS app issue. If iOS won=E2=80=99t support =
a composition that works, then the app needs to. Somehow.

Cheers
  =E2=80=94 perry


> On Jun 13, 2024, at 7:40=E2=80=AFAM, Amir Omidi <amir@aaomidi.com> =
wrote:
>=20
> I think there is "technically" a way to put a VPN on a VPN and that is =
doing one of those VPNs as a configuration profile. I'm not 100% sure =
about this though.
>=20
> I've run into very similar issues to this at various hotels. I've also =
always wished there was something to do HTTP tunneling on Wireguard =
officially to help with these awful network setups. But I also =
understand that's not a core WG issue.
>=20
>=20
> On Thu, Jun 13, 2024 at 2:35=E2=80=AFPM Perry The Cynic =
<perry@cynic.org> wrote:
> Dear wg community,
>=20
> I recently enjoyed a cruise to Alaska. Fun and easy, and with Starlink =
on board, the WiFi connectivity was actually not bad (some sporadic =
packet drops, mostly). Sadly, the cruise company=E2=80=99s network =
unceremoniously drops UDP of most kinds, leading to my Wireguard VPN (to =
my inside network at home) failing entirely. The cruise line is utterly =
immovable on this: =E2=80=9Cit=E2=80=99s someone else=E2=80=99s fault, =
and how dare you want to do this nonstandard thing?=E2=80=9D Yes, I =
actually talked to their onboard IT guy. =E2=80=9CIt=E2=80=99s on the =
network path somewhere, and they don=E2=80=99t even tell me how and =
why."
>=20
> Now I totally understand Wireguard=E2=80=99s attitude towards this: =
It=E2=80=99s not a =E2=80=9Ccore=E2=80=9D wg problem, and should be =
solved on the outside by whatever tools happen to fit the problem. If =
this was a linux-to-linux connection, I=E2=80=99d just pop in my =
favorite TCP-ish tunnel tool and move on. But it=E2=80=99s an iPhone =
(and iPad). And iOS doesn=E2=80=99t seem to like network composability. =
At all. Once you move outside the =E2=80=9Cit=E2=80=99s a VPN =
endpoint=E2=80=9D paradigm, things get stuck very quickly. I realize =
this is all Apple=E2=80=99s fault, and they should allow building =
arbitrary network stacks in iOS. But they don=E2=80=99t (yet). =
NWConnection is getting pretty good, but it requires in-app code =
composition. AFAIK, you can=E2=80=99t stack two iOS VPNs on top of each =
other (right?).
>=20
> So what are the practically available options here? I can set up =
whatever is needed on the server endpoint (it=E2=80=99s Debian), but =
what can I do on my phone to make wg work through an HTTP(s)-shaped =
pinhole? I=E2=80=99d hate to have to ditch wg for some other vpn just =
for that rare case=E2=80=A6 but what=E2=80=99s the answer?
>=20
> And, to prefetch a possible ending of this discussion: if I coded up =
patches to the iOS client that add some tcp-wrapper option, would you =
take it?
>=20
> Cheers
>   =E2=80=94 perry
> =
--------------------------------------------------------------------------=
-
> Perry The Cynic                                             =
perry@cynic.org
> To a blind optimist, an optimistic realist must seem like an Accursed =
Cynic.
> =
--------------------------------------------------------------------------=
-
>=20

