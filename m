Return-Path: <SRS0=xbiu=RJ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6F7BC10F00
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  6 Mar 2019 18:23:08 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2DE7920684
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  6 Mar 2019 18:23:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iFMiiVg7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2DE7920684
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9d12a159;
	Wed, 6 Mar 2019 18:12:26 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d0b84597
 for <wireguard@lists.zx2c4.com>; Wed, 6 Mar 2019 18:12:24 +0000 (UTC)
Received: from mail-qk1-x734.google.com (mail-qk1-x734.google.com
 [IPv6:2607:f8b0:4864:20::734])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4b2c5d6e
 for <wireguard@lists.zx2c4.com>; Wed, 6 Mar 2019 18:12:24 +0000 (UTC)
Received: by mail-qk1-x734.google.com with SMTP id c2so7390059qkb.3
 for <wireguard@lists.zx2c4.com>; Wed, 06 Mar 2019 10:22:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=mR4SewpgSvGFZUw8eRMPmwL2O/nyUJUSHlUyG6/uD9k=;
 b=iFMiiVg7GfMPmyx7EFx+7u9sTiItK6iHYeZ8Tkx1noEc9l2CeguXlnC4R58PowYjwh
 Z29dANvnd18VEw8gTLBU9fSZAtD0F2KzlCzlLMOsCWA/RiJ4zf/646QGXxErEAwPjFN6
 /c+FDYgYPeG+0bClsgUwkfuV5fBvgvzj6JB1V/+KhSF4a5ST2ffA/yIu5NINnWsOJF1g
 h4uTYPQ+zm/nMsPp2OPDzAsyJc9AdsUYQ7mTdDWAps+g2fBmy4ESiRS2mWD9E1I3h2sM
 W9NyHEWLwCjsZ0kaI5iIYubB5rsA+HDgsKFfr2cBvWXuD7fdzvrhawzOsFzb5OYB1AS/
 djXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=mR4SewpgSvGFZUw8eRMPmwL2O/nyUJUSHlUyG6/uD9k=;
 b=V7QhnlAlgCz+eaJD175p5bVQxgDcI3LVn7thzSKtRkkAo0f9w1bENsTL/dEUpoJ+41
 ZraTZitwQJUDsmwcx0tKYuHQYTQdqYWEOy97Isyga72LeOBpaXY5pvEtqZumhJSs3q5j
 CAwAa2u0tAxgCFwdSjVjOlIzPFk4pbKN/wQyhPN+Wv5ZSAqLNkOn+KC5S8p+G5kqMUNh
 8NeXE/o/e8FoPqneBFWrhSHRa9ejjxaFhb7xpKPFbw4rolNVyTpv59hvarcHdDWVTJg2
 CmeaN4EPAuyERwO9//A1lTq/i9pYGsgbgxfw/qaZOMA7+d2Eba8JdPO35qrSa/+bcayL
 K/lQ==
X-Gm-Message-State: APjAAAVRh9m7p26ttMo7/E8C+C2TgEsDFX46QEn/Yd1spoYlPZEVwit9
 dll6FRgiXvcoqfBjvr3OKrucfHbHaddjPg41mgKcsuli
X-Google-Smtp-Source: APXvYqyv6w3B02CDrr6Kmo+QIbpCJ6NaABlmwUFe4Et9rIEH8UA5J3CTP70Y8p5ATx3HT+Mq97nG6KS1J+3N3frHBhI=
X-Received: by 2002:a37:4e0f:: with SMTP id c15mr6935156qkb.267.1551896573423; 
 Wed, 06 Mar 2019 10:22:53 -0800 (PST)
MIME-Version: 1.0
References: <CAGCGytLuf1Lhm-oQrL+ACOJw0wMu3wcXPOS0qufRWo1w47RQ+g@mail.gmail.com>
 <3053f293b7e9a34a733c2b5b314e2d8a620682db.camel@airmail.cc>
 <CAGCGyt+gvYDHR3KHi+HRc2pCnyLbefV3h=OmfSOqhfdR564p0w@mail.gmail.com>
 <CAGCGyt+cKUuaSh8pSATmRSUGpaeyc0rKvSoF_sABPO-hsJ5HAQ@mail.gmail.com>
In-Reply-To: <CAGCGyt+cKUuaSh8pSATmRSUGpaeyc0rKvSoF_sABPO-hsJ5HAQ@mail.gmail.com>
From: Arpit Gupta <g.arpit@gmail.com>
Date: Wed, 6 Mar 2019 10:22:42 -0800
Message-ID: <CAGCGytKU9FfKgYoyKSwoH8B0rLqh8PPG=SyzTNO1pQG4feUO=A@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============8236506094999296925=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============8236506094999296925==
Content-Type: multipart/alternative; boundary="000000000000fcb4e005837113c7"

--000000000000fcb4e005837113c7
Content-Type: text/plain; charset="UTF-8"

