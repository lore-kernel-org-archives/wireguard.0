Return-Path: larkwang@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ad26ad29
 for <wireguard@lists.zx2c4.com>;
 Sun, 13 May 2018 14:18:46 +0000 (UTC)
Received: from mail-ua0-x22c.google.com (mail-ua0-x22c.google.com
 [IPv6:2607:f8b0:400c:c08::22c])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 08c47ab2
 for <wireguard@lists.zx2c4.com>;
 Sun, 13 May 2018 14:18:46 +0000 (UTC)
Received: by mail-ua0-x22c.google.com with SMTP id g9-v6so6653004uak.7
 for <wireguard@lists.zx2c4.com>; Sun, 13 May 2018 07:21:53 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAKXLc7capqT5oFinwT6Cj1-b2h5gKo+CG+WTLbFO+bG7pR7NsQ@mail.gmail.com>
References: <c1e04862-162f-eff9-7884-467f672608e2@cgws.de>
 <CAKXLc7capqT5oFinwT6Cj1-b2h5gKo+CG+WTLbFO+bG7pR7NsQ@mail.gmail.com>
From: Wang Jian <larkwang@gmail.com>
Date: Sun, 13 May 2018 22:21:52 +0800
Message-ID: <CAF75rJC4Jw62OWyiPqW6vdvKUtuU76yKnfsowQv8hrHaJQbRkA@mail.gmail.com>
Subject: Re: Need for HW-clock independent timestamps
To: neumann@cgws.de
Content-Type: multipart/alternative; boundary="000000000000363dad056c17170b"
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--000000000000363dad056c17170b
Content-Type: text/plain; charset="UTF-8"

2018-05-12 6:45 GMT+08:00 Kalin KOZHUHAROV <me.kalin@gmail.com>:
> I only see 2 ways:
> * hardware: add a cheap RTC (best), or storage (USB, SD)
> * policy: add exception for ntpdate on base UDP (not WG) (or have
> dedicated server/s for that, which you control).

As Kalin's suggestion, I think policy routing, or plain static route, is
the easier
solution.

You can point ntpdate or ntpd to a fixed ntp server, and add a rule or more
specific staticr oute for this fixed server.

Or, if you have a running computer in your local net, use that computer as
one of ntp servers.

--000000000000363dad056c17170b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>2018-05-12 6:45 GMT+08:00 Kalin KOZHUHAROV &lt;<a hre=
f=3D"mailto:me.kalin@gmail.com">me.kalin@gmail.com</a>&gt;:<br>&gt; I only =
see 2 ways:<br>&gt; * hardware: add a cheap RTC (best), or storage (USB, SD=
)<br>&gt; * policy: add exception for ntpdate on base UDP (not WG) (or have=
<br>&gt; dedicated server/s for that, which you control).<br><br>As Kalin&#=
39;s suggestion, I think policy routing, or plain static route, is the easi=
er<br></div>solution.<br><div><br>You can point ntpdate or ntpd to a fixed =
ntp server, and add a rule or more<br>specific staticr oute for this fixed =
server.<br><br></div><div>Or, if you have a running computer in your local =
net, use that computer as<br></div><div>one of ntp servers.<br></div></div>

--000000000000363dad056c17170b--
