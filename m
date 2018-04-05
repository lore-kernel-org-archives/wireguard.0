Return-Path: ximin@dfinity.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 99e059a0
 for <wireguard@lists.zx2c4.com>; Thu, 5 Apr 2018 03:09:19 +0000 (UTC)
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
 [209.85.223.177])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b879a16f
 for <wireguard@lists.zx2c4.com>; Thu, 5 Apr 2018 03:09:19 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id q84so28807142iod.10
 for <wireguard@lists.zx2c4.com>; Wed, 04 Apr 2018 20:22:25 -0700 (PDT)
MIME-Version: 1.0
From: Ximin Luo <ximin@dfinity.org>
Date: Wed, 4 Apr 2018 20:22:24 -0700
Message-ID: <CADX+UFjEBcWRsL3SRv5_b0ezU0adcURqOJf=MvDbQkSXg3JRHg@mail.gmail.com>
Subject: Using WG for transport security in a p2p network
To: wireguard@lists.zx2c4.com
Content-Type: multipart/alternative; boundary="001a11402fc0c83809056911722a"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a11402fc0c83809056911722a
Content-Type: text/plain; charset="UTF-8"

Hi WireGuard mailing list,

As part of my day job we're building a p2p broadcast network for a new type
of
blockchain, where latency is very important and certain objects need to be
delivered with greater priority than other objects. So I've looked into both
QUIC and SCTP since they offer stream multiplexing within a single
connection.
To secure these connections, QUIC uses TLS 1.3 [1] which is in the process
of
being finalised, and there is an S-SCTP extension [2] with unclear delivery
date and no implementations.

[1] https://tools.ietf.org/html/draft-ietf-quic-tls-09
[2] https://tools.ietf.org/html/draft-hohendorf-secure-sctp-25

Another option would be to run insecure QUIC or SCTP on top of WireGuard,
ignoring TLS and S-SCTP completely. Noise is much simpler and we already
authenticate node public keys via other means, so have no use for the
certificate logic that both TLS and S-SCTP include. Since WireGuard runs as
a
network interface, it should be easy to transparently run QUIC or SCTP on
top
of it, allowing us to decouple the security mechanism from the transport
mechanism. Then there are other issues to consider hence my email:

Our network churn is not expected to be very heavy, perhaps on the order of
~30
new connections per node per week or so. So any extra latency in the initial
connection caused by this separation of layers, should not be significant.
However this churn is probably higher than what current typical WG usages
get
exposed to. For example in [1] Jason says:

> Secondly, I'm wondering if you tend to do, "anything strange". For
> example -- are you setting up and taking down the device often in an
> automated way? Or reconfiguring the interface (via wg(8), for example)
> often in an automated way?

[1] https://lists.zx2c4.com/pipermail/wireguard/2018-February/002370.html

Our usage would indeed involve setting up and tearing down interfaces ~30
times
a week in an automated fashion, which might be "strange" going by the above.

I'm also wondering how easy this would be to program. It would clearly be
much
more heavyweight than simply opening a socket, but I guess it can be done
via
invocations of the `wg` or `wg-quick` tools. Has anyone had any experience
with
this level of WG automation, could you share your thoughts? Would the
program
need any extra system-level privileges? Ideally we wouldn't need root, of
course - does that mean we're forced to wait for a userspace WG library
such as
wireguard-rs? I understand there is a performance penalty here, but I'd
have to
run benchmarks to know if this affects our use-case significantly.

Once the network is live, we'd need the transport protocol to be relatively
stable, or at least be easily upgradeable - perhaps using the noise
negotiation
subprotocol to support two protocols during network upgrade times. This is
an
extra requirement that seems beyond WG's current main use-case so I was also
wondering if that is something that you guys plan to cover.

Best,

Ximin

--001a11402fc0c83809056911722a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi WireGuard mailing list,<br><br>As part of my day job we=
&#39;re building a p2p broadcast network for a new type of<br>blockchain, w=
here latency is very important and certain objects need to be<br>delivered =
with greater priority than other objects. So I&#39;ve looked into both<br>Q=
UIC and SCTP since they offer stream multiplexing within a single connectio=
n.<br>To secure these connections, QUIC uses TLS 1.3 [1] which is in the pr=
ocess of<br>being finalised, and there is an S-SCTP extension [2] with uncl=
ear delivery<br>date and no implementations.<br><br>[1] <a href=3D"https://=
tools.ietf.org/html/draft-ietf-quic-tls-09">https://tools.ietf.org/html/dra=
ft-ietf-quic-tls-09</a><br>[2] <a href=3D"https://tools.ietf.org/html/draft=
-hohendorf-secure-sctp-25">https://tools.ietf.org/html/draft-hohendorf-secu=
re-sctp-25</a><br><br>Another option would be to run insecure QUIC or SCTP =
on top of WireGuard,<br>ignoring TLS and S-SCTP completely. Noise is much s=
impler and we already<br>authenticate node public keys via other means, so =
have no use for the<br>certificate logic that both TLS and S-SCTP include. =
Since WireGuard runs as a<br>network interface, it should be easy to transp=
arently run QUIC or SCTP on top<br>of it, allowing us to decouple the secur=
ity mechanism from the transport<br>mechanism. Then there are other issues =
to consider hence my email:<br><br>Our network churn is not expected to be =
very heavy, perhaps on the order of ~30<br>new connections per node per wee=
k or so. So any extra latency in the initial<br>connection caused by this s=
eparation of layers, should not be significant.<br>However this churn is pr=
obably higher than what current typical WG usages get<br>exposed to. For ex=
ample in [1] Jason says:<br><br>&gt; Secondly, I&#39;m wondering if you ten=
d to do, &quot;anything strange&quot;. For<br>&gt; example -- are you setti=
ng up and taking down the device often in an<br>&gt; automated way? Or reco=
nfiguring the interface (via wg(8), for example)<br>&gt; often in an automa=
ted way?<br><br>[1] <a href=3D"https://lists.zx2c4.com/pipermail/wireguard/=
2018-February/002370.html">https://lists.zx2c4.com/pipermail/wireguard/2018=
-February/002370.html</a><br><br>Our usage would indeed involve setting up =
and tearing down interfaces ~30 times<br>a week in an automated fashion, wh=
ich might be &quot;strange&quot; going by the above.<br><br>I&#39;m also wo=
ndering how easy this would be to program. It would clearly be much<br>more=
 heavyweight than simply opening a socket, but I guess it can be done via<b=
r>invocations of the `wg` or `wg-quick` tools. Has anyone had any experienc=
e with<br>this level of WG automation, could you share your thoughts? Would=
 the program<br>need any extra system-level privileges? Ideally we wouldn&#=
39;t need root, of<br>course - does that mean we&#39;re forced to wait for =
a userspace WG library such as<br>wireguard-rs? I understand there is a per=
formance penalty here, but I&#39;d have to<br>run benchmarks to know if thi=
s affects our use-case significantly.<br><br>Once the network is live, we&#=
39;d need the transport protocol to be relatively<br>stable, or at least be=
 easily upgradeable - perhaps using the noise negotiation<br>subprotocol to=
 support two protocols during network upgrade times. This is an<br>extra re=
quirement that seems beyond WG&#39;s current main use-case so I was also<br=
>wondering if that is something that you guys plan to cover.<br><br>Best,<b=
r><br>Ximin<br><br></div>

--001a11402fc0c83809056911722a--
