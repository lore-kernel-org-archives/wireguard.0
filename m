Return-Path: guus@tinc-vpn.org
Received: from arianus.sliepen.org (arianus.sliepen.org [92.243.30.131])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4ec7fd46
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 Jul 2016 10:54:00 +0000 (UTC)
Received: from sliepen.org (unknown [10.1.1.1])
 by arianus.sliepen.org (Postfix) with ESMTP id 953F326547
 for <wireguard@lists.zx2c4.com>; Thu, 14 Jul 2016 12:55:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by sliepen.org (Postfix) with ESMTP id 3DB4A22017E
 for <wireguard@lists.zx2c4.com>; Thu, 14 Jul 2016 12:55:00 +0200 (CEST)
Date: Thu, 14 Jul 2016 12:55:00 +0200
From: Guus Sliepen <guus@tinc-vpn.org>
To: wireguard@lists.zx2c4.com
Message-ID: <20160714105500.GT3952@sliepen.org>
References: <CAHmME9piH4WkMpJ3p0rzFmtA=ozkfa-+rGbAH0T2OjQ+5AJkJg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature"; boundary="kK1uqZGE6pgsGNyR"
In-Reply-To: <CAHmME9piH4WkMpJ3p0rzFmtA=ozkfa-+rGbAH0T2OjQ+5AJkJg@mail.gmail.com>
Subject: Re: [WireGuard] NAT-T Keepalives
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--kK1uqZGE6pgsGNyR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Some insights learned from tinc:

On Thu, Jul 07, 2016 at 06:33:11PM +0200, Jason A. Donenfeld wrote:

> a) The persistent keepalive does not need an active session and does
> not need to send any encrypted data. It simply is a UDP packet to the
> endpoint. The payload doesn't matter for the purpose of just keeping
> the NAT mapping alive.

Indeed.

> 1. What should the payload be? Should it be a single fixed byte? Or
> should it be a zero length UDP packet?

A zero-length UDP packet should be fine, although it might upset some
OSes or firewalls.

Another issue that tinc deals with is path MTU discovery. It combines
this with the heartbeat packets. While a zero-length UDP packets is
enough to keep a NAT mapping alive, the actual path between two peers
might change, and that also changes the path MTU. AFAIK WireGuard
doesn't care about this, but in case you (start to) do, you want to send
packets with the discovered MTU and perhaps a slightly bigger one too,
once in a while, to check whether the PMTU changed.

Discovering the PMTU between two peers and enforcing this inside the
tunnel helps prevent fragmentation of the outer UDP packets. This
improves performance and sometimes it's just necessary because there are
firewalls out there that block fragments.

> 2. What is an acceptable minimum interval? Every 5 seconds?
> 3. What is an acceptable maximum interval? 3600 seconds?
> 4. What is a good interval to show in documentation examples that will
> work for most people?

If you want to keep alive a NAT mapping, then experience tells me 10
seconds is something that works for virtually all NAT devices. Once you
start to go over 10 seconds, you will find there are those that will
drop the mappings. There are RFCs which tell you how a NAT device should
behave (RFC 4787 and 7857), but it's hard to find devices that follow
all these requirements. The recommended timeout for NAT devices is 5
minutes. I'm quite sure a 3600 second interval is useless in practice.

--=20
Met vriendelijke groet / with kind regards,
     Guus Sliepen <guus@tinc-vpn.org>

--kK1uqZGE6pgsGNyR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCAAGBQJXh2+DAAoJED9JDeuHHvn65QoQAJJ4VbK0UyzigVCiTR+piACt
GWkvZosxCTSrwXZPAHumF+DtWOajLWr2y+MetZhojTIJy5wGiJ/thdJbMAjvxX0g
UmPuMNAV2WXtVAO3+rwP/Nsr7xCNvzxocIKQ37MYpGuIDkSoidcLYiThIb0bjVFH
lFtBbxWCUs5jef1KKHV0FvlOGuBlfaiuj+16+Ri/HdUUs1nv9q7yGO2EKeIjPT0r
LThSCKExUz3198qZYO6Eb43HpqcoESpoWz6T6RgtxK8S8QI/k5J1/kwG1MlNbnEI
t+ZPnVmRSXANqGrDwAQYt09i5YZi7F7YhxQ54f7WWE0Mtns/cdXLZbfkidNYxDXy
8HU77l5cUFnWH2thEaPa82O43W2xwpwUIniiy6i9Im0h/OqPIlHOEVTediJonvrd
6OjpGNcUuwcs12dRiwJ1vpu8t6n9FHThKRApTcGh+f84QKJXULuZkttqdvJ7IBRJ
fXAd693b0TP8hrE/NQJogw1jr3QSihDb7MOjmbhQbpcTiZSCWy8GZS326UZ/kUxk
2uTNi9S9TCQEolFHngPNbKX75K+XuiotqaEUbQTb+xoYCzc1M1sc54MZmK2YDe+d
1V5EXNS5cbIT3/xv+xPioU5LHpDwsyqERccqV1CN47p06nty/unzMIYYJd4vkqll
ts8sWhFsNkBp1t/c2FTe
=zs/G
-----END PGP SIGNATURE-----

--kK1uqZGE6pgsGNyR--
