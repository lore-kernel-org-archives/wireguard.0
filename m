Return-Path: andy@herdoralden.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a86a0f58
 for <wireguard@lists.zx2c4.com>;
 Sat, 19 Aug 2017 18:14:19 +0000 (UTC)
Received: from mail-pf0-f173.google.com (mail-pf0-f173.google.com
 [209.85.192.173])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6a096b75
 for <wireguard@lists.zx2c4.com>;
 Sat, 19 Aug 2017 18:14:19 +0000 (UTC)
Received: by mail-pf0-f173.google.com with SMTP id w127so5623971pfd.2
 for <wireguard@lists.zx2c4.com>; Sat, 19 Aug 2017 11:37:34 -0700 (PDT)
MIME-Version: 1.0
From: Andrew Harrison <andy@herdoralden.com>
Date: Sat, 19 Aug 2017 11:37:33 -0700
Message-ID: <CAJmufjLM+pk-mwAaAbbsJ9obPjOvOmt_t_dMK4k1RX30sYts3w@mail.gmail.com>
Subject: Having some trouble with an ip rule
To: wireguard@lists.zx2c4.com
Content-Type: multipart/alternative; boundary="94eb2c18eea0f4935705571f89d9"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--94eb2c18eea0f4935705571f89d9
Content-Type: text/plain; charset="UTF-8"

I've been messing around with WireGuard, and I'm trying to get it to route
all of my traffic.

I was trying to emulate what is shown in this gif
<https://www.wireguard.com/img/wg-quick-tool.gif>, but I've made a mistake.

Instead of showing:

    ip rule add not to *server ip address* table 51820


I am left with:

    [#] ip -4 rule add not fwmark 51820 table 51820


and I'm not sure how to remove this.  Anytime I try to use WireGuard with
the `wg-quick` command, it makes/executes this rule, and it clobbers my
connections.

The command I used that got me in this mess is (I think):

    ip rule add not to *server ip address* table 51820


Anytime WireGuard creates the VPN interface (wg0vpn), it creates this rule.


 I can run

    ip rule del table 51820

and it gets rid of it, but next time I initiate the connection, it is
back.  And also, it's not routing my traffic...

Any help would be appreciated.

--94eb2c18eea0f4935705571f89d9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div style=3D"font-size:12.8px">I&#39;ve been messing arou=
nd with WireGuard, and I&#39;m trying to get it to route all of my traffic.=
</div><div style=3D"font-size:12.8px"><br></div><div style=3D"font-size:12.=
8px">I was trying to emulate what is shown in=C2=A0<a href=3D"https://www.w=
ireguard.com/img/wg-quick-tool.gif" target=3D"_blank">this gif</a>, but I&#=
39;ve made a mistake.</div><div style=3D"font-size:12.8px"><br></div><div s=
tyle=3D"font-size:12.8px">Instead of showing:</div><div style=3D"font-size:=
12.8px"><br></div><div style=3D"font-size:12.8px">=C2=A0 =C2=A0 ip rule add=
 not to *server ip address* table 51820</div><div style=3D"font-size:12.8px=
"><br></div><div style=3D"font-size:12.8px"><br></div><div style=3D"font-si=
ze:12.8px">I am left with:</div><div style=3D"font-size:12.8px"><br></div><=
div style=3D"font-size:12.8px">=C2=A0 =C2=A0 [#] ip -4 rule add not fwmark =
51820 table 51820</div><div style=3D"font-size:12.8px"><br></div><div style=
=3D"font-size:12.8px"><br></div><div style=3D"font-size:12.8px">and I&#39;m=
 not sure how to remove this.=C2=A0 Anytime I try to use WireGuard with the=
 `wg-quick` command, it makes/executes this rule, and it clobbers my connec=
tions.</div><div style=3D"font-size:12.8px"><br></div><div style=3D"font-si=
ze:12.8px">The command I used that got me in this mess is (I think):</div><=
div style=3D"font-size:12.8px"><br></div><div style=3D"font-size:12.8px">=
=C2=A0 =C2=A0 ip rule add not to *server ip address* table 51820</div><div =
style=3D"font-size:12.8px"><br></div><div style=3D"font-size:12.8px"><br></=
div><div style=3D"font-size:12.8px">Anytime WireGuard creates the VPN inter=
face (wg0vpn), it creates this rule.=C2=A0</div><div style=3D"font-size:12.=
8px"><br></div><div style=3D"font-size:12.8px"><br></div><div style=3D"font=
-size:12.8px">=C2=A0I can run</div><div style=3D"font-size:12.8px"><br></di=
v><div style=3D"font-size:12.8px">=C2=A0 =C2=A0 ip rule del table 51820</di=
v><div style=3D"font-size:12.8px"><br></div><div style=3D"font-size:12.8px"=
>and it gets rid of it, but next time I initiate the connection, it is back=
.=C2=A0 And also, it&#39;s not routing my traffic... =C2=A0</div><div style=
=3D"font-size:12.8px"><br></div><div style=3D"font-size:12.8px">Any help wo=
uld be appreciated.</div></div>

--94eb2c18eea0f4935705571f89d9--
