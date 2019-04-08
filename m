Return-Path: <SRS0=LHA5=SK=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C24EBC10F0E
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  8 Apr 2019 01:40:26 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EBCFF20880
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  8 Apr 2019 01:40:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="TiX9kdDj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EBCFF20880
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 839bf199;
	Mon, 8 Apr 2019 01:37:28 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3e59abc8
 for <wireguard@lists.zx2c4.com>; Mon, 8 Apr 2019 01:37:26 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 15150613
 for <wireguard@lists.zx2c4.com>; Mon, 8 Apr 2019 01:37:26 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d4fea37d
 for <wireguard@lists.zx2c4.com>; Mon, 8 Apr 2019 01:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=2DE4Txee6vOHlvGu/ZvTzxNA+Fw=; b=TiX9kd
 DjmQobY/bCcvc3csL6jvxt9tDAwUGC55BQMpc1kLgr1TJWGK+UYXbs1sLRI4Jw6d
 2owiNMVRDMc7vCLFUzEg+VyBQjz70JfHvzFN6e1gtqpJqeGURrN6LeJdJs4Sm9Eb
 WHW2Z54ZfDdDC07OSQigcdEuWqtwkEU60Wvd+YKC3ox4lNI5yj+t1m+K5u30kcaF
 RiuySl3KW+4K3XzvvDE3w9r4LJH1nFrjztYpD2AvrowcAWp6M7rhDTmEeFapJibB
 jIDrJXe0HJ9r+E0lO6fFk3JH/hLMCHQtAFYhd+EVrY9D70Vz499WOwm5VsKyFhq7
 Z0H23M0+ZwvMqznw==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 8cd104d7
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 8 Apr 2019 01:16:12 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id y84so9156574oia.12
 for <wireguard@lists.zx2c4.com>; Sun, 07 Apr 2019 18:40:04 -0700 (PDT)
X-Gm-Message-State: APjAAAWyzML7zrW+lttBItd2Y0ByOYUPaJWBu8jMzlkf8YwhGFWisNrB
 Fbr15UN8Fr5Q/GIn1UocFbOIVV0dAycSM8W57BY=
X-Google-Smtp-Source: APXvYqxV/RmMpSmzS8uE5nzIpe2fVlfjyIN/qnItz3dqjuuzoMmalskTyHfWCMwwVA9VRjgtkCtnl4hrEZY5ToBkS3w=
X-Received: by 2002:aca:e58b:: with SMTP id
 c133mr14291411oih.119.1554687602273; 
 Sun, 07 Apr 2019 18:40:02 -0700 (PDT)
MIME-Version: 1.0
References: <75dc1198-7727-f342-2756-a160f3f3f994@gmail.com>
 <911c5ed5-0bf8-80bb-cf15-7b2c6ee896fa@m7n.se>
 <d46cbe36-887a-d7ab-4daa-3aea02b78e8c@gmail.com>
In-Reply-To: <d46cbe36-887a-d7ab-4daa-3aea02b78e8c@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 8 Apr 2019 10:39:48 +0900
X-Gmail-Original-Message-ID: <CAHmME9r3rb1ib6c03=z5662ZdP4O2sPTyvGikpWAPKOUChkY=A@mail.gmail.com>
Message-ID: <CAHmME9r3rb1ib6c03=z5662ZdP4O2sPTyvGikpWAPKOUChkY=A@mail.gmail.com>
Subject: Re: Multiple VPN connections on Android
To: Julian Orth <ju.orth@gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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
Content-Type: multipart/mixed; boundary="===============2934158527919456010=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============2934158527919456010==
Content-Type: multipart/alternative; boundary="00000000000045366a0585faea0c"

--00000000000045366a0585faea0c
Content-Type: text/plain; charset="UTF-8"

That's an interesting point; in theory it's probably possible to multiplex
into one tun device, provided the routes for each distinct wg interface
don't overlap.

On Sun, Apr 7, 2019, 19:37 Julian Orth <ju.orth@gmail.com> wrote:

