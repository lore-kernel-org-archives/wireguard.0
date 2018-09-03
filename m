Return-Path: gunnar@meh.is
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3396949b
 for <wireguard@lists.zx2c4.com>; Mon, 3 Sep 2018 11:09:20 +0000 (UTC)
Received: from mail-io0-x22f.google.com (mail-io0-x22f.google.com
 [IPv6:2607:f8b0:4001:c06::22f])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e955f668
 for <wireguard@lists.zx2c4.com>; Mon, 3 Sep 2018 11:09:20 +0000 (UTC)
Received: by mail-io0-x22f.google.com with SMTP id e12-v6so137016iok.12
 for <wireguard@lists.zx2c4.com>; Mon, 03 Sep 2018 04:23:45 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?R3VubmFyIEd1w7B2YXLDsGFyc29u?= <gunnar@meh.is>
Date: Mon, 3 Sep 2018 11:23:33 +0000
Message-ID: <CAF9E_4r4J46wzqebb=RU7T95RAt7RiQjUMxr89W_+rDhyADaYQ@mail.gmail.com>
Subject: Replies to incoming unicast from local network exits wrong interface
To: wireguard@lists.zx2c4.com
Content-Type: multipart/alternative; boundary="0000000000003374b90574f5c63e"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--0000000000003374b90574f5c63e
Content-Type: text/plain; charset="UTF-8"

Hey,

I've been debugging the problem, that when I ssh from my desktop to my
tunneled laptop's tunnel ip, the laptop receives it but replies to it over
the local broadcast domain, instead of over the tunnel interface.

I eventually tracked it down to this rule added by `wg-quick`:

    32764:  from all lookup main suppress_prefixlength 0

That rule means, use routing table `main` for all prefixes bigger than 0
bits (default route).

But the local network, is there, bigger than 0 bit mask, and gets
selected...

Even though the source ip is completely wrong!
So while the reply ends up on the connecting computer, it doesn't know it
should use the local broadcast domain to continue the conversation and
sends the next ACK packet to the default gateway, which drops it due to not
having seen a SYN-ACK (asymmetric routing).

Solutions?

Delete that IP-rule?
Add an exception rule if the source ip is the tunnel interface ip?

p.s. when i got ssh working, it works, sometimes, but sometimes i get
multi-second lagspikes. But i haven't debugged that at all yet.

~ Gunnar

--0000000000003374b90574f5c63e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><span style=3D"color:rgb(33,33,33);font-size:13px">Hey,</s=
pan><div style=3D"color:rgb(33,33,33);font-size:13px"><br></div><div style=
=3D"color:rgb(33,33,33);font-size:13px">I&#39;ve been debugging the problem=
, that when I ssh from my desktop to my tunneled laptop&#39;s tunnel ip, th=
e laptop receives it but replies to it over the local broadcast domain, ins=
tead of over the tunnel interface.</div><div style=3D"color:rgb(33,33,33);f=
ont-size:13px"><br></div><div style=3D"color:rgb(33,33,33);font-size:13px">=
I eventually tracked it down to this rule added by `wg-quick`:</div><div st=
yle=3D"color:rgb(33,33,33);font-size:13px"><br></div><div style=3D"color:rg=
b(33,33,33);font-size:13px">=C2=A0 =C2=A0=C2=A032764:=C2=A0 from all lookup=
 main suppress_prefixlength 0</div><div style=3D"color:rgb(33,33,33);font-s=
ize:13px"><br></div><div style=3D"color:rgb(33,33,33);font-size:13px">That =
rule means, use routing table `main` for all prefixes bigger than 0 bits (d=
efault route).</div><div style=3D"color:rgb(33,33,33);font-size:13px"><br><=
/div><div style=3D"color:rgb(33,33,33);font-size:13px">But the local networ=
k, is there, bigger than 0 bit mask, and gets selected...</div><div style=
=3D"color:rgb(33,33,33);font-size:13px"><br></div><div style=3D"color:rgb(3=
3,33,33);font-size:13px">Even though the source ip is completely wrong!</di=
v><div style=3D"color:rgb(33,33,33);font-size:13px">So while the reply ends=
 up on the connecting computer, it doesn&#39;t know it should use the local=
 broadcast domain to continue the conversation and sends the next ACK packe=
t to the default gateway, which drops it due to not having seen a SYN-ACK (=
asymmetric routing).</div><div style=3D"color:rgb(33,33,33);font-size:13px"=
><br></div><div style=3D"color:rgb(33,33,33);font-size:13px">Solutions?</di=
v><div style=3D"color:rgb(33,33,33);font-size:13px"><br></div><div style=3D=
"color:rgb(33,33,33);font-size:13px">Delete that IP-rule?</div><div style=
=3D"color:rgb(33,33,33);font-size:13px">Add an exception rule if the source=
 ip is the tunnel interface ip?</div><div style=3D"color:rgb(33,33,33);font=
-size:13px"><br></div><div style=3D"color:rgb(33,33,33);font-size:13px">p.s=
. when i got ssh working, it works, sometimes, but sometimes i get multi-se=
cond lagspikes. But i haven&#39;t debugged that at all yet.</div><div style=
=3D"color:rgb(33,33,33);font-size:13px"><br></div><div style=3D"color:rgb(3=
3,33,33);font-size:13px">~ Gunnar</div></div>

--0000000000003374b90574f5c63e--
