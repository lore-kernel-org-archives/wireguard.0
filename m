Return-Path: nicolas.prochazka@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id be084bdb
 for <wireguard@lists.zx2c4.com>;
 Fri, 17 Feb 2017 14:02:47 +0000 (UTC)
Received: from mail-lf0-f41.google.com (mail-lf0-f41.google.com
 [209.85.215.41])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e3d0ed7d
 for <wireguard@lists.zx2c4.com>;
 Fri, 17 Feb 2017 14:02:47 +0000 (UTC)
Received: by mail-lf0-f41.google.com with SMTP id x1so22993827lff.0
 for <wireguard@lists.zx2c4.com>; Fri, 17 Feb 2017 06:03:07 -0800 (PST)
MIME-Version: 1.0
Sender: nicolas.prochazka@gmail.com
From: nicolas prochazka <prochazka.nicolas@gmail.com>
Date: Fri, 17 Feb 2017 15:03:05 +0100
Message-ID: <CADdae-jNLBGrjwKjfibBtwKennPDESaBe0_hE3vbu5=x_BTmFw@mail.gmail.com>
Subject: [wireguard-devel] About ip management
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: multipart/alternative; boundary=94eb2c1cb94a74526e0548ba5f2a
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--94eb2c1cb94a74526e0548ba5f2a
Content-Type: text/plain; charset=UTF-8

Hello,
I hope not to have misunderstood ip management with wireguard,
in a "server mode operation" , as many peers -> one peer ( server ) ,
private ip configuration must be coherent. In fact, as server / client
example in contrib, server must delivery ip to clients, there's no way for
client to know good private_ip .
We cannot use dhcp, layer 3 , so ...
we need to implement a pool ip manager , is it correct ?

Regards,
Nicolas Prochazka.

--94eb2c1cb94a74526e0548ba5f2a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div><div><div>Hello, <br><span id=3D"gmail=
-result_box" class=3D"gmail-" lang=3D"en"><span class=3D"gmail-">I hope not=
 to have misunderstood ip management with wireguard, <br></span></span></di=
v><span id=3D"gmail-result_box" class=3D"gmail-" lang=3D"en"><span class=3D=
"gmail-">in a &quot;server mode operation&quot; , as many peers -&gt; one p=
eer ( server ) , <br></span></span></div><span id=3D"gmail-result_box" clas=
s=3D"gmail-" lang=3D"en"><span class=3D"gmail-">private ip configuration mu=
st be coherent. In fact, as server / client example in contrib, server must=
 delivery ip to clients, there&#39;s no way for client to know good private=
_ip .<br></span></span></div><span id=3D"gmail-result_box" class=3D"gmail-"=
 lang=3D"en"><span class=3D"gmail-">We cannot use dhcp, layer 3 , so ... <b=
r></span></span></div><span id=3D"gmail-result_box" class=3D"gmail-" lang=
=3D"en"><span class=3D"gmail-">we need to implement a pool ip manager , is =
it correct ?<br><br></span></span></div><span id=3D"gmail-result_box" class=
=3D"gmail-" lang=3D"en"><span class=3D"gmail-">Regards, <br></span></span><=
/div><span id=3D"gmail-result_box" class=3D"gmail-" lang=3D"en"><span class=
=3D"gmail-">Nicolas Prochazka. <br></span></span></div>

--94eb2c1cb94a74526e0548ba5f2a--
