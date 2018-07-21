Return-Path: shawn@git.icu
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e1c7472e
 for <wireguard@lists.zx2c4.com>;
 Sat, 21 Jul 2018 05:59:17 +0000 (UTC)
Received: from git.icu (git.icu [IPv6:2001:470:d:238::1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d5588c1f
 for <wireguard@lists.zx2c4.com>;
 Sat, 21 Jul 2018 05:59:17 +0000 (UTC)
Received: from mail-ua0-f179.google.com (mail-ua0-f179.google.com
 [209.85.217.179]) by git.icu (Postfix) with ESMTPSA id D01E923DFE
 for <wireguard@lists.zx2c4.com>; Sat, 21 Jul 2018 06:08:00 +0000 (UTC)
Received: by mail-ua0-f179.google.com with SMTP id k25-v6so8763980uao.11
 for <wireguard@lists.zx2c4.com>; Fri, 20 Jul 2018 23:08:00 -0700 (PDT)
MIME-Version: 1.0
From: Shawn Landden <shawn@git.icu>
Date: Fri, 20 Jul 2018 23:07:49 -0700
Message-ID: <CA+49okrJFL0AD57AG3snv_UgDqVhY7bh8j=N+sNaFS2peB7btA@mail.gmail.com>
Subject: Re: some mips iperf3 tests
To: wireguard@lists.zx2c4.com
Content-Type: multipart/alternative; boundary="000000000000ff6fef05717c3ba2"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--000000000000ff6fef05717c3ba2
Content-Type: text/plain; charset="UTF-8"

https://openwrt.org/toh/hwdata/gl.inet/gl.inet_gl-mt300n_v2

MediaTek MT7628AN 580Mhz single core

with -march=24kc -O2

With 0.0.20180718
receive
[ ID] Interval           Transfer     Bandwidth       Retr
[  4]   0.00-15.00  sec  64.7 MBytes  36.2 Mbits/sec  246             sender
[  4]   0.00-15.00  sec  64.6 MBytes  36.1 Mbits/sec
receiver

send
[ ID] Interval           Transfer     Bandwidth       Retr
[  4]   0.00-15.00  sec   116 MBytes  65.0 Mbits/sec    2             sender
[  4]   0.00-15.00  sec   115 MBytes  64.2 Mbits/sec
receiver

--000000000000ff6fef05717c3ba2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><a href=3D"https://openwrt.org/toh/hwdata/gl.inet/gl.=
inet_gl-mt300n_v2">https://openwrt.org/toh/hwdata/gl.inet/gl.inet_gl-mt300n=
_v2</a><br></div><div><br></div><div>MediaTek MT7628AN=C2=A0580Mhz single c=
ore<br></div><div><br></div><div>with -march=3D24kc -O2<br></div><div><br><=
/div><div>With 0.0.20180718</div><div><div>receive</div><div>[ ID] Interval=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Transfer=C2=A0 =C2=A0 =C2=A0Bandwi=
dth=C2=A0 =C2=A0 =C2=A0 =C2=A0Retr</div><div>[=C2=A0 4]=C2=A0 =C2=A00.00-15=
.00=C2=A0 sec=C2=A0 64.7 MBytes=C2=A0 36.2 Mbits/sec=C2=A0 246=C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sender</div><div>[=C2=A0 4]=C2=A0 =C2=A0=
0.00-15.00=C2=A0 sec=C2=A0 64.6 MBytes=C2=A0 36.1 Mbits/sec=C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 receiver</div><div><br></d=
iv><div>send</div><div>[ ID] Interval=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0Transfer=C2=A0 =C2=A0 =C2=A0Bandwidth=C2=A0 =C2=A0 =C2=A0 =C2=A0Retr</di=
v><div>[=C2=A0 4]=C2=A0 =C2=A00.00-15.00=C2=A0 sec=C2=A0 =C2=A0116 MBytes=
=C2=A0 65.0 Mbits/sec=C2=A0 =C2=A0 2=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0sender</div><div>[=C2=A0 4]=C2=A0 =C2=A00.00-15.00=C2=A0 sec=C2=
=A0 =C2=A0115 MBytes=C2=A0 64.2 Mbits/sec=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 receiver</div></div><div><br></div></div>

--000000000000ff6fef05717c3ba2--
