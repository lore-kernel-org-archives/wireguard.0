Return-Path: <SRS0=bcVQ=RK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B26FC43381
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  7 Mar 2019 08:05:39 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 959D920835
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  7 Mar 2019 08:05:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 959D920835
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kerr.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e1d85512;
	Thu, 7 Mar 2019 07:54:25 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 20014b89
 for <wireguard@lists.zx2c4.com>; Thu, 7 Mar 2019 07:54:22 +0000 (UTC)
Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com
 [209.85.167.171])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 09f31c9a
 for <wireguard@lists.zx2c4.com>; Thu, 7 Mar 2019 07:54:21 +0000 (UTC)
Received: by mail-oi1-f171.google.com with SMTP id t82so12177700oie.12
 for <wireguard@lists.zx2c4.com>; Thu, 07 Mar 2019 00:04:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xJyDx8xBteUc/qBKYwqHIoZsBKXOOw5EWOXftnwCgx8=;
 b=myVakw5fIjleJyZ9Zn34Tp11Off88/JshD1T2UhVbzP5n71UaNLXN1Bl4trhORkpJI
 seBsuPiY/VHKaS6jAejgST1BHC2jApwjatiUpW6+o7tt6KCAq/lEZUh9wxFPH/DA1dl6
 jFbt2CoqM3CjvUM9XV1pnM68+46IsADaZcBEU2NShwMuYQZ+lP9ElxV5TS9QMBGhuZOi
 hfLf0u7dmgs25FWVrZnJfX+nMEbSdoJvpiufMeQF3wh76Ibj0fl/e7uKdFLQmXgdeX9J
 bqU1QCRzIa/qm6E5LNDJxvGBY22LRhv4He6dJ7OZGltnwX+6Nc8/ia9WjEBdCZp3ETw5
 flyQ==
X-Gm-Message-State: APjAAAUxKfIUpQnCjEv6Cl8oBcwa2iYdNx0doaCeDfwgKTaf2PG5MOEU
 Ft33oXjea4325nHhoW+cPb5QRiHCjm6DSws6/0Yz/Q==
X-Google-Smtp-Source: APXvYqyj1V18+kYGDnedL8sap3APGBvLNC2oGrwIA1M/yczWzRHYVkVJia3h3M9xKJgfLv7DYzkeW+Un4tnM+HwK+Ag=
X-Received: by 2002:aca:d7c3:: with SMTP id o186mr4313788oig.28.1551945895114; 
 Thu, 07 Mar 2019 00:04:55 -0800 (PST)
MIME-Version: 1.0
References: <CAGCGytLuf1Lhm-oQrL+ACOJw0wMu3wcXPOS0qufRWo1w47RQ+g@mail.gmail.com>
 <3053f293b7e9a34a733c2b5b314e2d8a620682db.camel@airmail.cc>
 <CAGCGyt+gvYDHR3KHi+HRc2pCnyLbefV3h=OmfSOqhfdR564p0w@mail.gmail.com>
 <CAGCGyt+cKUuaSh8pSATmRSUGpaeyc0rKvSoF_sABPO-hsJ5HAQ@mail.gmail.com>
 <CAGCGytKU9FfKgYoyKSwoH8B0rLqh8PPG=SyzTNO1pQG4feUO=A@mail.gmail.com>
In-Reply-To: <CAGCGytKU9FfKgYoyKSwoH8B0rLqh8PPG=SyzTNO1pQG4feUO=A@mail.gmail.com>
From: David Kerr <david@kerr.net>
Date: Thu, 7 Mar 2019 03:04:44 -0500
Message-ID: <CAJJxGdFAvUXVrVy+qKF8pp2qCNv93tVW818opfJPJBxmA15EOw@mail.gmail.com>
Subject: Re: cant connect to wireguard when router connected to a vpn service
To: Arpit Gupta <g.arpit@gmail.com>
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
Content-Type: multipart/mixed; boundary="===============8903159058329571560=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============8903159058329571560==
Content-Type: multipart/alternative; boundary="000000000000ca12b305837c8fde"

