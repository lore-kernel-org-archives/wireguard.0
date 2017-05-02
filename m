Return-Path: damian.kaczkowski@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3cc0b793
 for <wireguard@lists.zx2c4.com>; Tue, 2 May 2017 08:11:58 +0000 (UTC)
Received: from mail-qt0-f179.google.com (mail-qt0-f179.google.com
 [209.85.216.179])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5565667b
 for <wireguard@lists.zx2c4.com>; Tue, 2 May 2017 08:11:58 +0000 (UTC)
Received: by mail-qt0-f179.google.com with SMTP id c45so105900071qtb.1
 for <wireguard@lists.zx2c4.com>; Tue, 02 May 2017 01:21:28 -0700 (PDT)
MIME-Version: 1.0
From: Damian Kaczkowski <damian.kaczkowski@gmail.com>
Date: Tue, 2 May 2017 10:20:46 +0200
Message-ID: <CAGzienFDihyN8fDbKj4KQ-1cwz53_u7Vz3G37P08+wS=hbF0LA@mail.gmail.com>
Subject: Ability to use one udp port for multiple wg interfaces
To: wireguard@lists.zx2c4.com
Content-Type: multipart/alternative; boundary=001a11409b84e18380054e8639d9
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a11409b84e18380054e8639d9
Content-Type: text/plain; charset=UTF-8

Hello.

I'm trying to run two wg interfaces bound to one udp port. eg. wg0 ang wg1
on 51820/udp . wg shows that both interfaces are created (wg0 and wg1). wg
also shows that all peers on both interfaces are defined. However only
peers defined on one wg interface (either wg0 or wg1) are able to establish
connection. Peers on the other interface are not able to connect.

Is this currently unsupported configuration?

Or is this supported configuration and I am doing something wrong?

If unsupported, do you consider to support it in the future?

It would be useful if one wants to easily manage ACLs via firewall rules
defined by wg interfaces (easy to define zones), but do not want to open
multiple ports for every new zone/peer(s). Currently one have to open one
udp port per wg interface. It is not very friendly to open additional udp
ports in multiple peer scenario where firewall ACLs are desirable. If one
have limited number of free udp ports then it also does not scale well.

I am using wireguard build no 20170115 on lede/mips linux.

Greets.

--001a11409b84e18380054e8639d9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello.<div><br></div><div>I&#39;m trying to run two wg int=
erfaces bound to one udp port. eg. wg0 ang wg1 on=C2=A051820/udp . wg shows=
 that both interfaces are created (wg0 and wg1). wg also shows that all pee=
rs on both interfaces are defined. However only peers defined on one wg int=
erface (either wg0 or wg1) are able to establish connection. Peers on the o=
ther interface are not able to connect.</div><div><br></div><div>Is this cu=
rrently unsupported configuration?<br></div><div><br></div><div>Or is this =
supported configuration and I am doing something wrong?</div><div><br></div=
><div>If unsupported, do you consider to support it in the future?</div><di=
v><br></div><div>It would be useful if one wants to easily manage ACLs via =
firewall rules defined by wg interfaces (easy to define zones), but do not =
want to open multiple ports for every new zone/peer(s). Currently one have =
to open one udp port per wg interface. It is not very friendly to open addi=
tional udp ports in multiple peer scenario where firewall ACLs are desirabl=
e. If one have limited number of free udp ports then it also does not scale=
 well.</div><div><br></div><div>I am using wireguard build no 20170115 on l=
ede/mips linux.</div><div><br></div><div>Greets.</div></div>

--001a11409b84e18380054e8639d9--
