Return-Path: <SRS0=Fp2b=TH=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	NORMAL_HTTP_TO_IP,SPF_PASS,URIBL_BLOCKED,WEIRD_PORT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56811C004C9
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  7 May 2019 06:45:26 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB523205C9
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  7 May 2019 06:45:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X7eSsrd5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AB523205C9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cabb9921;
	Tue, 7 May 2019 06:45:08 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ee62966e
 for <wireguard@lists.zx2c4.com>; Tue, 7 May 2019 06:45:06 +0000 (UTC)
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6c740f34
 for <wireguard@lists.zx2c4.com>; Tue, 7 May 2019 06:45:06 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id y19so3374383lfy.5
 for <wireguard@lists.zx2c4.com>; Mon, 06 May 2019 23:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YpiVyTjvKOIalMmA2UBZQfn51/dCTfq6179c0wmfA40=;
 b=X7eSsrd5DWNPxVK4AmurvkR/E6a1g0B5PCtOkNQFd6zX7LLoWZ1nmiCBfBp0PEmr/o
 9oI+dPsQclLUY2eYj5nPSzqfQmu19+QMwcULFN7kgFHpoLFbbtw/pAwrhL/kPFA7ND6+
 5KR55YQ4chthpkWoEiWorOT1oDFvMNrLkHQ0OcjgKtGlF7iOnS7RG859nG2Wj/l5gZ5o
 H5+/B2FQyq0Xl1Zdal7/XxmMYT62IfyPd8SIbDqMZHTJflHpwvNgt1uUp/XELGuTtL1z
 qBWK6EKX9jHHthKxV4Vsh3zGzy+Y25oJtzLzf2GkJOdfYAqEBooMVHW6Z4A1lvBzQOVy
 hC+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YpiVyTjvKOIalMmA2UBZQfn51/dCTfq6179c0wmfA40=;
 b=k+0PFVKGt/u4STbtsv5pHUnOlYR1J/ldBjtU6GedSvJQxd8onPP0xRW5xTtyfCVf6u
 t3UFibmw4DIEh9dziwbi0nSqFuBejSgXoDIQ8RvQNs/mtYHq/+mWCxT28icMz0tTW6J/
 akHDnSxdDJZe1RtkLnAzu6MhiLQlIUPcrozK+WC8IBMPn8UlL822pTqS/KPXSOIy2TMh
 2S77Gh6bbfBSvasnjFK+HJNuQTHrXKJJJCUEzg/lS+glInqhDxmKx0Ur3BdY8HLP++vq
 orHdlzkcF1LWA5LhC7iXFkyfrLWTNfChOqSkYVc4e5LwytmPZhmIzb5pL1UYDCrW7kmH
 anog==
X-Gm-Message-State: APjAAAWiK7kRoXSoXdgZwQ59HKhpWSlheij/Yw9b4zMOug6oD9V606Xl
 8QEy/O3CNtKnD3reSFbOjLhXz7mptrYxGpimB4U=
X-Google-Smtp-Source: APXvYqz0jQwEUIyUy+xkpB8sUnz0Y45muCspQk/Az+HZ3qVITTW61bqMnfwQvqtP8XzFazWgnZkN2VfhpKFf+1jwTw8=
X-Received: by 2002:ac2:5582:: with SMTP id v2mr15246317lfg.19.1557211504019; 
 Mon, 06 May 2019 23:45:04 -0700 (PDT)
MIME-Version: 1.0
References: <AM0PR08MB3522DC4AA812C933D8285AFCD43B0@AM0PR08MB3522.eurprd08.prod.outlook.com>
In-Reply-To: <AM0PR08MB3522DC4AA812C933D8285AFCD43B0@AM0PR08MB3522.eurprd08.prod.outlook.com>
From: Henning Reich <henning.reich@gmail.com>
Date: Tue, 7 May 2019 08:44:27 +0200
Message-ID: <CAOAVeL031uRn=3tj7GKq44itkX2r6TdPag9DDMa8tQA1evPwyw@mail.gmail.com>
Subject: Re: Deploy a wireguard on 2 raspberry pi to connect 2 remote lan -
 Lan2Lan
To: Paulo Lopes <plopes1960@hotmail.com>
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
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
Content-Type: multipart/mixed; boundary="===============5613333800025277825=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============5613333800025277825==
Content-Type: multipart/alternative; boundary="000000000000898f680588468e99"

--000000000000898f680588468e99
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

You have to do the same. Use for the WG-interfaces a "transportation
subnet" and add your local IP as Gateway for the subnet of the other lan
side.

left: ip route add 192.168.90.0/24 via 192.168.1.3
right: ip route add 192.168.1.0/24 via 192.168.90.20


#left
[Interface]
Address =3D 172.16.0.1/32
ListenPort =3D 12345
PrivateKey =3D priv1

#right
[Peer]
PublicKey =3D pub2
AllowedIPs =3D 172.16.0.2/32, 192.168.90.0/24
Endpoint =3D 80.40.20.10:12345

