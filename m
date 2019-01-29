Return-Path: <SRS0=D9u6=QF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC6D8C169C4
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 29 Jan 2019 23:55:44 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E0E5A2087E
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 29 Jan 2019 23:55:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=erayd.net header.i=@erayd.net header.b="nFvzKlpa"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E0E5A2087E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=erayd.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e3ea7f2a;
	Tue, 29 Jan 2019 23:49:48 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 47579d39
 for <wireguard@lists.zx2c4.com>;
 Tue, 29 Jan 2019 23:49:45 +0000 (UTC)
Received: from mail-yw1-xc42.google.com (mail-yw1-xc42.google.com
 [IPv6:2607:f8b0:4864:20::c42])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7a4433c1
 for <wireguard@lists.zx2c4.com>;
 Tue, 29 Jan 2019 23:49:45 +0000 (UTC)
Received: by mail-yw1-xc42.google.com with SMTP id t13so8913322ywe.13
 for <wireguard@lists.zx2c4.com>; Tue, 29 Jan 2019 15:55:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=erayd.net; s=ga;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=m/LgG+xJc/bMHc6H2QEj1D/ReZBSFRL0dqJs5ZDQR0U=;
 b=nFvzKlpa/qh8qqemxABcT0f5p8aEGeKi/B2hdvlxs6cNCi//lnXp25wfKHp2rVyGka
 cp8VJqYCShBmiLQLKaUrji22Per56U0g+Fb5Na9Mw/yTnEhynRJ+TEBP2tLs6O4WoPVk
 mNpqCBg5VO+DdnqPsMlIxVJZs/gyauBmqXBUE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=m/LgG+xJc/bMHc6H2QEj1D/ReZBSFRL0dqJs5ZDQR0U=;
 b=B7lQZTsx1rO+dInzCwQBmpttW4DWbEbrMX7kqm7V4eZPNDkk3FphaTdGVfs9iLtNl6
 j+fl6ICwQiPLrEd5JFlcoUQqsDkQ83aOwR6XDoelQ7jJl9ZQkuAJkuVGAPOcKQRi9PKI
 P6M6ltDKgE+/aCAajMk7puLq12U+pbqFePJuswkmQTp3mJotVED1GXqliqb3pIA7Pnle
 fbnPCVCnDL2ZwxVXzCIBHT75q4wuUa9FIQKrcOYe6g6JhZJS4Qt4q8Aln9KUJvB5bo0s
 mL/VgYCKW9R3hAT9X/v+/rT5OAmZnb75Vl4C/Aw9G8OWYl+M7MyZZtxP/44Fn8hrvsJX
 i4eg==
X-Gm-Message-State: AJcUukdgoPhnPc7x4Kvi44Ri73HNrORDw6MrnCFjTSPndVmGDl0omgZv
 wp3cNnvx7IHC9f2Sq2niwpGywlJO/j34W4TZODQvKV5c
X-Google-Smtp-Source: ALg8bN6I18LLaaT376wxW7h2yxHmiXnzZNf2mIiNJu1A7duVf+6HSIqJYVZVRulfUEz97L9DEcVEQletAxCBMl2VqoE=
X-Received: by 2002:a81:3753:: with SMTP id e80mr27314869ywa.505.1548806137856; 
 Tue, 29 Jan 2019 15:55:37 -0800 (PST)
MIME-Version: 1.0
References: <CADjxVNq-PPTrzd9qDZK+ZFF8v70eme8n87xBK-77e=PNMGCQwg@mail.gmail.com>
In-Reply-To: <CADjxVNq-PPTrzd9qDZK+ZFF8v70eme8n87xBK-77e=PNMGCQwg@mail.gmail.com>
From: Steve Gilberd <steve@erayd.net>
Date: Wed, 30 Jan 2019 12:55:26 +1300
Message-ID: <CAJQSx3aQLGT9Hr=3NNTnrvq2JJCqiJ2vkV092n_zCN2LNjP-1Q@mail.gmail.com>
Subject: Re: wirehub - decentralized, peer-to-peer and secure overlay networks
 built with WireGuard
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
Content-Type: multipart/mixed; boundary="===============1551770880757495474=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============1551770880757495474==
Content-Type: multipart/alternative; boundary="000000000000ac5c150580a18700"