> On 3/26/19 8:49 PM, mikma.wg@lists.m7n.se wrote:>
> > On 2019-03-26 15:17, Julian Orth wrote:
> >> Hello list,
> >>
> >> I'm currently using WireGuard on Android for two purposes:
> >>
> >> 1. Routing all traffic via a commercial VPN provider to protect myself
> on
> >>     open wireless networks.
> >> 2. Connecting to my home network.
> >>
> >> Unfortunately WireGuard on Android does not allow me to do both of these
> >> things at the same time. I assume this is because VpnService [1] only
> allows 1
> >> VPN connection at a time.
> >
> > Can't you add the peer for your home network to the same configuration
> (tun
> > device) as the peer for the commercial VPN provider? It seems a straight
> > forward solution to me if you are okay with the IP addresses assigned by
> the
> > VPN provider.
>
> Using the same src IP is not going to work in my case. The VPN provider
> might
> also assign me a new IP and then I might have to reconfigure my home
> network.
> Not something I want to deal with.
>
> But this would also require me to share the same public key between my home
> network and the VPN provider. For some reason this does not feel right to
> me. On
> the other hand, I use the same SSH key on multiple sites so maybe this
> feeling
> is not justified.
>
> My current provider allows me to generate the key pair locally and to only
> send
> them the public key. If they insistet on generating the keys on their
> servers
> and sending me the private key, then this solution would be impossible.
>
> >
> >>
> >> Has any thought been put into emulating multiple tun devices in user
> space?
> >
> > I don't see why you would need multiple tun devices.
>
> By "emulating multiple tun devices" I did not mean emulating all of the
> functionality of tun devices. Packets are processed as follows right now:
>
> 1. Kernel chooses the correct route and device
> 2. Kernel sends the packet via the device
> 3. If the device is a wireguard tun device:
>    a. Choose the peer and wrap the packet in a wireguard packet
>    b. Goto 1 with the original packet replaced by the wrapped packet
>
> What I suggest is emulating steps 1 and 2. An emulated tun devices would
> therefore only have to consist of a set of assigned routes and an instance
> of
> the wireguard core that implements step 3.
>
> Let's say the Android app currently processes packets as follows:
>
> void process(packet) {
>     peer, packet := wireguard.process(packet);
>     peer.udp_send(packet);
> }
>
> My suggestion is to change this as follows:
>
> void process(packet) {
>     seen_peers := { }; // a set
>     while (true) {
>         tap_dev := find_tap_dev(packet.dst);
>         peer, packet := tap_dev.process(packet);
>         if (seen_peers.contains(peer)) {
>             // routing loop
>             return;
>         }
>         seen_peers.add(peer);
>         if (find_tap_dev(packet.dst) == null) {
>             peer.udp_send(packet);
>             return;
>         }
>     }
> }
>
> The Android tun device created via VpnService would then of course contain
> the
> union of all routes of the emulated tun devices.
>
> >                                                      It is possible to
> add
> > multiple IPv4 and IPv6 addresses to the tun device, but there may be a
> problem
> > with the source address selection. Linux allows specifying a preferred
> address
> > for each route, but it isn't possible in the Android API AFAIK. If you
> have a
> > rooted device then you can potentially update the routing tables with the
> > preferred source address for each VPN route.
>
> I don't think routing should be necessary for this. Afaik, other VPN apps
> already support using multiple tunnels at once.
>
> >
> > /Mikma
>
> PS: Your mail was classified as spam by gmail.
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>

--00000000000045366a0585faea0c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>That&#39;s an interesting point; in theory it&#39;s =
probably possible to multiplex into one tun device, provided the routes for=
 each distinct wg interface don&#39;t overlap.<br><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Apr 7, 2019, 19:37 Juli=
an Orth &lt;<a href=3D"mailto:ju.orth@gmail.com">ju.orth@gmail.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex">On 3/26/19 8:49 PM, <a href=
=3D"mailto:mikma.wg@lists.m7n.se" target=3D"_blank" rel=3D"noreferrer">mikm=
a.wg@lists.m7n.se</a> wrote:&gt;<br>
&gt; On 2019-03-26 15:17, Julian Orth wrote:<br>
&gt;&gt; Hello list,<br>
&gt;&gt;<br>
&gt;&gt; I&#39;m currently using WireGuard on Android for two purposes:<br>
&gt;&gt;<br>
&gt;&gt; 1. Routing all traffic via a commercial VPN provider to protect my=
self on<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0open wireless networks.<br>
&gt;&gt; 2. Connecting to my home network.<br>
&gt;&gt;<br>
&gt;&gt; Unfortunately WireGuard on Android does not allow me to do both of=
 these<br>
