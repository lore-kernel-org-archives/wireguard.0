Return-Path: <SRS0=xbiu=RJ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C99CC43381
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  6 Mar 2019 15:59:57 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7566B20675
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  6 Mar 2019 15:59:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nYJOcEzS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7566B20675
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ac2464de;
	Wed, 6 Mar 2019 15:49:10 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cd192b46
 for <wireguard@lists.zx2c4.com>; Wed, 6 Mar 2019 15:49:05 +0000 (UTC)
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com
 [IPv6:2607:f8b0:4864:20::72d])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 79a10fbb
 for <wireguard@lists.zx2c4.com>; Wed, 6 Mar 2019 15:49:05 +0000 (UTC)
Received: by mail-qk1-x72d.google.com with SMTP id h28so7066321qkk.7
 for <wireguard@lists.zx2c4.com>; Wed, 06 Mar 2019 07:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OYY+aDRExFf74CLENKmhkF0zP9WKXL0cFlXle+Sg2U8=;
 b=nYJOcEzSaKnRPBkP0Krh4l3wj9/1n48W8FwAwnNkWopf393GiWM2zolcDkejK4hg+d
 Oxa81Mfb9hiFOWSqmrMpVymqvDwHyPUoMuEtq8aQ6aMHUW82AujNYmZ/qjviPaVDGz0U
 Ag9Zkx+Q8IU0ikY+2cVQouZIVuET5Mvdn+dD5hKIHr531M7ILFBb3a5ceNhTQJjhPxUe
 8MYHn0N7cAtmr/ovCFpe14xNBw2/ETcJXBTSTuh4SkDXXfnWb5FHCOkJRkvcGl3ZVCTI
 TVC1ocKUwW4g9gdh7TzeoczCaaJ1EnxYXjdIsUDGUantctSyk+Pf+rgpx1JpxTvuSx1i
 ujww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OYY+aDRExFf74CLENKmhkF0zP9WKXL0cFlXle+Sg2U8=;
 b=qlVZ/pnb5MCnBe52IjgSf8dqWtVwqEthMBSUExxpcywXv87EEtm0J9iT7imbcSVsvn
 d94nWiS+eUbnXGcX0PV3XCqnSoQr71SHe/AeU18dwGdQ178QbjvSbNfW6PpGp7RdYLY9
 DbLTNjfkUEKapG2IaL0fWxrdDrK7leCuDMy594o4a+GvLTZySPjWVMw33G3ATLXYJmL0
 7L2sLvsD4EurRvuddVsDphDdzKtt5DTHlwhbEKIWvxumH6fROpKMNDIjtq/UESCMfZVV
 u8gwhmB2+j1K/itMOi/RHGblRa3fCBOB0zEHrhXouV1AY4R/ym9gMv4TdPLdZ10/2xCn
 HnXQ==
X-Gm-Message-State: APjAAAW74uf60VrBu8ryG01hFWre3PuQAJFcND+CY9JVbONJNjxrFe58
 /ZQkhjF+HCtDUy0T+acVpkYd56tUgIhV05ENq81kpYN7
X-Google-Smtp-Source: APXvYqzbFADqhrUL5rk597KMu7CootD/nFbTOFqiuqUFCuCEITsWktNEXAUnzag23qmw5NPLYNMtw5OLjngx4il4UrA=
X-Received: by 2002:ae9:ed0c:: with SMTP id c12mr5981609qkg.306.1551887973405; 
 Wed, 06 Mar 2019 07:59:33 -0800 (PST)
MIME-Version: 1.0
References: <CAGCGytLuf1Lhm-oQrL+ACOJw0wMu3wcXPOS0qufRWo1w47RQ+g@mail.gmail.com>
 <3053f293b7e9a34a733c2b5b314e2d8a620682db.camel@airmail.cc>
In-Reply-To: <3053f293b7e9a34a733c2b5b314e2d8a620682db.camel@airmail.cc>
From: Arpit Gupta <g.arpit@gmail.com>
Date: Wed, 6 Mar 2019 07:59:22 -0800
Message-ID: <CAGCGyt+gvYDHR3KHi+HRc2pCnyLbefV3h=OmfSOqhfdR564p0w@mail.gmail.com>
Subject: Re: cant connect to wireguard when router connected to a vpn service
To: XRP <xrp@airmail.cc>
Cc: wireguard@lists.zx2c4.com
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
Content-Type: multipart/mixed; boundary="===============7770222015439826466=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============7770222015439826466==
Content-Type: multipart/alternative; boundary="00000000000062d8b705836f1395"

--00000000000062d8b705836f1395
Content-Type: text/plain; charset="UTF-8"

Tried changing the allowed ip's to what was suggested and it did not work.
Same behavior as before. Also my configs were working as expected before i
had my router connected to a vpn service.

It required me to add the following route policy for my vpn client on my
router

Source IP: 192.168.1.0/24, Destination: 0.0.0.0 will go throuh the VPN. So
if it matters if i connected to wireguard using the ip address of the ISP
vs the IP address of the VPN?


--
Arpit


On Wed, Mar 6, 2019 at 1:18 AM XRP <xrp@airmail.cc> wrote:

