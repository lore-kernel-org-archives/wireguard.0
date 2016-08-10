Return-Path: jens@viisauksena.de
Received: from viisauksena.de (v32412.1blu.de [178.254.39.111])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e387e7f8
 for <wireguard@lists.zx2c4.com>;
 Wed, 10 Aug 2016 01:36:13 +0000 (UTC)
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
References: <7a999008-9396-c82d-1764-d658873af7fc@viisauksena.de>
 <CAHmME9rCmhkegmUnS8EBoSmb8BEHo=bv7fxOQNdCwu1CaB+L-A@mail.gmail.com>
 <CCE0C17C-29C4-4E58-A853-590802C58589@viisauksena.de>
 <CAHmME9qqv3kC=6Y_JTO-P++4jpfTjw8qUGtGTQhsdmCujvU4sw@mail.gmail.com>
 <DEB54C8F-1159-48AD-B2A3-CB2B4E05C896@viisauksena.de>
 <CAHmME9oveH4hLUzEjwWnZ8Nj8U63LEuVezgivsxVxgpZKL_PwQ@mail.gmail.com>
 <8eebb32d-b302-5975-726b-874a9ad12a84@viisauksena.de>
 <20160803064853.Horde.ZExiUp0by8SskYUmZW7CFq4@www.vdorst.com>
 <ce094d6d-2314-8bfe-72e1-879b88ec7141@viisauksena.de>
 <20160803201014.Horde.RctXDT7A7Fi6hFbWMcqDmJs@www.vdorst.com>
 <923cdc92-aa01-758a-5741-99a3f6009dc5@viisauksena.de>
 <CAHmME9oNd9o6rzqPU-Lh69E09oWb8_gHApxuD5+asAdQbgAcwA@mail.gmail.com>
 <b1788ba6-edc5-98d9-2f49-8321e6c3e7b1@viisauksena.de>
From: jens <jens@viisauksena.de>
Message-ID: <90a667ed-4f48-a0cc-1e93-472fcc5ef67f@viisauksena.de>
Date: Wed, 10 Aug 2016 03:37:00 +0200
MIME-Version: 1.0
In-Reply-To: <b1788ba6-edc5-98d9-2f49-8321e6c3e7b1@viisauksena.de>
Content-Type: multipart/alternative;
 boundary="------------F04F4078619B3ED3C105AD7F"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Subject: Re: [WireGuard] LEDE / OpenWrt test - on TP-Link841Nv11 - 15MBs and
 crash
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is a multi-part message in MIME format.
--------------F04F4078619B3ED3C105AD7F
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 04.08.2016 13:34, jens wrote:
> [ X  ] I have tried removing "sk_clear_memalloc(sock);" and
> "sk_set_memalloc(sock->sk);" from socket.c, and the problem still
> continued.
> [  ] I have tried removing "sock->sk->sk_sndbuf =3D INT_MAX;" from
> socket.c, and the problem still continued.

we just want to inform you that we want to run some more tests in the
next days, including your suggestions and compare all with fastd (which
we also test), and everything also on a different router - we write to
the list as soon we have some results on this.

Testsetup will stay the same: (see first post for details)
laptop (iperf3) > tp841v11 <- WireGuard -> tp841v11 < laptop (iperf3)

we will test
    fastd,
    default lede Wireguard(20160630),
    latest wireguard(20160808),
    latest wireguard without memalloc(step1) ,
    latest wireguard without sndbuf =3D INT_MAX (step2)

we will also compare the setup to a similar router : TPLink cpe210 ,
with 64MB ram and 8 mb flash with similar cpu (maybe not with all tests
so far)

the ready to use builded packages (Firmware and ipk) are already laying
here http://openfreiburg.de/freifunk/firmware/
if some want to play around with them.

if there are any suggestions and ideas we could/should add, we are happy
to hear from you
(its all about hunting the out of memory issue on heavy udp traffic
through wireguard tunnel)

greetz

--=20
make the world nicer, please use PGP encryption


--------------F04F4078619B3ED3C105AD7F
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    On 04.08.2016 13:34, jens wrote:<br>
    <blockquote
      cite="mid:b1788ba6-edc5-98d9-2f49-8321e6c3e7b1@viisauksena.de"
      type="cite">
      <div>[ X  ] I have tried removing "<span style="font-size:12.8px">sk_clear_memalloc(sock);"
          and "</span><span style="font-size:12.8px">sk_set_memalloc(sock-&gt;sk);"
          from socket.c, and the problem still continued.</span></div>
      <div><span style="font-size:12.8px">[  ] I have tried removing "</span><span
          style="font-size:12.8px">sock-&gt;sk-&gt;sk_sndbuf = INT_MAX;"
          from socket.c, and the problem still continued.</span></div>
    </blockquote>
    <p>we just want to inform you that we want to run some more tests in
      the next days, including your suggestions and compare all with
      fastd (which we also test), and everything also on a different
      router - we write to the list as soon we have some results on
      this.<br>
      <br>
      Testsetup will stay the same: (see first post for details)<br>
      laptop (iperf3) &gt; tp841v11 &lt;- WireGuard -&gt; tp841v11 &lt;
      laptop (iperf3) <br>
    </p>
    <p>
      we will test <br>
          fastd, <br>
          default lede Wireguard(20160630), <br>
          latest wireguard(20160808), <br>
          latest wireguard without memalloc(step1) , <br>
          latest wireguard without sndbuf = INT_MAX (step2)</p>
    <p>
      we will also compare the setup to a similar router : TPLink cpe210
      , with 64MB ram and 8 mb flash with similar cpu (maybe not with
      all tests so far)<br>
    </p>
    <p>the ready to use builded packages (Firmware and ipk) are already
      laying here <a class="moz-txt-link-freetext" href="http://openfreiburg.de/freifunk/firmware/">http://openfreiburg.de/freifunk/firmware/</a> <br>
      if some want to play around with them.<br>
    </p>
    <p>if there are any suggestions and ideas we could/should add, we
      are happy to hear from you<br>
      (its all about hunting the out of memory issue on heavy udp
      traffic through wireguard tunnel)<br>
    </p>
    <p>greetz </p>
    <pre class="moz-signature" cols="72">-- 
make the world nicer, please use PGP encryption</pre>
  </body>
</html>

--------------F04F4078619B3ED3C105AD7F--
