Return-Path: Jason@zx2c4.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 375901d0
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 May 2017 09:57:09 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id fba38e7c
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 May 2017 09:57:09 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f8f78a3a
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 May 2017 10:08:34 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 15ec58ea
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 May 2017 10:08:33 +0000 (UTC)
Received: by mail-oi0-f43.google.com with SMTP id h4so47783334oib.3
 for <wireguard@lists.zx2c4.com>; Thu, 18 May 2017 03:08:38 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170518080213.GB1941@matrix-dream.net>
References: <CAHmME9pGX9zH+A9ouz0g8g6R7ZheZ=sKu_seAZ8r-DtBRdY_Rw@mail.gmail.com>
 <20170516154204.GB9458@matrix-dream.net>
 <CAHmME9roTAqMYB0qB7JG3rkKfGw1nfzTz0AD-frcGyyweCTcJQ@mail.gmail.com>
 <20170518080213.GB1941@matrix-dream.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 18 May 2017 12:08:37 +0200
Message-ID: <CAHmME9pqK6qbbSWQoxE4j6E-bXBObQZTBJ8-Zjkrhw78Xj14nQ@mail.gmail.com>
Subject: Re: allowed_ips move semantics?
To: =?UTF-8?B?SXZhbiBMYWLDoXRo?= <labawi-wg@matrix-dream.net>
Content-Type: multipart/alternative; boundary="001a113cd13ea2be1c054fc9963c"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a113cd13ea2be1c054fc9963c
Content-Type: text/plain; charset="UTF-8"

Hi Ivan,

You make a lot of compelling points there, and I'm inclined to follow your
advice. The (untested) patch to change this to the behavior you'd like is
actually this trivial two line change:

diff --git a/src/routingtable.c b/src/routingtable.c
index f9c3eff..0ad4d3c 100644
--- a/src/routingtable.c
+++ b/src/routingtable.c
@@ -194,6 +194,8 @@ static int add(struct routing_table_node __rcu **trie,
u8 bits, const u8 *key, u
  return 0;
  }
  if (node_placement(*trie, key, cidr, bits, &node, lock)) {
+ if (node->peer)
+ return -EEXIST;
  node->peer = peer;
  return 0;
  }

I'm especially compelled by your point that this would mirror the semantics
of the routing table.

However, I was a bit confused by your mention of a race condition, because
I believe that my current solution _avoids_ a race condition. The routing
table has a concept of metrics, which allows for avoiding a race condition
when gracefully handing over routes between different interfaces, like this:

# ip route add 10.0.0.0/24 dev eth0 metric 1000
# ip route add 10.0.0.0/24 dev wlan0 metric 1001
# ip route del 10.0.0.0/24 dev eth0 metric 1000

(It also has `ip route change`, but I don't know if this is actually
implemented in a race free way in the kernel or how it works.)

If I added the -EEXIST semantic to WireGuard's allowed-ips, if you wanted
to change traffic from one peer to the other, you could not do so without
dropping a bunch of packets during the interim. Thus, a race condition.
This was the original reason for designing it as I did -- I liked the idea
of race-free handovers.

Do you think maintaining race-free handover is important enough to warrant
not using -EEXIST? I sort of think it is important. Of course, I could add
an explicit "change" flag, but that makes things a bit complicated. And, in
the case of your hypothetical fat-fingered sysadmin, the error condition is
that this "fails closed", rather than "fails open", which probably makes it
not such a big deal.

What do you think of that argumentation?

Jason

--001a113cd13ea2be1c054fc9963c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Ivan,<br><br>You make a lot of compelling points there,=
 and I&#39;m inclined to follow your advice. The (untested) patch to change=
 this to the behavior you&#39;d like is actually this trivial two line chan=
ge:<br><br><div>diff --git a/src/routingtable.c b/src/routingtable.c</div><=
div>index f9c3eff..0ad4d3c 100644</div><div>--- a/src/routingtable.c</div><=
div>+++ b/src/routingtable.c</div><div>@@ -194,6 +194,8 @@ static int add(s=
truct routing_table_node __rcu **trie, u8 bits, const u8 *key, u</div><div>=
=C2=A0<span style=3D"white-space:pre">		</span>return 0;</div><div>=C2=A0<s=
pan style=3D"white-space:pre">	</span>}</div><div>=C2=A0<span style=3D"whit=
e-space:pre">	</span>if (node_placement(*trie, key, cidr, bits, &amp;node, =
lock)) {</div><div>+<span style=3D"white-space:pre">		</span>if (node-&gt;p=
eer)</div><div>+<span style=3D"white-space:pre">			</span>return -EEXIST;</=
div><div>=C2=A0<span style=3D"white-space:pre">		</span>node-&gt;peer =3D p=
eer;</div><div>=C2=A0<span style=3D"white-space:pre">		</span>return 0;</di=
v><div>=C2=A0<span style=3D"white-space:pre">	</span>}</div><div><br></div>=
<div>I&#39;m especially compelled by your point that this would mirror the =
semantics of the routing table.</div><div><br></div><div>However, I was a b=
it confused by your mention of a race condition, because I believe that my =
current solution _avoids_ a race condition. The routing table has a concept=
 of metrics, which allows for avoiding a race condition when gracefully han=
ding over routes between different interfaces, like this:</div><div><br></d=
iv><div>#=C2=A0ip route add <a href=3D"http://10.0.0.0/24">10.0.0.0/24</a> =
dev eth0 metric 1000</div><div>#=C2=A0ip route add <a href=3D"http://10.0.0=
.0/24">10.0.0.0/24</a> dev wlan0 metric 1001</div><div># ip route del <a hr=
ef=3D"http://10.0.0.0/24">10.0.0.0/24</a> dev eth0 metric 1000<br></div><di=
v><br></div><div>(It also has `ip route change`, but I don&#39;t know if th=
is is actually implemented in a race free way in the kernel or how it works=
.)</div><div><br></div><div>If I added the -EEXIST semantic to WireGuard&#3=
9;s allowed-ips, if you wanted to change traffic from one peer to the other=
, you could not do so without dropping a bunch of packets during the interi=
m. Thus, a race condition. This was the original reason for designing it as=
 I did -- I liked the idea of race-free handovers.</div><div><br></div><div=
>Do you think maintaining race-free handover is important enough to warrant=
 not using -EEXIST? I sort of think it is important. Of course, I could add=
 an explicit &quot;change&quot; flag, but that makes things a bit complicat=
ed. And, in the case of your hypothetical fat-fingered sysadmin, the error =
condition is that this &quot;fails closed&quot;, rather than &quot;fails op=
en&quot;, which probably makes it not such a big deal.</div><div><br></div>=
<div>What do you think of that argumentation?</div><div><br></div><div>Jaso=
n</div></div>

--001a113cd13ea2be1c054fc9963c--
