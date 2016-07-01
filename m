Return-Path: jens@viisauksena.de
Received: from viisauksena.de (v32412.1blu.de [178.254.39.111])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 71a328c5
 for <wireguard@lists.zx2c4.com>; Fri, 1 Jul 2016 23:14:05 +0000 (UTC)
To: wireguard@lists.zx2c4.com
From: jens <jens@viisauksena.de>
Message-ID: <abcdfe33-f758-fa4d-b886-596373480187@viisauksena.de>
Date: Sat, 2 Jul 2016 01:14:54 +0200
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------6B63E37BE900546BEF7F8936"
Cc: team@wireguard.io, kontakt <kontakt@freiburg.freifunk.net>
Subject: [WireGuard] fastd comparison wireguard ?
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is a multi-part message in MIME format.
--------------6B63E37BE900546BEF7F8936
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

somebody post a hint of your project in Freifunk Forum
(https://forum.freifunk.net/t/wireguard-als-zukuenftige-vpn-loesung/12858=
 )

There a many Communities that actually run l2tp or fastd for many
nodes2server tunnel. Maybe you know something about Freifunk and its
infrastructure.

However, what is my interest here:

do you know fastd ? do you know how fastd compares to wireguard?

on of the downsides of fastd is that it runs in userspace, not
kernelspace - so there is big overhead on network/crypto while switching
between kernel/userspace.

For example, in Freiburg we are using encrypted fastd tunnel to connect
to our gateway servers. Around 300 Nodes. And we are really interested
in more performant ways of encrypted tunnel connections even for small
nodes (TP Link 841 - 4 MB Flash, 32 MB Ram, Openwrt) - there we reach
with salsa2012+umac something between 12 and 20 Mbit (only).

thanks for hints and suggestions,

fuzzle/ Freifunk Freiburg

https://www.wireguard.io/
http://fastd.readthedocs.io/en/v18/devel/protocol.html
http://gluon.readthedocs.io/en/v2016.1.5/
https://cccfr.de/git/viisauksena/firmware
https://forum.freifunk.net/t/wireguard-als-zukuenftige-vpn-loesung/12858

--=20
make the world nicer, please use PGP encryption


--------------6B63E37BE900546BEF7F8936
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>somebody post a hint of your project in Freifunk Forum
(<a class="moz-txt-link-freetext" href="https://forum.freifunk.net/t/wireguard-als-zukuenftige-vpn-loesung/12858">https://forum.freifunk.net/t/wireguard-als-zukuenftige-vpn-loesung/12858</a>
      )<br>
    </p>
    <p>There a many Communities that actually run l2tp or fastd for many
      nodes2server tunnel. Maybe you know something about Freifunk and
      its infrastructure.</p>
    <p>However, what is my interest here: <br>
    </p>
    <p>do you know fastd ? do you know how fastd compares to wireguard?
      <br>
    </p>
    <p>on of the downsides of fastd is that it runs in userspace, not
      kernelspace - so there is big overhead on network/crypto while
      switching between kernel/userspace. <br>
    </p>
    <p>For example, in Freiburg we are using encrypted fastd tunnel to
      connect to our gateway servers. Around 300 Nodes. And we are
      really interested in more performant ways of encrypted tunnel
      connections even for small nodes (TP Link 841 - 4 MB Flash, 32 MB
      Ram, Openwrt) - there we reach with salsa2012+umac something
      between 12 and 20 Mbit (only).<br>
    </p>
    <p>thanks for hints and suggestions,<br>
    </p>
    <p>fuzzle/ Freifunk Freiburg</p>
    <p><a class="moz-txt-link-freetext" href="https://www.wireguard.io/">https://www.wireguard.io/</a><br>
      <a class="moz-txt-link-freetext" href="http://fastd.readthedocs.io/en/v18/devel/protocol.html">http://fastd.readthedocs.io/en/v18/devel/protocol.html</a><br>
      <a class="moz-txt-link-freetext" href="http://gluon.readthedocs.io/en/v2016.1.5/">http://gluon.readthedocs.io/en/v2016.1.5/</a><br>
      <a class="moz-txt-link-freetext" href="https://cccfr.de/git/viisauksena/firmware">https://cccfr.de/git/viisauksena/firmware</a><br>
<a class="moz-txt-link-freetext" href="https://forum.freifunk.net/t/wireguard-als-zukuenftige-vpn-loesung/12858">https://forum.freifunk.net/t/wireguard-als-zukuenftige-vpn-loesung/12858</a><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
make the world nicer, please use PGP encryption</pre>
  </body>
</html>

--------------6B63E37BE900546BEF7F8936--