--000000000000ac5c150580a18700
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I very much like the idea of this project - I've been looking for a decent
full-mesh L3 VPN for ages, and have never found a solution I've been
properly happy with. Thanks for your work in developing this solution :-).

However - I'm concerned about some of the potential increased attack
surface that your architecture introduces:
 - uses extra crypto functionality which is not already part of wireguard;
and
 - passes messages across public networks using that functionality; and
 - clamps the wireguard keys in some unspecified way to embed a
proof-of-work (in fairness, I haven't read the code, so please correct me
if I have misunderstood).

For what it's worth, if it would be possible to also encapsulate your
control protocol inside wireguard, that would be vastly preferable: it
allows the transport cryptography to be implemented in one place, once
(i.e. in wireguard), and lets wirehub be a purely organisational overlay
for managing links, rather than touching the crypto and introducing
troubling extra complexities.

I would also love to see some sort of PKI option with this project, to
avoid having to explicitly trust all the peers. I'd prefer to be able to
simply provide the peers with a signature they can present to other peers
that proves they can be trusted (or even better, have that signature
generated by a nominated host at connect / setup time for each peer, which
avoids much of the shenanigans involved with handling expiry, revocations
etc.) Having the ability to tell all peers on the network to immediately
terminate all connections with a specific compromised peer would also be
handy.

Cheers,
Steve

On Wed, 30 Jan 2019 at 10:15 Gawen ARAB <g@wenarab.com> wrote:

> Hello,
>
> I've been giving my free time on a side project called WireHub
> (https://github.com/gawen/wirehub), which is a simple tool to build
> decentralized, peer-to-peer and secure overlay networks. It dynamically
> configures WireGuard tunnels, discoverying peers' endpoints via a
> authenticated
> DHT, going through NATs, and relaying the WireGuard traffic if no P2P
> communication is possible.
>
> Overlay networks are defined by a single human-readable file which lists
> the
> hostname and public key for each nodes of the network. Here's an example:
>
>     name test               # network name is 'test'
>     subnet 10.0.42.0/24     # overlay subnetwork is 10.0.42.0/24
>     workbit 8               # PoW parameter for DHT security
>
>     # a public bootstrap node
>     boot P17zMwXJFbBdJEn05RFIMADw9TX5_m2xgf31OgNKX3w bootstrap.wirehub.io
>
>     # Add trusted node 'a.test' to the overlay network.
>     # Each trusted node are at least identified by an human-readable
> hostname
>     # and a base64 public key.
>     trust a.test KJ7YGrBeqLLm_JJ1huIS26OnqAVFy57z5UJqjyMagW4
>
>     # If the endpoint of a peer is static, it might be set after the
> public key.
>     # Note that this is optional, as endpoints can be dynamically found i=
n
> the
>     # DHT.
>     trust b.test eIix5ldvqDzOIrG9ViKTe9TSBlF4g9nUwKi20C06hFM 12.34.56.78
>
>     # By default WireHub assigns nodes an (overlay) private IP, but a
> static
>     # private IP might be defined
>     trust c.test 10.0.42.254 kKZzuIm11zkBSHL9ETRwEthIBbLTvz840F_k4mhI_Hs
>     ...
>
> To start a peer,
>
>     # wh up ./config private-key ./sk
>
> When a network is up, the node's hostnames are resolved in userland.
>
>     # ping b.test
>     PING 10.0.42.2 (10.0.42.2): 56 data bytes
>     64 bytes from 10.0.42.2: seq=3D0 ttl=3D64 time=3D106.801 ms
>     64 bytes from 10.0.42.2: seq=3D1 ttl=3D64 time=3D49.778 ms
>
> WireGuard and WireHub uses the same Curve25519 key. WireHub keys must be
> generated with `wh genkey`, which adds a Proof-of-Work to the generation
> of the
> Curve25519 key, in order to mitigate Sybil attacks on the DHT. A high
> workbit
> will require more work to generate a valid key.
>
>     # wh genkey workbit 8       # fast
>     MFaqLuutFvNs79Xc9zhOUofIbL3xSLz1uo+RB1xB73s=3D
>     # wh genkey workbit 8 | wh pubkey | wh workbit
>     8
>     # wh genkey workbit 16      # will take more time to generate
>     kLfotsCIfB/7OcDGeLenptfy2Dzav9wmVZjVQ0Gvnk0=3D
>     # wh genkey workbit 16 | wh pubkey | wh workbit
>     16
>
>     # wg genkey | wh pubkey | wh workbit    # WireGuard keys have 0 workb=
it
>     0
>
> Under the hood, WireHub runs its own UDP protocol, binding the same UDP
> port
> than the WireGuard interface (for NAT trasversal technique reasons). It
> does so using
> libpcap. The first byte of a WireHub packet is 0xff, which corresponds to
> an
> invalid WireGuard packet with message type outside the valid range
> 0x00-0x03.
>
> WireHub currently authenticates its packets with a custom cryptographic
> scheme
> based on the node's keys. In the future, it might be better to tunnel
> WireHub
> packets through WireGuard, yet I'm not sure how to do that simply at the
> moment,
> as WireHub packets are not IP packets but more like authenticated message=
s.
>
> There's much room for improvement (security, allowed-ips management, more
> UDP
> hole punching techniques, faster relaying), but it's usable. Docker image=
s
> are
> provided to ease quick starting.
>
> Feel free to test and give some feedbacks!
>
> Also, I'll be at FOSDEM 2019 next week-end, so see you there! =F0=9F=8D=
=BA
>
> Gawen
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>
--=20

