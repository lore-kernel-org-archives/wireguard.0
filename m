Return-Path: <SRS0=ZSUP=4L=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	NUMERIC_HTTP_ADDR,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F5ABC35671
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 23 Feb 2020 10:37:18 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8B3BE206ED
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 23 Feb 2020 10:37:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=panagiotou.net header.i=@panagiotou.net header.b="O2QR7Xf6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8B3BE206ED
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=panagiotou.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c236244b;
	Sun, 23 Feb 2020 10:27:54 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 669f8c49
 for <wireguard@lists.zx2c4.com>;
 Sat, 22 Feb 2020 20:32:58 +0000 (UTC)
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id af1dd5f6
 for <wireguard@lists.zx2c4.com>;
 Sat, 22 Feb 2020 20:32:58 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id l16so4023050lfg.2
 for <wireguard@lists.zx2c4.com>; Sat, 22 Feb 2020 12:36:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=panagiotou.net; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=/AOsrOgttOu0SlGHXk1Wnp4tGQrQ75xBe5NGJ73d9rE=;
 b=O2QR7Xf6DWGKXF4Nk8aOZPz/OcLo9E6w0wDskiPuQZSzFcXYLBMTwOxNP6jZsyCXRK
 A9qRAEsebvEC9ECK91NkuIe1gXOwZf7AV2HzLOex33gVoFMIT/Aa1qNN3AcT9KWro+0z
 7EKpJTls6FfO0StP94zhihdNNEAc64aVTLavU71Ft3n4uoc84V7Zb9tiXx72vOyyzJy7
 6ZJ2sIXQQGB1AYcud15UUhEwnjxSiOA16M49TXcLRdP4KFD2C1QF9Hr9yCgwbz2Bomg4
 p34sL7wI+OWVlh0YkdowIwCRjlvVhA7+Az8VlU5bPUaweC0BNBeQO8oj08niqAYh/lC9
 Az/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=/AOsrOgttOu0SlGHXk1Wnp4tGQrQ75xBe5NGJ73d9rE=;
 b=VNdD57pndOKQnY9AhMySjP1GbRxEEsC9jaLZG3BmIxK6bIi/Lx5Zv1cHYWuIvjIxP1
 +vu4EL/WK3JMyR9iG3OqlLC/Q2XP9ZcNIr4p2cLnGeRCDy2p/iuPVn4eFotoDRYURQUj
 OHCAvNyIL7IrSd0rUJBtuQ5B5WR+fCibZpu8zlR464bxblQILY2TW5oF/orbkYKmRb5y
 xjtBfoq75fW8fmb49rwkMf+3QjHEO3xRSg+zGDMoObMUBSZ4Q/e3Ui7qVr10SOgJUnfR
 MW7hfkLgbCJoPKC/jnTfPuqnLUMfUJSEPvUY/FOzGgHEq4j+dfii7l9RH4PPFO3S+DRa
 5M2g==
X-Gm-Message-State: APjAAAXQeRBBs7bmfJajz+BLtewjMaInumfMpWkg88FcJJovhGbKa6XH
 BEj/ZvU8hsL7XpNF7tkOQ6perUIz1YFIzh+gXVqGuYgB8upHAw==
X-Google-Smtp-Source: APXvYqxtWZaLhoWFUXTXN0nFp75k67www7ZM4leJQUPVtWwcDPCxuY366V3K3Edi0sneAbmEVoOPvzGEcZPZkbQy2k0=
X-Received: by 2002:a19:4f46:: with SMTP id a6mr23249044lfk.143.1582403767107; 
 Sat, 22 Feb 2020 12:36:07 -0800 (PST)
MIME-Version: 1.0
From: "Dimitri J. Panagiotou" <dimitri@panagiotou.net>
Date: Sat, 22 Feb 2020 12:35:57 -0800
Message-ID: <CAPMuNSoJaLGxTErezypvgh4j6iD9Kj2eh2UtEaGLANqjgwJ6YQ@mail.gmail.com>
Subject: xtables lock at startup?
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Sun, 23 Feb 2020 11:27:41 +0100
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
Content-Type: multipart/mixed; boundary="===============0617218168462474055=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============0617218168462474055==
Content-Type: multipart/alternative; boundary="0000000000006e1cff059f30166c"

--0000000000006e1cff059f30166c
Content-Type: text/plain; charset="UTF-8"

Hi,

Since upgrading to Fedora 31 (5.5), wireguard (latest) does not start after
rebooting.
It does start with no problem at all after rebooting, by manually running
wg-quick.

