Return-Path: jens@viisauksena.de
Received: from viisauksena.de (v32412.1blu.de [178.254.39.111])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4fcc80e2
 for <wireguard@lists.zx2c4.com>; Thu, 4 Aug 2016 11:33:55 +0000 (UTC)
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
From: jens <jens@viisauksena.de>
Message-ID: <b1788ba6-edc5-98d9-2f49-8321e6c3e7b1@viisauksena.de>
Date: Thu, 4 Aug 2016 13:34:08 +0200
MIME-Version: 1.0
In-Reply-To: <CAHmME9oNd9o6rzqPU-Lh69E09oWb8_gHApxuD5+asAdQbgAcwA@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="------------1507EC69EC1AC65E51639CB3"
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
--------------1507EC69EC1AC65E51639CB3
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 04.08.2016 10:15, Jason A. Donenfeld wrote:
> Your prior communications have not been clear to me, and recently
> somebody took the mailing list off the CC. In order to steer this
> conversation back on a useful track, please check all that apply:
>
> [ X  ] I have tried removing "sk_clear_memalloc(sock);" and
> "sk_set_memalloc(sock->sk);" from socket.c, and the problem still
> continued.
> [  ] I have tried removing "sock->sk->sk_sndbuf =3D INT_MAX;" from
> socket.c, and the problem still continued.
> [ X ] I do not know how or am unable to make changes to the source
> code, recompile, and test these changes.
> [ X ] I have an extra device that I can mail to Jason so that he can
> debug the issue.
* for the extra device we may pay new ones , since you easily get them
for 15 euro per part (the TP link 841N)
* buildchain for crosscompiling is ready now, but unfortunately we test
it in our local hack space when there is free time, (n3ph and me) could
be in the next days ..

by the way : the setup from Rene is different: see this same thread -
message from 11h today from Rene.
(mainly he run iperf on one routerdevice direct, and only connect to wg
outside, where we build a uniqe wireguard bridge between two similar
routerdevices and no iperf had to be done (and regulated) on this
devices ... just storms of packets)

--=20
make the world nicer, please use PGP encryption


--------------1507EC69EC1AC65E51639CB3
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    On 04.08.2016 10:15, Jason A. Donenfeld wrote:<br>
    <blockquote
cite="mid:CAHmME9oNd9o6rzqPU-Lh69E09oWb8_gHApxuD5+asAdQbgAcwA@mail.gmail.com"
      type="cite">
      <div dir="ltr">Your prior communications have not been clear to
        me, and recently somebody took the mailing list off the CC. In
        order to steer this conversation back on a useful track, please
        check all that apply:
        <div><br>
        </div>
        <div>[ X  ] I have tried removing "<span
            style="font-size:12.8px">sk_clear_memalloc(sock);" and "</span><span
            style="font-size:12.8px">sk_set_memalloc(sock-&gt;sk);" from
            socket.c, and the problem still continued.</span></div>
        <div><span style="font-size:12.8px">[  ] I have tried removing "</span><span
            style="font-size:12.8px">sock-&gt;sk-&gt;sk_sndbuf =
            INT_MAX;" from socket.c, and the problem still continued.</span></div>
        <div><span style="font-size:12.8px">[ X ] I do not know how or
            am unable to make changes to the source code, recompile, and
            test these changes.</span></div>
        <div><span style="font-size:12.8px">[ X ] I have an extra device
            that I can mail to Jason so that he can debug the issue.</span></div>
      </div>
    </blockquote>
    * for the extra device we may pay new ones , since you easily get
    them for 15 euro per part (the TP link 841N) <br>
    * buildchain for crosscompiling is ready now, but unfortunately we
    test it in our local hack space when there is free time, (n3ph and
    me) could be in the next days ..<br>
    <br>
    by the way : the setup from Rene is different: see this same thread
    - message from 11h today from Rene. <br>
    (mainly he run iperf on one routerdevice direct, and only connect to
    wg outside, where we build a uniqe wireguard bridge between two
    similar routerdevices and no iperf had to be done (and regulated) on
    this devices ... just storms of packets) <br>
    <br>
    <pre class="moz-signature" cols="72">-- 
make the world nicer, please use PGP encryption</pre>
  </body>
</html>

--------------1507EC69EC1AC65E51639CB3--