Cheers,

*Steve Gilberd*
Erayd LTD *=C2=B7* Consultant
*Phone: +64 4 974-4229 **=C2=B7** Mob: +64 27 565-3237*
*PO Box 10019, The Terrace, Wellington 6143, NZ*

--000000000000ac5c150580a18700
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I very much like the idea of this project - I&#39;ve been =
looking for a decent full-mesh L3 VPN for ages, and have never found a solu=
tion I&#39;ve been properly happy with. Thanks for your work in developing =
this solution :-).<div><br></div><div>However - I&#39;m concerned about som=
e of the potential increased attack surface that your architecture introduc=
es:<div>=C2=A0- uses extra crypto functionality which is not already part o=
f wireguard; and</div><div>=C2=A0- passes messages across public networks u=
sing that functionality; and</div><div>=C2=A0- clamps the wireguard keys in=
 some unspecified way to embed a proof-of-work (in fairness, I haven&#39;t =
read the code, so please correct me if I have misunderstood).</div><div><br=
></div><div>For what it&#39;s worth, if it would be possible to also encaps=
ulate your control protocol inside wireguard, that would be vastly preferab=
le: it allows the transport cryptography to be implemented in one place, on=
ce (i.e. in wireguard), and lets wirehub be a purely organisational overlay=
 for managing links, rather than touching the crypto and introducing troubl=
ing extra complexities.</div><div><br></div><div>I would also love to see s=
ome sort of PKI option with this project, to avoid having to explicitly tru=
st all the peers. I&#39;d prefer to be able to simply provide the peers wit=
h a signature they can present to other peers that proves they can be trust=
ed (or even better, have that signature generated by a nominated host at co=
nnect / setup time for each peer, which avoids much of the shenanigans invo=
lved with handling expiry, revocations etc.) Having the ability to tell all=
 peers on the network to immediately terminate all connections with a speci=
