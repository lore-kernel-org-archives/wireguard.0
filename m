Return-Path: <SRS0=0s16=S3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	NORMAL_HTTP_TO_IP,SPF_PASS,URIBL_BLOCKED,WEIRD_PORT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 309DBC10F03
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 25 Apr 2019 12:01:37 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81BB62084B
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 25 Apr 2019 12:01:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=davz-net.20150623.gappssmtp.com header.i=@davz-net.20150623.gappssmtp.com header.b="rVVZn9W2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 81BB62084B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=davz.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b43cfdbb;
	Thu, 25 Apr 2019 12:01:18 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9b317715
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Apr 2019 04:03:04 +0000 (UTC)
Received: from mail-it1-x144.google.com (mail-it1-x144.google.com
 [IPv6:2607:f8b0:4864:20::144])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3c0e3989
 for <wireguard@lists.zx2c4.com>;
 Wed, 17 Apr 2019 04:03:03 +0000 (UTC)
Received: by mail-it1-x144.google.com with SMTP id y10so2290568itc.1
 for <wireguard@lists.zx2c4.com>; Tue, 16 Apr 2019 21:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=davz-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Lt+kPQ4mNZsp0VRClNxiScwcjGP//t0gvCY/jvQ9jGA=;
 b=rVVZn9W2Utcy0NYaJJDXwzXumr2JczEGBnDMfY22GDXldVp9wuWiFKPVxt0UgADH00
 eXwEeZDsXhDA0SPIRqzPSE8x1UnxrRR9O6mGGgkMGagNxbdxrl/6DnK02nSYllBf8PhF
 45eGMEHICTHiCWR5rJc3iEnrrMdhCJ9rr8mys25rWUMxtZlyC3oA6iEaLy19xCBVqLku
 WxX94HIdLGpz1mrazbmb8G2OJr240s052lBowXwYn5hB1JjwLMtiVyYHH2LT/YzzeImR
 At92wXPMi6DplLHFQBc1GQmaDAVvYhLydHOcwKqX+Uli0G6s2mnszUmQWpzpnOPlByIK
 e76w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Lt+kPQ4mNZsp0VRClNxiScwcjGP//t0gvCY/jvQ9jGA=;
 b=WwgsaAOGSXSJNFVG2PLD9GLSVrpENuv9uVWqwU0VO686pYQfjkpHZi/yzOpPqG6WuQ
 6j/WblHw52vpVlJuvgV/eheli4ftXbAYokqbg60MItmj9sau5PrsMD6CJfkoZw27nNTh
 yp8KGIan8IaKiNhWWZ3gcixuSov0gXWprHS/eM31F5BUR/0ozC3swqcSqB3Vu2v3pm84
 Wth5AND5cvpj1VZ2S/rzH6vrbSqyrAL8vJE4sJHIWTt1aJiooAxGkpVtrTzUbvD8oQ3p
 cesEzpocF+NuinsAk/P6zmcAgbS/iInn/YBLz3Zc6zextKoCFFtSfsr/wRJ7XHOIF7s/
 U3ZQ==
X-Gm-Message-State: APjAAAU3d7tqFQK3YdXbnjIo67j4t/vBmx4ZqBdSGXYH2LKtD2hyS2nX
 izPSJBp+QLQar6SKiC9vT1kLEZJfMDOOCT+OyZaoEZw0
X-Google-Smtp-Source: APXvYqyu8p9pXjn3tnLf85hpDBNUbKsUCWigk7sYougyW+XaBBD5Xp1MlVsBoffVjPk/D4EeLj/oHeK50zllXFXOSIM=
X-Received: by 2002:a24:6c54:: with SMTP id w81mr28397198itb.78.1555473782009; 
 Tue, 16 Apr 2019 21:03:02 -0700 (PDT)
MIME-Version: 1.0
References: <CAHwDNp2KzB7ivO7Y770kRgq60SPsxOjVhVdGtbEVjz0jsy23jg@mail.gmail.com>
In-Reply-To: <CAHwDNp2KzB7ivO7Y770kRgq60SPsxOjVhVdGtbEVjz0jsy23jg@mail.gmail.com>
From: Alex Davies <alex@davz.net>
Date: Wed, 17 Apr 2019 05:02:56 +0100
Message-ID: <CAHwDNp3k2pDb-x-Q4yJgHwsJGwVZ3YsO9Y18rhM1FOzGDh+Q-g@mail.gmail.com>
Subject: Table=off behavior (not adding any route *at all*)
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Thu, 25 Apr 2019 14:01:18 +0200
Cc: Alex Davies <adavies@jumptrading.com>, Simon Stace <sstace@jumptrading.com>,
 ad@opnsense.org
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
Content-Type: multipart/mixed; boundary="===============7491647918896382193=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============7491647918896382193==
Content-Type: multipart/alternative; boundary="0000000000003c10760586b1f69b"

