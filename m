Return-Path: <SRS0=ZPcD=WX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	NUMERIC_HTTP_ADDR,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D16FC3A5A3
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 27 Aug 2019 17:21:21 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C1D2F214DA
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 27 Aug 2019 17:21:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I3raFSZL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C1D2F214DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 40dab678;
	Tue, 27 Aug 2019 17:20:53 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2df81416
 for <wireguard@lists.zx2c4.com>;
 Tue, 27 Aug 2019 17:20:51 +0000 (UTC)
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a250058c
 for <wireguard@lists.zx2c4.com>;
 Tue, 27 Aug 2019 17:20:51 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id u13so5919368lfm.9
 for <wireguard@lists.zx2c4.com>; Tue, 27 Aug 2019 10:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=PFwDZOeUbmicMKSKZQmHv5vfE5Sk+nkVqw24wfuEU/U=;
 b=I3raFSZLF4pOJ3r9fqpH7jIusZrVqMwiUYLA5ytCi4J1171EF7sVsBKmr/ZcjB/u2a
 thBt5avoIsL7DUxy9buTJLBfdYxKPyz2Pa2N1VD4O4+Cp4L9X4LER1zmHwMRKDJWhf7e
 oegMdHCGV/+hSxgk9kHE+mq9ARkYFP3mjgX9WrFhotAqjokXlfPBN0LfEtHSm6g6mSuF
 +cVHl/TE0nRCYVmZYIyTk+zrY0MHppwkOgb0lo5bzyN/urdoBaa+4ixDKEEfIP3H7nKB
 ZCcCwEi5Q/YlUx13vQ9MNu8I6nHYo0TLS7YikhYjKn4EImiOfUCgG7FhaasQH6khzkOZ
 IxPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=PFwDZOeUbmicMKSKZQmHv5vfE5Sk+nkVqw24wfuEU/U=;
 b=NBgdwPrilRMs+RRwRZ2csLkrtEF0yzpEv2KfKPd8ELnwYtrB1+Js+SF4kXQFU1qKeT
 qkEQtAm8yKyuiyJxvPaYgRK0jagjKCGytHibCW4IM0GdNP6H1UKh2P0OuHfRm0/t/lJJ
 L1FNWjkNoQfRa30LKl3FbuT3uObAk7ZPkPD/A3Fjh/BgamkLEvqPjNiyWPucWx2b/j2k
 KFMGobdt91p19dH9lcYKBR085Dc6kjdF4P+ImGyC5uO4/q6SGO+DkReepWvSnuELAPAC
 LM7HX52vcCC0Jwf9twbb4QmIHbHxLuQYPxI3lFULsw+I9NhhYqcWyTbpIw/fxUd6NYKg
 qe6A==
X-Gm-Message-State: APjAAAUIuSr+F6VRS24z2INWUnnDcu7l2nUK8FhxRBiLeTY9UARdt+Xk
 sXVFdt3OfKe95UZLwUuvyTPRWHyD0exaIunD/06YQAJH
X-Google-Smtp-Source: APXvYqzBsjZHkLOhTvaQ6/cUxkuuGAmgW38JXjrLme46x6RCCE22nXePbIgf6QxywwVc0+5tTin2KLErcNgi2T4y0F8=
X-Received: by 2002:a05:6512:50f:: with SMTP id
 o15mr14424371lfb.63.1566926449022; 
 Tue, 27 Aug 2019 10:20:49 -0700 (PDT)
MIME-Version: 1.0
From: Dimitar Vassilev <dimitar.vassilev@gmail.com>
Date: Tue, 27 Aug 2019 20:20:37 +0300
Message-ID: <CAF+AZZVktGm19scLjT4Ku-JyQGyxQGfsLFSf=wybyuuiuoULQw@mail.gmail.com>
Subject: need a hand with WG setup
To: wireguard@lists.zx2c4.com
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
Content-Type: multipart/mixed; boundary="===============3466494325108196602=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============3466494325108196602==
Content-Type: multipart/alternative; boundary="00000000000062196e05911c7ec9"

--00000000000062196e05911c7ec9
Content-Type: text/plain; charset="UTF-8"

Hello,

I'm trying to establish site to site VPN with 2 OpenWRTs 18.6.4 - linux
4.9.184