> On Wed, 2019-03-06 at 08:40 +0000, Arpit Gupta wrote:
> > On my server my conf is
> >
> > [Interface]
> > Address = 192.168.100.1/32
> > PostUp = iptables -A FORWARD -i %i -j ACCEPT; iptables -A FORWARD -o
> > %i -j
> > ACCEPT; iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
> > PostDown = iptables -D FORWARD -i %i -j ACCEPT; iptables -D FORWARD
> > -o %i
> > -j ACCEPT; iptables -t nat -D POSTROUTING -o eth0 -j MASQUERADE
> > ListenPort = 54930
> > PrivateKey = xxxxx
> >
> > [Peer]
> > PublicKey = xxxx
> > AllowedIPs = 192.168.100.2/32
> >
> >
> > on my client my config is
> >
> > [Interface]
> > Address = 192.168.100.2
> > PrivateKey = xxxxx
> > ListenPort = 21841
> > DNS = 192.168.1.63
> >
> > [Peer]
> > PublicKey = xxxx
> > Endpoint = ddns:xxx
> > AllowedIPs = 192.168.1.0/24
> >
> > # This is for if you're behind a NAT and
> > # want the connection to be kept alive.
> > PersistentKeepalive = 25
>
> Try changing AllowedIPs in the client config to:
> AllowedIPs = 192.168.100.1/32,192.168.1.0/24
>
> Also, if you want to masquerade the traffic to the internet you need to
> add 0.0.0.0./0 to the client or change the destination IP to the server
> node via a NAT rule, otherwise it's going to be rejected because the IP
> packet doesn't have an AllowedIP address, I think. (The source needs to
> match, so either 192.168.100.1/32 or 192.168.1.0/24). My guess is
> that's why you couldn't complete the handshake.
>
>

--00000000000062d8b705836f1395
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Tried changing the allowed ip&#39;s to what was suggested =
and it did not work. Same behavior as before. Also my configs were working =
as expected before i had my router connected to a vpn service.<div><br></di=
v><div>It required me to add the following route policy for my vpn client o=
n my router</div><div><br></div><div>Source IP: <a href=3D"http://192.168.1=
.0/24">192.168.1.0/24</a>, Destination: 0.0.0.0 will go throuh the VPN. So =
if it matters if i connected to wireguard using the ip address of the ISP v=
s the IP address of the VPN?</div><div><br></div><div><br clear=3D"all"><di=
v><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_signat=
ure"><div dir=3D"ltr"><div>--</div>Arpit</div></div></div><br></div></div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed,=
 Mar 6, 2019 at 1:18 AM XRP &lt;xrp@airmail.cc&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">On Wed, 2019-03-06 at 08:40 +0000=
, Arpit Gupta wrote:<br>
&gt; On my server my conf is<br>
&gt; <br>
&gt; [Interface]<br>
&gt; Address =3D <a href=3D"http://192.168.100.1/32" rel=3D"noreferrer" tar=
get=3D"_blank">192.168.100.1/32</a><br>
&gt; PostUp =3D iptables -A FORWARD -i %i -j ACCEPT; iptables -A FORWARD -o=
<br>
&gt; %i -j<br>
&gt; ACCEPT; iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE<br>
&gt; PostDown =3D iptables -D FORWARD -i %i -j ACCEPT; iptables -D FORWARD<=
br>
&gt; -o %i<br>
&gt; -j ACCEPT; iptables -t nat -D POSTROUTING -o eth0 -j MASQUERADE<br>
&gt; ListenPort =3D 54930<br>
&gt; PrivateKey =3D xxxxx<br>
&gt; <br>
&gt; [Peer]<br>
&gt; PublicKey =3D xxxx<br>
&gt; AllowedIPs =3D <a href=3D"http://192.168.100.2/32" rel=3D"noreferrer" =
target=3D"_blank">192.168.100.2/32</a><br>
&gt; <br>
&gt; <br>
&gt; on my client my config is<br>
&gt; <br>
&gt; [Interface]<br>
&gt; Address =3D 192.168.100.2<br>
&gt; PrivateKey =3D xxxxx<br>
&gt; ListenPort =3D 21841<br>
&gt; DNS =3D 192.168.1.63<br>
&gt; <br>
&gt; [Peer]<br>
&gt; PublicKey =3D xxxx<br>
&gt; Endpoint =3D ddns:xxx<br>
&gt; AllowedIPs =3D <a href=3D"http://192.168.1.0/24" rel=3D"noreferrer" ta=
rget=3D"_blank">192.168.1.0/24</a><br>
&gt; <br>
&gt; # This is for if you&#39;re behind a NAT and<br>
&gt; # want the connection to be kept alive.<br>
&gt; PersistentKeepalive =3D 25<br>
<br>
Try changing AllowedIPs in the client config to:<br>
AllowedIPs =3D <a href=3D"http://192.168.100.1/32,192.168.1.0/24" rel=3D"no=
referrer" target=3D"_blank">192.168.100.1/32,192.168.1.0/24</a><br>
<br>
Also, if you want to masquerade the traffic to the internet you need to<br>
add 0.0.0.0./0 to the client or change the destination IP to the server<br>
node via a NAT rule, otherwise it&#39;s going to be rejected because the IP=
<br>
packet doesn&#39;t have an AllowedIP address, I think. (The source needs to=
<br>
match, so either <a href=3D"http://192.168.100.1/32" rel=3D"noreferrer" tar=
get=3D"_blank">192.168.100.1/32</a> or <a href=3D"http://192.168.1.0/24" re=
l=3D"noreferrer" target=3D"_blank">192.168.1.0/24</a>). My guess is<br>
that&#39;s why you couldn&#39;t complete the handshake.<br>
<br>
</blockquote></div>

--00000000000062d8b705836f1395--

--===============7770222015439826466==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============7770222015439826466==--
