Return-Path: eric@bluelinelabs.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f836cb8e
 for <wireguard@lists.zx2c4.com>; Mon, 2 Jul 2018 20:29:35 +0000 (UTC)
Received: from mail-qt0-x22f.google.com (mail-qt0-x22f.google.com
 [IPv6:2607:f8b0:400d:c0d::22f])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1947d7dd
 for <wireguard@lists.zx2c4.com>; Mon, 2 Jul 2018 20:29:35 +0000 (UTC)
Received: by mail-qt0-x22f.google.com with SMTP id y20-v6so14940856qto.8
 for <wireguard@lists.zx2c4.com>; Mon, 02 Jul 2018 13:35:56 -0700 (PDT)
From: Eric Kuck <eric@bluelinelabs.com>
MIME-Version: 1.0
Date: Mon, 2 Jul 2018 13:35:54 -0700
Message-ID: <CAMj-8hS_bJado86_1V9hCyW=+-jO6BDnk1WnZE0EQoDembViEw@mail.gmail.com>
Subject: Android app whitelist/blacklist feature
To: wireguard@lists.zx2c4.com
Content-Type: multipart/alternative; boundary="000000000000ee97f105700a24da"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--000000000000ee97f105700a24da
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I=E2=80=99d like to make a contribution to the Android app, but would like =
to know
if this is something that would actually get merged before I go through all
the effort. What I=E2=80=99d like to do is add an exceptions list (apps tha=
t will
not be routed through the Wireguard interface). The rationale for this
being that some apps simply don=E2=80=99t work with Wireguard. For example,=
 the use
of a Wireguard VPN with custom DNS breaks WearOS watches due to Google
hardcoding the use of the 8.8.8.8 DNS server. Another example is that
Netflix doesn=E2=80=99t work when routed through my VPN server since they k=
now it=E2=80=99s
a DigitalOcean instance, but works fine without the VPN enabled. Another
example is that there=E2=80=99s often no reason to route data-heavy video a=
pps
through your VPN server. Rather than turning the VPN on my phone off to use
my wearable or to watch something on my phone, I=E2=80=99d like to be able =
to opt
those apps out of using the VPN at all. I=E2=80=99m sure there are many mor=
e
examples of apps that simply don=E2=80=99t need to go through a VPN, as no
confidential information is passed through them.

My proposal is to add another Fragment that=E2=80=99s just a list of all ap=
ps
installed on the phone with check boxes next to them. If the checkbox is
checked, that app will be routed through Wireguard. If not, it will be free
to bypass the VPN. Naturally, all apps will be default to being checked.
This is an easy change to make for the GoBackend implementation
using VpnService.Builder.addDisallowedApplication(<packageName>), but would
likely be pretty complicated to add to WgQuickBackend. Perhaps this is
something that would only be possible for GoBackend users.

Any thoughts on this? I have everything working locally by simply adding
these two hardcoded lines to GoBackend.java:

            builder.addDisallowedApplication("com.netflix.mediaclient");

builder.addDisallowedApplication("com.google.android.wearable.app=E2=80=9D)=
;

but I would like to make this more configurable and available to the rest
of Wireguard users if you=E2=80=99re agreeable to it. Thanks.

--000000000000ee97f105700a24da
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<html><head><style>body{font-family:Helvetica,Arial;font-size:13px}</style>=
</head><body style=3D"word-wrap:break-word"><div id=3D"bloop_customfont" st=
yle=3D"color:rgb(0,0,0);margin:0px"><div id=3D"bloop_customfont" style=3D"m=
argin:0px"><font face=3D"Helvetica">I=E2=80=99d like to make a contribution=
 to the Android app, but would like to know if this is something that would=
 actually get merged before I go through all the effort. What I=E2=80=99d l=
ike to do is add an exceptions list (apps that will not be routed through t=
he Wireguard interface). The rationale for this being that some apps simply=
 don=E2=80=99t work with Wireguard. For example, the use of a Wireguard VPN=
 with custom DNS breaks WearOS watches due to Google hardcoding the use of =
the 8.8.8.8 DNS server. Another example is that Netflix doesn=E2=80=99t wor=
k when routed through my VPN server since they know it=E2=80=99s a DigitalO=
cean instance, but works fine without the VPN enabled. Another example is t=
hat there=E2=80=99s often no reason to route data-heavy video apps through =
your VPN server. Rather than turning the VPN on my phone off to use my wear=
able or to watch something on my phone, I=E2=80=99d like to be able to opt =
those apps out of using the VPN at all. I=E2=80=99m sure there are many mor=
e examples of apps that simply don=E2=80=99t need to go through a VPN, as n=
o confidential information is passed through them.</font></div><div><font f=
ace=3D"Helvetica"><br></font></div><font face=3D"Helvetica">My proposal is =
to add another Fragment that=E2=80=99s just a list of all apps installed on=
 the phone with check boxes next to them. If the checkbox is checked, that =
app will be routed through Wireguard. If not, it will be free to bypass the=
 VPN. Naturally, all apps will be default to being checked. This is an easy=
 change to make for the GoBackend implementation using=C2=A0VpnService.Buil=
der.addDisallowedApplication(&lt;packageName&gt;), but would likely be pret=
ty complicated to add to WgQuickBackend. Perhaps this is something that wou=
ld only be possible for GoBackend users.</font><div><font face=3D"Helvetica=
"><br></font></div><div><font face=3D"Helvetica">Any thoughts on this? I ha=
ve everything working locally by simply adding these two hardcoded lines to=
 GoBackend.java:</font></div><div><font face=3D"Helvetica"><br></font></div=
><div><div><font face=3D"Helvetica">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 builder.addDisallowedApplication(&quot;com.netflix.mediaclient&quot;);<=
/font></div><div><font face=3D"Helvetica">=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 builder.addDisallowedApplication(&quot;com.google.android.wearab=
le.app=E2=80=9D);</font></div><div><font face=3D"Helvetica"><br></font></di=
v><div><font face=3D"Helvetica">but I would like to make this more configur=
able and available to the rest of Wireguard users if you=E2=80=99re agreeab=
le to it. Thanks.</font></div></div></div><font face=3D"Helvetica"><br></fo=
nt><div id=3D"bloop_sign_1530563587386675712" class=3D"bloop_sign"></div></=
body></html>

--000000000000ee97f105700a24da--