fic compromised peer would also be handy.<br><div><br></div><div>Cheers,</d=
iv><div>Steve<br><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"g=
mail_attr">On Wed, 30 Jan 2019 at 10:15 Gawen ARAB &lt;<a href=3D"mailto:g@=
wenarab.com">g@wenarab.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex"><div dir=3D"ltr"><div dir=3D"ltr">Hello,<br><br>I&#39;ve been giving=
 my free time on a side project called WireHub<br>(<a href=3D"https://githu=
b.com/gawen/wirehub" target=3D"_blank">https://github.com/gawen/wirehub</a>=
), which is a simple tool to build<br>decentralized, peer-to-peer and secur=
e overlay networks. It dynamically<br>configures WireGuard tunnels, discove=
rying peers&#39; endpoints via a authenticated<br>DHT, going through NATs, =
and relaying the WireGuard traffic if no P2P<br>communication is possible.<=
br><br>Overlay networks are defined by a single human-readable file which l=
ists the<br>hostname and public key for each nodes of the network. Here&#39=
;s an example:<br><br>=C2=A0=C2=A0=C2=A0 name test=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # network name=
 is &#39;test&#39;<br>=C2=A0=C2=A0=C2=A0 subnet <a href=3D"http://10.0.42.0=
/24" target=3D"_blank">10.0.42.0/24</a>=C2=A0=C2=A0=C2=A0=C2=A0 # overlay s=
ubnetwork is <a href=3D"http://10.0.42.0/24" target=3D"_blank">10.0.42.0/24=
</a><br>=C2=A0=C2=A0=C2=A0 workbit 8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # PoW parameter for DHT secur=
ity<br><br>=C2=A0=C2=A0=C2=A0 # a public bootstrap node<br>=C2=A0=C2=A0=C2=
=A0 boot P17zMwXJFbBdJEn05RFIMADw9TX5_m2xgf31OgNKX3w <a href=3D"http://boot=
strap.wirehub.io" target=3D"_blank">bootstrap.wirehub.io</a><br><br>=C2=A0=
=C2=A0=C2=A0 # Add trusted node &#39;a.test&#39; to the overlay network.<br=
>=C2=A0=C2=A0=C2=A0 # Each trusted node are at least identified by an human=
-readable hostname<br>=C2=A0=C2=A0=C2=A0 # and a base64 public key.<br>=C2=
=A0=C2=A0=C2=A0 trust a.test KJ7YGrBeqLLm_JJ1huIS26OnqAVFy57z5UJqjyMagW4<br=
><br>=C2=A0=C2=A0=C2=A0 # If the endpoint of a peer is static, it might be =
set after the public key.<br>=C2=A0=C2=A0=C2=A0 # Note that this is optiona=
l, as endpoints can be dynamically found in the<br>=C2=A0=C2=A0=C2=A0 # DHT=
.<br>=C2=A0=C2=A0=C2=A0 trust b.test eIix5ldvqDzOIrG9ViKTe9TSBlF4g9nUwKi20C=
06hFM 12.34.56.78<br><br>=C2=A0=C2=A0=C2=A0 # By default WireHub assigns no=
des an (overlay) private IP, but a static<br>=C2=A0=C2=A0=C2=A0 # private I=
P might be defined<br>=C2=A0=C2=A0=C2=A0 trust c.test 10.0.42.254 kKZzuIm11=
zkBSHL9ETRwEthIBbLTvz840F_k4mhI_Hs<br>=C2=A0=C2=A0=C2=A0 ...<br><br>To star=
t a peer,<br><br>=C2=A0=C2=A0=C2=A0 # wh up ./config private-key ./sk<br><b=
r>When a network is up, the node&#39;s hostnames are resolved in userland.<=
br><br>=C2=A0=C2=A0=C2=A0 # ping b.test<br>=C2=A0=C2=A0=C2=A0 PING 10.0.42.=
2 (10.0.42.2): 56 data bytes<br>=C2=A0=C2=A0=C2=A0 64 bytes from <a href=3D=
"http://10.0.42.2" target=3D"_blank">10.0.42.2</a>: seq=3D0 ttl=3D64 time=
=3D106.801 ms<br>=C2=A0=C2=A0=C2=A0 64 bytes from <a href=3D"http://10.0.42=
.2" target=3D"_blank">10.0.42.2</a>: seq=3D1 ttl=3D64 time=3D49.778 ms<br><=
br>WireGuard and WireHub uses the same Curve25519 key. WireHub keys must be=
<br>generated with `wh genkey`, which adds a Proof-of-Work to the generatio=
n of the<br>Curve25519 key, in order to mitigate Sybil attacks on the DHT. =
A high workbit<br>will require more work to generate a valid key.<br><br>=
=C2=A0=C2=A0=C2=A0 # wh genkey workbit 8=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 # fast<br>=C2=A0=C2=A0=C2=A0 MFaqLuutFvNs79Xc9zhOUofIbL3xSLz1uo+RB1xB73=
s=3D<br>=C2=A0=C2=A0=C2=A0 # wh genkey workbit 8 | wh pubkey | wh workbit<b=
r>=C2=A0=C2=A0=C2=A0 8<br>=C2=A0=C2=A0=C2=A0 # wh genkey workbit 16=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 # will take more time to generate<br>=C2=A0=C2=A0=
=C2=A0 kLfotsCIfB/7OcDGeLenptfy2Dzav9wmVZjVQ0Gvnk0=3D<br>=C2=A0=C2=A0=C2=A0=
 # wh genkey workbit 16 | wh pubkey | wh workbit<br>=C2=A0=C2=A0=C2=A0 16<b=