&gt;&gt; things at the same time. I assume this is because VpnService [1] o=
nly allows 1<br>
&gt;&gt; VPN connection at a time.<br>
&gt;<br>
&gt; Can&#39;t you add the peer for your home network to the same configura=
tion (tun<br>
&gt; device) as the peer for the commercial VPN provider? It seems a straig=
ht<br>
&gt; forward solution to me if you are okay with the IP addresses assigned =
by the<br>
&gt; VPN provider.<br>
<br>
Using the same src IP is not going to work in my case. The VPN provider mig=
ht<br>
also assign me a new IP and then I might have to reconfigure my home networ=
k.<br>
Not something I want to deal with.<br>
<br>
But this would also require me to share the same public key between my home=
<br>
network and the VPN provider. For some reason this does not feel right to m=
e. On<br>
the other hand, I use the same SSH key on multiple sites so maybe this feel=
ing<br>
is not justified.<br>
<br>
My current provider allows me to generate the key pair locally and to only =
send<br>
them the public key. If they insistet on generating the keys on their serve=
rs<br>
and sending me the private key, then this solution would be impossible.<br>
<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; Has any thought been put into emulating multiple tun devices in us=
er space?<br>
&gt;<br>
&gt; I don&#39;t see why you would need multiple tun devices.<br>
<br>
By &quot;emulating multiple tun devices&quot; I did not mean emulating all =
of the<br>
functionality of tun devices. Packets are processed as follows right now:<b=
r>
<br>
1. Kernel chooses the correct route and device<br>
2. Kernel sends the packet via the device<br>
3. If the device is a wireguard tun device:<br>
=C2=A0 =C2=A0a. Choose the peer and wrap the packet in a wireguard packet<b=
r>
=C2=A0 =C2=A0b. Goto 1 with the original packet replaced by the wrapped pac=
ket<br>
<br>
What I suggest is emulating steps 1 and 2. An emulated tun devices would<br=
>
therefore only have to consist of a set of assigned routes and an instance =
of<br>
the wireguard core that implements step 3.<br>
<br>
Let&#39;s say the Android app currently processes packets as follows:<br>
<br>
void process(packet) {<br>
=C2=A0 =C2=A0 peer, packet :=3D wireguard.process(packet);<br>
=C2=A0 =C2=A0 peer.udp_send(packet);<br>
}<br>
<br>
My suggestion is to change this as follows:<br>
<br>
void process(packet) {<br>
=C2=A0 =C2=A0 seen_peers :=3D { }; // a set<br>
=C2=A0 =C2=A0 while (true) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 tap_dev :=3D find_tap_dev(packet.dst);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 peer, packet :=3D tap_dev.process(packet);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (seen_peers.contains(peer)) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 // routing loop<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 seen_peers.add(peer);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (find_tap_dev(packet.dst) =3D=3D null) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 peer.udp_send(packet);<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
=C2=A0 =C2=A0 }<br>
}<br>
<br>
The Android tun device created via VpnService would then of course contain =
the<br>
union of all routes of the emulated tun devices.<br>
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 It is possible to add<br>
&gt; multiple IPv4 and IPv6 addresses to the tun device, but there may be a=
 problem<br>
&gt; with the source address selection. Linux allows specifying a preferred=
 address<br>
&gt; for each route, but it isn&#39;t possible in the Android API AFAIK. If=
 you have a<br>
&gt; rooted device then you can potentially update the routing tables with =
the<br>
&gt; preferred source address for each VPN route.<br>
<br>
I don&#39;t think routing should be necessary for this. Afaik, other VPN ap=
ps<br>
already support using multiple tunnels at once.<br>
<br>
&gt;<br>
&gt; /Mikma<br>
<br>
PS: Your mail was classified as spam by gmail.<br>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank" rel=3D"noref=
errer">WireGuard@lists.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer noreferrer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinf=
o/wireguard</a><br>
</blockquote></div></div></div>

--00000000000045366a0585faea0c--

--===============2934158527919456010==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============2934158527919456010==--
