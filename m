Return-Path: <SRS0=bcVQ=RK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,
	WEIRD_PORT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A003C43381
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  7 Mar 2019 19:18:43 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7DCEB20449
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  7 Mar 2019 19:18:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OVwq/3dN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7DCEB20449
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e617888d;
	Thu, 7 Mar 2019 19:08:03 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6816eb91
 for <wireguard@lists.zx2c4.com>; Thu, 7 Mar 2019 19:08:01 +0000 (UTC)
Received: from mail-qt1-x82d.google.com (mail-qt1-x82d.google.com
 [IPv6:2607:f8b0:4864:20::82d])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 87dc0c18
 for <wireguard@lists.zx2c4.com>; Thu, 7 Mar 2019 19:08:01 +0000 (UTC)
Received: by mail-qt1-x82d.google.com with SMTP id p25so18479288qtb.3
 for <wireguard@lists.zx2c4.com>; Thu, 07 Mar 2019 11:18:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7SovzrTPmvmdTM7AC2w0IAb5ZeB93/nvk4mlz9DOr+g=;
 b=OVwq/3dNjzC1iZKQs+Nz2KXZcQjZgKrcnG3zqyXxtB/GqqV/gxpuPRATfWgPRo/cy8
 G2Y0WixXFLEuYJOGkra06KnWe9cBO7XLfjxWs7HWuCetZzqaloro9xHu1UnIcWEbbZhb
 JnmEOez7GXp34GW18Zs4btb9+AOuwch9rDtQCtdeuWAUyio+pxqC90vyZJVfZQ+Kdk6I
 B828ZK4sH3cUuAzmWqPWOtZ463guDG7WuhweZGGbbwS+o27JBccUKVcGWPE6PpgB9xX/
 j3etkxAW8wSEJrTvqhxOJc6vvHS41OAvuEooZvlO/tu32pC8e3O7WSfwcn1P4nxGnell
 dffw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7SovzrTPmvmdTM7AC2w0IAb5ZeB93/nvk4mlz9DOr+g=;
 b=rwz1NY02Dv11U97nKMRKQiMOe9r/v7/Ik6YTUc4HzweVZ4G7jFxmnll8T3Fe2bYZeO
 MD7OvwBYZVWbB4tACT4hlyU2ICVUsFsPi1qzRUMjiCmap3hxwWNsO7bqgbOsHZQNHr0W
 5mbEGymHxDj3lbbElyQWKMKV+rbwU0h+9gk9yIaFns4yOt/PJCuu802daRj1JmopbIXv
 /lYmZ+yBq1W+4mcaYHQ7zPSa3zxSGzhWbWJQ4uGZwd0MvnwmYJhpp8eFDJV5GRIrgTI2
 E6L21wsNvO/cZCSVmNqm3FGOZVc82KRDp35h2vPM+NVCU/TR3p+NJMnVAsOejtc6C9D8
 PiSg==
X-Gm-Message-State: APjAAAX4kfBUIHVeSGDFroDKbeDso+8nqsk2UPsK2R8GMZUjaIc2wg5e
 qIqOT+G7GYKiRiMvPExgSxjF/ixfN7sxgm+5u1c=
X-Google-Smtp-Source: APXvYqyGNKsX3PsOX2VtczVUH7F1Jlw7EePzB4YQjICFUB6JbYDkmucKDU2CrX9Ti5ls0hEK6wfH0MahZMELbDM1ho0=
X-Received: by 2002:a0c:9624:: with SMTP id 33mr12186490qvx.101.1551986317814; 
 Thu, 07 Mar 2019 11:18:37 -0800 (PST)
