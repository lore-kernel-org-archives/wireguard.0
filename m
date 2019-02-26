Return-Path: <SRS0=tKTr=RX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED,WEIRD_PORT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93DEEC43381
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 Mar 2019 22:38:29 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F08A720830
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 20 Mar 2019 22:38:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=swtk.info header.i=@swtk.info header.b="dL46cMHF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F08A720830
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=swtk.info
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 26708d52;
	Wed, 20 Mar 2019 22:38:07 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bb78b101
 for <wireguard@lists.zx2c4.com>;
 Tue, 26 Feb 2019 09:50:16 +0000 (UTC)
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id aea9e209
 for <wireguard@lists.zx2c4.com>;
 Tue, 26 Feb 2019 09:50:16 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id i8so9835215oib.10
 for <wireguard@lists.zx2c4.com>; Tue, 26 Feb 2019 01:59:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=swtk.info; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=zB5QdqBgLDq9wYTNq+1LBe/EzKppxSysKX/p1weU6Dg=;
 b=dL46cMHF9nF7Mt10sOGgQjbqepZT7DAeSjG+88PhXDNwNYcQTYuh5cwUEIuAuF+cm6
 TeZ0QdKP8v60kpaq12EPgX6KQRL/oTL+sm2o5Slt3HXLm+scZ5FPF4q9ae/R7amgSPdo
 WZAWdVxf4QyLdd7l4+s60QqfGkP4o9JjJQKFE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=zB5QdqBgLDq9wYTNq+1LBe/EzKppxSysKX/p1weU6Dg=;
 b=kEz0hRTCOkle/ewkgWNTvYfHA6PMbJXDPLGjdpoSph8KC0HIGCqQoXmYDnKbfBFPtt
 eHzSKdqlNpX9DR8I3J1/0BgVP9csw/jroT9K4ZYvllEceVjeU5UipmUFe5t+NjJ5Zo+1
 +F5QaDLsTMZmLNVUQDiAz7zG3EeI7yLKpBjA1R/vFQx474NpmTy9PdW1ZD00xQtQHH/x
 1jyqTcs0DqOyY8KIhWNCq7Sl7RJ8tg7rf4+9BZrbHiJNBiog9hrrtsrCw+MdoKmkke3q
 33tZ+FOTlN8ZirdsBYbHUd7us951ytwreejduRBi3vU93UNq4QWTrB6zqaWYdlYnfto0
 bgHw==
X-Gm-Message-State: AHQUAuY352b9L/HwlEKExzIuJSkURlFZKbg1KLdTkV13EmaAacnAIEGM
 8iPX83S28/W7NMHcOb5zo0391FoVC1wcWziYAmOJc44ytvY=
X-Google-Smtp-Source: AHgI3IZmXxJDsC1PG7nIsUd+o1hnqjid41ctWZy+G6lYi/Vw1QGA0k7d5QQHqFqYlcGb87ZJvt0MeMRVTqImSTNi5uU=
X-Received: by 2002:aca:8c9:: with SMTP id 192mr919980oii.164.1551175180442;
 Tue, 26 Feb 2019 01:59:40 -0800 (PST)
MIME-Version: 1.0
From: Wojtek Swiatek <w@swtk.info>
Date: Tue, 26 Feb 2019 10:59:06 +0100
Message-ID: <CAPRYYOZY_fPDkQyebrY6vu7CTvzHoniHyhiZwNHLS6zfgk5JQg@mail.gmail.com>
Subject: How to debug wireguard on the server?
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Wed, 20 Mar 2019 23:38:05 +0100
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
Content-Type: multipart/mixed; boundary="===============4056950824355919529=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============4056950824355919529==
Content-Type: multipart/alternative; boundary="0000000000009d74ee0582c91dbb"

--0000000000009d74ee0582c91dbb
Content-Type: text/plain; charset="UTF-8"

Hello everyone

I am trying to set up wireguard on a Linux server (Ubuntu 18.04) and I am
having some issues. The configuration of the server:

[Interface]
Address = 192.168.20.1/24
ListenPort = 51820
PrivateKey = UbuntuPrivateKey