This is what I get:
-- Reboot --
Feb 22 01:19:48 myservername systemd[1]: Starting WireGuard via wg-quick(8)
for wg0...
Feb 22 01:19:49 myservername wg-quick[1173]: [#] ip link add wg0 type
wireguard
Feb 22 01:19:49 myservername wg-quick[1173]: [#] wg setconf wg0 /dev/fd/63
Feb 22 01:19:50 myservername wg-quick[1173]: [#] ip -4 address add
10.12.182.1/24 dev wg0
Feb 22 01:19:50 myservername wg-quick[1173]: [#] ip link set mtu 1420 up
dev wg0
Feb 22 01:19:50 myservername wg-quick[1173]: [#] mount `10.12.197.1'
/etc/resolv.conf
Feb 22 01:19:51 myservername wg-quick[1173]: [#] iptables -A FORWARD -i wg0
-j ACCEPT; iptables -t nat -A POSTROUTING -o enp2s0 -j MASQUERADE
Feb 22 01:19:51 myservername wg-quick[1173]: Another app is currently
holding the xtables lock. Perhaps you want to use the -w option?
Feb 22 01:19:51 myservername wg-quick[1173]: [#] umount /etc/resolv.conf
Feb 22 01:19:51 myservername wg-quick[1173]: [#] ip link delete dev wg0
Feb 22 01:19:51 myservername systemd[1]: wg-quick@wg0.service: Main process
exited, code=exited, status=4/NOPERMISSION
Feb 22 01:19:51 myservername systemd[1]: wg-quick@wg0.service: Failed with
result 'exit-code'.
Feb 22 01:19:51 myservername systemd[1]: Failed to start WireGuard via
wg-quick(8) for wg0.

Running
wireguard-dkms.noarch                         1:0.0.20200215-2.fc31
         @jdoss-wireguard
wireguard-tools.x86_64                        1:1.0.20200102-1.fc31
         @jdoss-wireguard

Any idea what's causing this?

Thanks,
-dimitri

--0000000000006e1cff059f30166c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:tahoma,s=
ans-serif;color:#330033">Hi,</div><div class=3D"gmail_default" style=3D"fon=
t-family:tahoma,sans-serif;color:#330033"><br></div><div class=3D"gmail_def=
ault" style=3D"font-family:tahoma,sans-serif;color:#330033">Since upgrading=
 to Fedora 31 (5.5), wireguard (latest) does not start after rebooting.</di=
v><div class=3D"gmail_default" style=3D"font-family:tahoma,sans-serif;color=
:#330033">It does start with no problem at all after rebooting, by manually=
 running wg-quick.</div><div class=3D"gmail_default" style=3D"font-family:t=
ahoma,sans-serif;color:#330033"><br></div><div class=3D"gmail_default" styl=
e=3D"font-family:tahoma,sans-serif;color:#330033">This is what I get:</div>=
<div class=3D"gmail_default" style=3D"font-family:tahoma,sans-serif"><font =
color=3D"#330033">-- Reboot --</font><br><font color=3D"#330033">Feb 22 01:=
19:48 myservername systemd[1]: Starting WireGuard via wg-quick(8) for wg0..=
.</font><br><font color=3D"#330033">Feb 22 01:19:49 myservername wg-quick[1=
173]: [#] ip link add wg0 type wireguard</font><br><font color=3D"#330033">=
Feb 22 01:19:49 myservername wg-quick[1173]: [#] wg setconf wg0 /dev/fd/63<=
/font><br><font color=3D"#330033">Feb 22 01:19:50 myservername wg-quick[117=
3]: [#] ip -4 address add <a href=3D"http://10.12.182.1/24">10.12.182.1/24<=
/a> dev wg0</font><br><font color=3D"#330033">Feb 22 01:19:50 myservername =
wg-quick[1173]: [#] ip link set mtu 1420 up dev wg0</font><br><font color=
=3D"#330033">Feb 22 01:19:50 myservername wg-quick[1173]: [#] mount `10.12.=
197.1&#39; /etc/resolv.conf</font><br><font color=3D"#330033">Feb 22 01:19:=
51 myservername wg-quick[1173]: [#] iptables -A FORWARD -i wg0 -j ACCEPT; i=
ptables -t nat -A POSTROUTING -o enp2s0 -j MASQUERADE</font><br><font color=
=3D"#ff0000">Feb 22 01:19:51 myservername wg-quick[1173]: Another app is cu=
rrently holding the xtables lock. Perhaps you want to use the -w option?</f=
ont><br><font color=3D"#330033">Feb 22 01:19:51 myservername wg-quick[1173]=
: [#] umount /etc/resolv.conf</font><br><font color=3D"#330033">Feb 22 01:1=
9:51 myservername wg-quick[1173]: [#] ip link delete dev wg0</font><br><fon=
t color=3D"#330033">Feb 22 01:19:51 myservername systemd[1]: wg-quick@wg0.s=
ervice: Main process exited, code=3Dexited, status=3D4/NOPERMISSION</font><=
br><font color=3D"#330033">Feb 22 01:19:51 myservername systemd[1]: wg-quic=
k@wg0.service: Failed with result &#39;exit-code&#39;.</font><br><font colo=
r=3D"#330033">Feb 22 01:19:51 myservername systemd[1]: Failed to start Wire=
Guard via wg-quick(8) for wg0.</font><br></div><div class=3D"gmail_default"=
 style=3D"font-family:tahoma,sans-serif;color:#330033"><br></div><div class=
=3D"gmail_default" style=3D"font-family:tahoma,sans-serif;color:#330033">Ru=
nning=C2=A0</div><div class=3D"gmail_default" style=3D"font-family:tahoma,s=
ans-serif;color:#330033">wireguard-dkms.noarch =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1:0.0.20200215-2.fc=
31 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0@jdoss-wir=
eguard<br>wireguard-tools.x86_64 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01:1.0.20200102-1.fc31 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0@jdoss-wireguard<br></d=
iv><div class=3D"gmail_default" style=3D"font-family:tahoma,sans-serif;colo=
r:#330033"><br></div><div class=3D"gmail_default" style=3D"font-family:taho=
ma,sans-serif;color:#330033">Any idea what&#39;s causing this?=C2=A0=C2=A0<=
/div><div class=3D"gmail_default" style=3D"font-family:tahoma,sans-serif;co=
lor:#330033"><br></div><div class=3D"gmail_default" style=3D"font-family:ta=
homa,sans-serif;color:#330033">Thanks,</div><div class=3D"gmail_default" st=
yle=3D"font-family:tahoma,sans-serif;color:#330033">-dimitri</div><div clas=
s=3D"gmail_default" style=3D"font-family:tahoma,sans-serif;color:#330033"><=
br></div><div class=3D"gmail_default" style=3D"font-family:tahoma,sans-seri=
f;color:#330033"><br></div></div>

--0000000000006e1cff059f30166c--

--===============0617218168462474055==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============0617218168462474055==--