--000000000000ca12b305837c8fde
Content-Type: text/plain; charset="UTF-8"

I'm a little confused as to the network architecture.  Are your running a
wireguard VPN inside of your OpenVPN?  Or do you have two VPN's connecting
into your host independently?  Either way, the first thing I would look at
is your ip route tables.  You need to make sure that packets that arrive on
one interface (e.g. wg0) are replied to over that same interface and are
not directed out somewhere else by virtue of the default route pointing
elsewhere.

David

On Wed, Mar 6, 2019 at 1:23 PM Arpit Gupta <g.arpit@gmail.com> wrote:

> Actually false alarm :(.
>
> Can only get it to work if i add a policy rule in my router vpn client to
> send all traffic from host running wireguard through the WAN and thus
> skipping VPN which is not ideal as when i am routing all traffic through
> wireguard ideally i want it to use the vpn tunnel on my router.
>
>
> --
> Arpit
>
>
> On Wed, Mar 6, 2019 at 8:20 AM Arpit Gupta <g.arpit@gmail.com> wrote:
>
>> Got it working :).
>>
>> Did not need to change any client or server settings. However needed to
>> add another policy rule in my vpn client. Rule states
>>
>> Source: wireguard server
>> destination: 192.168.100.0/24 (so any of my wireguard clients)
>> interface: WAN
>>
>> So this way wireguard traffic does not go through the VPN.
>> --
>> Arpit
>>
>>
>> On Wed, Mar 6, 2019 at 7:59 AM Arpit Gupta <g.arpit@gmail.com> wrote:
>>
>>> Tried changing the allowed ip's to what was suggested and it did not
>>> work. Same behavior as before. Also my configs were working as expected
>>> before i had my router connected to a vpn service.
>>>
>>> It required me to add the following route policy for my vpn client on my
>>> router
>>>
>>> Source IP: 192.168.1.0/24, Destination: 0.0.0.0 will go throuh the VPN.
>>> So if it matters if i connected to wireguard using the ip address of the
>>> ISP vs the IP address of the VPN?
>>>
>>>
>>> --
>>> Arpit
>>>
>>>
>>> On Wed, Mar 6, 2019 at 1:18 AM XRP <xrp@airmail.cc> wrote:
>>>
>>>> On Wed, 2019-03-06 at 08:40 +0000, Arpit Gupta wrote:
>>>> > On my server my conf is
>>>> >
>>>> > [Interface]
>>>> > Address = 192.168.100.1/32
>>>> > PostUp = iptables -A FORWARD -i %i -j ACCEPT; iptables -A FORWARD -o
>>>> > %i -j
>>>> > ACCEPT; iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
>>>> > PostDown = iptables -D FORWARD -i %i -j ACCEPT; iptables -D FORWARD
>>>> > -o %i
>>>> > -j ACCEPT; iptables -t nat -D POSTROUTING -o eth0 -j MASQUERADE
>>>> > ListenPort = 54930
>>>> > PrivateKey = xxxxx
>>>> >
>>>> > [Peer]
>>>> > PublicKey = xxxx
>>>> > AllowedIPs = 192.168.100.2/32
>>>> >
>>>> >
>>>> > on my client my config is
>>>> >
>>>> > [Interface]
>>>> > Address = 192.168.100.2
>>>> > PrivateKey = xxxxx
>>>> > ListenPort = 21841
>>>> > DNS = 192.168.1.63
>>>> >
>>>> > [Peer]
>>>> > PublicKey = xxxx
>>>> > Endpoint = ddns:xxx
>>>> > AllowedIPs = 192.168.1.0/24
>>>> >
>>>> > # This is for if you're behind a NAT and
>>>> > # want the connection to be kept alive.
>>>> > PersistentKeepalive = 25
>>>>
>>>> Try changing AllowedIPs in the client config to:
>>>> AllowedIPs = 192.168.100.1/32,192.168.1.0/24
>>>>
>>>> Also, if you want to masquerade the traffic to the internet you need to
>>>> add 0.0.0.0./0 to the client or change the destination IP to the server
>>>> node via a NAT rule, otherwise it's going to be rejected because the IP
>>>> packet doesn't have an AllowedIP address, I think. (The source needs to
>>>> match, so either 192.168.100.1/32 or 192.168.1.0/24). My guess is
>>>> that's why you couldn't complete the handshake.
>>>>
>>>> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>