--0000000000003c10760586b1f69b
Content-Type: text/plain; charset="UTF-8"

Hi,

We have been trying to use WireGuard on FreeBSD (we are using the WG plugin
inside the open source opnsense.org software). These run FreeBSD
11.2-RELEASE-p9-HBSD (OPNsense 19.7.a_288-amd64).

We noticed that by default (i.e. no Table=) wireguard-go wg0 adds default
routes (as two /31's) as expected. However, if table=off, we get no route
at all - not even to the VPN peer.

The announcement for the Table= option[1] stated:

  In collaboration with Luis Ressel, wg-quick(8) grew an option! We
generally
  do not like to add things to wg-quick or allow feature-creep, but this was
  basic enough and mostly involves disabling functionality. Specifically,
  wg-quick now accepts a Table= parameter with these semantics:

    ~ Table=auto (default) selects the current behaviour
    ~ Table=off disables creation of routes from allowed ips altogether
    ~ All other values are passed through to "ip route add"'s table option

  This should enable people to do basic policy routing. It also matches the
  functionality provided by LEDE/OpenWRT's uci config as well as NixOS's
  networking configuration.

Ignoring the "creation of routes from allowed ips", it does not even add
the subnet defined in [Interface]. netstat -r | grep wg returns nothing.

As a concrete example, if I take the trivial config at
https://wiki.archlinux.org/index.php/WireGuard:

[Interface]
Address = 10.200.200.2/24
PrivateKey = [FOO's PRIVATE KEY]
DNS = 10.200.200.1

[Peer]
PublicKey = [SERVER PUBLICKEY]
PresharedKey = [PRE-SHARED KEY]
AllowedIPs = 0.0.0.0/0, ::/0
Endpoint = my.ddns.address.com:51820

I would (naively) expect this:
Table=auto: inject route for 10.200.200.2/24 *and* 0.0.0.0/0 via wg0
Table=off: inject route for 10.200.200.2/24 *only* via wg0

What actually happens is:
Table=auto: as above/expected
Table=off: no route out wg0

This mean with Table=off, you are in the extremely confusing situation that
you cant even ping the other peer.

Testing on Linux (Kernel 4.15.0-1032-aws inside a 18.04 AMI (public AMI
- ami-07dc734dc14746eab)) shows that the behavior is different - its as I
expect for both Table values. With this wg0.conf:

root@ip-172-31-39-185:~# cat /etc/wireguard/wg0.conf
[Interface]
Address = 192.168.2.1/24
PrivateKey = eEIwdXp8jKV9/2MEwxYBqQLu4TZqBv9YWvG9fbMuaG4=
Table = off

[Peer]
PublicKey = pHQfWzLAUM85vDO6+MZAneBYhapOHUkPAuxr0lJdZlY=
AllowedIPs = 0.0.0.0/0
Endpoint = 18.130.138.71:51820

I get this route:

root@ip-172-31-39-185:~# ip route show | grep wg0
192.168.2.0/24 dev wg0 proto kernel scope link src 192.168.2.1

Note the /24 route (as expected). With Table undefined or set to auto, I
get the 0.0.0.0 route (also as expected).

I dont know much about FreeBSD, but I launched a test EC2 instance (FreeBSD
12.0-RELEASE based on public ami-0d244633039d93966 with kernel reported as
12.0-RELEASE-p3) and I think I see the same thing (i.e. no /24 route):

root@freebsd:/etc/wireguard # netstat -rn | grep wg0
192.168.2.5        link#3             UH          wg0
fe80::%wg0/64                     link#3                        U
 wg0
fe80::1427:e888:767c:dce1%wg0     link#3                        UHS
 lo0
root@freebsd:/etc/wireguard # ping 192.168.2.5

Somebody more expert than me can comment on whether this is expected or
not. At the very least, hopefully this post is useful for somebody else.
For our specific problem, we have fixed this by putting a static route in
for the "Address" subnet across wg0.

-Alex

[1] https://lists.zx2c4.com/pipermail/wireguard/2017-December/002231.html

--0000000000003c10760586b1f69b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr"><div dir=3D"lt=
r"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div=
 dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div>Hi,</d=
iv><div><br></div><div>We have been trying to use WireGuard on FreeBSD (we =
are using the WG plugin inside the open source <a href=3D"http://opnsense.o=
rg" target=3D"_blank">opnsense.org</a> software). These run FreeBSD 11.2-RE=
LEASE-p9-HBSD (OPNsense 19.7.a_288-amd64).</div><div><br></div><div>We noti=
ced that by default (i.e. no Table=3D) wireguard-go wg0 adds default routes=
 (as two /31&#39;s) as expected. However, if table=3Doff, we get no route a=
t all - not even to the VPN peer.=C2=A0</div><div><br></div><div>The announ=
cement for the Table=3D option[1] stated:</div><div><br></div><div><font fa=
ce=3D"monospace, monospace">=C2=A0 In collaboration with Luis Ressel, wg-qu=
ick(8) grew an option! We generally</font></div><div><font face=3D"monospac=
e, monospace">=C2=A0 do not like to add things to wg-quick or allow feature=
-creep, but this was</font></div><div><font face=3D"monospace, monospace">=
=C2=A0 basic enough and mostly involves disabling functionality. Specifical=
ly,</font></div><div><font face=3D"monospace, monospace">=C2=A0 wg-quick no=
w accepts a Table=3D parameter with these semantics:</font></div><div><font=
 face=3D"monospace, monospace">=C2=A0=C2=A0</font></div><div><font face=3D"=
monospace, monospace">=C2=A0 =C2=A0 ~ Table=3Dauto (default) selects the cu=
rrent behaviour</font></div><div><font face=3D"monospace, monospace">=C2=A0=
 =C2=A0 ~ Table=3Doff disables creation of routes from allowed ips altogeth=
er</font></div><div><font face=3D"monospace, monospace">=C2=A0 =C2=A0 ~ All=
 other values are passed through to &quot;ip route add&quot;&#39;s table op=
tion</font></div><div><font face=3D"monospace, monospace">=C2=A0=C2=A0</fon=
t></div><div><font face=3D"monospace, monospace">=C2=A0 This should enable =
people to do basic policy routing. It also matches the</font></div><div><fo=
nt face=3D"monospace, monospace">=C2=A0 functionality provided by LEDE/Open=
WRT&#39;s uci config as well as NixOS&#39;s</font></div><div><font face=3D"=
monospace, monospace">=C2=A0 networking configuration.</font></div><div><br=
></div><div>Ignoring the &quot;creation of routes from allowed ips&quot;, i=
t does not even add the subnet defined in [Interface]. netstat -r | grep wg=
 returns nothing.=C2=A0</div><div><br></div><div>As a concrete example, if =
I take the trivial config at <a href=3D"https://wiki.archlinux.org/index.ph=
p/WireGuard" target=3D"_blank">https://wiki.archlinux.org/index.php/WireGua=
rd</a>:</div><div><br></div><div><font face=3D"monospace, monospace">[Inter=
face]</font></div><div><font face=3D"monospace, monospace">Address =3D <a h=
ref=3D"http://10.200.200.2/24" target=3D"_blank">10.200.200.2/24</a></font>=
</div><div><font face=3D"monospace, monospace">PrivateKey =3D [FOO&#39;s PR=
IVATE KEY]</font></div><div><font face=3D"monospace, monospace">DNS =3D 10.=
200.200.1</font></div><div><font face=3D"monospace, monospace"><br></font><=
/div><div><font face=3D"monospace, monospace">[Peer]</font></div><div><font=
 face=3D"monospace, monospace">PublicKey =3D [SERVER PUBLICKEY]</font></div=
><div><font face=3D"monospace, monospace">PresharedKey =3D [PRE-SHARED KEY]=
</font></div><div><font face=3D"monospace, monospace">AllowedIPs =3D <a hre=
f=3D"http://0.0.0.0/0" target=3D"_blank">0.0.0.0/0</a>, ::/0</font></div><d=
iv><font face=3D"monospace, monospace">Endpoint =3D <a href=3D"http://my.dd=
ns.address.com:51820" target=3D"_blank">my.ddns.address.com:51820</a></font=
></div><div><br></div><div>I would (naively) expect this:</div><div>Table=
=3Dauto: inject route for <a href=3D"http://10.200.200.2/24" target=3D"_bla=
nk">10.200.200.2/24</a> *and* <a href=3D"http://0.0.0.0/0" target=3D"_blank=
">0.0.0.0/0</a> via wg0</div><div>Table=3Doff: inject route for <a href=3D"=
http://10.200.200.2/24" target=3D"_blank">10.200.200.2/24</a> *only* via wg=
0</div><div><br></div><div>What actually happens is:</div><div>Table=3Dauto=
: as above/expected</div><div>Table=3Doff: no route out wg0</div><div><br><=
/div><div>This mean with Table=3Doff, you are in the extremely confusing si=
tuation that you cant even ping the other peer.</div><div><br></div><div>Te=
sting on Linux (Kernel=C2=A04.15.0-1032-aws inside a 18.04 AMI (public AMI =
-=C2=A0ami-07dc734dc14746eab)) shows that the behavior is different - its a=
s I expect for both Table values. With this wg0.conf:</div><div><br></div><=
div><div><font face=3D"monospace, monospace">root@ip-172-31-39-185:~# cat /=
etc/wireguard/wg0.conf</font></div><div><font face=3D"monospace, monospace"=
>[Interface]</font></div><div><font face=3D"monospace, monospace">Address =
=3D <a href=3D"http://192.168.2.1/24" target=3D"_blank">192.168.2.1/24</a><=
/font></div><div><font face=3D"monospace, monospace">PrivateKey =3D eEIwdXp=
8jKV9/2MEwxYBqQLu4TZqBv9YWvG9fbMuaG4=3D</font></div><div><font face=3D"mono=
space, monospace">Table =3D off</font></div><div><font face=3D"monospace, m=
onospace"><br></font></div><div><font face=3D"monospace, monospace">[Peer]<=
/font></div><div><font face=3D"monospace, monospace">PublicKey =3D pHQfWzLA=
UM85vDO6+MZAneBYhapOHUkPAuxr0lJdZlY=3D</font></div><div><font face=3D"monos=
pace, monospace">AllowedIPs =3D <a href=3D"http://0.0.0.0/0" target=3D"_bla=
nk">0.0.0.0/0</a></font></div><div><font face=3D"monospace, monospace">Endp=
oint =3D <a href=3D"http://18.130.138.71:51820" target=3D"_blank">18.130.13=
8.71:51820</a></font></div></div><div><font face=3D"monospace, monospace"><=
br></font></div><div>I get this route:</div><div><br></div><div><div><font =
face=3D"monospace, monospace">root@ip-172-31-39-185:~# ip route show | grep=
 wg0</font></div><div><font face=3D"monospace, monospace"><a href=3D"http:/=
/192.168.2.0/24" target=3D"_blank">192.168.2.0/24</a> dev wg0 proto kernel =
scope link src 192.168.2.1</font></div></div><div><br></div><div>Note the /=
24 route (as expected). With Table undefined or set to auto, I get the 0.0.=
0.0 route (also as expected).</div><div><br></div><div>I dont know much abo=
ut FreeBSD, but I launched a test EC2 instance (FreeBSD 12.0-RELEASE based =
on public ami-0d244633039d93966 with kernel reported as 12.0-RELEASE-p3) an=
d I think I see the same thing (i.e. no /24 route):</div><div><br></div><di=
v><div><font face=3D"monospace, monospace">root@freebsd:/etc/wireguard # ne=
tstat -rn | grep wg0</font></div><div><font face=3D"monospace, monospace">1=
92.168.2.5=C2=A0 =C2=A0 =C2=A0 =C2=A0 link#3=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0UH=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 wg0</font></div><div>=
<font face=3D"monospace, monospace">fe80::%wg0/64=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0link#3=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 U=C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wg0</font></div><div><font face=3D"monosp=
ace, monospace">fe80::1427:e888:767c:dce1%wg0=C2=A0 =C2=A0 =C2=A0link#3=C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 UHS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0lo0</font></div><div><font face=
=3D"monospace, monospace">root@freebsd:/etc/wireguard # ping 192.168.2.5</f=
ont></div></div><div><br></div><div>Somebody more expert than me can commen=
t on whether this is expected or not. At the very least, hopefully this pos=
t is useful for somebody else.=C2=A0 For our specific problem, we have fixe=
d this by putting a static route in for the &quot;Address&quot; subnet acro=
ss wg0.</div><div><br></div><div>-Alex</div><div><br></div><div>[1] <a href=
=3D"https://lists.zx2c4.com/pipermail/wireguard/2017-December/002231.html" =
target=3D"_blank">https://lists.zx2c4.com/pipermail/wireguard/2017-December=
/002231.html</a></div></div></div></div></div></div></div></div></div></div=
></div>
</div></div>

--0000000000003c10760586b1f69b--

--===============7491647918896382193==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============7491647918896382193==--
