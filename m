Return-Path: ximin@dfinity.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e2377105
 for <wireguard@lists.zx2c4.com>; Thu, 5 Apr 2018 17:54:10 +0000 (UTC)
Received: from mail-it0-f42.google.com (mail-it0-f42.google.com
 [209.85.214.42])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6a0e3a3f
 for <wireguard@lists.zx2c4.com>; Thu, 5 Apr 2018 17:54:10 +0000 (UTC)
Received: by mail-it0-f42.google.com with SMTP id u62-v6so5191373ita.5
 for <wireguard@lists.zx2c4.com>; Thu, 05 Apr 2018 11:07:20 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1a0ce6c1-4f62-509f-8d8e-9f0821d6f465@urlichs.de>
References: <CADX+UFjEBcWRsL3SRv5_b0ezU0adcURqOJf=MvDbQkSXg3JRHg@mail.gmail.com>
 <1a0ce6c1-4f62-509f-8d8e-9f0821d6f465@urlichs.de>
From: Ximin Luo <ximin@dfinity.org>
Date: Thu, 5 Apr 2018 11:07:19 -0700
Message-ID: <CADX+UFjb3MyJbPMpA78m2j4ygtGxxR-No6kFEV265mf55tT7bA@mail.gmail.com>
Subject: Re: Using WG for transport security in a p2p network
To: Matthias Urlichs <matthias@urlichs.de>
Content-Type: multipart/alternative; boundary="00000000000087f56305691dcff9"
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--00000000000087f56305691dcff9
Content-Type: text/plain; charset="UTF-8"

(reposting to the list)

On Thu, Apr 5, 2018 at 12:13 AM, Matthias Urlichs <matthias@urlichs.de>
wrote:

> Another option would be to run insecure QUIC or SCTP on top of WireGuard,
>
> You cannot run SCTP on the Internet anyway. Too many routers block
> anything that's not TCP/UDP/ICMP.
>

Well, that's another advantage of running on top of WG. AIUI the content
should be encrypted and authenticated so to all routers the traffic would
look like opaque UDP traffic. The endpoints will decrypt and pass it to
their SCTP/QUIC stack.

> I'm also wondering how easy this would be to program. It would clearly be
> much
> more heavyweight than simply opening a socket, but I guess it can be done
> via
> invocations of the `wg` or `wg-quick` tools.
>
> Don't use the tools. There's a library around that you can use to do all
> of the heavy lifting via netlink sockets. You'll also need the privilege to
> assign addresses and routes to the WG interfaces.
>
> Ideally we wouldn't need root
>
> If you go the netlink route, you do need one process that has the
> appropriate privilege, which means root at install time (but not runtime).
>

OK, thanks for the pointer to the netlink library I'll check that out.
Someone else mentioned CAP_NET_ADMIN, I'll follow that up in a separate
email.

>
> Once the network is live, we'd need the transport protocol to be relatively
> stable, or at least be easily upgradeable
>
> Well, the WG wire protocol is supposed to be stable by now. Switching away
> from it would require new code on your side anyway, so you can implement
> the exact method of switching at that time.
>

What does "stable" mean exactly here though? At some point the WG protocol
might need a new version, e.g. to reselect ciphers to e.g. add post-quantum
crypto. In the typical WG use-case this is not an issue because the network
admin controls both endpoints and can upgrade both simultaneously, but this
wouldn't be the case for our p2p network.

X

--00000000000087f56305691dcff9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">(reposting to the list)<br></di=
v><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Thu, Apr 5, =
2018 at 12:13 AM, Matthias Urlichs <span dir=3D"ltr">&lt;<a href=3D"mailto:=
matthias@urlichs.de" target=3D"_blank">matthias@urlichs.de</a>&gt;</span> w=
rote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
 =20
   =20
 =20
  <div bgcolor=3D"#FFFFFF"><span class=3D"gmail-">
    <blockquote type=3D"cite">Another option would be to run insecure QUIC =
or SCTP on top of
        WireGuard,<br>
     =20
    </blockquote></span>
    You cannot run SCTP on the Internet anyway. Too many routers block
    anything that&#39;s not TCP/UDP/ICMP.<span class=3D"gmail-"><br></span>=
</div></blockquote><div><br>Well, that&#39;s another advantage of running o=
n top of WG. AIUI the content
 should be encrypted and authenticated so to all routers the traffic=20
would look like opaque UDP traffic. The endpoints will decrypt and pass=20
it to their SCTP/QUIC stack. <br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex"><div bgcolor=3D"#FFFFFF"><span class=3D"gmail-">
   =20
    <blockquote type=3D"cite">
      <div dir=3D"ltr">I&#39;m also wondering how easy this would be to
        program. It would clearly be much<br>
        more heavyweight than simply opening a socket, but I guess it
        can be done via<br>
        invocations of the `wg` or `wg-quick` tools.</div>
    </blockquote></span>
    Don&#39;t use the tools. There&#39;s a library around that you can use =
to do
    all of the heavy lifting via netlink sockets. You&#39;ll also need the
    privilege to assign addresses and routes to the WG interfaces.<span cla=
ss=3D"gmail-"><br>
    <blockquote type=3D"cite">
      <div dir=3D"ltr">Ideally we wouldn&#39;t need root</div>
    </blockquote></span>
    If you go the netlink route, you do need one process that has the
    appropriate privilege, which means root at install time (but not
    runtime).<span class=3D"gmail-"><br></span></div></blockquote><div><br>=
</div><div>OK, thanks for the pointer to the netlink library I&#39;ll check=
 that out. Someone else mentioned CAP_NET_ADMIN, I&#39;ll follow that up in=
 a separate email.<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><div bgcolor=3D"#FFFFFF"><span class=3D"gmail-">
    <blockquote type=3D"cite">
      <div dir=3D"ltr"><br>
        Once the network is live, we&#39;d need the transport protocol to b=
e
        relatively<br>
        stable, or at least be easily upgradeable</div>
    </blockquote></span>
    Well, the WG wire protocol is supposed to be stable by now.
    Switching away from it would require new code on your side anyway,
    so you can implement the exact method of switching at that time.<span c=
lass=3D"gmail-HOEnZb"><font color=3D"#888888"></font></span><br></div></blo=
ckquote><div><br></div><div>What does &quot;stable&quot; mean exactly here =
though? At some point the WG protocol might need a new version, e.g. to res=
elect ciphers to e.g. add post-quantum crypto. In the typical WG use-case t=
his is not an issue because the network admin controls both endpoints and c=
an upgrade both simultaneously, but this wouldn&#39;t be the case for our p=
2p network.<br><br></div><div>X<br><br></div></div></div></div>

--00000000000087f56305691dcff9--