MIME-Version: 1.0
References: <CAGCGytLuf1Lhm-oQrL+ACOJw0wMu3wcXPOS0qufRWo1w47RQ+g@mail.gmail.com>
 <3053f293b7e9a34a733c2b5b314e2d8a620682db.camel@airmail.cc>
 <CAGCGyt+gvYDHR3KHi+HRc2pCnyLbefV3h=OmfSOqhfdR564p0w@mail.gmail.com>
 <CAGCGyt+cKUuaSh8pSATmRSUGpaeyc0rKvSoF_sABPO-hsJ5HAQ@mail.gmail.com>
 <CAGCGytKU9FfKgYoyKSwoH8B0rLqh8PPG=SyzTNO1pQG4feUO=A@mail.gmail.com>
 <CAJJxGdFAvUXVrVy+qKF8pp2qCNv93tVW818opfJPJBxmA15EOw@mail.gmail.com>
 <CAGCGytL6SoA4pJRE1wJ2r9V80WMeyXKMyVatTm+N0Ox4-a-d0w@mail.gmail.com>
In-Reply-To: <CAGCGytL6SoA4pJRE1wJ2r9V80WMeyXKMyVatTm+N0Ox4-a-d0w@mail.gmail.com>
From: Arpit Gupta <g.arpit@gmail.com>
Date: Thu, 7 Mar 2019 11:18:26 -0800
Message-ID: <CAGCGytJgXWOjk2YuTau9TB6QCqD_W9r5CkuaN1tcBnJuHEcjnw@mail.gmail.com>
Subject: Re: cant connect to wireguard when router connected to a vpn service
To: David Kerr <david@kerr.net>
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
Content-Type: multipart/mixed; boundary="===============9130445954347640820=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============9130445954347640820==
Content-Type: multipart/alternative; boundary="0000000000002b71ad058385f964"

--0000000000002b71ad058385f964
Content-Type: text/plain; charset="UTF-8"

Man this was a pebkac issue :).

The way i was using wireguard before was i would always leave it on even
when i was at home. However now when i am home my wireless is connected to
mullvad vpn. So when i tried to connect to wireguard using the vpn ip it
did not work. When i switched my phone's wifi off and then used the vpn ip
to connect to wireguard it worked just fine.

Now i willl do some research on how can i make this work at home and
outside :).

Sorry for all the noise.

Thanks
--
Arpit


On Thu, Mar 7, 2019 at 9:54 AM Arpit Gupta <g.arpit@gmail.com> wrote:

