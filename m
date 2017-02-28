Return-Path: williclarkam@gmail.com
MIME-Version: 1.0
From: William Clark <williclarkam@gmail.com>
Date: Tue, 28 Feb 2017 19:38:22 +0330
Message-ID: <CAPtYZXijvKABYy35SjHTGNrC4fFkP+9xwyUR8RyUOjMB=mB2WQ@mail.gmail.com>
Subject: RTNETLINK answers: Operation not supported
To: WireGuard@lists.zx2c4.com
Content-Type: multipart/alternative; boundary=94eb2c046ada0f02f1054999690a
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--94eb2c046ada0f02f1054999690a
Content-Type: text/plain; charset=UTF-8

Hello,

So I wanted to try WireGuard but unfortunately I can't get pas this part:
ip link add dev wg0 type wireguard.

When ever I run the command "ip link add dev wg0 type wireguard"
I get the output:
RTNETLINK answers: Operation not supported

This both happens on CentOS 7 and Fedora 25 and Ubuntu 16.04.

CentOS 7 Kernel:
Linux hostname 3.10.0-514.6.2.el7.x86_64 #1 SMP Thu Feb 23 03:04:39 UTC
2017 x86_64 x86_64 x86_64 GNU/Linux
Fedora 25 Kernel:
Linux hostname 4.9.7-x86_64-X #2 SMP Thu Feb 2 15:43:55 EST 2017 x86_64
x86_64 x86_64 GNU/Linux

I've tried installing Linux headers too, but no luck and I've rebooted
after the upgrade too, and still no luck.

Thanks a lot.

--94eb2c046ada0f02f1054999690a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><font face=3D"monospace, monospace">Hello,</font><div><fon=
t face=3D"monospace, monospace"><br></font></div><div><font face=3D"monospa=
ce, monospace">So I wanted to try WireGuard but unfortunately I can&#39;t g=
et pas this part:</font></div><div><font face=3D"monospace, monospace">ip l=
ink add dev wg0 type wireguard.<br></font></div><div><font face=3D"monospac=
e, monospace"><br></font></div><div><div><font face=3D"monospace, monospace=
">When ever I run the command &quot;ip link add dev wg0 type wireguard&quot=
;<br></font></div></div><div><font face=3D"monospace, monospace">I get the =
output:</font></div><div><div><font face=3D"monospace, monospace">RTNETLINK=
 answers: Operation not supported</font></div></div><div><font face=3D"mono=
space, monospace"><br></font></div><div><font face=3D"monospace, monospace"=
>This both happens on CentOS 7 and Fedora 25 and Ubuntu 16.04.</font></div>=
<div><font face=3D"monospace, monospace"><br></font></div><div><font face=
=3D"monospace, monospace">CentOS 7 Kernel:</font></div><div><div><font face=
=3D"monospace, monospace">Linux hostname 3.10.0-514.6.2.el7.x86_64 #1 SMP T=
hu Feb 23 03:04:39 UTC 2017 x86_64 x86_64 x86_64 GNU/Linux</font></div></di=
v><div><font face=3D"monospace, monospace">Fedora 25 Kernel:</font></div><d=
iv><div><font face=3D"monospace, monospace">Linux hostname 4.9.7-x86_64-X #=
2 SMP Thu Feb 2 15:43:55 EST 2017 x86_64 x86_64 x86_64 GNU/Linux</font></di=
v></div><div><font face=3D"monospace, monospace"><br></font></div><div><fon=
t face=3D"monospace, monospace">I&#39;ve tried installing Linux=C2=A0header=
s too, but no luck and I&#39;ve rebooted after the upgrade too, and still n=
o luck.</font></div><div><font face=3D"monospace, monospace"><br></font></d=
iv><div><font face=3D"monospace, monospace">Thanks a lot.</font></div></div=
>

--94eb2c046ada0f02f1054999690a--
