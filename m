Return-Path: naulisreal@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3fc13a34
 for <wireguard@lists.zx2c4.com>; Sun, 1 Apr 2018 07:14:54 +0000 (UTC)
Received: from mail-wm0-f42.google.com (mail-wm0-f42.google.com [74.125.82.42])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e4a10497
 for <wireguard@lists.zx2c4.com>; Sun, 1 Apr 2018 07:14:54 +0000 (UTC)
Received: by mail-wm0-f42.google.com with SMTP id f125so22357036wme.4
 for <wireguard@lists.zx2c4.com>; Sun, 01 Apr 2018 00:27:30 -0700 (PDT)
MIME-Version: 1.0
From: Jun Gyu Park <naulisreal@gmail.com>
Date: Sun, 1 Apr 2018 16:27:29 +0900
Message-ID: <CACf-YK=UBsAmk9V+3sZR+PcvqYU3tJgo4ASzw08XMJzZaNOvRQ@mail.gmail.com>
Subject: Conflict with broadcom component.
To: wireguard@lists.zx2c4.com
Content-Type: multipart/alternative; boundary="001a11469032e67d610568c4676d"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a11469032e67d610568c4676d
Content-Type: text/plain; charset="UTF-8"

I installed Wireguard on my Asus router.
Some sites work but others slow or do not response.
I tried adjust MTU but no luck.

Kernel makes following error messages.