r><br>=C2=A0=C2=A0=C2=A0 # wg genkey | wh pubkey | wh workbit=C2=A0=C2=A0=
=C2=A0 # WireGuard keys have 0 workbit<br>=C2=A0=C2=A0=C2=A0 0<br><br>Under=
 the hood, WireHub runs its own UDP protocol, binding the same UDP port<br>=
than the WireGuard interface (for NAT trasversal technique reasons). It doe=
s so using<br>libpcap. The first byte of a WireHub packet is 0xff, which co=
rresponds to an<br>invalid WireGuard packet with message type outside the v=
alid range 0x00-0x03.<br><br>WireHub currently authenticates its packets wi=
th a custom cryptographic scheme<br>based on the node&#39;s keys. In the fu=
ture, it might be better to tunnel WireHub<br>packets through WireGuard, ye=
t I&#39;m not sure how to do that simply at the moment,<br>as WireHub packe=
ts are not IP packets but more like authenticated messages.<br><br>There&#3=
9;s much room for improvement (security, allowed-ips management, more UDP<b=
r>hole punching techniques, faster relaying), but it&#39;s usable. Docker i=
mages are<br>provided to ease quick starting.<br><br>Feel free to test and =
give some feedbacks!<br><br>Also, I&#39;ll be at FOSDEM 2019 next week-end,=
 so see you there! =F0=9F=8D=BA<br><br>Gawen</div></div>
_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank">WireGuard@li=
sts.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinfo/wireguard=
</a><br>
</blockquote></div></div></div></div></div>-- <br><div dir=3D"ltr" class=3D=
"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><p di=
r=3D"ltr">Cheers,</p>
<p dir=3D"ltr"><b>Steve Gilberd</b><br>
<span style=3D"color:rgb(102,102,102)">Erayd LTD=C2=A0</span><span style=3D=
"color:rgb(102,102,102)"><b>=C2=B7</b></span><span style=3D"color:rgb(102,1=
02,102)">=C2=A0Consultant</span><br>
<span style=3D"color:rgb(102,102,102)"><i>Phone: +64 4 974-4229=C2=A0</i></=
span><span style=3D"color:rgb(102,102,102)"><i><b>=C2=B7</b></i></span><spa=
n style=3D"color:rgb(102,102,102)"><i>=C2=A0Mob: +64 27 565-3237</i></span>=
<br>
<span style=3D"color:rgb(102,102,102)"><i>PO Box 10019, The Terrace, Wellin=
gton 6143, NZ</i></span></p>
</div></div>

--000000000000ac5c150580a18700--

--===============1551770880757495474==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============1551770880757495474==--