# the laptop I want to connect from
[Peer]
# this public key is derived from the laptop's private key LaptopPrivateKey
PublicKey = kExj276RLpqCZoDdOYHiq4FQHKA94y0eY1W/ptvT2y4=
AllowedIPs = 192.168.20.0/24

Bringing up the wg0 interface via wg-quick is OK:

root@srv ~# wg
interface: wg0
  public key: A7MreEBC3maH305tVrU0HEoQrBhy+An6KlvZ+z9KFRA=
  private key: (hidden)
  listening port: 51820

peer: kExj276RLpqCZoDdOYHiq4FQHKA94y0eY1W/ptvT2y4=
  allowed ips: 192.168.20.0/24

I have a client peer configured as well:

[Interface]
Address = 192.168.20.2/24
ListenPort = 51820
PrivateKey = LaptopPrivateKey

# the server I want to connect to
[Peer]
# this public key is derived from the server's private key UbuntuPrivateKey
PublicKey = A7MreEBC3maH305tVrU0HEoQrBhy+An6KlvZ+z9KFRA=
AllowedIPs = 192.168.20.0/24
# Address of the server
Endpoint = wireguard.example.com:51820
# Send periodic keepalives to ensure connection stays up behind NAT.
PersistentKeepalive = 25

When connecting from the client, I see handshake packets leaving it, and
arriving on the server - on its external interface:

root@srv ~# tcpdump -i eth0 port 51820 -vvv -X
tcpdump: listening on br0, link-type EN10MB (Ethernet), capture size 262144
bytes
10:35:29.386976 IP (tos 0x0, ttl 115, id 17333, offset 0, flags [none],
proto UDP (17), length 176)
    91-244-238-14.rev.ltt.li.59958 > srv.swtk.info.51820: [udp sum ok] UDP,
