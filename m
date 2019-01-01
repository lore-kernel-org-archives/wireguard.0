Return-Path: <SRS0=QZLZ=PK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	NORMAL_HTTP_TO_IP,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8A27C43387
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  2 Jan 2019 18:03:35 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4A2A218D3
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  2 Jan 2019 18:03:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=swtk.info header.i=@swtk.info header.b="U9UJ5CMC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E4A2A218D3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=swtk.info
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5c7e8775;
	Wed, 2 Jan 2019 18:00:28 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 717f851d
 for <wireguard@lists.zx2c4.com>; Tue, 1 Jan 2019 21:04:10 +0000 (UTC)
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 619d7a8c
 for <wireguard@lists.zx2c4.com>; Tue, 1 Jan 2019 21:04:10 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id x6so23263893ioa.9
 for <wireguard@lists.zx2c4.com>; Tue, 01 Jan 2019 13:06:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=swtk.info; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=gpM8dhBX/TOlHtgLIrtlQXhLCkmLxWaJzFXYrTYhraQ=;
 b=U9UJ5CMCm2zGuS2Ji5ySQ2YruFchUylyGfscbVT2gB4StxhD6EZk86Hr4FqXLN6Ycm
 749eoLseeezV7N/1n2O1a+mIgxa/vH01k3tORtEIOuPa/XHWZp/XFKwa48hdzNGYxFwt
 KDn2QLLfdEl+MRpR5kM8KvNY4L2cObfGSAhD4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=gpM8dhBX/TOlHtgLIrtlQXhLCkmLxWaJzFXYrTYhraQ=;
 b=RXxhlQvMeeE+fi8BYHgLrG76bFjA9n5J/2AnZNITaMX9Arv8qHCZ+pEorEOBQRVyok
 0m9XNOu7C6R2/6a8LXIDzZ7o/dSgFdeCVzHohZZunw8RCohdNsAowoJAjhOgWlPEWuyM
 Av6mdu9MNBo5NucHEdB5DDI+L5X+MJYTwYp9Wy3Uxdd42TgQAtkPktXwd8CPrlKtjYgS
 1TcTKtkZ8onn+VK6Fo2QSSeY20zGjW9UMDmCJa67Qz4gW39YsuRZ9JBSuUDfgBp/NUWV
 VnD8deqZawD6y13nOQCfFJ45KTkrCxjdmtefNxtr2YjyikgFiHV10D+R6SYDgmJxByHG
 cGbg==
X-Gm-Message-State: AJcUukeoeBVmQbYbJqBO78QJ48Pc4uXPb4FHc3J51E+RhfKRPJYoFXp7
 TFFWiX4euojnnLvzksMszujpY8wfpp/JmWHiVIk0cZR2
X-Google-Smtp-Source: ALg8bN430mKX8LTjKgKid+yPZWRoEENWci1FzD37dBg2yuQ8n47avPBmTrh+f81Efp0lSEDJPbg7x/L410stoee9UX0=
X-Received: by 2002:a6b:92d7:: with SMTP id
 u206mr30356262iod.174.1546376786239; 
 Tue, 01 Jan 2019 13:06:26 -0800 (PST)
MIME-Version: 1.0
From: Wojtek Swiatek <w@swtk.info>
Date: Tue, 1 Jan 2019 22:05:50 +0100
Message-ID: <CAPRYYOZEj55phSnyqHyrGcOt5w0vyfx_VV3y4kYc_CUVM-vPiA@mail.gmail.com>
Subject: problems setting up wireguard: no traffic but kepalives reach the
 server
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Wed, 02 Jan 2019 19:00:27 +0100
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1902814943304134145=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============1902814943304134145==
Content-Type: multipart/alternative; boundary="0000000000000874f4057e6be752"

--0000000000000874f4057e6be752
Content-Type: text/plain; charset="UTF-8"

Hello everyone,

I have just installed wireguard so I apologies if some things I missed may
be obvious. As a background: I have a working OpenVPN connection to my
server and wanted to have a wireguard setup in parallel to compare both.
The server is installed on a Ubuntu bionic (LTS) and the client is on a AWS
machine (Ubuntu as well).

Server perspective:

