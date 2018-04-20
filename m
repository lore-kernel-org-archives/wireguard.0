Return-Path: ximin@dfinity.org
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 99d58c65
 for <wireguard@lists.zx2c4.com>;
 Fri, 20 Apr 2018 15:44:23 +0000 (UTC)
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
 [209.85.223.173])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cb51961a
 for <wireguard@lists.zx2c4.com>;
 Fri, 20 Apr 2018 15:44:23 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id f3-v6so11031698iob.13
 for <wireguard@lists.zx2c4.com>; Fri, 20 Apr 2018 08:44:37 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CADX+UFjjqvemqD38xvpa3GAFBWm2=39sb7dfBnvuAaQkzqwdRQ@mail.gmail.com>
References: <CADX+UFjEBcWRsL3SRv5_b0ezU0adcURqOJf=MvDbQkSXg3JRHg@mail.gmail.com>
 <CAHmME9racrutSPmM_Oy6eHAx3B=ah1=xzchzb_msZ5F9Zf-rGA@mail.gmail.com>
 <CADX+UFjjqvemqD38xvpa3GAFBWm2=39sb7dfBnvuAaQkzqwdRQ@mail.gmail.com>
From: Ximin Luo <ximin@dfinity.org>
Date: Fri, 20 Apr 2018 17:44:36 +0200
Message-ID: <CADX+UFiHhwCrWk3t5PARVbTh9EcMMe=TjdUkZuQ4450J2eYvBQ@mail.gmail.com>
Subject: Re: Using WG for transport security in a p2p network
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: multipart/alternative; boundary="000000000000c24919056a499040"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--000000000000c24919056a499040
Content-Type: text/plain; charset="UTF-8"

On Fri, Apr 20, 2018 at 5:20 PM, Ximin Luo <ximin@dfinity.org> wrote:

