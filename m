Return-Path: t0ny0@atlantabg.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2e0ca3f8
 for <wireguard@lists.zx2c4.com>; Thu, 4 Jan 2018 21:49:36 +0000 (UTC)
Received: from mail-yb0-f170.google.com (mail-yb0-f170.google.com
 [209.85.213.170])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 549c3f34
 for <wireguard@lists.zx2c4.com>; Thu, 4 Jan 2018 21:49:36 +0000 (UTC)
Received: by mail-yb0-f170.google.com with SMTP id u107so1181954ybi.2
 for <wireguard@lists.zx2c4.com>; Thu, 04 Jan 2018 13:51:21 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAL-k0sTtBWdgV1LfiAF9jjU6T47sT=pYyJgJQej4UmFrA0_27Q@mail.gmail.com>
References: <CAL-k0sRpa8Z2sW=z3bCW5pqPyJMCc5i3BMcXHRmZxNoRijTOXQ@mail.gmail.com>
 <CAL-k0sRFgPetkH3n_p4H5cTSA-58bHGJ=mV+rs7tC4kWeqgmiA@mail.gmail.com>
 <CAL-k0sQk=kbFep0xZ-9_xzUqvgGGqa3Y6=nEe=1kWq98Ek9f6w@mail.gmail.com>
 <CAL-k0sST3nZnOPAFYtthv4CFJjpoFDvzpxYDwvP1vt_t4bO+kQ@mail.gmail.com>
 <CAL-k0sTi-g0w4cHw+9K5hqYooupPJVf_bb_tQ3jR-hW=tqmfKA@mail.gmail.com>
 <CAL-k0sShn5t8K4TCgnWgKp74Lf6ASgrA_SDdAEjdL9Vc-J3e4Q@mail.gmail.com>
 <CAL-k0sTux_e2CrQG0Pm2cdk4VxdxW9m+BALQ=Ccw34KH-6D25g@mail.gmail.com>
 <CAL-k0sRUR1DKJK4df1YHvs+3LSJ+qQVUrBgC5-tg2eSjN_wrtw@mail.gmail.com>
 <CAL-k0sTtBWdgV1LfiAF9jjU6T47sT=pYyJgJQej4UmFrA0_27Q@mail.gmail.com>
From: Stoyan Mihov <t0ny0@atlantabg.com>
Date: Thu, 4 Jan 2018 16:51:19 -0500
Message-ID: <CAL-k0sSF7y63y8wYc0dn2_8j2Sa8_t-U5-5ZZHcRVxh9pRK47w@mail.gmail.com>
Subject: Question about Wireguard server
To: wireguard@lists.zx2c4.com
Content-Type: multipart/alternative; boundary="001a114fc9e010c0860561fa5527"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--001a114fc9e010c0860561fa5527
Content-Type: text/plain; charset="UTF-8"

Greetings dear wireguards!

First of all - happy 2018!

I have a quick question:

I am running wireguard on ubuntu 16.04 server and LEDE on router. When I
have everything set up on the router - I decided to upgrade to a newer
version of LEDE. So I did, and then my router would not connect to the
server anymore (although settings have been saved) until I issue a command
on the server:
wg-quick down wg0 && wg-quick up wg0

Then the router automatically connects without an issue. Before that - the
server would not accept a connection from the router, there are no dmesg
errors, no errors whatsoever on both sides. It simply doesn't show a
handshake on the server, and the router sends packets, but receives 0
packets.

Is there an easier way to fix that issue, so a restart on the server would
not be necessary every time an upgrade on the router is made? Or am I
missing something obvious (quite possible lol) that resolves that issue?

Thank you so much!
Tony.

--001a114fc9e010c0860561fa5527
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Greetings dear wireguards!<div dir=3D"auto"><br></div><di=
v dir=3D"auto">First of all - happy 2018!</div><div dir=3D"auto"><br></div>=
<div dir=3D"auto">I have a quick question:</div><div dir=3D"auto"><br></div=
><div dir=3D"auto">I am running wireguard on ubuntu 16.04 server and LEDE o=
n router. When I have everything set up on the router - I decided to upgrad=
e to a newer version of LEDE. So I did, and then my router would not connec=
t to the server anymore (although settings have been saved) until I issue a=
 command on the server:</div><div dir=3D"auto">wg-quick down wg0 &amp;&amp;=
 wg-quick up wg0</div><div dir=3D"auto"><br></div><div dir=3D"auto">Then th=
e router automatically connects without an issue. Before that - the server =
would not accept a connection from the router, there are no dmesg errors, n=
o errors whatsoever on both sides. It simply doesn&#39;t show a handshake o=
n the server, and the router sends packets, but receives 0 packets.</div><d=
iv dir=3D"auto"><br></div><div dir=3D"auto">Is there an easier way to fix t=
hat issue, so a restart on the server would not be necessary every time an =
upgrade on the router is made? Or am I missing something obvious (quite pos=
sible lol) that resolves that issue?</div><div dir=3D"auto"><br></div><div =
dir=3D"auto">Thank you so much!</div><div dir=3D"auto">Tony.</div></div>

--001a114fc9e010c0860561fa5527--
