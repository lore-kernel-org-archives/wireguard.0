Return-Path: <SRS0=xbiu=RJ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34C75C43381
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  6 Mar 2019 16:21:09 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BCEED20684
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  6 Mar 2019 16:21:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="URKL6fWV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BCEED20684
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c908c5da;
	Wed, 6 Mar 2019 16:10:38 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d64f2144
 for <wireguard@lists.zx2c4.com>; Wed, 6 Mar 2019 16:10:35 +0000 (UTC)
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e8b5b7ea
 for <wireguard@lists.zx2c4.com>; Wed, 6 Mar 2019 16:10:35 +0000 (UTC)
Received: by mail-qt1-x831.google.com with SMTP id v10so13450377qtp.8
 for <wireguard@lists.zx2c4.com>; Wed, 06 Mar 2019 08:21:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+qBHyuoIWxBC+nqit23CS9gppkjHRgL+nNs2t7V1UsU=;
 b=URKL6fWVOnMZppxmnhwVghAKslVGhg8jk1j6y+4Fazi9A6vsdvrkpxo4VMcA2zoK44
 Ao1mY8FTcrgbX9LOl7oj69qlZV8TD8BuDdPwOgRTCPaCXRxIgKG2D559WOabkh00WK7i
 cpIJ1ZycecmaLKclt154FeoPdoBObTIy1/UPJCpeUroIi6vuE6VYQeqON7741FxDhjsT
 GakfdsanOHcQMZPKh5/Q6uUQM1hpArRAy6rfW2Q8cXqsB4fT6VJp0sApFumt9LMYdhHv
 lfLdCbWLqe6U0gXjJpvEVXdkNqqT1bW8h/hbZWLVJnbYzog8sw3IMOGhRD2tt26FPG2a
 qcdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+qBHyuoIWxBC+nqit23CS9gppkjHRgL+nNs2t7V1UsU=;
 b=NtmAS/Og4AL3ClnK798ojnEDHYZCfz9ZbgEk7GehAqP8RlT6g7GU5b7NLakCs1UZIG
 iqriSFIjxGz2vP8EZinfdzndXxSodx5Zy9/eMzPTMwwgrOWqdc/53TM4oCkFLqpbVM1Q
 DrsQNsTLCrgZwWq2CQQPw3WFnGeIIS20DsUniU+klYW+ANOmpsVWGedZBK6FSPZpbeYz
 V7TfX5o91v2EEuqwqr1SqTmE/BoSQi833Bz+DPjFu8qraHGBKXycWTBS8se4bmEy4CtV
 BQeaKbZYLyMI47w2YhmrPEAjXcFLV2z4aoIdgxFgiyIr/mWzkEK13+AWftRdJ2PrMIzB
 U2UA==
X-Gm-Message-State: APjAAAVM72zLbOAavLf6VM9JzyRbgFdApPE+AQpY67bOxYM24Hh2KZmX
 R9NpUG2f5RTFVWkjdbv5k3l2qNR+Z2H+RZAy7WGNPLHr
X-Google-Smtp-Source: APXvYqznFMQ8Ef6KluoKeNpsljOvWZnf6nIAP82vkAzdIjO32oJnq/rzwscmj+igZgj+b7AYq8Hvti73Jf/Fxz7MKMo=
X-Received: by 2002:a0c:ae78:: with SMTP id z53mr6834637qvc.235.1551889264003; 
 Wed, 06 Mar 2019 08:21:04 -0800 (PST)
MIME-Version: 1.0
References: <CAGCGytLuf1Lhm-oQrL+ACOJw0wMu3wcXPOS0qufRWo1w47RQ+g@mail.gmail.com>
 <3053f293b7e9a34a733c2b5b314e2d8a620682db.camel@airmail.cc>
 <CAGCGyt+gvYDHR3KHi+HRc2pCnyLbefV3h=OmfSOqhfdR564p0w@mail.gmail.com>
In-Reply-To: <CAGCGyt+gvYDHR3KHi+HRc2pCnyLbefV3h=OmfSOqhfdR564p0w@mail.gmail.com>
From: Arpit Gupta <g.arpit@gmail.com>
Date: Wed, 6 Mar 2019 08:20:53 -0800
Message-ID: <CAGCGyt+cKUuaSh8pSATmRSUGpaeyc0rKvSoF_sABPO-hsJ5HAQ@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============8911169448818833896=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============8911169448818833896==
Content-Type: multipart/alternative; boundary="0000000000004fd18b05836f60d9"

--0000000000004fd18b05836f60d9
Content-Type: text/plain; charset="UTF-8"

Got it working :).

Did not need to change any client or server settings. However needed to add
another policy rule in my vpn client. Rule states