> (reposting to the list, I'll learn one of these days..)
>
> On Fri, Apr 6, 2018 at 7:59 PM, Jason A. Donenfeld <Jason@zx2c4.com>
> wrote:
>
>> [..]
>>
>> Let me know if you have any more questions or ways in which I can help
>> you guys out with the p2p protocol.
>>
>>
> Hey, thanks for the reply. Another issue came up while I've been looking
> into this:
>
> At present, one has to manually add specific peers in order for WG to
> authenticate them. I was wondering what the options are for dynamic
> authentication, of peer keys that one doesn't know beforehand. The typical
> example would be a PAKE but for us it would be an alternative
> zero-knowledge proof that the initiator's key belongs to some allowed-set
> of peers wrt the responder's key, as defined by the rest of the protocol
> (I'm being vague because the details are TBD, actually).
>
> It would be nice to keep WG's current property of being able to
> authenticate a client on the first packet without requiring further
> communication. To reduce the DoS-potential of having to verify a complex zk
> proof, we can probably also include a proof-of-work linked to a recent
> global shared source of randomness (we have that in our protocol). So one
> way would be for WG to hook into a custom function that reads a custom
> certificate from the first incoming packet and say whether it passes the
> test.
>
> Alternatively we can listen on another socket, perform the custom check on
> incoming packets here, and then forward passing packets with our custom
> portion stripped out onto the local WG socket. Hopefully this would "just
> work" if the "from" address on the UDP packet is correct. However,
> initiating these would be tricky, we'd have to intercept the WG initial
> outgoing packet and rewrite it.
>
> Other suggestions would be much appreciated.
>
>
Here is another option that adds a half-round but is much simpler than
either of my suggestions above and doesn't involve modifying WG, so I think
I'll go with that. Might be useful for other people looking to do dynamic
auth on top of WG.

Peer A first authenticates and locates B via the parent protocol, adds B as
a WG peer, then:
 -> zk-proof "I am A, I am allowed to connect to you B"
Peer B verifies this proof and adds A as a WG peer, triggering the standard
WG protocol flow
 <- WG initiation, Noise_IKpsk2, etc
 ->
 <-, etc

Since it authorises the keys and WG stores these, it shouldn't be necessary
to re-run this after e.g a disconnection, WG should "just work" by itself.

X

--000000000000c24919056a499040
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On F=
ri, Apr 20, 2018 at 5:20 PM, Ximin Luo <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:ximin@dfinity.org" target=3D"_blank">ximin@dfinity.org</a>&gt;</span> w=
rote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmai=
l_extra"><div class=3D"gmail_quote">(reposting to the list, I&#39;ll learn =
one of these days..)<br></div><div class=3D"gmail_quote"><span class=3D""><=
br>On Fri, Apr 6, 2018 at 7:59 PM, Jason A. Donenfeld <span dir=3D"ltr">&lt=
;<a href=3D"mailto:Jason@zx2c4.com" target=3D"_blank">Jason@zx2c4.com</a>&g=
t;</span> wrote:<br></span><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">[..]<br>
<br><span class=3D"">
Let me know if you have any more questions or ways in which I can help<br>
you guys out with the p2p protocol.<br><br></span></blockquote><span class=
=3D""><div><br><div>Hey, thanks for the reply. Another issue came up while =
I&#39;ve been looking into this:<br><br></div><div>At
 present, one has to manually add specific peers in order for WG to=20
authenticate them. I was wondering what the options are for dynamic=20
authentication, of peer keys that one doesn&#39;t know beforehand. The=20
typical example would be a PAKE but for us it would be an alternative=20
zero-knowledge proof that the initiator&#39;s key belongs to some=20
allowed-set of peers wrt the responder&#39;s key, as defined by the rest of=
=20
the protocol (I&#39;m being vague because the details are TBD, actually).<b=
r><br></div><div>It
 would be nice to keep WG&#39;s current property of being able to=20
authenticate a client on the first packet without requiring further=20
communication. To reduce the DoS-potential of having to verify a complex
 zk proof, we can probably also include a proof-of-work linked to a=20
recent global shared source of randomness (we have that in our=20
protocol). So one way would be for WG to hook into a custom function=20
that reads a custom certificate from the first incoming packet and say=20
whether it passes the test.<br><br>Alternatively we can listen on=20
another socket, perform the custom check on incoming packets here, and=20
then forward passing packets with our custom portion stripped out onto=20
the local WG socket. Hopefully this would &quot;just work&quot; if the &quo=
t;from&quot;=20
address on the UDP packet is correct. However, initiating these would be
 tricky, we&#39;d have to intercept the WG initial outgoing packet and=20
rewrite it.<br><br></div><div>Other suggestions would be much appreciated.<=
br><br></div></div></span></div></div></div></blockquote><div><br></div><di=
v>Here is another option that adds a half-round but is much simpler than ei=
ther of my suggestions above and doesn&#39;t involve modifying WG, so I thi=
nk I&#39;ll go with that. Might be useful for other people looking to do dy=
namic auth on top of WG.<br><br></div><div>Peer A first authenticates and l=
ocates B via the parent protocol, adds B as a WG peer, then:<br></div><div>=
=C2=A0-&gt; zk-proof &quot;I am A, I am allowed to connect to you B&quot;<b=
r></div><div>Peer B verifies this proof and adds A as a WG peer, triggering=
 the standard WG protocol flow<br></div><div>=C2=A0&lt;- WG initiation, Noi=
se_IKpsk2, etc<br></div><div>=C2=A0-&gt;<br></div><div>=C2=A0&lt;-, etc<br>=
</div><div>=C2=A0<br></div><div>Since it authorises the keys and WG stores =
these, it shouldn&#39;t be necessary to re-run this after e.g a disconnecti=
on, WG should &quot;just work&quot; by itself.<br><br></div><div>X<br><br><=
/div></div></div></div>

--000000000000c24919056a499040--
