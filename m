Return-Path: nicolas.prochazka@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cb263b93
 for <wireguard@lists.zx2c4.com>;
 Thu, 23 Feb 2017 13:02:34 +0000 (UTC)
Received: from mail-lf0-f53.google.com (mail-lf0-f53.google.com
 [209.85.215.53])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f5d58d60
 for <wireguard@lists.zx2c4.com>;
 Thu, 23 Feb 2017 13:02:34 +0000 (UTC)
Received: by mail-lf0-f53.google.com with SMTP id l12so15933378lfe.0
 for <wireguard@lists.zx2c4.com>; Thu, 23 Feb 2017 05:03:39 -0800 (PST)
MIME-Version: 1.0
From: Nicolas Prochazka <nicolas.prochazka@gmail.com>
Date: Thu, 23 Feb 2017 14:03:37 +0100
Message-ID: <CADdae-h1pmyzn5aTsnBG5nBaKCuLk03eu0wtQ0E1V0j+nBZsiA@mail.gmail.com>
Subject: [ wireguard-dev ] About configuring allowedip
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: multipart/alternative; boundary=94eb2c1cb94ad24c090549323dd1
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--94eb2c1cb94ad24c090549323dd1
Content-Type: text/plain; charset=UTF-8

Hello, i'm trying to do this with wireguard, withtout success :

peer1 ---> peer2   : config ok , works
peer3 ---> peer1  : config ok , works
peer3 --->peer1 ---> peer2  : not ok .

I suspect allowed-ip configuration, but all my tests does not works.
perhaps I must create two wireguard interface on peer 1 and do
forwarding/routing ?
i'm using ipv6 as internal ip.

so my question is :
- two interface ?
- specifiq magic allowedip ?
( allowed ip is confusing for, it is using for routing and for evicting
paquet ? )

Regards,
Nicolas

--94eb2c1cb94ad24c090549323dd1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div><div><div>Hello, i&#39;m trying to do =
this with wireguard, withtout success : <br><br></div>peer1 ---&gt; peer2=
=C2=A0=C2=A0 : config ok , works<br></div>peer3 ---&gt; peer1=C2=A0 : confi=
g ok , works <br></div>peer3 ---&gt;peer1 ---&gt; peer2=C2=A0 : not ok .<br=
><br></div>I suspect allowed-ip configuration, but all my tests does not wo=
rks.<br></div>perhaps I must create two wireguard interface on peer 1 and d=
o forwarding/routing ? <br></div><div>i&#39;m using ipv6 as internal ip.<br=
><br></div><div>so my question is : <br></div><div>- two interface ?<br></d=
iv><div>- specifiq magic allowedip ?<br></div><div>( allowed ip is confusin=
g for, it is using for routing and for evicting paquet ? )<br></div><div><b=
r></div><div>Regards, <br></div><div>Nicolas <br></div></div>

--94eb2c1cb94ad24c090549323dd1--
