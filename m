Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C979C27C53
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 22 Jun 2024 09:25:30 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 102452f4;
	Sat, 22 Jun 2024 09:25:28 +0000 (UTC)
Received: from smtp.ungleich.ch (smtp.ungleich.ch
 [2a0a:e5c0:2:2:0:c8ff:fe68:bf1c])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 1b1a5aa3
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 22 Jun 2024 09:25:26 +0000 (UTC)
Received: from bridge.localdomain (localhost [IPv6:::1])
 by smtp.ungleich.ch (Postfix) with ESMTP id A852C20C9C;
 Sat, 22 Jun 2024 11:25:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ungleich.ch;
 s=202201; t=1719048325;
 bh=G6BU+dN2ambcQOGF9VKTHVK+45kjxxQRs4aCu7EKXFw=;
 h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
 b=ku50jeH0EpwtbBv+DyUEvQl+sDA/deGOceHBoy5pjIXQUWTr280EWxkItTVoPiufM
 N6eDODy+J2PjlvYz8nJmHn++wtCyMMSuGIBbAQgL8URvWQSYJ6+DK8wi5XQuQ402sm
 GiNB7rGNs9t2yM4eV6kRnTD8cIW+SR3c0czyMcZ/IC227u5uaeoV2mZ5DoGcrl8Wio
 vaS0LHF1fcBgh2X6e0ipxdc/qQCzGGuuhSN0Q6ZqckfZ/eFyNPbnUkN4Jb4dzLoNUg
 G0MYJFKAfQPbPSretO+7yd9TIJJ8hUehwDjPzPkYYZovisdqYClloRCGH+cu9pMcmN
 V2zffJZy+Ouow==
Received: by bridge.localdomain (Postfix, from userid 1000)
 id 63F211A6A2B4; Sat, 22 Jun 2024 11:22:28 +0200 (CEST)
From: Nico Schottelius <nico.schottelius@ungleich.ch>
To: Daniel =?utf-8?Q?Gr=C3=B6ber?= <dxld@darkboxed.org>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: Wireguard uses incorrect interface - routing issue
In-Reply-To: <20240621122926.2xzt7ulno5oczqcv@House.clients.dxld.at> ("Daniel
 =?utf-8?Q?Gr=C3=B6ber=22's?= message of "Fri, 21 Jun 2024 14:29:26 +0200")
References: <878qyyim5k.fsf@ungleich.ch> <874j9milmo.fsf@ungleich.ch>
 <20240621122926.2xzt7ulno5oczqcv@House.clients.dxld.at>
Date: Sat, 22 Jun 2024 11:22:28 +0200
Message-ID: <87zfrdgwmj.fsf@ungleich.ch>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="=-=-="
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

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Good morning Daniel,

Daniel Gr=C3=B6ber <dxld@darkboxed.org> writes:
>> wireguard still uses the wrong interface:
>>=20
>> 11:20:13.115154 eth0  Out IP 192.168.1.149.60031 > 194.187.90.23.4000: U=
DP, length 148
>
> I haven't looked at the details yet but this smells like the same route
> caching issue I found a while ago:
> https://lists.zx2c4.com/pipermail/wireguard/2023-July/008111.html
>
> Does up/down'ing the interface make the problem go away? IIRC that will
> re-initialize the udp socket and thus clear the route chache.

Up & down does *not* fix it, however a *reboot* did. I've the feeling
that this is a race condition together with bird running on the
machine. I suspect the following is happening:

- machine starts
- ip rule is used to move traffic into table 42 (part of the container star=
tup)
- table 42 is populated by bird with static routes (part of bird
  startup)

-- at this stage wireguard works

- bird establishes iBGP sessions and receives alternate routes for the
  target in the main routing table
- wireguard restart is triggered and from that moment on wireguard uses
  the route from the main table

-- at this stage wireguard is broken/takes the route from the main table

This is so far a theory, I'll need to verify that, maybe a simple test
script as you suggested makes sense.

> FYI Nico: It may be time to escalate these bugs to the network subsystem
> maintainers on netdev@vger.kernel.org since Jason is not reading this list
> anymore AFAICT.

That is a very good point and I shall do so next week!

> get_maintainer.pl spits out this list of emails to send To:
>
>     Jason A. Donenfeld" <Jason@zx2c4.com>,
>     "David S. Miller" <davem@davemloft.net>,
>     Eric Dumazet <edumazet@google.com>,=20
>     Jakub Kicinski <kuba@kernel.org>,
>     Paolo Abeni <pabeni@redhat.com>,
>     wireguard@lists.zx2c4.com,=20
>     netdev@vger.kernel.org,
>     linux-kernel@vger.kernel.org

Thanks for looking up!

> Do add me to CC as well. Before sending I'd recommend working out an
> ip-netns based reproducer script -- makes it harder to ignore the report =
as
> "ugh, too much work" ;)

Understood and ...


> Let me know if you need help with that,

... would certainly appreciate that.

You are on matrix, too, aren't you?
I'm @nico:ungleich.ch, might be easier for coordination.

Best regards from sunny Glarus,

Nico



--=-=-=
Content-Type: multipart/signed; boundary="==-=-=";
	micalg=pgp-sha512; protocol="application/pgp-signature"

--==-=-=
Content-Type: text/plain
Content-Transfer-Encoding: quoted-printable


=2D-=20
Sustainable and modern Infrastructures by ungleich.ch

--==-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQJRBAEBCgA7FiEEZZsNkehufiT9FWnQxykhoSk/LSQFAmZ2l9QdHG5pY28uc2No
b3R0ZWxpdXNAdW5nbGVpY2guY2gACgkQxykhoSk/LSSjGA/+LS/5svjFMHhmwpAB
pJ/e27Dk7K55DAjk0DvD9K4ItiDk7lTCOEfkxYHagUPVqUmqCZMU4O22jnEHl4pn
BqY/2Nb1qHv/lkCLhKHv2dlGPEB5ubEFTWFwpdRzR0406UtuVwReoOnmyHd6cjBV
YNMF71AKadfNBXgO68CS/QzQDuxY8eeqnlptTgZitbnOoFoaHeXb40gY7FuUbX5f
pr7J40KEFfIzrV/qGMwI0Eyl4Y8HE7B6484aYFCib+Qdkjkd4QSViNdJrmQlayGV
YMbgz4S4IDbiUQdsK1EyFvt0iJYZPtpFpnBx6xAUrYC/ceEA7iowJ1lOGFULCf3z
G40/LRgJXBsHEdROPnquGISy0GSTZ1arzU148d0um4dRnlkfsFCvG1Zq+ynMdglx
YToZJVpwglnCxVD8AZofYO+0tCS1I6CAUUd2AiO8CurZp00sH3uDaY8qUumepiUE
mbRx2ekdXeEcicqcXNhpv45tLpwP32YdU3+t2pgOxij3Q9MJu0LGcGhaFdsaVjj9
yvS+qQ6Ccf0kCy9QOrVfjD8v/hHQmX8XFXfO0wBhrJSkW/dc732O8DWcJ/7YQdiJ
iCl+MD6TNLfO3TPBAmS7KpND7yNU3z4Wy/YAIhPen47Lam9kpOM2xkVvO3y0XHJq
d3G+4PG1ZTIDqlJsdwGY+2ZzzkY=
=Ks5b
-----END PGP SIGNATURE-----
--==-=-=--

--=-=-=--