root@srv /e/wireguard# wg show
interface: wg0
  public key: A7MreEBC3maH305tVrU0HEoQrBhy+An6KlvZ+z9KFRA=
  private key: (hidden)
  listening port: 51820

peer: 2At7asuH2ay1vMvg9H8BZvUU5mnJ97VGlDwQWT1l1C8=
  preshared key: (hidden)
  allowed ips: 0.0.0.0/0

Client perspective (X.X.X.X is my Internet-facing IP):

# wg show
interface: wg0
  public key: 2At7asuH2ay1vMvg9H8BZvUU5mnJ97VGlDwQWT1l1C8=
  private key: (hidden)
  listening port: 33960

peer: YUd1mFAOyn01G2/n942hk9LZ0mfhUm4nHb/3xMVSETc=
  preshared key: (hidden)
  endpoint: X.X.X.X:51820
  allowed ips: 0.0.0.0/0
  transfer: 0 B received, 98.86 KiB sent
  persistent keepalive: every 10 seconds


On the server, the traffic to wg0 is redirected (to wg0) for port 51820. I
am surprised that there is no actual service listening to 51820 (as seen by
lsof or netstat) but I assume this is some wireguard voodoo (such as "if a
packet directed to port 51820 gets to me(wg0) tehn I will be correctly
dealing with it).

I then tried to ping:

- on the client: the IP of its own wg0 (10.250.0.1): OK
- on the server: the IP of its own wg0 (10.250.0.254): OK
- on the client: 10.250.0.254 (the IP of the other side of the VPN = on the
server): KO = nothing happens (ICMP echo is sent, as seen on tcpdump)
- on the server: 10.250.0.1 (the IP of the other side of the VPN = on the
client): KO =

root@srv ~# ping 10.250.0.1
PING 10.250.0.1 (10.250.0.1) 56(84) bytes of data.
From 10.250.0.254 icmp_seq=1 Destination Host Unreachable
ping: sendmsg: Destination address required
ping: sendmsg: Destination address required
From 10.250.0.254 icmp_seq=2 Destination Host Unreachable
ping: sendmsg: Destination address required
From 10.250.0.254 icmp_seq=3 Destination Host Unreachable
From 10.250.0.254 icmp_seq=4 Destination Host Unreachable

I had a look at my internet interface (tcpdump filtered on port 51820) and
I see, every 10 seconds, a UDP packet coming in (192.168.0.10 is the IP of
the internet-exposed dev):

root@srv ~# tcpdump -i any port 51820 -nn
tcpdump: verbose output suppressed, use -v or -vv for full protocol decode
listening on any, link-type LINUX_SLL (Linux cooked), capture size 262144
bytes
21:15:41.944090 IP 35.180.168.248.33960 > 192.168.0.10.51820: UDP, length
148
21:15:47.320081 IP 35.180.168.248.33960 > 192.168.0.10.51820: UDP, length
148

So this means that the client sends a UDP packet to the external IP
(X.X.X.X), to port 51820. This packet is then forwarded to interface wg0.

Is there a way to check with wireguard that a connection is established (=
that the server receives data, or a connection attempt (even unsuccessful)
is being done)?

--0000000000000874f4057e6be752
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr">Hello everyone,<div><br></div><div>I have just installed wireguar=
d so I apologies if some things I missed may be obvious. As a background: I=
 have a working OpenVPN connection to my server and wanted to have a wiregu=
ard setup in parallel to compare both.</div><div>The server is installed on=
 a Ubuntu bionic (LTS) and the client is on a AWS machine (Ubuntu as well).=
