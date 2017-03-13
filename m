Return-Path: saschagrunert@icloud.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a926539c
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Mar 2017 16:57:32 +0000 (UTC)
Received: from st11p00im-asmtp001.me.com (st11p00im-asmtp001.me.com
 [17.172.80.95])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c2b4cff2
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Mar 2017 16:57:32 +0000 (UTC)
Received: from process-dkim-sign-daemon.st11p00im-asmtp001.me.com by
 st11p00im-asmtp001.me.com
 (Oracle Communications Messaging Server 7.0.5.38.0 64bit (built Feb 26 2016))
 id <0OMR00500IVOZ500@st11p00im-asmtp001.me.com> for wireguard@lists.zx2c4.com;
 Mon, 13 Mar 2017 17:00:44 +0000 (GMT)
MIME-version: 1.0
Content-type: multipart/alternative;
 boundary="Boundary_(ID_oQT6zZC7Rs1STO+ulc3FXw)"
To: sopium <sopium@mysterious.site>
From: Sascha Grunert <saschagrunert@icloud.com>
Subject: Re: Rust implementation status
Date: Mon, 13 Mar 2017 17:00:39 +0000 (GMT)
Message-id: <b850dbab-d21f-4ff3-878d-1bc898da5b6f@me.com>
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--Boundary_(ID_oQT6zZC7Rs1STO+ulc3FXw)
Content-type: text/plain; charset=utf-8; format=flowed
Content-transfer-encoding: quoted-printable

Hey folks,=0A=0AThis sounds really great, do you think you can contribute =
your work to the main WireGuard Rust source?=0A=0ABest regards,=0ASascha=0A=
=0AAm 13. M=C3=A4rz 2017 um 08:04 schrieb sopium <sopium@mysterious.site>:=
=0A=0AHi,=0A=0A2017-03-05 20:42 GMT+09:00 Sascha Grunert <saschagrunert@ic=
loud.com>:=0AHey folks,=0A=0AI want to call for participation of the Rust =
userspace implementation of WireGuard. The template for the initial implem=
entation was this: https://www.wireguard.io/xplatform/ and can be found he=
re: https://git.zx2c4.com/wireguard-rs/.=0A=0A[......]=0A=0AI have got an =
initial working prototype of the WireGuard protocol in=0ARust.=0A=0AThe co=
de is at the `wg` branch of `TiTun`[1].=0A=0A1. https://github.com/sopium/=
titun/tree/wg=0A=0AMost of the essential aspects of the WireGuard protocol=
 is=0Aimplemented. The missing parts should not be too hard to add.=0A=0AO=
nly Linux is supported, for the moment.=0A=0AThe implementation is quite f=
ast =F0=9F=9A=80, although I haven't spent a lot of=0Aeffort in optimizati=
on yet. It uses a fixed number of threads to=0Aprocess packets from UDP so=
cket or TUN device (similar to the other=0AHaskell impl, nara), and uses f=
ine-grained locking to exploit=0Aparallelism. I get 600Mbps+ to 800Mbps+ t=
hroughput and about 0.5ms=0Alatency, between my Haswell Xeon-E3 desktop an=
d a local KVM=0Ainstance. It should be able to get even faster with SO_REU=
SEPORT=0Asockets and multi-queue TUN devices.=0A=0APlease review and test.=
=0A=0ARegards,=0ASopium=0A=0A=0A=

--Boundary_(ID_oQT6zZC7Rs1STO+ulc3FXw)
Content-type: multipart/related;
 boundary="Boundary_(ID_QDZluIyx0aMLxcRtxK39PA)"; type="text/html"


--Boundary_(ID_QDZluIyx0aMLxcRtxK39PA)
Content-type: text/html; charset=utf-8
Content-transfer-encoding: quoted-printable

<html><body><div>Hey folks,</div><div><br data-mce-bogus=3D"1"></div><div>This sounds =
really great, do you think you can contribute your work to the main WireGu=
ard Rust source?</div><div><br data-mce-bogus=3D"1"></div><div>Best regard=
s,</div><div>Sascha</div><div class=3D"x-apple-signature"></div><div><br>A=
m 13. M=C3=A4rz 2017 um 08:04 schrieb sopium &lt;sopium@mysterious.site&gt=
;:<br><br></div><div><blockquote type=3D"cite"><div class=3D"msg-quote"><d=
iv class=3D"_stretch"><span class=3D"body-text-content">Hi,<br><br>2017-03=
-05 20:42 GMT+09:00 Sascha Grunert &lt;saschagrunert@icloud.com&gt;:<br><b=
lockquote type=3D"cite" class=3D"quoted-plain-text">Hey folks,</blockquote=
><blockquote type=3D"cite" class=3D"quoted-plain-text"><br></blockquote><b=
lockquote type=3D"cite" class=3D"quoted-plain-text">I want to call for par=
ticipation of the Rust userspace implementation of WireGuard. The template=
 for the initial implementation was this: <a href=3D"https://www.wireguard=
.io/xplatform/" data-mce-href=3D"https://www.wireguard.io/xplatform/">http=
s://www.wireguard.io/xplatform/</a> and can be found here: <a href=3D"http=
s://git.zx2c4.com/wireguard-rs/" data-mce-href=3D"https://git.zx2c4.com/wi=
reguard-rs/">https://git.zx2c4.com/wireguard-rs/</a>.</blockquote><blockqu=
ote type=3D"cite" class=3D"quoted-plain-text"><br></blockquote><blockquote=
 type=3D"cite" class=3D"quoted-plain-text">[......]</blockquote><br>I have=
 got an initial working prototype of the WireGuard protocol in<br>Rust.<br=
><br>The code is at the `wg` branch of `TiTun`[1].<br><br>1. <a href=3D"ht=
tps://github.com/sopium/titun/tree/wg" data-mce-href=3D"https://github.com=
/sopium/titun/tree/wg">https://github.com/sopium/titun/tree/wg</a><br><br>=
Most of the essential aspects of the WireGuard protocol is<br>implemented.=
 The missing parts should not be too hard to add.<br><br>Only Linux is sup=
ported, for the moment.<br><br>The implementation is quite fast =F0=9F=9A=80=
, although I haven't spent a lot of<br>effort in optimization yet. It uses=
 a fixed number of threads to<br>process packets from UDP socket or TUN de=
vice (similar to the other<br>Haskell impl, nara), and uses fine-grained l=
ocking to exploit<br>parallelism. I get 600Mbps+ to 800Mbps+ throughput an=
d about 0.5ms<br>latency, between my Haswell Xeon-E3 desktop and a local K=
VM<br>instance. It should be able to get even faster with SO_REUSEPORT<br>=
sockets and multi-queue TUN devices.<br><br>Please review and test.<br><br=
>Regards,<br>Sopium<br><br><br></span></div></div></blockquote></div></body></html>=

--Boundary_(ID_QDZluIyx0aMLxcRtxK39PA)--

--Boundary_(ID_oQT6zZC7Rs1STO+ulc3FXw)--