Apr  1 16:17:43 kernel: ^[[0;33;41mBLOG ERROR blog_request :blog_key
corruption when adding flow net_p=ffffffc0100cba60  dir=0
old_key=0x20000091 new_key=0x20000092
Apr  1 16:17:43 kernel: ^[[0m
Apr  1 16:18:04 kernel: ^[[0;33;41mBLOG ERROR blog_request :blog_key
corruption when adding flow net_p=ffffffc0100cba60  dir=0
old_key=0x20000092 new_key=0x20000093
Apr  1 16:18:04 kernel: ^[[0m
Apr  1 16:18:05 kernel: ^[[0;33;41mBLOG ERROR blog_request :blog_key
corruption when adding flow net_p=ffffffc0100cba60  dir=0
old_key=0x20000093 new_key=0x20000094
Apr  1 16:18:05 kernel: ^[[0m
Apr  1 16:18:10 kernel: ^[[0;33;41mBLOG ERROR blog_request :blog_key
corruption when adding flow net_p=ffffffc0100cba60  dir=0
old_key=0x20000094 new_key=0x20000095
Apr  1 16:18:10 kernel: ^[[0m
Apr  1 16:18:11 kernel: ^[[0;33;41mBLOG ERROR blog_request :blog_key
corruption when adding flow net_p=ffffffc0100cba60  dir=0
old_key=0x20000095 new_key=0x20000096
Apr  1 16:18:11 kernel: ^[[0m
Apr  1 16:18:41 kernel: ^[[0;33;41mBLOG ERROR blog_request :blog_key
corruption when deleting flowfor net_p=ffffffc0110eb010
Apr  1 16:18:41 kernel: ^[[0m
Apr  1 16:19:17 kernel: ^[[0;33;41mBLOG ERROR blog_request :blog_key
corruption when deleting flowfor net_p=ffffffc0100cba60
Apr  1 16:19:17 kernel: ^[[0m
Apr  1 16:19:52 kernel: ^[[0;33;41mBLOG ERROR blog_request :blog_key
corruption when deleting flowfor net_p=ffffffc0110eb010
Apr  1 16:19:52 kernel: ^[[0m
Apr  1 16:20:01 kernel: ^[[0;33;41mBLOG ERROR blog_request :blog_key
corruption when deleting flowfor net_p=ffffffc0100cba60
Apr  1 16:20:01 kernel: ^[[0m
Apr  1 16:20:10 kernel: ^[[0;33;41mBLOG ERROR blog_request :blog_key
corruption when deleting flowfor net_p=ffffffc0100cba60
Apr  1 16:20:10 kernel: ^[[0m
Apr  1 16:20:10 kernel: ^[[0;33;41mBLOG ERROR blog_request :blog_key
corruption when deleting flowfor net_p=ffffffc0100cba60
Apr  1 16:20:10 kernel: ^[[0m
Apr  1 16:20:28 kernel: ^[[0;33;41mBLOG ERROR blog_request :blog_key
corruption when deleting flowfor net_p=ffffffc0100cba60
Apr  1 16:20:28 kernel: ^[[0m
Apr  1 16:20:55 kernel: ^[[0;33;41mBLOG ERROR blog_request :blog_key
corruption when deleting flowfor net_p=ffffffc0110eb010
Apr  1 16:20:55 kernel: ^[[0m

That codes in here.
https://github.com/RMerl/asuswrt-merlin.ng/blob/master/release/src-rt-5.02hnd/kernel/linux-4.1/net/core/blog.c

Can you guys review and tell what's wrong?
I don't know computer code :(.

--001a11469032e67d610568c4676d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I installed Wireguard on my Asus router.<div>

<div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:sm=
all;font-style:normal;font-variant-ligatures:normal;font-variant-caps:norma=
l;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;te=
xt-transform:none;white-space:normal;word-spacing:0px;text-decoration-style=
:initial;text-decoration-color:initial">Some sites work but others slow or =
do not response.</div><div style=3D"color:rgb(34,34,34);font-family:arial,s=
ans-serif;font-size:small;font-style:normal;font-variant-ligatures:normal;f=
ont-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:st=
art;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px=
;text-decoration-style:initial;text-decoration-color:initial">I tried adjus=
t MTU but no luck.</div>

<br></div><div>Kernel makes following error messages.</div><div><br></div><=
div><div>Apr=C2=A0 1 16:17:43 kernel: ^[[0;33;41mBLOG ERROR blog_request :b=
log_key corruption when adding flow net_p=3Dffffffc0100cba60=C2=A0 dir=3D0 =
old_key=3D0x20000091 new_key=3D0x20000092</div><div>Apr=C2=A0 1 16:17:43 ke=
rnel: ^[[0m</div><div>Apr=C2=A0 1 16:18:04 kernel: ^[[0;33;41mBLOG ERROR bl=
og_request :blog_key corruption when adding flow net_p=3Dffffffc0100cba60=
=C2=A0 dir=3D0 old_key=3D0x20000092 new_key=3D0x20000093</div><div>Apr=C2=
=A0 1 16:18:04 kernel: ^[[0m</div><div>Apr=C2=A0 1 16:18:05 kernel: ^[[0;33=
;41mBLOG ERROR blog_request :blog_key corruption when adding flow net_p=3Df=
fffffc0100cba60=C2=A0 dir=3D0 old_key=3D0x20000093 new_key=3D0x20000094</di=
v><div>Apr=C2=A0 1 16:18:05 kernel: ^[[0m</div><div>Apr=C2=A0 1 16:18:10 ke=
rnel: ^[[0;33;41mBLOG ERROR blog_request :blog_key corruption when adding f=
low net_p=3Dffffffc0100cba60=C2=A0 dir=3D0 old_key=3D0x20000094 new_key=3D0=
x20000095</div><div>Apr=C2=A0 1 16:18:10 kernel: ^[[0m</div><div>Apr=C2=A0 =
1 16:18:11 kernel: ^[[0;33;41mBLOG ERROR blog_request :blog_key corruption =
when adding flow net_p=3Dffffffc0100cba60=C2=A0 dir=3D0 old_key=3D0x2000009=
5 new_key=3D0x20000096</div><div>Apr=C2=A0 1 16:18:11 kernel: ^[[0m</div><d=
iv>Apr=C2=A0 1 16:18:41 kernel: ^[[0;33;41mBLOG ERROR blog_request :blog_ke=
y corruption when deleting flowfor net_p=3Dffffffc0110eb010=C2=A0</div><div=
>Apr=C2=A0 1 16:18:41 kernel: ^[[0m</div><div>Apr=C2=A0 1 16:19:17 kernel: =
^[[0;33;41mBLOG ERROR blog_request :blog_key corruption when deleting flowf=
or net_p=3Dffffffc0100cba60=C2=A0</div><div>Apr=C2=A0 1 16:19:17 kernel: ^[=
[0m</div><div>Apr=C2=A0 1 16:19:52 kernel: ^[[0;33;41mBLOG ERROR blog_reque=
st :blog_key corruption when deleting flowfor net_p=3Dffffffc0110eb010=C2=
=A0</div><div>Apr=C2=A0 1 16:19:52 kernel: ^[[0m</div><div>Apr=C2=A0 1 16:2=
0:01 kernel: ^[[0;33;41mBLOG ERROR blog_request :blog_key corruption when d=
eleting flowfor net_p=3Dffffffc0100cba60=C2=A0</div><div>Apr=C2=A0 1 16:20:=
01 kernel: ^[[0m</div><div>Apr=C2=A0 1 16:20:10 kernel: ^[[0;33;41mBLOG ERR=
OR blog_request :blog_key corruption when deleting flowfor net_p=3Dffffffc0=
100cba60=C2=A0</div><div>Apr=C2=A0 1 16:20:10 kernel: ^[[0m</div><div>Apr=
=C2=A0 1 16:20:10 kernel: ^[[0;33;41mBLOG ERROR blog_request :blog_key corr=
uption when deleting flowfor net_p=3Dffffffc0100cba60=C2=A0</div><div>Apr=
=C2=A0 1 16:20:10 kernel: ^[[0m</div><div>Apr=C2=A0 1 16:20:28 kernel: ^[[0=
;33;41mBLOG ERROR blog_request :blog_key corruption when deleting flowfor n=
et_p=3Dffffffc0100cba60=C2=A0</div><div>Apr=C2=A0 1 16:20:28 kernel: ^[[0m<=
/div><div>Apr=C2=A0 1 16:20:55 kernel: ^[[0;33;41mBLOG ERROR blog_request :=
blog_key corruption when deleting flowfor net_p=3Dffffffc0110eb010=C2=A0</d=
iv><div>Apr=C2=A0 1 16:20:55 kernel: ^[[0m</div><div><br></div><div>That co=
des in here.</div><div><a href=3D"https://github.com/RMerl/asuswrt-merlin.n=
g/blob/master/release/src-rt-5.02hnd/kernel/linux-4.1/net/core/blog.c">http=
s://github.com/RMerl/asuswrt-merlin.ng/blob/master/release/src-rt-5.02hnd/k=
ernel/linux-4.1/net/core/blog.c</a></div><div><br></div><div>Can you guys r=
eview and tell what&#39;s wrong?</div><div>I don&#39;t know computer code :=
(.</div></div></div>

--001a11469032e67d610568c4676d--