-------

#right
[Interface]
Address =3D 172.16.0.2/32
ListenPort =3D 12345
PrivateKey =3D priv2

#left
[Peer]
PublicKey =3D pub1
AllowedIPs =3D 172.16.0.1/32, 192.168.1.0/24
Endpoint =3D 200.100.50.25:12345

Am Mo., 6. Mai 2019 um 22:43 Uhr schrieb Paulo Lopes <plopes1960@hotmail.co=
m
>:

> Hi all!!!
>
> First, let me thank for the amazing vpn protocol that Wireguard is!!!!
>
> I need your advise. As you can see on the picture attach, I have 2
> raspberry pi. One as a vpn server and the other as a vpn client to connec=
t
> 2 remote Lan.
>
> Can you point me what I need to do, if I want to replace the openvpn for
> the wireguard?
>
> I can connect 2 rpi with wireguard, but, the others ip machinies on the
> server and client side can=C2=B4t see each other.
>
> With openvpn I needed to inser iroute and add a static route on both
> routers. What I need to with the wireguard?
>
> Once again many tahnks for all the help you can give me=F0=9F=98=89
>
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>

--000000000000898f680588468e99
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>You have to do the same. Use for the=
 WG-interfaces a &quot;transportation subnet&quot; and add your local IP as=
 Gateway for the subnet of the other lan side.</div><div><br></div><div>lef=
t: ip route add <a href=3D"http://192.168.90.0/24">192.168.90.0/24</a> via =
192.168.1.3</div><div>right: ip route add <a href=3D"http://192.168.1.0/24"=
>192.168.1.0/24</a> via 192.168.90.20<br></div><div></div><div><br></div><d=
iv><br></div><div>#left<br></div><div>[Interface]<br>Address =3D <a href=3D=
"http://172.16.0.1/32">172.16.0.1/32</a><br>ListenPort =3D 12345<br>Private=
Key =3D priv1<br><br>#right<br>[Peer]<br>PublicKey =3D pub2<br>AllowedIPs =
=3D <a href=3D"http://172.16.0.2/32">172.16.0.2/32</a>, <a href=3D"http://1=
92.168.90.0/24">192.168.90.0/24</a><br>Endpoint =3D <a href=3D"http://80.40=
.20.10:12345">80.40.20.10:12345</a></div><div><br></div><div>-------</div><=
div><br></div><div><div>#right<br></div><div>[Interface]<br>Address =3D <a =
href=3D"http://172.16.0.2/32">172.16.0.2/32</a><br>ListenPort =3D 12345<br>=
PrivateKey =3D priv2<br><br>#left<br>[Peer]<br>PublicKey =3D pub1<br>Allowe=
dIPs =3D <a href=3D"http://172.16.0.1/32">172.16.0.1/32</a>, <a href=3D"htt=
p://192.168.1.0/24">192.168.1.0/24</a><br>Endpoint =3D <a href=3D"http://20=
0.100.50.25:12345">200.100.50.25:12345</a></div></div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">Am Mo., 6. Mai 2019 um 22:4=
3=C2=A0Uhr schrieb Paulo Lopes &lt;<a href=3D"mailto:plopes1960@hotmail.com=
">plopes1960@hotmail.com</a>&gt;:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">




<div dir=3D"ltr">
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:12pt;color=
:rgb(0,0,0)">
Hi all!!!</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:12pt;color=
:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:12pt;color=
:rgb(0,0,0)">
First, let me thank for the amazing vpn protocol that Wireguard is!!!!</div=
>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:12pt;color=
:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:12pt;color=
:rgb(0,0,0)">
I need your advise. As you can see on the picture attach, I have 2 raspberr=
y pi. One as a vpn server and the other as a vpn client to connect 2 remote=
 Lan.</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:12pt;color=
:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:12pt;color=
:rgb(0,0,0)">
Can you point me what I need to do, if I want to replace the openvpn for th=
e wireguard?</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:12pt;color=
:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:12pt;color=
:rgb(0,0,0)">
I can connect 2 rpi with wireguard, but, the others ip machinies on the ser=
ver and client side can=C2=B4t see each other.</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:12pt;color=
:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:12pt;color=
:rgb(0,0,0)">
With openvpn I needed to inser iroute and add a static route on both router=
s. What I need to with the wireguard?</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:12pt;color=
:rgb(0,0,0)">
<br>
</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:12pt;color=
:rgb(0,0,0)">
Once again many tahnks for all the help you can give me=F0=9F=98=89</div>
<div style=3D"font-family:Calibri,Helvetica,sans-serif;font-size:12pt;color=
:rgb(0,0,0)">
=C2=A0</div>
</div>

_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank">WireGuard@li=
sts.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinfo/wireguard=
</a><br>
</blockquote></div></div></div>

--000000000000898f680588468e99--

--===============5613333800025277825==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============5613333800025277825==--
