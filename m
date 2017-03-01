Return-Path: nicolas.prochazka@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2b91825d
 for <wireguard@lists.zx2c4.com>; Wed, 1 Mar 2017 13:45:44 +0000 (UTC)
Received: from mail-lf0-f49.google.com (mail-lf0-f49.google.com
 [209.85.215.49])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 29cc9a2e
 for <wireguard@lists.zx2c4.com>; Wed, 1 Mar 2017 13:45:44 +0000 (UTC)
Received: by mail-lf0-f49.google.com with SMTP id a6so19646022lfa.0
 for <wireguard@lists.zx2c4.com>; Wed, 01 Mar 2017 05:47:33 -0800 (PST)
MIME-Version: 1.0
From: Nicolas Prochazka <nicolas.prochazka@gmail.com>
Date: Wed, 1 Mar 2017 14:47:31 +0100
Message-ID: <CADdae-jn7qKK=sg7QdP-UeepBrZyUswV4LkABCXsrpzexymk3g@mail.gmail.com>
Subject: [ wireguard-devel] Purge old peer
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: multipart/alternative; boundary=001a114b1a30e592b60549ab8d8f
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a114b1a30e592b60549ab8d8f
Content-Type: text/plain; charset=UTF-8

Hello,
we hare using wireguard with a lot of client, with a lot of dynamically
generated peer key.
So we have, server side, a lot of peers that are become obsoletes
At this time, we delete peer , based on latest handshake > delta time ,
with wg command.
Is the best thing to do ? is it possible to implement an auto purge of old
peer ?

Regards,
Nicolas Prochazka.

--001a114b1a30e592b60549ab8d8f
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Hello,<br>we hare using wireguard with a lot of =
client, with a lot of dynamically generated peer key.<br>So we have, server=
 side, a lot of peers that are become obsoletes<br>At this time, we delete =
peer , based on latest handshake &gt; delta time , with wg command.<br>Is t=
he best thing to do ? is it possible to implement an auto purge of old peer=
 ? <br><br></div>Regards, <br></div>Nicolas Prochazka.<br></div>

--001a114b1a30e592b60549ab8d8f--