my problem is that I cannot get any ping running and cannot reach the
remote tunnel ips.
Below is my setup
# ip r
default via 95.87.xxx.xxx dev eth0.2 proto static src 95.87.xxx.xx
95.87.xxx.0/24 dev eth0.2 proto kernel scope link src 95.87.xxxxx.xxx
130.204.xxx.xxx via 95.87.xxx.x dev eth0.2 proto static
192.168.11.0/24 dev br-lan proto kernel scope link src 192.168.11.1
192.168.100.1xx/25 dev wgknxvtun0 proto static scope link
192.168.101.0/24 dev wgknxvrtun0 proto kernel scope link src 192.168.101.1
216.66.xx.xx via 95.87.xxx.1 dev eth0.2 proto static

root@OpenWrt:~# wg show
interface: wgknxvtun0
  public key: f6
  private key: (hidden)
  listening port: 51820

peer: ThW
  endpoint: 130.204.xxx.xxx:51820
  allowed ips: 192.168.100.128/25
  latest handshake: 2 minutes, 15 seconds ago
  transfer: 134.86 KiB received, 121.67 KiB sent
  persistent keepalive: every 25 seconds

  root@OpenWrt:~# wg showconf wgknxvtun0
  [Interface]
  ListenPort = 51820
  PrivateKey = xxxx

  [Peer]
  PublicKey = Tx
  AllowedIPs = 192.168.100.128/25
  Endpoint = 130.204.x.x:51820
  PersistentKeepalive = 25

I've setup a separate FW zone where input, forward and output are default.
Ideas what I'm missing are welcome.

Best,
Dimitar

--00000000000062196e05911c7ec9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div><br></div><div>I&#39;m trying to establish site=
 to site VPN with 2 OpenWRTs 18.6.4 - linux 4.9.184</div><div><br></div><di=
v>my problem is that I cannot get any ping running and cannot reach the rem=
ote tunnel ips.</div><div>Below is my setup</div><div># ip r<br>default via=
 95.87.xxx.xxx dev eth0.2 proto static src 95.87.xxx.xx <br>95.87.xxx.0/24 =
dev eth0.2 proto kernel scope link src 95.87.xxxxx.xxx <br>130.204.xxx.xxx =
via 95.87.xxx.x dev eth0.2 proto static <br><a href=3D"http://192.168.11.0/=
24">192.168.11.0/24</a> dev br-lan proto kernel scope link src 192.168.11.1=
 <br>192.168.100.1xx/25 dev wgknxvtun0 proto static scope link <br><a href=
=3D"http://192.168.101.0/24">192.168.101.0/24</a> dev wgknxvrtun0 proto ker=
nel scope link src 192.168.101.1 <br>216.66.xx.xx via 95.87.xxx.1 dev eth0.=
2 proto static <br><br>root@OpenWrt:~# wg show<br>interface: wgknxvtun0<br>=
=C2=A0 public key: f6<br>=C2=A0 private key: (hidden)<br>=C2=A0 listening p=
ort: 51820<br><br>peer: ThW<br>=C2=A0 endpoint: 130.204.xxx.xxx:51820<br>=
=C2=A0 allowed ips: <a href=3D"http://192.168.100.128/25">192.168.100.128/2=
5</a><br>=C2=A0 latest handshake: 2 minutes, 15 seconds ago<br>=C2=A0 trans=
fer: 134.86 KiB received, 121.67 KiB sent<br>=C2=A0 persistent keepalive: e=
very 25 seconds<br><br>=C2=A0 root@OpenWrt:~# wg showconf wgknxvtun0<br>=C2=
=A0 [Interface]<br>=C2=A0 ListenPort =3D 51820<br>=C2=A0 PrivateKey =3D xxx=
x<br><br>=C2=A0 [Peer]<br>=C2=A0 PublicKey =3D Tx<br>=C2=A0 AllowedIPs =3D =
<a href=3D"http://192.168.100.128/25">192.168.100.128/25</a><br>=C2=A0 Endp=
oint =3D 130.204.x.x:51820<br>=C2=A0 PersistentKeepalive =3D 25<br></div><d=
iv><br></div><div>I&#39;ve setup a separate FW zone where input, forward an=
d output are default.</div><div>Ideas what I&#39;m missing are welcome.</di=
v><div><br></div><div>Best,</div><div>Dimitar</div></div>

--00000000000062196e05911c7ec9--

--===============3466494325108196602==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============3466494325108196602==--
