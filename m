Return-Path: aaronmdjones@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 44c93db3
 for <wireguard@lists.zx2c4.com>;
 Sun, 12 Aug 2018 00:56:13 +0000 (UTC)
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 011d1c3c
 for <wireguard@lists.zx2c4.com>;
 Sun, 12 Aug 2018 00:56:13 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id h10-v6so11272339wre.6
 for <wireguard@lists.zx2c4.com>; Sat, 11 Aug 2018 18:07:46 -0700 (PDT)
Return-Path: <aaronmdjones@gmail.com>
Subject: Re: Reflections on WireGuard Design Goals
To: Jason@zx2c4.com
References: <mailman.1318.1533866648.2201.wireguard@lists.zx2c4.com>
 <b66a15d1-c4f1-78a5-cf5a-4d2a4ca9ce54@pobox.com>
 <CAHmME9pQJ4-1AGGUd63Nsys2_5tVxecH2rWqVScWdMgNyG_zOA@mail.gmail.com>
 <CAJq09z5GX4QxqhN7j4UC+2cM=fp4FKpZm1gsyREy1f_vhXGzyg@mail.gmail.com>
 <fb5cc651-e249-c5f1-f42c-d46198a8e36b@gmail.com>
 <CAHmME9pfsYbBfxOAOv0GhGe6Xb7HbZH00OVNZ2bFFfAnQUdGNQ@mail.gmail.com>
From: Aaron Jones <aaronmdjones@gmail.com>
Message-ID: <84851251-e5d4-c601-e711-4f07289653c3@gmail.com>
Date: Sun, 12 Aug 2018 01:07:44 +0000
MIME-Version: 1.0
In-Reply-To: <CAHmME9pfsYbBfxOAOv0GhGe6Xb7HbZH00OVNZ2bFFfAnQUdGNQ@mail.gmail.com>
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
Hash: SHA512

On 12/08/18 00:46, Jason A. Donenfeld wrote:
> This is in fact true, but I'm not sure we're planning on following
> suite with that kind of thing in kernel space for WireGuard...

Indeed. :)

-----BEGIN PGP SIGNATURE-----
Comment: Using GnuPG with Thunderbird - https://www.enigmail.net/

iQIzBAEBCgAdFiEEYKVBwe43zZh/jkxPivBzdIirMBIFAltviFMACgkQivBzdIir
MBIolg//Tbt8zZy/nqtY3njasE6n5OXGs/qSP2GZbJSB4Ieyi1TZfJRumJTNfKSM
YLHZmaju+KZO85f6fwj+wqe89swD6WD0mGPKpCwhc+3j403YyT/ggp9uyqSTP78H
D9KEIFnX50mtwnj6cWzY3U9H3V0katWRms0P65U90kJF1Fb91EeAplIZnHlIygwa
m9+lBB8oJ+dXgkNmjaajI23idYV1qFVw8z9TR22lyXjAWsK0evJ1rcpKtuiIn9FX
3eZ+0QBNF5lCDVyWKl8Y04rattFde3jWs9AAzDPP4nv8GJqo9Jpponzy8jXSFxu5
CwvDShMS3ytWIO+zmSskkcZmh7h00puDhLzVRXneTfE7kbIyT31xQsH4sS2LQ4cY
4W3RoIYY7DnJW1IEaUYa3FAVWjW7XNZUUAU0fNcYJHVmqrPtDJYm692OEv8Hou3+
yn2YjaXaQPXPFqztLrExqDQL2RS4evSx0TRgTBp39ya43MDILM+EG3j04G4ibuyV
EeDykMd6KY3h3fVsxhQBE0lryDgS2QHZsr+6ziwFzP8e0Pmy6vU32iNEw1MhEItX
4ffufoanwXO7UKPpcoHCZDOzcxbo7DUDt4EEQpLYSOr4fXqcHfxY6dhT1vetRA0U
rnVnX2/tkrDUKJcUI8d7DV1WJqQQUBWdNLzZXWuYcAE08U74U+I=
=4Yzj
-----END PGP SIGNATURE-----
