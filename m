Return-Path: j.e.aten@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a17f803d
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 Apr 2017 17:38:12 +0000 (UTC)
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3d3e3dca
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 Apr 2017 17:38:11 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id o81so38512177wmb.1
 for <wireguard@lists.zx2c4.com>; Mon, 17 Apr 2017 10:45:53 -0700 (PDT)
MIME-Version: 1.0
From: "Jason E. Aten" <j.e.aten@gmail.com>
Date: Mon, 17 Apr 2017 12:45:51 -0500
Message-ID: <CAPNEFAaG3cQQJSyAuGxdHQHMm6+RzrQVt9ZrzTxrVNKm01z2dA@mail.gmail.com>
Subject: nat traversal / userspace impl
To: wireguard@lists.zx2c4.com
Content-Type: multipart/alternative; boundary=001a114a0e6cc9fd47054d605c35
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a114a0e6cc9fd47054d605c35
Content-Type: text/plain; charset=UTF-8

New to Wireguard, it looks super interesting... quick questions:

1. If it uses UDP only, how does NAT traversal (firewall punch through)
work?

2. are there userspace implementations available...?

Experience thus far: The src packages that are in repos for centos 7 were
insufficient to compile. I downloaded full wireguard source and tried to
compile the wireguard kernel module on centos 7.3 with kernel 3.10, no
luck, lots of compile time header issues. I upgraded to kernel 4.10 and
could compile the wireguard module under kernel 4.10, but then got stuck on
how to compile the dependent modules;hey aren't specific to wireguard, but
rather generic modules that just weren't in the default 4.10 kernel and I'm
not sure how to build them.

[root@k0 src]# insmod ./wireguard.ko
insmod: ERROR: could not insert module ./wireguard.ko: Unknown symbol in
module
[root@k0 src]# dmesg
...
[77292.707469] wireguard: Unknown symbol udp_sock_create4 (err 0)
[77292.711122] wireguard: Unknown symbol udp_tunnel6_xmit_skb (err 0)
[77292.714899] wireguard: Unknown symbol udp_tunnel_sock_release (err 0)
[77292.718642] wireguard: Unknown symbol setup_udp_tunnel_sock (err 0)
[77292.722699] wireguard: Unknown symbol udp_sock_create6 (err 0)
[77292.726007] wireguard: Unknown symbol udp_tunnel_xmit_skb (err 0)
[root@k0 src]#

Anywho, a userland implementation would be easier to play with. Are such
out there?

Thanks!

Jason

--001a114a0e6cc9fd47054d605c35
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>New to Wireguard, it looks super interesting... quick=
 questions:<br><br></div>1. If it uses UDP only, how does NAT traversal (fi=
rewall punch through) work?<br><div><br></div><div>2. are there userspace i=
mplementations available...?<br><br>Experience thus far: The src packages t=
hat are in repos for centos 7 were insufficient to compile. I downloaded fu=
ll wireguard source and tried to compile the wireguard kernel module on cen=
tos 7.3 with kernel 3.10, no luck, lots of compile time header issues. I up=
graded to kernel 4.10 and could compile the wireguard module under kernel 4=
.10, but then got stuck on how to compile the dependent modules;hey aren&#3=
9;t specific to wireguard, but rather generic modules that just weren&#39;t=
 in the default 4.10 kernel and I&#39;m not sure how to build them.<br></di=
v><div><br>[root@k0 src]# insmod ./wireguard.ko<br>insmod: ERROR: could not=
 insert module ./wireguard.ko: Unknown symbol in module<br>[root@k0 src]# d=
mesg<br>...<br>[77292.707469] wireguard: Unknown symbol udp_sock_create4 (e=
rr 0)<br>[77292.711122] wireguard: Unknown symbol udp_tunnel6_xmit_skb (err=
 0)<br>[77292.714899] wireguard: Unknown symbol udp_tunnel_sock_release (er=
r 0)<br>[77292.718642] wireguard: Unknown symbol setup_udp_tunnel_sock (err=
 0)<br>[77292.722699] wireguard: Unknown symbol udp_sock_create6 (err 0)<br=
>[77292.726007] wireguard: Unknown symbol udp_tunnel_xmit_skb (err 0)<br>[r=
oot@k0 src]# <br><br></div><div>Anywho, a userland implementation would be =
easier to play with. Are such out there?<br><br></div><div>Thanks!<br><br><=
/div><div>Jason<br></div></div>

--001a114a0e6cc9fd47054d605c35--