> I am noob in networking commands so looking for any pointers :). I think
> the issue is packets are getting directed some where else because of a
> default route.
>
> Here is info on my setup.
>
> Wireguard running on host: 192.168.1.63
>
> Router: 192.168.1.1 is also running a VPN Client and is connected to
> mullvad vpn service. This sets up a tunnel on my router. I have a policy
> rule setup on my router that sends all traffic from 192.168.1.0/24
> through the vpn tunnel.
>
> I setup port forwarding according to mullvad guides on my router. I have
> confirmed port forwarding in mullvad is working as i am forwarding ports to
> other services without any issues.
>
> iptables -t nat -A PREROUTING -i tun+ -p tcp --dport xxxx -j DNAT
> --to-destination 192.168.1.63:54930
> iptables -t nat -A PREROUTING -i tun+ -p udp --dport xxxx -j DNAT
> --to-destination 192.168.1.63:54930
>
> However even with these rules i am not able to connect to wireguard when
> using my vpn ip.
>
>
> Now if i add a route to my vpn client that states all traffic from
> 192.168.1.63 goes through the wan then i can connect to wireguard but using
> my isp's ip address. With this setup i only have access to lan. My ideal
> setup so that i dont need to switch to different wireguard tunnel when i
> leave my home network is that i be able access my lan as well as route all
> traffic via mullvad.
>
>
> So i think the issue i need to solve is how come i am not able to reach
> wireguard even with port forwarding setup in mullvad when using my vpn ip.
>
> --
> Arpit
>
>
> On Thu, Mar 7, 2019 at 12:04 AM David Kerr <david@kerr.net> wrote:
>
>> I'm a little confused as to the network architecture.  Are your running a
>> wireguard VPN inside of your OpenVPN?  Or do you have two VPN's connecting
>> into your host independently?  Either way, the first thing I would look at
>> is your ip route tables.  You need to make sure that packets that arrive on
>> one interface (e.g. wg0) are replied to over that same interface and are
>> not directed out somewhere else by virtue of the default route pointing
>> elsewhere.
>>
>> David
>>
>> On Wed, Mar 6, 2019 at 1:23 PM Arpit Gupta <g.arpit@gmail.com> wrote:
>>
>>> Actually false alarm :(.
>>>
>>> Can only get it to work if i add a policy rule in my router vpn client
>>> to send all traffic from host running wireguard through the WAN and thus
>>> skipping VPN which is not ideal as when i am routing all traffic through
>>> wireguard ideally i want it to use the vpn tunnel on my router.
>>>
>>>
>>> --
>>> Arpit
>>>
>>>
>>> On Wed, Mar 6, 2019 at 8:20 AM Arpit Gupta <g.arpit@gmail.com> wrote:
>>>
>>>> Got it working :).
>>>>
>>>> Did not need to change any client or server settings. However needed to
>>>> add another policy rule in my vpn client. Rule states
>>>>
>>>> Source: wireguard server
>>>> destination: 192.168.100.0/24 (so any of my wireguard clients)
>>>> interface: WAN
>>>>
>>>> So this way wireguard traffic does not go through the VPN.
>>>> --
>>>> Arpit
>>>>
>>>>
>>>> On Wed, Mar 6, 2019 at 7:59 AM Arpit Gupta <g.arpit@gmail.com> wrote:
>>>>
>>>>> Tried changing the allowed ip's to what was suggested and it did not
>>>>> work. Same behavior as before. Also my configs were working as expected
>>>>> before i had my router connected to a vpn service.
>>>>>
>>>>> It required me to add the following route policy for my vpn client on
>>>>> my router
>>>>>
>>>>> Source IP: 192.168.1.0/24, Destination: 0.0.0.0 will go throuh the
>>>>> VPN. So if it matters if i connected to wireguard using the ip address of
>>>>> the ISP vs the IP address of the VPN?
>>>>>
>>>>>
>>>>> --
>>>>> Arpit
>>>>>
>>>>>
>>>>> On Wed, Mar 6, 2019 at 1:18 AM XRP <xrp@airmail.cc> wrote:
>>>>>
>>>>>> On Wed, 2019-03-06 at 08:40 +0000, Arpit Gupta wrote:
>>>>>> > On my server my conf is
>>>>>> >
>>>>>> > [Interface]
>>>>>> > Address = 192.168.100.1/32
>>>>>> > PostUp = iptables -A FORWARD -i %i -j ACCEPT; iptables -A FORWARD -o
>>>>>> > %i -j
>>>>>> > ACCEPT; iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
>>>>>> > PostDown = iptables -D FORWARD -i %i -j ACCEPT; iptables -D FORWARD
>>>>>> > -o %i
>>>>>> > -j ACCEPT; iptables -t nat -D POSTROUTING -o eth0 -j MASQUERADE
>>>>>> > ListenPort = 54930
>>>>>> > PrivateKey = xxxxx
>>>>>> >
>>>>>> > [Peer]
>>>>>> > PublicKey = xxxx
>>>>>> > AllowedIPs = 192.168.100.2/32
>>>>>> >
>>>>>> >
>>>>>> > on my client my config is
>>>>>> >
>>>>>> > [Interface]
>>>>>> > Address = 192.168.100.2
>>>>>> > PrivateKey = xxxxx
>>>>>> > ListenPort = 21841
>>>>>> > DNS = 192.168.1.63
>>>>>> >
>>>>>> > [Peer]
>>>>>> > PublicKey = xxxx
>>>>>> > Endpoint = ddns:xxx
>>>>>> > AllowedIPs = 192.168.1.0/24
>>>>>> >
>>>>>> > # This is for if you're behind a NAT and
>>>>>> > # want the connection to be kept alive.
>>>>>> > PersistentKeepalive = 25
>>>>>>
>>>>>> Try changing AllowedIPs in the client config to:
>>>>>> AllowedIPs = 192.168.100.1/32,192.168.1.0/24
>>>>>>
>>>>>> Also, if you want to masquerade the traffic to the internet you need
>>>>>> to
>>>>>> add 0.0.0.0./0 to the client or change the destination IP to the
>>>>>> server
>>>>>> node via a NAT rule, otherwise it's going to be rejected because the
>>>>>> IP
>>>>>> packet doesn't have an AllowedIP address, I think. (The source needs
>>>>>> to
>>>>>> match, so either 192.168.100.1/32 or 192.168.1.0/24). My guess is
>>>>>> that's why you couldn't complete the handshake.
>>>>>>
>>>>>> _______________________________________________
>>> WireGuard mailing list
>>> WireGuard@lists.zx2c4.com
>>> https://lists.zx2c4.com/mailman/listinfo/wireguard
>>>
>>