</div><div><br></div><div>Server perspective:</div><div><br></div><div><div=
>root@srv /e/wireguard# wg show</div><div>interface: wg0</div><div>=C2=A0 p=
ublic key: A7MreEBC3maH305tVrU0HEoQrBhy+An6KlvZ+z9KFRA=3D</div><div>=C2=A0 =
private key: (hidden)</div><div>=C2=A0 listening port: 51820</div><div><br>=
</div><div>peer: 2At7asuH2ay1vMvg9H8BZvUU5mnJ97VGlDwQWT1l1C8=3D</div><div>=
=C2=A0 preshared key: (hidden)</div><div>=C2=A0 allowed ips: <a href=3D"htt=
p://0.0.0.0/0" target=3D"_blank">0.0.0.0/0</a></div></div><div><br></div><d=
iv>Client perspective (X.X.X.X is my Internet-facing IP):</div><div><br></d=
iv><div><div># wg show</div><div>interface: wg0</div><div>=C2=A0 public key=
: 2At7asuH2ay1vMvg9H8BZvUU5mnJ97VGlDwQWT1l1C8=3D</div><div>=C2=A0 private k=
ey: (hidden)</div><div>=C2=A0 listening port: 33960</div><div><br></div><di=
v>peer: YUd1mFAOyn01G2/n942hk9LZ0mfhUm4nHb/3xMVSETc=3D</div><div>=C2=A0 pre=
shared key: (hidden)</div><div>=C2=A0 endpoint: X.X.X.X:51820</div><div>=C2=
=A0 allowed ips: <a href=3D"http://0.0.0.0/0" target=3D"_blank">0.0.0.0/0</=
a></div><div>=C2=A0 transfer: 0 B received, 98.86 KiB sent</div><div>=C2=A0=
 persistent keepalive: every 10 seconds</div></div><div><br></div><div><br>=
</div><div>On the server, the traffic to wg0 is redirected (to wg0) for por=
t 51820. I am surprised that there is no actual service listening to 51820 =
(as seen by lsof or netstat) but I assume this is some wireguard voodoo (su=
ch as &quot;if a packet directed to port 51820 gets to me(wg0) tehn I will =
be correctly dealing with it).</div><div><br></div><div>I then tried to pin=
g:</div><div><br></div><div>- on the client: the IP of its own wg0 (10.250.=
0.1): OK</div><div>- on the server: the IP of its own wg0 (10.250.0.254): O=
K=C2=A0=C2=A0<br></div><div>- on the client: 10.250.0.254 (the IP of the ot=
her side of the VPN =3D on the server): KO =3D nothing happens (ICMP echo i=
s sent, as seen on tcpdump)</div><div>- on the server: 10.250.0.1 (the IP o=
f the other side of the VPN =3D on the client): KO =3D=C2=A0</div><div><div=
><br></div><div>root@srv ~# ping 10.250.0.1</div><div>PING 10.250.0.1 (10.2=
50.0.1) 56(84) bytes of data.</div><div>From 10.250.0.254 icmp_seq=3D1 Dest=
ination Host Unreachable</div><div>ping: sendmsg: Destination address requi=
red</div><div>ping: sendmsg: Destination address required</div><div>From 10=
.250.0.254 icmp_seq=3D2 Destination Host Unreachable</div><div>ping: sendms=
g: Destination address required</div><div>From 10.250.0.254 icmp_seq=3D3 De=
stination Host Unreachable</div><div>From 10.250.0.254 icmp_seq=3D4 Destina=
tion Host Unreachable</div></div><div><br></div><div>I had a look at my int=
ernet interface (tcpdump filtered on port 51820) and I see, every 10 second=
s, a UDP packet coming in (192.168.0.10 is the IP of the internet-exposed d=
ev):</div><div><br></div><div><div>root@srv ~# tcpdump -i any port 51820 -n=
n</div><div>tcpdump: verbose output suppressed, use -v or -vv for full prot=
ocol decode</div><div>listening on any, link-type LINUX_SLL (Linux cooked),=
 capture size 262144 bytes</div><div>21:15:41.944090 IP 35.180.168.248.3396=
0 &gt; 192.168.0.10.51820: UDP, length 148</div><div>21:15:47.320081 IP 35.=
180.168.248.33960 &gt; 192.168.0.10.51820: UDP, length 148</div></div><div>=
<br></div><div>So this means that the client sends a UDP packet to the exte=
rnal IP (X.X.X.X), to port 51820. This packet is then forwarded to interfac=
e wg0.</div><div><br></div><div>Is there a way to check with wireguard that=
 a connection is established (=3D that the server receives data, or a conne=
ction attempt (even unsuccessful) is being done)?</div><div><br></div><div>=
<br></div></div></div></div></div></div>

--0000000000000874f4057e6be752--

--===============1902814943304134145==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============1902814943304134145==--
