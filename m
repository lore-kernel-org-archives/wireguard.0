Return-Path: raulbe@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bcce5b41
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 Jul 2017 14:56:49 +0000 (UTC)
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
 [209.85.220.173])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8fa4e956
 for <wireguard@lists.zx2c4.com>;
 Mon, 10 Jul 2017 14:56:49 +0000 (UTC)
Received: by mail-qk0-f173.google.com with SMTP id p21so76270823qke.3
 for <wireguard@lists.zx2c4.com>; Mon, 10 Jul 2017 08:14:59 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170710024322.GA31153@zx2c4.com>
References: <CAOLRk5n2FvxWN_O+Th8Zy+Mga-MKA7_bOaWVsFh6MvVdfM6S2A@mail.gmail.com>
 <20170710024322.GA31153@zx2c4.com>
From: raul <raulbe@gmail.com>
Date: Mon, 10 Jul 2017 20:44:56 +0530
Message-ID: <CAOLRk5mZSJsP1Nf65fve6WBkirGkU9YDJe0SJZ+fE+m5-NGZPA@mail.gmail.com>
Subject: Re: Early Feedback on Container Networking, Resilience, Json Config
 and AcceptedIPs
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: multipart/alternative; boundary="001a1142df1ccbf56f0553f80bf9"
Cc: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a1142df1ccbf56f0553f80bf9
Content-Type: text/plain; charset="UTF-8"

Hi Jason,


So: things won't be too big of a pain, and at some point, there won't be
> any possibility of pains.
>


Great to hear that!


What precisely are you doing that you think might be easier with JSON?



I did look at wg-json. I was wondering more about /etc/wireguard/*.conf and
the possibility of using json config there. I am trying to parse wgX.conf
so that we can quickly add and remove peers and subnets. Currently I am
dumping it into a python dict keyed with the pubkeys


In this sense, on outgoing, it's sort of like a routing table. on incoming,
> it's sort of like an IP access control list.



 That's a pretty succinct way of putting it. It does sounds simple put that
way.


You don't have to run WireGuard in a star topology. You can do full mesh
> if you want, or whatever other topology. One interface can have multiple
> peers, so you can connect things together any which way you like.
>


As Jonathan mentioned he is running a mesh. And it does open up
possibilities in terms of access control that I haven't fully considered.
But how do we scale a mesh? For a number of hosts lets say 20+ with 20
container subnets or more to share, one would imagine managing a peer to
peer configuration as the network scales up and down can become a chore.

A client server with let's say a /16 shared may be more feasible, as then
all the client's acceptedIPs can be the single /16 subnet, while the
individual client subnets are added to the server for routing as they are
added. I will think about this some more.

Once again this is really impressive and valuable.

Thanks!
Raul

--001a1142df1ccbf56f0553f80bf9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Jason,<br><div><div class=3D"gmail_extra"><br><br><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
So: things won&#39;t be too big of a pain, and at some point, there won&#39=
;t be<br>
any possibility of pains.<br></blockquote><div>=C2=A0</div><div><br></div><=
div>Great to hear that!<br><br><br><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">What precisely are you doing that you think might be easier with=
 JSON?</blockquote><div><br><br>I did look at wg-json. I was wondering more=
 about /etc/wireguard/*.conf and the possibility of using json config there=
. I am trying to parse wgX.conf so that we can quickly add and remove peers=
 and subnets. Currently I am dumping it into a python dict keyed with the p=
ubkeys <br><br><br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">In thi=
s sense, on outgoing, it&#39;s sort of like a routing table. on incoming, i=
t&#39;s sort of like an IP access control list.</blockquote><div>=C2=A0</di=
v><div><br></div><div>=C2=A0That&#39;s a pretty succinct way of putting it.=
 It does sounds simple put that way.<br><br><span class=3D"gmail-m_-9402807=
95865836910gmail-"><br></span><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex"><span class=3D"gmail-m_-940280795865836910gmail-">
</span>You don&#39;t have to run WireGuard in a star topology. You can do f=
ull mesh<br>
if you want, or whatever other topology. One interface can have multiple<br=
>
peers, so you can connect things together any which way you like.<br></bloc=
kquote><div><br>=C2=A0<br></div><div>As Jonathan mentioned he is running a =
mesh. And it does open up possibilities in terms of access control that I h=
aven&#39;t fully considered. But how do we scale a mesh? For a number of ho=
sts lets say 20+ with 20 container subnets or more to share, one would imag=
ine managing a peer to peer configuration as the network scales up and down=
 can become a chore. <br><br>A client server with let&#39;s say a /16 share=
d may be more feasible, as then all the client&#39;s acceptedIPs can be the=
 single /16 subnet, while the individual client subnets are added to the se=
rver for routing as they are added. I will think about this some more.<br><=
br></div><div>Once again this is really impressive and valuable.<br></div><=
div><br></div><div>Thanks!<br></div><div>Raul<br></div><br></div></div></di=
v><br><br></div></div></div>

--001a1142df1ccbf56f0553f80bf9--
