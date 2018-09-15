Return-Path: david.w.cowden@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a74a88f9
 for <wireguard@lists.zx2c4.com>;
 Sat, 15 Sep 2018 22:40:07 +0000 (UTC)
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7880ed60
 for <wireguard@lists.zx2c4.com>;
 Sat, 15 Sep 2018 22:40:07 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id e12-v6so8696900iok.12
 for <wireguard@lists.zx2c4.com>; Sat, 15 Sep 2018 15:41:31 -0700 (PDT)
MIME-Version: 1.0
References: <cLOCDzwe4IyvMeayGnJqwGcbyBRfTtha5e0S0zJ33t_4tNCutwD-Krje6NTotKw_lIJdZT7ldacMCg7Rv-m3UuEzS-diWg3-5Z3VE2J_thk=@protonmail.com>
In-Reply-To: <cLOCDzwe4IyvMeayGnJqwGcbyBRfTtha5e0S0zJ33t_4tNCutwD-Krje6NTotKw_lIJdZT7ldacMCg7Rv-m3UuEzS-diWg3-5Z3VE2J_thk=@protonmail.com>
From: David Cowden <david.w.cowden@gmail.com>
Date: Sat, 15 Sep 2018 15:41:20 -0700
Message-ID: <CAD=29B_P0eF7f3m5cKfxmm0hy8KqVA1dgfmagcotz84eqO_nvQ@mail.gmail.com>
Subject: Re: Configure WireGuard for Roaming Between IPv4, IPv6
To: Lane Russell <lanerussell@protonmail.com>
Content-Type: multipart/alternative; boundary="0000000000003458050575f0a475"
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--0000000000003458050575f0a475
Content-Type: text/plain; charset="UTF-8"

I haven't actually tried that specific scenario but I don't see why the
tunnel wouldn't "come up". I mean really it's up when the interface is up
and the tunnel "connection" (it's UDP) isn't actually "established" (in a
NAT/firewall sense) unless data is sent. You can have an interface
configured for IPv6 on an "IPv4 only" network, it just won't get responses
to its router solicitations so the kernel (Linux, at least--BSDs do this in
userspace) won't configure routes for IPv6 traffic. If you look at your
physical interfaces, you'll probably notice they all have IPv6 link-local
addresses unless you've actually turned off IPv6 support in the kernel

The reason your IPv6 traffic goes out unencrypted on dual stack networks is
because the default route for IPv6 traffic is not the Wireguard interface,
but rather one of the physical ones. All you need to do to send your IPv6
traffic through the tunnel is configure the interface to be part of the
IPv6 network you're trying to reach, and of course allow an IPv6 address
from the client in the server config. In fact, if you configure your
interface with IPv6 address(s) and a route pointing at the wg interface,
you can even send IPv6 traffic on an IPv4 only tunnel provided your server
can route IPv6 traffic. If you're using wg-quick, simply adding an IPv6
address to the interface and allowing all IPv6 traffic from the server peer
would suffice.

On Sat, Sep 15, 2018 at 11:01 AM Lane Russell <lanerussell@protonmail.com>
wrote:

> What is the best practice for configuring Wireguard to work over diverse
> networks, including IPv4-only, IPv6-only, and dual-stack?
>
> For example, my current configuration only deals with IPv4. When I roam
> from an IPv4-only network to a dual-stack, my device routes IPv4 traffic
> over the WireGuard interface, but IPv6 traffic goes out unencrypted.
>
>
>
> My VPN server is IPv6-capable, so I could enable it. However, will the
> client tunnel fail to come up on an IPv4-only network if the config
> contains IPv6 addresses?
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>

--0000000000003458050575f0a475
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">I haven&#39;t actually tried that specific scenario =
but I don&#39;t see why the tunnel wouldn&#39;t &quot;come up&quot;. I mean=
 really it&#39;s up when the interface is up and the tunnel &quot;connectio=
n&quot; (it&#39;s UDP) isn&#39;t actually &quot;established&quot; (in a NAT=
/firewall sense) unless data is sent. You can have an interface configured =
for IPv6 on an &quot;IPv4 only&quot; network, it just won&#39;t get respons=
es to its router solicitations so the kernel (Linux, at least--BSDs do this=
 in userspace) won&#39;t configure routes for IPv6 traffic. If you look at =
your physical interfaces, you&#39;ll probably notice they all have IPv6 lin=
k-local addresses unless you&#39;ve actually turned off IPv6 support in the=
 kernel</div><br><div dir=3D"auto">The reason your IPv6 traffic goes out un=
encrypted on dual stack networks is because the default route for IPv6 traf=
fic is not the Wireguard interface, but rather one of the physical ones. Al=
l you need to do to send your IPv6 traffic through the tunnel is configure =
the interface to be part of the IPv6 network you&#39;re trying to reach, an=
d of course allow an IPv6 address from the client in the server config. In =
fact, if you configure your interface with IPv6 address(s) and a route poin=
ting at the wg interface, you can even send IPv6 traffic on an IPv4 only tu=
nnel provided your server can route IPv6 traffic. If you&#39;re using wg-qu=
ick, simply adding an IPv6 address to the interface and allowing all IPv6 t=
raffic from the server peer would suffice.</div></div><div dir=3D"auto"><br=
></div><div><div class=3D"gmail_quote"><div dir=3D"ltr">On Sat, Sep 15, 201=
8 at 11:01 AM Lane Russell &lt;<a href=3D"mailto:lanerussell@protonmail.com=
" target=3D"_blank">lanerussell@protonmail.com</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex"><div>What is the best practice for configuring W=
ireguard to work over diverse networks, including IPv4-only, IPv6-only, and=
 dual-stack?<br></div><div><br></div><div>For example, my current configura=
tion only deals with IPv4. When I roam from an IPv4-only network to a dual-=
stack, my device routes IPv4 traffic over the WireGuard interface, but IPv6=
 traffic goes out unencrypted.<br></div><div class=3D"m_-881949088593441354=
5m_-9031858115316408682protonmail_signature_block m_-8819490885934413545m_-=
9031858115316408682protonmail_signature_block-empty"><div class=3D"m_-88194=
90885934413545m_-9031858115316408682protonmail_signature_block-user m_-8819=
490885934413545m_-9031858115316408682protonmail_signature_block-empty"><br>=
</div><div class=3D"m_-8819490885934413545m_-9031858115316408682protonmail_=
signature_block-proton m_-8819490885934413545m_-9031858115316408682protonma=
il_signature_block-empty"><br></div></div><div><br></div><div>My VPN server=
 is IPv6-capable, so I could enable it. However, will the client tunnel fai=
l to come up on an IPv4-only network if the config contains IPv6 addresses?=
<br></div>_______________________________________________<br>
WireGuard mailing list<br>
<a href=3D"mailto:WireGuard@lists.zx2c4.com" target=3D"_blank">WireGuard@li=
sts.zx2c4.com</a><br>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" rel=3D"noref=
errer" target=3D"_blank">https://lists.zx2c4.com/mailman/listinfo/wireguard=
</a><br>
</blockquote></div>
</div>

--0000000000003458050575f0a475--
