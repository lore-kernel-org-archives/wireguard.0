Return-Path: antonshpilevoy@gmail.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8cc95f7e
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 Jun 2018 23:22:54 +0000 (UTC)
Received: from mail-wm0-x22a.google.com (mail-wm0-x22a.google.com
 [IPv6:2a00:1450:400c:c09::22a])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6000466d
 for <wireguard@lists.zx2c4.com>;
 Thu, 14 Jun 2018 23:22:53 +0000 (UTC)
Received: by mail-wm0-x22a.google.com with SMTP id v16-v6so644408wmh.5
 for <wireguard@lists.zx2c4.com>; Thu, 14 Jun 2018 16:26:57 -0700 (PDT)
MIME-Version: 1.0
From: Anton Shpilevoy <antonshpilevoy@gmail.com>
Date: Fri, 15 Jun 2018 04:26:35 +0500
Message-ID: <CAEyvJ0dTyuN+76QShpTWvr6_6TWyhaJAS6RaU7x=cP4bquqLQQ@mail.gmail.com>
Subject: problem with Mac OS
To: wireguard@lists.zx2c4.com
Content-Type: multipart/alternative; boundary="0000000000005845d0056ea26f9d"
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--0000000000005845d0056ea26f9d
Content-Type: text/plain; charset="UTF-8"

stat: cannot read file system information for '0%#p': No such file or
directory
Mac version 10.13.4 (17E202), Kernel Version: Darwin 17.5.0

After simple
brew install wireguard-tools
sudo wg-quick up azirevpn-se1
I'm getting:
stat: cannot read file system information for '0%#p': No such file or
directory
/usr/local/bin/wg-quick: line 56: ((: (  File:
"/private/etc/wireguard/azirevpn-se1.conf"
 ...
Inodes: Total: 9223372036854775807 Free: 9223372036853543267 & 0007) == 0:
missing `)' (error token is ": "/private/etc/wireguard/azirevpn-se1.conf"
...
Inodes: Total: 9223372036854775807 Free: 9223372036853543267 & 0007) == 0")
Warning: `/private/etc/wireguard/azirevpn-se1.conf' is world accessible
[#] wireguard-go utun
...
INFO: (utun9) 2018/06/15 04:06:14 Starting wireguard-go version 0.0.20180613
/usr/local/bin/wg-quick: line 101: File: "/var/run/wireguard/utun9.sock"
...
[#] rm -f /var/run/wireguard/azirevpn-se1.name

any workaround?

--0000000000005845d0056ea26f9d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">stat: cannot read file system information for &#39;0%#p&#3=
9;: No such file or directory<br><div><div>Mac version 10.13.4 (17E202), Ke=
rnel Version: Darwin 17.5.0</div></div><div><br></div><div>After simple</di=
v><div>brew install wireguard-tools=C2=A0</div><div>sudo wg-quick up azirev=
pn-se1<br></div><div>I&#39;m getting:</div><div>stat: cannot read file syst=
em information for &#39;0%#p&#39;: No such file or directory<br></div><div>=
<div>/usr/local/bin/wg-quick: line 56: ((: (=C2=A0 File: &quot;/private/etc=
/wireguard/azirevpn-se1.conf&quot;</div><div>=C2=A0...</div><div>Inodes: To=
tal: 9223372036854775807 Free: 9223372036853543267 &amp; 0007) =3D=3D 0: mi=
ssing `)&#39; (error token is &quot;: &quot;/private/etc/wireguard/azirevpn=
-se1.conf&quot;</div><div>...</div><div>Inodes: Total: 9223372036854775807 =
Free: 9223372036853543267 &amp; 0007) =3D=3D 0&quot;)<br></div><div>Warning=
: `/private/etc/wireguard/azirevpn-se1.conf&#39; is world accessible</div><=
div>[#] wireguard-go utun</div><div>...</div><div>INFO: (utun9) 2018/06/15 =
04:06:14 Starting wireguard-go version 0.0.20180613<br></div><div>/usr/loca=
l/bin/wg-quick: line 101: File: &quot;/var/run/wireguard/utun9.sock&quot;</=
div><div>...</div><div>[#] rm -f /var/run/wireguard/<a href=3D"http://azire=
vpn-se1.name">azirevpn-se1.name</a></div></div><div><br></div><div>any work=
around?</div></div>

--0000000000005845d0056ea26f9d--
