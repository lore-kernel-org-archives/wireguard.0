Return-Path: ryan@testtoast.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e23e7e56
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Aug 2018 10:40:40 +0000 (UTC)
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
 [66.111.4.25])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d49ce823
 for <wireguard@lists.zx2c4.com>;
 Thu, 30 Aug 2018 10:40:40 +0000 (UTC)
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
 by mailout.nyi.internal (Postfix) with ESMTP id 8A2FA21E33
 for <wireguard@lists.zx2c4.com>; Thu, 30 Aug 2018 06:54:35 -0400 (EDT)
Received: from [192.168.1.143] (180-150-21-37.cust.aussiebb.net
 [180.150.21.37])
 by mail.messagingengine.com (Postfix) with ESMTPA id C2BBCE4447
 for <wireguard@lists.zx2c4.com>; Thu, 30 Aug 2018 06:54:33 -0400 (EDT)
From: Ryan Walklin <ryan@testtoast.com>
Content-Type: multipart/alternative;
 boundary="Apple-Mail=_488820B3-F2D8-422C-8A56-8A7DA0EEE0A7"
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: TCP Tunneling (again sorry)
Message-Id: <1D3625F5-E278-436F-B50E-0D65ADCACC1C@testtoast.com>
Date: Thu, 30 Aug 2018 20:54:30 +1000
To: wireguard@lists.zx2c4.com
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>


--Apple-Mail=_488820B3-F2D8-422C-8A56-8A7DA0EEE0A7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hi,

I appreciate this is a bit of a noob question not directly related to =
WireGuard and has been covered before, but I=E2=80=99m just hoping for a =
bit of advice and clarity. I=E2=80=99ve got a WireGuard tunnel up and =
running nicely between my MBP laptop and my Debian server at home and am =
hoping to use it as a VPN while travelling.=20

However I=E2=80=99ve found an issue when my laptop is behind work =
firewalls which block UDP, and not wanting to be encountering this issue =
overseas have been looking at tunnelling options. I have been using a =
SOCKS proxy generated with OpenSSH up until now, but it=E2=80=99s =
difficult to route all my laptop=E2=80=99s traffic via the proxy.

I=E2=80=99m aware of SSF (https://securesocketfunneling.github.io/ssf =
<https://securesocketfunneling.github.io/ssf>) and udp2raw =
(https://github.com/wangyu-/udp2raw-tunnel/blob/master/doc/openvpn_guide.m=
d =
<https://github.com/wangyu-/udp2raw-tunnel/blob/master/doc/openvpn_guide.m=
d>) which has been covered on this list before =
(https://lists.zx2c4.com/pipermail/wireguard/2018-May/002915.html =
<https://lists.zx2c4.com/pipermail/wireguard/2018-May/002915.html>) but =
just wonder if anyone could comment on the specific security implication =
of using minimal or no security on the TCP tunnel mechanism (which seems =
poorly implemented by udp2raw particularly), and relying on the =
underlying WireGuard encryption? Or is this crazy? Is there any other =
satisfactory Unix-based mechanism to tunnel UDP over TCP?

I feel like if I run a WireGuard tunnel through an encrypted SSF tunnel =
I may as well just be using SSF by itself, however the ease of setting =
the default route on my laptop with wg-quick is a great feature and I am =
very impressed by the quality of WireGuard and the focus on security so =
would like to continue using it if possible.

Thanks,

Ryan=

--Apple-Mail=_488820B3-F2D8-422C-8A56-8A7DA0EEE0A7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" =
class=3D"">Hi,<div class=3D""><br class=3D""></div><div class=3D"">I =
appreciate this is a bit of a noob question not directly related to =
WireGuard and has been covered before, but I=E2=80=99m just hoping for a =
bit of advice and clarity. I=E2=80=99ve got a WireGuard tunnel up and =
running nicely between my MBP laptop and my Debian server at home and am =
hoping to use it as a VPN while travelling.&nbsp;</div><div class=3D""><br=
 class=3D""></div><div class=3D"">However I=E2=80=99ve found an issue =
when my laptop is behind work firewalls which block UDP, and not wanting =
to be encountering this issue overseas have been looking at tunnelling =
options. I have been using a SOCKS proxy generated with OpenSSH up until =
now, but it=E2=80=99s difficult to route all my laptop=E2=80=99s traffic =
via the proxy.</div><div class=3D""><br class=3D""></div><div =
class=3D"">I=E2=80=99m aware of SSF (<a =
href=3D"https://securesocketfunneling.github.io/ssf" =
class=3D"">https://securesocketfunneling.github.io/ssf</a>) and udp2raw =
(<a =
href=3D"https://github.com/wangyu-/udp2raw-tunnel/blob/master/doc/openvpn_=
guide.md" =
class=3D"">https://github.com/wangyu-/udp2raw-tunnel/blob/master/doc/openv=
pn_guide.md</a>) which has been covered on this list before (<a =
href=3D"https://lists.zx2c4.com/pipermail/wireguard/2018-May/002915.html" =
class=3D"">https://lists.zx2c4.com/pipermail/wireguard/2018-May/002915.htm=
l</a>) but just wonder if anyone could comment on the specific security =
implication of using minimal or no security on the TCP tunnel mechanism =
(which seems poorly implemented by udp2raw particularly), and relying on =
the underlying WireGuard encryption? Or is this crazy? Is there any =
other satisfactory Unix-based mechanism to tunnel UDP over =
TCP?</div><div class=3D""><br class=3D""></div><div class=3D"">I feel =
like if I run a WireGuard tunnel through an encrypted SSF tunnel I may =
as well just be using SSF by itself, however the ease of setting the =
default route on my laptop with wg-quick is a great feature and I am =
very impressed by the quality of WireGuard and the focus on security so =
would like to continue using it if possible.</div><div class=3D""><br =
class=3D""></div><div class=3D"">Thanks,</div><div class=3D""><br =
class=3D""></div><div class=3D"">Ryan</div></body></html>=

--Apple-Mail=_488820B3-F2D8-422C-8A56-8A7DA0EEE0A7--
