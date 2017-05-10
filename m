Return-Path: jonathon.fernyhough@york.ac.uk
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e1f60e3d
 for <wireguard@lists.zx2c4.com>;
 Wed, 10 May 2017 07:20:46 +0000 (UTC)
Received: from mail-wr0-f173.google.com (mail-wr0-f173.google.com
 [209.85.128.173])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b3ad811a
 for <wireguard@lists.zx2c4.com>;
 Wed, 10 May 2017 07:20:46 +0000 (UTC)
Received: by mail-wr0-f173.google.com with SMTP id z52so30888900wrc.2
 for <wireguard@lists.zx2c4.com>; Wed, 10 May 2017 00:31:16 -0700 (PDT)
Return-Path: <jonathon.fernyhough@york.ac.uk>
Received: from [144.32.48.210] (pc210.cs.york.ac.uk. [144.32.48.210])
 by smtp.googlemail.com with ESMTPSA id m201sm3112558wmd.15.2017.05.10.00.31.12
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 10 May 2017 00:31:13 -0700 (PDT)
Subject: Re: SSH stuck
To: wireguard@lists.zx2c4.com
References: <20170510003254.2f810c1d@msi.defcon1>
From: Jonathon Fernyhough <jonathon.fernyhough@york.ac.uk>
Message-ID: <196a1f14-d30b-3926-561c-baf3c8c73c58@york.ac.uk>
Date: Wed, 10 May 2017 08:31:12 +0100
MIME-Version: 1.0
In-Reply-To: <20170510003254.2f810c1d@msi.defcon1>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="A5q4AwcrsnrOm592Hu4gaGdhONn9srBLF"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--A5q4AwcrsnrOm592Hu4gaGdhONn9srBLF
Content-Type: multipart/mixed; boundary="IpJNKFAhhGmQUPK1kcd9q1JFGTiWcV59q";
 protected-headers="v1"
From: Jonathon Fernyhough <jonathon.fernyhough@york.ac.uk>
To: wireguard@lists.zx2c4.com
Message-ID: <196a1f14-d30b-3926-561c-baf3c8c73c58@york.ac.uk>
Subject: Re: SSH stuck
References: <20170510003254.2f810c1d@msi.defcon1>
In-Reply-To: <20170510003254.2f810c1d@msi.defcon1>

--IpJNKFAhhGmQUPK1kcd9q1JFGTiWcV59q
Content-Type: text/plain; charset=utf-8
Content-Language: en-GB
Content-Transfer-Encoding: quoted-printable

Hi Jean-Yves,

On 09/05/17 23:32, Bzzzz wrote:
> 1- I solved the LAN being unreachable apart the endpoint and the intern=
et
>    being completely unreachable with an iptables rule:
>    iptables -t nat -I POSTROUTING -s 10.11.12.0/24 -o eth0 -j MASQUERAD=
E
>    is this right? (if not, why?)

I don't think this is Wireguard specific. That rule essentially allows
that machine to act as a NAT gateway, the same as for e.g. an OpenVPN
server.

> 2- When I want to ssh any LAN machine, wireshark only sees 4 packets:
> 	client announce
> 	server ACK
> 	client key negociation
> 	server key negociation
>    and that's all.
>    Is it a limitation (non-TCP packets) or is there another reason for
>    ssh not working as expected? (connecting to any machine http srv wor=
ks
>    perfectly)

SSH over a Wireguard interface works as expected for me. You might have
some luck seeing what's going on with `ssh -v` (and increasing the
verbosity with further `v`s, e.g. `ssh -vvvv`).



Jonathon


--IpJNKFAhhGmQUPK1kcd9q1JFGTiWcV59q--

--A5q4AwcrsnrOm592Hu4gaGdhONn9srBLF
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJZEsHAAAoJEOAwQ4KMP/S7ZNkQAIKXuqhINqNda64w9yul/6oA
DTYU42RRgbBaohtMidH3p8mDGuGeDonyzpOw2URVCu0TXjXtMcT487ELxpSKO9SS
3YZNY/YydPSntMTu+FhJH2/hJXpoj0jm3qoDnZxaLEfQCGVybb9bc1F0oDBS0Mkx
s+p6Y5dfg5bHdigWjHKB2eWM8SeY1kivva4av7TAGPY1tlc/Zrjzs9+xlUmUoTn4
BIPskb6Y7cBZ/fYmX2uQuKGp7+/kRTwuZ03Gl7I7ZXR3XcWZFJ4SMzfDxaTSKVIG
OAIr/MPrfe7sy9nJFRXkafkO8DPwQ2UeDaxCuDvxWqfpZwlLPmU7kZKQ5jdZlur8
+r/ePKC1p73AaBg544mye3JAVeHnylnI0s1PbJbCqyTq1tqTJ6tQGLx4/gNCUSIH
BInquRLpZCx1ZhfORn6I+ydbHY7EuqO+72NPvvx5d2SFwoZObj6QcMDaONg3eElw
nqBXfn8+Y3I04/S5JOhtsX1gqDK8Ropd4Tmo907ZBmpp4Uxm8+EAILTU4YXZPR7N
1JGvIQ3qbeU90GGtiTKgrHQqBWmp7+Y3kqd5GHXtlxDXHsntcnXDMT+v8dMAopdX
vL2hOTjg/9bxYEzslYyV4FaTozGAWR7X/nvpej8WR7jvK9/9MaXN92ctVaQija1e
OPFufrpPNPGgfW13KKqp
=wMhm
-----END PGP SIGNATURE-----

--A5q4AwcrsnrOm592Hu4gaGdhONn9srBLF--