Actually false alarm :(.

Can only get it to work if i add a policy rule in my router vpn client to
send all traffic from host running wireguard through the WAN and thus
skipping VPN which is not ideal as when i am routing all traffic through
wireguard ideally i want it to use the vpn tunnel on my router.


--
Arpit


On Wed, Mar 6, 2019 at 8:20 AM Arpit Gupta <g.arpit@gmail.com> wrote:

> Got it working :).
>
> Did not need to change any client or server settings. However needed to
> add another policy rule in my vpn client. Rule states
>
> Source: wireguard server
> destination: 192.168.100.0/24 (so any of my wireguard clients)
> interface: WAN
>
> So this way wireguard traffic does not go through the VPN.
> --
> Arpit
>
>
> On Wed, Mar 6, 2019 at 7:59 AM Arpit Gupta <g.arpit@gmail.com> wrote:
>
>> Tried changing the allowed ip's to what was suggested and it did not
>> work. Same behavior as before. Also my configs were working as expected
>> before i had my router connected to a vpn service.
>>
>> It required me to add the following route policy for my vpn client on my
>> router
>>
>> Source IP: 192.168.1.0/24, Destination: 0.0.0.0 will go throuh the VPN.
>> So if it matters if i connected to wireguard using the ip address of the
>> ISP vs the IP address of the VPN?
>>
>>
>> --
>> Arpit
>>
>>
>> On Wed, Mar 6, 2019 at 1:18 AM XRP <xrp@airmail.cc> wrote:
>>
>>> On Wed, 2019-03-06 at 08:40 +0000, Arpit Gupta wrote:
>>> > On my server my conf is
>>> >
>>> > [Interface]
>>> > Address = 192.168.100.1/32
>>> > PostUp = iptables -A FORWARD -i %i -j ACCEPT; iptables -A FORWARD -o
>>> > %i -j
>>> > ACCEPT; iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
>>> > PostDown = iptables -D FORWARD -i %i -j ACCEPT; iptables -D FORWARD
>>> > -o %i
>>> > -j ACCEPT; iptables -t nat -D POSTROUTING -o eth0 -j MASQUERADE
>>> > ListenPort = 54930
>>> > PrivateKey = xxxxx
>>> >
>>> > [Peer]
>>> > PublicKey = xxxx
>>> > AllowedIPs = 192.168.100.2/32
>>> >
>>> >
>>> > on my client my config is
>>> >
>>> > [Interface]
>>> > Address = 192.168.100.2
>>> > PrivateKey = xxxxx
>>> > ListenPort = 21841
>>> > DNS = 192.168.1.63
>>> >
>>> > [Peer]
>>> > PublicKey = xxxx
>>> > Endpoint = ddns:xxx
>>> > AllowedIPs = 192.168.1.0/24
>>> >
>>> > # This is for if you're behind a NAT and
>>> > # want the connection to be kept alive.
>>> > PersistentKeepalive = 25
>>>
>>> Try changing AllowedIPs in the client config to:
>>> AllowedIPs = 192.168.100.1/32,192.168.1.0/24
>>>
>>> Also, if you want to masquerade the traffic to the internet you need to
>>> add 0.0.0.0./0 to the client or change the destination IP to the server
>>> node via a NAT rule, otherwise it's going to be rejected because the IP
>>> packet doesn't have an AllowedIP address, I think. (The source needs to
>>> match, so either 192.168.100.1/32 or 192.168.1.0/24). My guess is
>>> that's why you couldn't complete the handshake.
>>>
>>>

--000000000000fcb4e005837113c7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Actually false alarm :(.<div><br></div><div>Can only get i=
t to work if i add a policy rule in my router vpn client to send all traffi=
c from host running wireguard through the WAN and thus skipping VPN which i=
s not ideal as when i am routing all traffic through wireguard ideally i wa=
nt it to use the vpn tunnel on my router.</div><div><br></div><div><br clea=
r=3D"all"><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D=
"gmail_signature"><div dir=3D"ltr"><div>--</div>Arpit</div></div></div><br>=
</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_=
attr">On Wed, Mar 6, 2019 at 8:20 AM Arpit Gupta &lt;<a href=3D"mailto:g.ar=
pit@gmail.com">g.arpit@gmail.com</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr">Got it working :).<div><b=
r></div><div>Did not need to change any client or server settings. However =
needed to add another policy rule in my vpn client. Rule states</div><div><=
br></div><div>Source: wireguard server</div><div>destination: <a href=3D"ht=
tp://192.168.100.0/24" target=3D"_blank">192.168.100.0/24</a> (so any of my=
 wireguard clients)</div><div>interface: WAN</div><div><br></div><div>So th=
is way wireguard traffic does not go through the VPN.=C2=A0<br clear=3D"all=
"><div><div dir=3D"ltr" class=3D"gmail-m_3041124942920358459gmail_signature=
"><div dir=3D"ltr"><div>--</div>Arpit</div></div></div><br></div></div><br>=
<div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Ma=
r 6, 2019 at 7:59 AM Arpit Gupta &lt;<a href=3D"mailto:g.arpit@gmail.com" t=
arget=3D"_blank">g.arpit@gmail.com</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Tried changing the allow=
ed ip&#39;s to what was suggested and it did not work. Same behavior as bef=
ore. Also my configs were working as expected before i had my router connec=
ted to a vpn service.<div><br></div><div>It required me to add the followin=
g route policy for my vpn client on my router</div><div><br></div><div>Sour=
ce IP: <a href=3D"http://192.168.1.0/24" target=3D"_blank">192.168.1.0/24</=
a>, Destination: 0.0.0.0 will go throuh the VPN. So if it matters if i conn=
ected to wireguard using the ip address of the ISP vs the IP address of the=
 VPN?</div><div><br></div><div><br clear=3D"all"><div><div dir=3D"ltr" clas=
s=3D"gmail-m_3041124942920358459gmail-m_6695934501888018956gmail_signature"=
><div dir=3D"ltr"><div>--</div>Arpit</div></div></div><br></div></div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar=
 6, 2019 at 1:18 AM XRP &lt;xrp@airmail.cc&gt; wrote:<br></div><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">On Wed, 2019-03-06 at 08:40 +0000, Ar=
pit Gupta wrote:<br>
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
</blockquote></div>
</blockquote></div>

--000000000000fcb4e005837113c7--

--===============8236506094999296925==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============8236506094999296925==--