length 148
        0x0000:  4500 00b0 43b5 0000 7311 eeda 5bf4 ee0e  E...C...s...[...
        0x0010:  c0a8 0a02 ea36 ca6c 009c 98e7 0100 0000  .....6.l........
        0x0020:  ac50 0f85 6ead 67f6 2c38 4b74 43c4 6388  .P..n.g.,8KtC.c.
        0x0030:  f594 1886 6699 f439 183e ad2b 0e02 4e13  ....f..9.>.+..N.
        0x0040:  c1a8 d14a f1c6 8d13 1f98 8c2c 6cfd dbf6  ...J.......,l...
        0x0050:  9f2f 8d35 9073 bad1 ddd7 927e 0552 aadf  ./.5.s.....~.R..

The same tcpdump command ran against wg0 does not show any traffic (but
maybe this is normal?)

The client keeps on sending handshake packets.

Q1: is there anything I should do in order for the packets to reach wg0, or
do they reach it but I just do not see that with tcpdump (sorry, I am not
well versed with virtual interfaces)
Q2: if there is nothing more to do than a wg-quick, is there a way to debug
the server to understand what happens with this handshake packet (= it is
rejected because ...)

Thanks!

--0000000000009d74ee0582c91dbb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div di=
r=3D"ltr">Hello everyone<div><br></div><div>I am trying to set up wireguard=
 on a Linux server (Ubuntu 18.04) and I am having some issues. The configur=
ation of the server:</div><div><br></div><div><div>[Interface]</div><div>Ad=
dress =3D <a href=3D"http://192.168.20.1/24">192.168.20.1/24</a></div><div>=
ListenPort =3D 51820</div><div>PrivateKey =3D UbuntuPrivateKey</div><div><b=
r></div><div># the laptop I want to connect from</div><div>[Peer]</div><div=
># this public key is derived from the laptop&#39;s private key LaptopPriva=
teKey</div><div>PublicKey =3D kExj276RLpqCZoDdOYHiq4FQHKA94y0eY1W/ptvT2y4=
=3D</div><div>AllowedIPs =3D <a href=3D"http://192.168.20.0/24">192.168.20.=
0/24</a></div></div><div><br></div><div>Bringing up the wg0 interface via w=
g-quick is OK:</div><div><br></div><div><div>root@srv ~# wg</div><div>inter=
face: wg0</div><div>=C2=A0 public key: A7MreEBC3maH305tVrU0HEoQrBhy+An6KlvZ=
+z9KFRA=3D</div><div>=C2=A0 private key: (hidden)</div><div>=C2=A0 listenin=
g port: 51820</div><div><br></div><div>peer: kExj276RLpqCZoDdOYHiq4FQHKA94y=
0eY1W/ptvT2y4=3D</div><div>=C2=A0 allowed ips: <a href=3D"http://192.168.20=
.0/24">192.168.20.0/24</a></div></div><div><br></div><div>I have a client p=
eer configured as well:</div><div><br></div><div><div>[Interface]</div><div=
>Address =3D <a href=3D"http://192.168.20.2/24">192.168.20.2/24</a></div><d=
iv>ListenPort =3D 51820</div><div>PrivateKey =3D LaptopPrivateKey</div><div=
><br></div><div># the server I want to connect to</div><div>[Peer]</div><di=
v># this public key is derived from the server&#39;s private key UbuntuPriv=
ateKey</div><div>PublicKey =3D A7MreEBC3maH305tVrU0HEoQrBhy+An6KlvZ+z9KFRA=
=3D</div><div>AllowedIPs =3D <a href=3D"http://192.168.20.0/24">192.168.20.=
0/24</a></div><div># Address of the server</div><div>Endpoint =3D <a href=
=3D"http://wireguard.example.com:51820">wireguard.example.com:51820</a></di=
v><div># Send periodic keepalives to ensure connection stays up behind NAT.=
</div><div>PersistentKeepalive =3D 25</div></div><div><br></div><div>When c=
onnecting from the client, I see handshake packets leaving it, and arriving=
 on the server - on its external interface:</div><div><br></div><div><div>r=
oot@srv ~# tcpdump -i eth0 port 51820 -vvv -X</div><div>tcpdump: listening =
on br0, link-type EN10MB (Ethernet), capture size 262144 bytes</div><div>10=
:35:29.386976 IP (tos 0x0, ttl 115, id 17333, offset 0, flags [none], proto=
 UDP (17), length 176)</div><div>=C2=A0 =C2=A0 91-244-238-14.rev.ltt.li.599=
58 &gt; srv.swtk.info.51820: [udp sum ok] UDP, length 148</div><div>=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 0x0000:=C2=A0 4500 00b0 43b5 0000 7311 eeda 5bf4 ee0e=
=C2=A0 E...C...s...[...</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0010:=C2=A0=
 c0a8 0a02 ea36 ca6c 009c 98e7 0100 0000=C2=A0 .....6.l........</div><div>=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0020:=C2=A0 ac50 0f85 6ead 67f6 2c38 4b74 43c=
4 6388=C2=A0 .P..n.g.,8KtC.c.</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0030:=
=C2=A0 f594 1886 6699 f439 183e ad2b 0e02 4e13=C2=A0 ....f..9.&gt;.+..N.</d=
iv><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 0x0040:=C2=A0 c1a8 d14a f1c6 8d13 1f98 =
8c2c 6cfd dbf6=C2=A0 ...J.......,l...</div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 0x0050:=C2=A0 9f2f 8d35 9073 bad1 ddd7 927e 0552 aadf=C2=A0 ./.5.s.....~.R=
..</div></div><div><br></div><div>The same tcpdump command ran against wg0 =
does not show any traffic (but maybe this is normal?)</div><div><br></div><=
div>The client keeps on sending handshake packets.</div><div><br></div><div=
>Q1: is there anything I should do in order for the packets to reach wg0, o=
r do they reach it but I just do not see that with tcpdump (sorry, I am not=
 well versed with virtual interfaces)</div><div>Q2: if there is nothing mor=
e to do than a wg-quick, is there a way to debug the server to understand w=
hat happens with this handshake packet (=3D it is rejected because ...)</di=
v><div><br></div><div>Thanks!</div><div><br></div><div><br></div></div></di=
v></div></div></div>

--0000000000009d74ee0582c91dbb--

--===============4056950824355919529==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============4056950824355919529==--