--0000000000002b71ad058385f964
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Man this was a pebkac issue :).<div><br></div><div>The way=
 i was using wireguard before was i would always leave it on even when i wa=
s at home. However now when i am home my wireless is connected to mullvad v=
pn. So when i tried to connect to wireguard using the vpn ip it did not wor=
k. When i switched my phone&#39;s wifi off and then used the vpn ip to conn=
ect to wireguard it worked just fine.</div><div><br></div><div>Now i willl =
do some research on how can i make this work at home and outside :).</div><=
div><br></div><div>Sorry for all the noise.</div><div><br></div><div>Thanks=
<br clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_signature" data-smar=
tmail=3D"gmail_signature"><div dir=3D"ltr"><div>--</div>Arpit</div></div></=
div><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Thu, Mar 7, 2019 at 9:54 AM Arpit Gupta &lt;<a href=3D"m=
ailto:g.arpit@gmail.com">g.arpit@gmail.com</a>&gt; wrote:<br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"ltr"=
><div dir=3D"ltr">I am noob in networking commands so looking for any point=
ers :). I think the issue is packets are getting directed some where else b=
ecause of a default route.=C2=A0<div><br></div><div>Here is info on my setu=
p.</div><div><br></div><div>Wireguard running on host: 192.168.1.63</div><d=
iv><br></div><div>Router: 192.168.1.1 is also running a VPN Client and is c=
onnected to mullvad vpn service. This sets up a tunnel on my router. I have=
 a policy rule setup on my router that sends all traffic from <a href=3D"ht=
tp://192.168.1.0/24" target=3D"_blank">192.168.1.0/24</a> through the vpn t=
unnel.</div><div><br></div><div>I setup port forwarding according to mullva=
d guides on my router. I have confirmed port forwarding in mullvad is worki=
ng as i am forwarding ports to other services without any issues.</div><div=
><br></div><div>iptables -t nat -A PREROUTING -i tun+ -p tcp --dport xxxx -=
j DNAT --to-destination <a href=3D"http://192.168.1.63:54930" target=3D"_bl=
ank">192.168.1.63:54930</a></div><div>iptables -t nat -A PREROUTING -i tun+=
 -p udp --dport xxxx -j DNAT --to-destination <a href=3D"http://192.168.1.6=
3:54930" target=3D"_blank">192.168.1.63:54930</a>=C2=A0<br></div><div><br><=
/div><div>However even with these rules i am not able to connect to wiregua=
rd when using my vpn ip.</div><div><br></div><div><br></div><div>Now if i a=
dd a route to my vpn client that states all traffic from 192.168.1.63 goes =
through the wan then i can connect to wireguard but using my isp&#39;s ip a=
ddress. With this setup i only have access to lan. My ideal setup so that i=
 dont need to switch to different wireguard tunnel when i leave my home net=
work is that i be able access my lan as well as route all traffic via mullv=
ad.</div><div><br></div><div><br></div><div>So i think the issue i need to =
solve is how come i am not able to reach wireguard even with port forwardin=
g setup in mullvad when using my vpn ip.</div><div><br clear=3D"all"><div><=
div dir=3D"ltr" class=3D"gmail-m_654336866890567803gmail_signature"><div di=
r=3D"ltr"><div>--</div>Arpit</div></div></div><br></div></div></div></div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu,=
 Mar 7, 2019 at 12:04 AM David Kerr &lt;<a href=3D"mailto:david@kerr.net" t=
