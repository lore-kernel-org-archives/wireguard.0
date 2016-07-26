Return-Path: jens@viisauksena.de
Received: from viisauksena.de (v32412.1blu.de [178.254.39.111])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b8cb9fdc
 for <wireguard@lists.zx2c4.com>;
 Tue, 26 Jul 2016 19:43:15 +0000 (UTC)
Received: from [10.60.12.138] (unknown [185.66.194.30])
 by openfreiburg.de (Postfix) with ESMTPSA id 6C79410F23C38
 for <wireguard@lists.zx2c4.com>; Tue, 26 Jul 2016 21:45:49 +0200 (CEST)
To: wireguard@lists.zx2c4.com
From: jens <jens@viisauksena.de>
Message-ID: <62f0dc7c-4eb4-523a-c548-ee2b2a6ec038@viisauksena.de>
Date: Tue, 26 Jul 2016 21:42:41 +0200
MIME-Version: 1.0
Content-Type: multipart/alternative;
 boundary="------------66D1E712E391DEEF34EB5B2B"
Subject: [WireGuard] Header / MTU sizes for Wireguard
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <http://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <http://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

This is a multi-part message in MIME format.
--------------66D1E712E391DEEF34EB5B2B
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

hi,

we are succesfully built an alternative for our tincd backbone with
wireguard (and on top l2tpv3/batv15).

with iperf we get up to 500Mbs on l2tpv3 level.. (upto 700 on pure
wireguard)

for optimization we need to know more and better about the used header,
the possible data-size per packet-header to increase throuhput with all
the other layers.

Do you know your headersize, or some more easy details in
headersize/packetsize...

where does the default mtu of 1423 come from

thx jens


--=20
make the world nicer, please use PGP encryption=09


--------------66D1E712E391DEEF34EB5B2B
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 8bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=utf-8">
  </head>
  <body text="#000000" bgcolor="#FFFFFF">
    <p>hi,</p>
    <p>we are succesfully built an alternative for our tincd backbone
      with wireguard (and on top l2tpv3/batv15).</p>
    <p>with iperf we get up to 500Mbs on l2tpv3 level.. (upto 700 on
      pure wireguard)</p>
    <p>for optimization we need to know more and better about the used
      header, the possible data-size per packet-header to increase
      throuhput with all the other layers. <br>
    </p>
    <p>Do you know your headersize, or some more easy details in
      headersize/packetsize...</p>
    <p>where does the default mtu of 1423 come from<br>
    </p>
    <p>thx jens</p>
    <p><br>
    </p>
    <pre class="moz-signature" cols="72">-- 
make the world nicer, please use PGP encryption	</pre>
  </body>
</html>

--------------66D1E712E391DEEF34EB5B2B--
