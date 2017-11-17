Return-Path: aaronmdjones@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 76685d6a
 for <wireguard@lists.zx2c4.com>;
 Fri, 17 Nov 2017 21:24:52 +0000 (UTC)
Received: from mail-wr0-f182.google.com (mail-wr0-f182.google.com
 [209.85.128.182])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ebcd43d7
 for <wireguard@lists.zx2c4.com>;
 Fri, 17 Nov 2017 21:24:52 +0000 (UTC)
Received: by mail-wr0-f182.google.com with SMTP id z14so3211448wrb.8
 for <wireguard@lists.zx2c4.com>; Fri, 17 Nov 2017 13:29:24 -0800 (PST)
Return-Path: <aaronmdjones@gmail.com>
Subject: Re: Roaming Mischief
To: Markus Woschank <markus.woschank@gmail.com>
References: <CAHmME9pW_0o8C+ovxgN3_-6csAa2sjF4hXo=24bhsi0jo=AP0Q@mail.gmail.com>
 <CAKUy5axhFKvgeGY1FrP5S4UON2QPV=7jQjZM268qG-M3RCAcVw@mail.gmail.com>
 <593d6d3a-550e-a14d-4c1d-f7ee8e731d87@gmail.com>
 <CAKUy5axo5jO=6qv1XEsHvOUkcm6z7r4UW1hV+Oeomq_dJqQXJg@mail.gmail.com>
 <cdf48a39-3d81-5269-dbb4-93929cdf081f@gmail.com>
 <CAKUy5ayo2jWAaA-D2UmtO6q4YUe-KP4u1+3VF32-kvbHbjZLsA@mail.gmail.com>
From: Aaron Jones <aaronmdjones@gmail.com>
Message-ID: <630c9955-ae3a-bf10-02ae-e5aa7eee6e64@gmail.com>
Date: Fri, 17 Nov 2017 21:29:21 +0000
MIME-Version: 1.0
In-Reply-To: <CAKUy5ayo2jWAaA-D2UmtO6q4YUe-KP4u1+3VF32-kvbHbjZLsA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

On 17/11/17 18:46, Markus Woschank wrote:
> Am I missing something here?

My example is most useful when both endpoints are roaming and either
endpoint needs to be able to initiate sessions. It's not a very
common scenario I'll give you that, but the current full roaming
support does enable it seamlessly (when you also enable keep-alives).

- -- 
Aaron Jones

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQIcBAEBCAAGBQJaD1SvAAoJEIrwc3SIqzASeGEP/jM0ibvZPNF3LDXnRTVlsSQW
CCG4cAFmTkemV3MHoOjTIyzmpXHVSEJVqoJCPPqjeMkQp7tENJyUuuHt4JMu0ZSb
RW/mUr6DHtl1QvIeT0u/zb88NX36NyR0KalUE6R3yA5LHlUjqx1OVVpq+sEQMT9p
iRUAusn2psJGQAyu+QW9faU+4HQdbv2d8khLdZqC/0g+YxG24/B+3xVJYtv4Ou9Z
1M8MRWggiSyEOx/LoifxVYRlW0d8mgJV75e921bV9NkGFLATQ6tFvbaJn9ZP98iP
uGBP0XIT2NUb6HuekxJaTud7wsoTNiX1g57UdQtrgH0rTIjBzqlRG3atBgxCJ682
dpN1vvuAaiQrXoieHTek/d9pMAa8xwhc2uNQ36pi3xHrEFveqMIhQv95Qh0cwcpL
PoqciZyVDNrFdDkDajdhKMOhcH6qs2uWP8vYPkxZRaN5INU1kMZbIuBsBefr/yzl
4FqKuYRBHrKHZmrltLo0ek5B0Ib9oACE1HnTy4SyvonVOQwy6bKEQLw5D3/P+u1T
cX5bk0PWyVDLrc9zegxsl68tNjw9QYyxSV3rjleTUZatXu4CYGA9EgtkAICQ8TU0
Y0Gy325nAoKP/jXZWxUlXx75uU86ul12HoqrNgVYBcAYokDTz8U9qReBUCCGhqAP
neeE8d6rJBN9ZRWsBQzz
=BDlR
-----END PGP SIGNATURE-----
