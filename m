Return-Path: jens@viisauksena.de
Received: from viisauksena.de (v32412.1blu.de [178.254.39.111])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 23d63eaa
 for <wireguard@lists.zx2c4.com>; Fri, 8 Jul 2016 16:41:48 +0000 (UTC)
Received: from [192.168.0.38] (p5B20FDAF.dip0.t-ipconnect.de [91.32.253.175])
 by openfreiburg.de (Postfix) with ESMTPSA id DE4E810F23929
 for <wireguard@lists.zx2c4.com>; Fri,  8 Jul 2016 18:42:06 +0200 (CEST)
To: wireguard@lists.zx2c4.com
From: jens <jens@viisauksena.de>
Message-ID: <3b339d53-2fa0-6ed6-575b-7239c91e6a36@viisauksena.de>
Date: Fri, 8 Jul 2016 18:39:38 +0200
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------85E525C27FF285E80F1AED0E"
Subject: [WireGuard] openwrt package - kernel >4.1 vs freifunk gluon
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is a multi-part message in MIME format.
--------------85E525C27FF285E80F1AED0E
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

in Freifunk gluon there is actually the kernel 3.18.29 used,
(Freifunk . in case you dont know is a loosly very bog free wifi
community in germany with something around 35000 TP Link routers which
connect to master servers with different technology (like fastd l2tp ..)

if i want to build the package i got this obvious error ... kernel 4.1
or higher needed.

Now i am wondering if its better to wait for newer freifunk-gluon
packages with latest kernel

(which could be some time) or go hacky steps towards patching the kernel.=


in gluon are actually 120+- patches for the actual kernel, many of them
would be obsolete then i think, but it seems like a heck of work todo

any suggestion ?
https://forum.freifunk.net/t/wireguard-als-zukuenftige-vpn-loesung/12858/=
13?u=3Dfuzzle
https://github.com/freifunk-gluon/gluon/issues/816

--=20
make the world nicer, please use PGP encryption


--------------85E525C27FF285E80F1AED0E
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>in Freifunk gluon there is actually the kernel 3.18.29 used,<br>
      (Freifunk . in case you dont know is a loosly very bog free wifi
      community in germany with something around 35000 TP Link routers
      which connect to master servers with different technology (like
      fastd l2tp ..)<br>
    </p>
    <p>if i want to build the package i got this obvious error ...
      kernel 4.1 or higher needed.</p>
    <p>Now i am wondering if its better to wait for newer freifunk-gluon
      packages with latest kernel <br>
    </p>
    <p>(which could be some time) or go hacky steps towards patching the
      kernel. <br>
    </p>
    <p>in gluon are actually 120+- patches for the actual kernel, many
      of them would be obsolete then i think, but it seems like a heck
      of work todo</p>
    <p>any suggestion ?<br>
<a class="moz-txt-link-freetext" href="https://forum.freifunk.net/t/wireguard-als-zukuenftige-vpn-loesung/12858/13?u=fuzzle">https://forum.freifunk.net/t/wireguard-als-zukuenftige-vpn-loesung/12858/13?u=fuzzle</a><br>
      <a class="moz-txt-link-freetext" href="https://github.com/freifunk-gluon/gluon/issues/816">https://github.com/freifunk-gluon/gluon/issues/816</a><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
make the world nicer, please use PGP encryption</pre>
  </body>
</html>

--------------85E525C27FF285E80F1AED0E--