--000000000000ca12b305837c8fde
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:verdana,=
sans-serif">I&#39;m a little confused as to the network architecture.=C2=A0=
 Are your running a wireguard VPN inside of your OpenVPN?=C2=A0 Or do you h=
ave two VPN&#39;s connecting into your host independently?=C2=A0 Either way=
, the first thing I would look at is your ip route tables.=C2=A0 You need t=
o make sure that packets that arrive on one interface (e.g. wg0) are replie=
d to over that same interface and are not directed out somewhere else by vi=
rtue of the default route pointing elsewhere.</div><div class=3D"gmail_defa=
ult" style=3D"font-family:verdana,sans-serif"><br></div><div class=3D"gmail=
_default" style=3D"font-family:verdana,sans-serif">David</div></div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 6=
, 2019 at 1:23 PM Arpit Gupta &lt;<a href=3D"mailto:g.arpit@gmail.com">g.ar=
pit@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex"><div dir=3D"ltr">Actually false alarm :(.<div><br></div><div>C=
an only get it to work if i add a policy rule in my router vpn client to se=
nd all traffic from host running wireguard through the WAN and thus skippin=
g VPN which is not ideal as when i am routing all traffic through wireguard=
 ideally i want it to use the vpn tunnel on my router.</div><div><br></div>=
<div><br clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail-m_-170330502574=
9338391gmail_signature"><div dir=3D"ltr"><div>--</div>Arpit</div></div></di=
v><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"=
gmail_attr">On Wed, Mar 6, 2019 at 8:20 AM Arpit Gupta &lt;<a href=3D"mailt=
o:g.arpit@gmail.com" target=3D"_blank">g.arpit@gmail.com</a>&gt; wrote:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Go=
t it working :).<div><br></div><div>Did not need to change any client or se=
rver settings. However needed to add another policy rule in my vpn client. =
Rule states</div><div><br></div><div>Source: wireguard server</div><div>des=
tination: <a href=3D"http://192.168.100.0/24" target=3D"_blank">192.168.100=
.0/24</a> (so any of my wireguard clients)</div><div>interface: WAN</div><d=
iv><br></div><div>So this way wireguard traffic does not go through the VPN=
.=C2=A0<br clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail-m_-1703305025=
749338391gmail-m_3041124942920358459gmail_signature"><div dir=3D"ltr"><div>=
--</div>Arpit</div></div></div><br></div></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 6, 2019 at 7:59 AM Arp=
it Gupta &lt;<a href=3D"mailto:g.arpit@gmail.com" target=3D"_blank">g.arpit=
@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"ltr">Tried changing the allowed ip&#39;s to what was=
 suggested and it did not work. Same behavior as before. Also my configs we=
re working as expected before i had my router connected to a vpn service.<d=
iv><br></div><div>It required me to add the following route policy for my v=
pn client on my router</div><div><br></div><div>Source IP: <a href=3D"http:=
//192.168.1.0/24" target=3D"_blank">192.168.1.0/24</a>, Destination: 0.0.0.=
0 will go throuh the VPN. So if it matters if i connected to wireguard usin=
g the ip address of the ISP vs the IP address of the VPN?</div><div><br></d=
iv><div><br clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail-m_-170330502=
5749338391gmail-m_3041124942920358459gmail-m_6695934501888018956gmail_signa=
ture"><div dir=3D"ltr"><div>--</div>Arpit</div></div></div><br></div></div>=
<br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed=
, Mar 6, 2019 at 1:18 AM XRP &lt;xrp@airmail.cc&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">On Wed, 2019-03-06 at 08:40 +000=
0, Arpit Gupta wrote:<br>
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
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank">WireGuard@li=
sts.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinfo/wireguard=
</a><br>
</blockquote></div>

--000000000000ca12b305837c8fde--

--===============8903159058329571560==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============8903159058329571560==--
