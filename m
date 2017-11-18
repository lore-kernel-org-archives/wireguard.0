Return-Path: reuben.m.work@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5daea92e
 for <wireguard@lists.zx2c4.com>;
 Sat, 18 Nov 2017 23:50:59 +0000 (UTC)
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 27702ca3
 for <wireguard@lists.zx2c4.com>;
 Sat, 18 Nov 2017 23:50:59 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id 9so12542906wme.4
 for <wireguard@lists.zx2c4.com>; Sat, 18 Nov 2017 15:55:39 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAM3m09QZc=kJoXUQvCpCVQG62TeDX0B4BdcuUU3A9T2Lfg10VQ@mail.gmail.com>
References: <CAM3m09QZc=kJoXUQvCpCVQG62TeDX0B4BdcuUU3A9T2Lfg10VQ@mail.gmail.com>
From: Reuben Martin <reuben.m.work@gmail.com>
Date: Sat, 18 Nov 2017 17:55:38 -0600
Message-ID: <CALJ2VGa=4faoudZkttX8Whsm5mysq0GPe+vDjREYtb7+Syukzg@mail.gmail.com>
Subject: Re: Another allowed-ips question
To: Ryan Whelan <rcwhelan@gmail.com>
Content-Type: multipart/alternative; boundary="001a1144255c12ce25055e4a97a0"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a1144255c12ce25055e4a97a0
Content-Type: text/plain; charset="UTF-8"

On Nov 18, 2017 5:44 PM, "Ryan Whelan" <rcwhelan@gmail.com> wrote:

I'm working on a system where Wireguard machines can connect directly to
one another as well as communicate with one another via an intermediary
router (or 'server').

When 2 machines directly connect to one another, the allowed-ips setting is
obviously a non-issue; what i'm struggling with is if they are unable to
communicate directly and build routes to one another via an intermediary
router (which is also connected to each 'client' via wireguard).  Unless
the 'server' NATs the traffic, the allowed-ips setting will prevent the
'clients' from communicating.  Am i missing something?

I'm trying to avoid building a wg interface for each peer connection if
possible, but i'm failing to see any other way around it.  Either NAT at
the intermediary router or create an interface per-peer.

Are there other options?


I have something kinda similar. I set up vxlan connections overtop of the
wireguard connections and added the vxlan interfaces to bridges.

-Reuben

--001a1144255c12ce25055e4a97a0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><div class=3D"gmail_extra"><div class=3D"gmail_quote=
">On Nov 18, 2017 5:44 PM, &quot;Ryan Whelan&quot; &lt;<a href=3D"mailto:rc=
whelan@gmail.com">rcwhelan@gmail.com</a>&gt; wrote:<br type=3D"attribution"=
><blockquote class=3D"quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex"><div dir=3D"ltr">I&#39;m working on a system wher=
e Wireguard machines can connect directly to one another as well as communi=
cate with one another via an intermediary router (or &#39;server&#39;).=C2=
=A0<div><br></div><div>When 2 machines directly connect to one another, the=
 allowed-ips setting is obviously a non-issue; what i&#39;m struggling with=
 is if they are unable to communicate directly and build routes to one anot=
her via an intermediary router (which is also connected to each &#39;client=
&#39; via wireguard).=C2=A0 Unless the &#39;server&#39; NATs the traffic, t=
he allowed-ips setting will prevent the &#39;clients&#39; from communicatin=
g.=C2=A0 Am i missing something?</div><div><br></div><div>I&#39;m trying to=
 avoid building a wg interface for each peer connection if possible, but i&=
#39;m failing to see any other way around it.=C2=A0 Either NAT at the inter=
mediary router or create an interface per-peer.</div><div><br></div><div>Ar=
e there other options?</div></div></blockquote></div></div></div><div dir=
=3D"auto"><br></div><div dir=3D"auto">I have something kinda similar. I set=
 up vxlan connections overtop of the wireguard connections and added the vx=
lan interfaces to bridges.</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o">-Reuben</div><div dir=3D"auto"></div></div>

--001a1144255c12ce25055e4a97a0--
