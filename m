Return-Path: jonathan@jonathanhult.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 746b7b2b
 for <wireguard@lists.zx2c4.com>;
 Mon, 18 Jun 2018 19:45:43 +0000 (UTC)
Received: from mail-lf0-x22e.google.com (mail-lf0-x22e.google.com
 [IPv6:2a00:1450:4010:c07::22e])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e16f59c1
 for <wireguard@lists.zx2c4.com>;
 Mon, 18 Jun 2018 19:45:43 +0000 (UTC)
Received: by mail-lf0-x22e.google.com with SMTP id y20-v6so26537069lfy.0
 for <wireguard@lists.zx2c4.com>; Mon, 18 Jun 2018 12:50:16 -0700 (PDT)
MIME-Version: 1.0
From: Jonathan Hult <jonathan@jonathanhult.com>
Date: Mon, 18 Jun 2018 15:49:48 -0400
Message-ID: <CAAmL+SmFnHXTQTQ+PjYHei_HQ4bw5gQAasPnPve9uNUFaryFsw@mail.gmail.com>
Subject: Is a hostname a valid value value for Endpoint?
To: wireguard@lists.zx2c4.com
Content-Type: multipart/alternative; boundary="000000000000d1a0dc056eefdf96"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--000000000000d1a0dc056eefdf96
Content-Type: text/plain; charset="UTF-8"

Greetings,

I would like to know if a hostname is a valid value for *Endpoint*? Today,
the documentation all seems to reference an IP address.

Today, Mullvad <https://mullvad.net/en/> currently sets *EndPoint* to a
hostname (see here <https://api.mullvad.net/public/relays/wireguard/v1/>)

In my case, my host is set to use a DNS server which routes VPN provider
domains to a bad IP (in order to block them).

1. If *EndPoint* should never be a hostname, perhaps we should prevent (or
at least warn) when it is found to be a hostname (instead of an IP address).

2. If *EndPoint* can be a hostname, then I think we want to ensure DNS is
set from the configuration file before attempting to connect. In the wg-quick
script <https://git.zx2c4.com/WireGuard/tree/src/tools/wg-quick/linux.bash>,
I updated the *cmd_up()* function to call *set_dns()* earlier on than it is
currently called. This prevents my host's original DNS server from blocking
anything.

Jonathan

--000000000000d1a0dc056eefdf96
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D""><font face=3D"geor=
gia, serif" style=3D"" size=3D"2">Greetings,</font></div><div class=3D"gmai=
l_default" style=3D""><font face=3D"georgia, serif" size=3D"2"><br></font><=
/div><div class=3D"gmail_default" style=3D""><font face=3D"georgia, serif" =
size=3D"2">I would like to know if a hostname is a valid value for=C2=A0<i>=
Endpoint</i>? Today, the documentation all seems to reference an IP address=
.</font></div><div class=3D"gmail_default" style=3D""><font face=3D"georgia=
, serif" size=3D"2"><br></font></div><div class=3D"gmail_default" style=3D"=
"><font face=3D"georgia, serif" size=3D"2">Today, <a href=3D"https://mullva=
d.net/en/">Mullvad</a> currently sets <i>EndPoint</i> to a hostname=C2=A0(s=
ee <a href=3D"https://api.mullvad.net/public/relays/wireguard/v1/">here</a>=
<span style=3D"background-color:rgb(255,255,255);text-decoration-style:init=
ial;text-decoration-color:initial;float:none;display:inline">)</span></font=
></div><div class=3D"gmail_default" style=3D""><font face=3D"georgia, serif=
" size=3D"2"><br></font></div><div class=3D"gmail_default" style=3D""><div =
class=3D"gmail_default" style=3D"text-decoration-style:initial;text-decorat=
ion-color:initial"><font face=3D"georgia, serif" size=3D"2">In my case, my =
host is set to use a DNS server which routes VPN provider domains to a bad =
IP (in order to block them).</font></div><div class=3D"gmail_default" style=
=3D"text-decoration-style:initial;text-decoration-color:initial"><font face=
=3D"georgia, serif" size=3D"2"><br></font></div><div class=3D"gmail_default=
" style=3D"text-decoration-style:initial;text-decoration-color:initial"><fo=
nt face=3D"georgia, serif" size=3D"2">1.=C2=A0</font><span style=3D"font-fa=
mily:georgia,serif;font-size:small">If </span><i style=3D"font-family:georg=
ia,serif;font-size:small">EndPoint</i><span style=3D"font-family:georgia,se=
rif;font-size:small"> should never be a hostname, perhaps we should prevent=
 (or at least warn) when it is found to be a hostname (instead of an IP add=
ress).</span></div></div><div class=3D"gmail_default" style=3D""><font face=
=3D"georgia, serif" size=3D"2"><br></font></div><div class=3D"gmail_default=
" style=3D""><font face=3D"georgia, serif" size=3D"2">2. If <i>EndPoint</i>=
 can be a hostname, then I think we want to ensure DNS is set from the conf=
iguration file before attempting to connect. In the <a href=3D"https://git.=
zx2c4.com/WireGuard/tree/src/tools/wg-quick/linux.bash">wg-quick script</a>=
, I updated the <i>cmd_up()</i> function to call <i>set_dns()</i> earlier o=
n than it is currently called. This prevents</font><span style=3D"font-fami=
ly:georgia,serif;font-size:small">=C2=A0my host&#39;s original DNS server f=
rom blocking anything.</span></div><div class=3D"gmail_default" style=3D"">=
<font face=3D"georgia, serif" size=3D"2"><br></font></div><div class=3D"gma=
il_default" style=3D""><font face=3D"georgia, serif" style=3D"" size=3D"2">=
Jonathan</font></div></div>

--000000000000d1a0dc056eefdf96--