arget=3D"_blank">david@kerr.net</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_defau=
lt" style=3D"font-family:verdana,sans-serif">I&#39;m a little confused as t=
o the network architecture.=C2=A0 Are your running a wireguard VPN inside o=
f your OpenVPN?=C2=A0 Or do you have two VPN&#39;s connecting into your hos=
t independently?=C2=A0 Either way, the first thing I would look at is your =
ip route tables.=C2=A0 You need to make sure that packets that arrive on on=
e interface (e.g. wg0) are replied to over that same interface and are not =
directed out somewhere else by virtue of the default route pointing elsewhe=
re.</div><div class=3D"gmail_default" style=3D"font-family:verdana,sans-ser=
if"><br></div><div class=3D"gmail_default" style=3D"font-family:verdana,san=
s-serif">David</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" c=
lass=3D"gmail_attr">On Wed, Mar 6, 2019 at 1:23 PM Arpit Gupta &lt;<a href=
=3D"mailto:g.arpit@gmail.com" target=3D"_blank">g.arpit@gmail.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr">Actually false alarm :(.<div><br></div><div>Can only get it to wor=
k if i add a policy rule in my router vpn client to send all traffic from h=
ost running wireguard through the WAN and thus skipping VPN which is not id=
eal as when i am routing all traffic through wireguard ideally i want it to=
 use the vpn tunnel on my router.</div><div><br></div><div><br clear=3D"all=
"><div><div dir=3D"ltr" class=3D"gmail-m_654336866890567803gmail-m_19373170=
55147639516gmail-m_-1703305025749338391gmail_signature"><div dir=3D"ltr"><d=
iv>--</div>Arpit</div></div></div><br></div></div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 6, 2019 at 8:20 AM =
Arpit Gupta &lt;<a href=3D"mailto:g.arpit@gmail.com" target=3D"_blank">g.ar=
pit@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex"><div dir=3D"ltr">Got it working :).<div><br></div><div>Did not=
 need to change any client or server settings. However needed to add anothe=
r policy rule in my vpn client. Rule states</div><div><br></div><div>Source=
: wireguard server</div><div>destination: <a href=3D"http://192.168.100.0/2=
4" target=3D"_blank">192.168.100.0/24</a> (so any of my wireguard clients)<=
/div><div>interface: WAN</div><div><br></div><div>So this way wireguard tra=
ffic does not go through the VPN.=C2=A0<br clear=3D"all"><div><div dir=3D"l=
tr" class=3D"gmail-m_654336866890567803gmail-m_1937317055147639516gmail-m_-=
1703305025749338391gmail-m_3041124942920358459gmail_signature"><div dir=3D"=
ltr"><div>--</div>Arpit</div></div></div><br></div></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 6, 2019 at 7=
:59 AM Arpit Gupta &lt;<a href=3D"mailto:g.arpit@gmail.com" target=3D"_blan=
k">g.arpit@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex"><div dir=3D"ltr">Tried changing the allowed ip&#39;s to=
 what was suggested and it did not work. Same behavior as before. Also my c=
onfigs were working as expected before i had my router connected to a vpn s=
ervice.<div><br></div><div>It required me to add the following route policy=
 for my vpn client on my router</div><div><br></div><div>Source IP: <a href=
=3D"http://192.168.1.0/24" target=3D"_blank">192.168.1.0/24</a>, Destinatio=
n: 0.0.0.0 will go throuh the VPN. So if it matters if i connected to wireg=
uard using the ip address of the ISP vs the IP address of the VPN?</div><di=
v><br></div><div><br clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail-m_6=
54336866890567803gmail-m_1937317055147639516gmail-m_-1703305025749338391gma=
il-m_3041124942920358459gmail-m_6695934501888018956gmail_signature"><div di=
r=3D"ltr"><div>--</div>Arpit</div></div></div><br></div></div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 6, 2019=
 at 1:18 AM XRP &lt;xrp@airmail.cc&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">On Wed, 2019-03-06 at 08:40 +0000, Arpit Gupt=
a wrote:<br>
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
</blockquote></div>
</blockquote></div>

--0000000000002b71ad058385f964--

--===============9130445954347640820==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============9130445954347640820==--