Source: wireguard server
destination: 192.168.100.0/24 (so any of my wireguard clients)
interface: WAN

So this way wireguard traffic does not go through the VPN.
--
Arpit


On Wed, Mar 6, 2019 at 7:59 AM Arpit Gupta <g.arpit@gmail.com> wrote:

> Tried changing the allowed ip's to what was suggested and it did not work.
> Same behavior as before. Also my configs were working as expected before i
> had my router connected to a vpn service.
>
> It required me to add the following route policy for my vpn client on my
> router
>
> Source IP: 192.168.1.0/24, Destination: 0.0.0.0 will go throuh the VPN.
> So if it matters if i connected to wireguard using the ip address of the
> ISP vs the IP address of the VPN?
>
>
> --
> Arpit
>
>
> On Wed, Mar 6, 2019 at 1:18 AM XRP <xrp@airmail.cc> wrote:
>
>> On Wed, 2019-03-06 at 08:40 +0000, Arpit Gupta wrote:
>> > On my server my conf is
>> >
>> > [Interface]
>> > Address = 192.168.100.1/32
>> > PostUp = iptables -A FORWARD -i %i -j ACCEPT; iptables -A FORWARD -o
>> > %i -j
>> > ACCEPT; iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
>> > PostDown = iptables -D FORWARD -i %i -j ACCEPT; iptables -D FORWARD
>> > -o %i
>> > -j ACCEPT; iptables -t nat -D POSTROUTING -o eth0 -j MASQUERADE
>> > ListenPort = 54930
>> > PrivateKey = xxxxx
>> >
>> > [Peer]
>> > PublicKey = xxxx
>> > AllowedIPs = 192.168.100.2/32
>> >
>> >
>> > on my client my config is
>> >
>> > [Interface]
>> > Address = 192.168.100.2
>> > PrivateKey = xxxxx
>> > ListenPort = 21841
>> > DNS = 192.168.1.63
>> >
>> > [Peer]
>> > PublicKey = xxxx
>> > Endpoint = ddns:xxx
>> > AllowedIPs = 192.168.1.0/24
>> >
>> > # This is for if you're behind a NAT and
>> > # want the connection to be kept alive.
>> > PersistentKeepalive = 25
>>
>> Try changing AllowedIPs in the client config to:
>> AllowedIPs = 192.168.100.1/32,192.168.1.0/24
>>
>> Also, if you want to masquerade the traffic to the internet you need to
>> add 0.0.0.0./0 to the client or change the destination IP to the server
>> node via a NAT rule, otherwise it's going to be rejected because the IP
>> packet doesn't have an AllowedIP address, I think. (The source needs to
>> match, so either 192.168.100.1/32 or 192.168.1.0/24). My guess is
>> that's why you couldn't complete the handshake.
>>
>>

--0000000000004fd18b05836f60d9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Got it working :).<div><br></div><div>Did not need to chan=
ge any client or server settings. However needed to add another policy rule=
 in my vpn client. Rule states</div><div><br></div><div>Source: wireguard s=
erver</div><div>destination: <a href=3D"http://192.168.100.0/24">192.168.10=
0.0/24</a> (so any of my wireguard clients)</div><div>interface: WAN</div><=
div><br></div><div>So this way wireguard traffic does not go through the VP=
N.=C2=A0<br clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_signature" d=
ata-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div>--</div>Arpit</div>=
</div></div><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr"=
 class=3D"gmail_attr">On Wed, Mar 6, 2019 at 7:59 AM Arpit Gupta &lt;<a hre=
f=3D"mailto:g.arpit@gmail.com">g.arpit@gmail.com</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">Tried chan=
ging the allowed ip&#39;s to what was suggested and it did not work. Same b=
ehavior as before. Also my configs were working as expected before i had my=
 router connected to a vpn service.<div><br></div><div>It required me to ad=
d the following route policy for my vpn client on my router</div><div><br><=
/div><div>Source IP: <a href=3D"http://192.168.1.0/24" target=3D"_blank">19=
2.168.1.0/24</a>, Destination: 0.0.0.0 will go throuh the VPN. So if it mat=
ters if i connected to wireguard using the ip address of the ISP vs the IP =
address of the VPN?</div><div><br></div><div><br clear=3D"all"><div><div di=
r=3D"ltr" class=3D"gmail-m_6695934501888018956gmail_signature"><div dir=3D"=
ltr"><div>--</div>Arpit</div></div></div><br></div></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 6, 2019 at 1=
:18 AM XRP &lt;xrp@airmail.cc&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">On Wed, 2019-03-06 at 08:40 +0000, Arpit Gupta wro=
te:<br>
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

--0000000000004fd18b05836f60d9--

--===============8911169448818833896==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============8911169448818833896==--
