Return-Path: apetrov@vmware.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ccabe4b8
 for <wireguard@lists.zx2c4.com>; Wed, 4 Oct 2017 13:34:21 +0000 (UTC)
Received: from NAM01-BY2-obe.outbound.protection.outlook.com
 (mail-by2nam01on0040.outbound.protection.outlook.com [104.47.34.40])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3ec5d798
 for <wireguard@lists.zx2c4.com>; Wed, 4 Oct 2017 13:34:20 +0000 (UTC)
From: Andrey Petrov <apetrov@vmware.com>
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: CentOS kernel module build failure
Date: Wed, 4 Oct 2017 14:03:19 +0000
Message-ID: <CY1PR0501MB157904D69DD3E95529A3E04AC4730@CY1PR0501MB1579.namprd05.prod.outlook.com>
Content-Type: multipart/alternative;
 boundary="_000_CY1PR0501MB157904D69DD3E95529A3E04AC4730CY1PR0501MB1579_"
MIME-Version: 1.0
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--_000_CY1PR0501MB157904D69DD3E95529A3E04AC4730CY1PR0501MB1579_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi,


Up-to-date CentOS Linux release 7.4.1708

$ uname -r

3.10.0-693.2.2.el7.x86_64


Followed the official instructions at https://www.wireguard.com/install/ to=
 install the latest wireguard snapshot on a fully up-to-date CentOS 7.4 but=
 the kernel module compilation failed:

$ cat /var/lib/dkms/wireguard/0.0.20171001/build/make.log
DKMS make.log for wireguard-0.0.20171001 for kernel 3.10.0-693.2.2.el7.x86_=
64 (x86_64)
Wed Oct  4 13:57:39 UTC 2017
make: Entering directory `/usr/src/kernels/3.10.0-693.2.2.el7.x86_64'
  LD      /var/lib/dkms/wireguard/0.0.20171001/build/built-in.o
  CC [M]  /var/lib/dkms/wireguard/0.0.20171001/build/main.o
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20171001/build/compat/compat.h:428:0: warning: =
"GENL_UNS_ADMIN_PERM" redefined [enabled by default]
 #define GENL_UNS_ADMIN_PERM GENL_ADMIN_PERM
 ^
In file included from include/linux/genetlink.h:4:0,
                 from include/net/genetlink.h:4,
                 from /var/lib/dkms/wireguard/0.0.20171001/build/compat/com=
pat.h:406,
                 from <command-line>:0:
include/uapi/linux/genetlink.h:24:0: note: this is the location of the prev=
ious definition
 #define GENL_UNS_ADMIN_PERM 0x10
 ^
  CC [M]  /var/lib/dkms/wireguard/0.0.20171001/build/noise.o
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20171001/build/compat/compat.h:428:0: warning: =
"GENL_UNS_ADMIN_PERM" redefined [enabled by default]
 #define GENL_UNS_ADMIN_PERM GENL_ADMIN_PERM
 ^
In file included from include/linux/genetlink.h:4:0,
                 from include/net/genetlink.h:4,
                 from /var/lib/dkms/wireguard/0.0.20171001/build/compat/com=
pat.h:406,
                 from <command-line>:0:
include/uapi/linux/genetlink.h:24:0: note: this is the location of the prev=
ious definition
 #define GENL_UNS_ADMIN_PERM 0x10
 ^
  CC [M]  /var/lib/dkms/wireguard/0.0.20171001/build/device.o
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20171001/build/compat/compat.h:428:0: warning: =
"GENL_UNS_ADMIN_PERM" redefined [enabled by default]
 #define GENL_UNS_ADMIN_PERM GENL_ADMIN_PERM
 ^
In file included from include/linux/genetlink.h:4:0,
                 from include/net/genetlink.h:4,
                 from /var/lib/dkms/wireguard/0.0.20171001/build/compat/com=
pat.h:406,
                 from <command-line>:0:
include/uapi/linux/genetlink.h:24:0: note: this is the location of the prev=
ious definition
 #define GENL_UNS_ADMIN_PERM 0x10
 ^
  CC [M]  /var/lib/dkms/wireguard/0.0.20171001/build/peer.o
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20171001/build/compat/compat.h:428:0: warning: =
"GENL_UNS_ADMIN_PERM" redefined [enabled by default]
 #define GENL_UNS_ADMIN_PERM GENL_ADMIN_PERM
 ^
In file included from include/linux/genetlink.h:4:0,
                 from include/net/genetlink.h:4,
                 from /var/lib/dkms/wireguard/0.0.20171001/build/compat/com=
pat.h:406,
                 from <command-line>:0:
include/uapi/linux/genetlink.h:24:0: note: this is the location of the prev=
ious definition
 #define GENL_UNS_ADMIN_PERM 0x10
 ^
  CC [M]  /var/lib/dkms/wireguard/0.0.20171001/build/timers.o
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20171001/build/compat/compat.h:428:0: warning: =
"GENL_UNS_ADMIN_PERM" redefined [enabled by default]
 #define GENL_UNS_ADMIN_PERM GENL_ADMIN_PERM
 ^
In file included from include/linux/genetlink.h:4:0,
                 from include/net/genetlink.h:4,
                 from /var/lib/dkms/wireguard/0.0.20171001/build/compat/com=
pat.h:406,
                 from <command-line>:0:
include/uapi/linux/genetlink.h:24:0: note: this is the location of the prev=
ious definition
 #define GENL_UNS_ADMIN_PERM 0x10
 ^
  CC [M]  /var/lib/dkms/wireguard/0.0.20171001/build/queueing.o
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20171001/build/compat/compat.h:428:0: warning: =
"GENL_UNS_ADMIN_PERM" redefined [enabled by default]
 #define GENL_UNS_ADMIN_PERM GENL_ADMIN_PERM
 ^
In file included from include/linux/genetlink.h:4:0,
                 from include/net/genetlink.h:4,
                 from /var/lib/dkms/wireguard/0.0.20171001/build/compat/com=
pat.h:406,
                 from <command-line>:0:
include/uapi/linux/genetlink.h:24:0: note: this is the location of the prev=
ious definition
 #define GENL_UNS_ADMIN_PERM 0x10
 ^
  CC [M]  /var/lib/dkms/wireguard/0.0.20171001/build/send.o
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20171001/build/compat/compat.h:428:0: warning: =
"GENL_UNS_ADMIN_PERM" redefined [enabled by default]
 #define GENL_UNS_ADMIN_PERM GENL_ADMIN_PERM
 ^
In file included from include/linux/genetlink.h:4:0,
                 from include/net/genetlink.h:4,
                 from /var/lib/dkms/wireguard/0.0.20171001/build/compat/com=
pat.h:406,
                 from <command-line>:0:
include/uapi/linux/genetlink.h:24:0: note: this is the location of the prev=
ious definition
 #define GENL_UNS_ADMIN_PERM 0x10
 ^
  CC [M]  /var/lib/dkms/wireguard/0.0.20171001/build/receive.o
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20171001/build/compat/compat.h:428:0: warning: =
"GENL_UNS_ADMIN_PERM" redefined [enabled by default]
 #define GENL_UNS_ADMIN_PERM GENL_ADMIN_PERM
 ^
In file included from include/linux/genetlink.h:4:0,
                 from include/net/genetlink.h:4,
                 from /var/lib/dkms/wireguard/0.0.20171001/build/compat/com=
pat.h:406,
                 from <command-line>:0:
include/uapi/linux/genetlink.h:24:0: note: this is the location of the prev=
ious definition
 #define GENL_UNS_ADMIN_PERM 0x10
 ^
  CC [M]  /var/lib/dkms/wireguard/0.0.20171001/build/socket.o
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20171001/build/compat/compat.h:428:0: warning: =
"GENL_UNS_ADMIN_PERM" redefined [enabled by default]
 #define GENL_UNS_ADMIN_PERM GENL_ADMIN_PERM
 ^
In file included from include/linux/genetlink.h:4:0,
                 from include/net/genetlink.h:4,
                 from /var/lib/dkms/wireguard/0.0.20171001/build/compat/com=
pat.h:406,
                 from <command-line>:0:
include/uapi/linux/genetlink.h:24:0: note: this is the location of the prev=
ious definition
 #define GENL_UNS_ADMIN_PERM 0x10
 ^
  CC [M]  /var/lib/dkms/wireguard/0.0.20171001/build/hashtables.o
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20171001/build/compat/compat.h:428:0: warning: =
"GENL_UNS_ADMIN_PERM" redefined [enabled by default]
 #define GENL_UNS_ADMIN_PERM GENL_ADMIN_PERM
 ^
In file included from include/linux/genetlink.h:4:0,
                 from include/net/genetlink.h:4,
                 from /var/lib/dkms/wireguard/0.0.20171001/build/compat/com=
pat.h:406,
                 from <command-line>:0:
include/uapi/linux/genetlink.h:24:0: note: this is the location of the prev=
ious definition
 #define GENL_UNS_ADMIN_PERM 0x10
 ^
  CC [M]  /var/lib/dkms/wireguard/0.0.20171001/build/routingtable.o
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20171001/build/compat/compat.h:428:0: warning: =
"GENL_UNS_ADMIN_PERM" redefined [enabled by default]
 #define GENL_UNS_ADMIN_PERM GENL_ADMIN_PERM
 ^
In file included from include/linux/genetlink.h:4:0,
                 from include/net/genetlink.h:4,
                 from /var/lib/dkms/wireguard/0.0.20171001/build/compat/com=
pat.h:406,
                 from <command-line>:0:
include/uapi/linux/genetlink.h:24:0: note: this is the location of the prev=
ious definition
 #define GENL_UNS_ADMIN_PERM 0x10
 ^
  CC [M]  /var/lib/dkms/wireguard/0.0.20171001/build/ratelimiter.o
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20171001/build/compat/compat.h:428:0: warning: =
"GENL_UNS_ADMIN_PERM" redefined [enabled by default]
 #define GENL_UNS_ADMIN_PERM GENL_ADMIN_PERM
 ^
In file included from include/linux/genetlink.h:4:0,
                 from include/net/genetlink.h:4,
                 from /var/lib/dkms/wireguard/0.0.20171001/build/compat/com=
pat.h:406,
                 from <command-line>:0:
include/uapi/linux/genetlink.h:24:0: note: this is the location of the prev=
ious definition
 #define GENL_UNS_ADMIN_PERM 0x10
 ^
  CC [M]  /var/lib/dkms/wireguard/0.0.20171001/build/cookie.o
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20171001/build/compat/compat.h:428:0: warning: =
"GENL_UNS_ADMIN_PERM" redefined [enabled by default]
 #define GENL_UNS_ADMIN_PERM GENL_ADMIN_PERM
 ^
In file included from include/linux/genetlink.h:4:0,
                 from include/net/genetlink.h:4,
                 from /var/lib/dkms/wireguard/0.0.20171001/build/compat/com=
pat.h:406,
                 from <command-line>:0:
include/uapi/linux/genetlink.h:24:0: note: this is the location of the prev=
ious definition
 #define GENL_UNS_ADMIN_PERM 0x10
 ^
  CC [M]  /var/lib/dkms/wireguard/0.0.20171001/build/netlink.o
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20171001/build/compat/compat.h:428:0: warning: =
"GENL_UNS_ADMIN_PERM" redefined [enabled by default]
 #define GENL_UNS_ADMIN_PERM GENL_ADMIN_PERM
 ^
In file included from include/linux/genetlink.h:4:0,
                 from include/net/genetlink.h:4,
                 from /var/lib/dkms/wireguard/0.0.20171001/build/compat/com=
pat.h:406,
                 from <command-line>:0:
include/uapi/linux/genetlink.h:24:0: note: this is the location of the prev=
ious definition
 #define GENL_UNS_ADMIN_PERM 0x10
 ^
/var/lib/dkms/wireguard/0.0.20171001/build/netlink.c: In function =91netlin=
k_init=92:
/var/lib/dkms/wireguard/0.0.20171001/build/netlink.c:488:42: error: macro "=
genl_register_family_with_ops" passed 3 arguments, but takes just 2
  return genl_register_family(&genl_family);
                                          ^
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20171001/build/compat/compat.h:434:33: error: =
=91genl_register_family_with_ops=92 undeclared (first use in this function)
 #define genl_register_family(a) genl_register_family_with_ops(a, (struct g=
enl_ops *)genl_ops, ARRAY_SIZE(genl_ops))
                                 ^
/var/lib/dkms/wireguard/0.0.20171001/build/netlink.c:488:9: note: in expans=
ion of macro =91genl_register_family=92
  return genl_register_family(&genl_family);
         ^
/var/lib/dkms/wireguard/0.0.20171001/build/compat/compat.h:434:33: note: ea=
ch undeclared identifier is reported only once for each function it appears=
 in
 #define genl_register_family(a) genl_register_family_with_ops(a, (struct g=
enl_ops *)genl_ops, ARRAY_SIZE(genl_ops))
                                 ^
/var/lib/dkms/wireguard/0.0.20171001/build/netlink.c:488:9: note: in expans=
ion of macro =91genl_register_family=92
  return genl_register_family(&genl_family);
         ^
/var/lib/dkms/wireguard/0.0.20171001/build/netlink.c:489:1: warning: contro=
l reaches end of non-void function [-Wreturn-type]
 }
 ^
make[1]: *** [/var/lib/dkms/wireguard/0.0.20171001/build/netlink.o] Error 1
make: *** [_module_/var/lib/dkms/wireguard/0.0.20171001/build] Error 2
make: Leaving directory `/usr/src/kernels/3.10.0-693.2.2.el7.x86_64'



- A.

--_000_CY1PR0501MB157904D69DD3E95529A3E04AC4730CY1PR0501MB1579_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<style type=3D"text/css" style=3D"display:none;"><!-- P {margin-top:0;margi=
n-bottom:0;} --></style>
</head>
<body dir=3D"ltr">
<div id=3D"divtagdefaultwrapper" style=3D"font-size:12pt;color:#000000;font=
-family:Calibri,Helvetica,sans-serif;" dir=3D"ltr">
<p><span style=3D"font-size: 12pt;">Hi,</span></p>
<p><span style=3D"font-size: 12pt;"><br>
</span></p>
<p><span style=3D"font-size: 12pt;">Up-to-date&nbsp;</span><span style=3D"f=
ont-size: 12pt;">CentOS Linux release 7.4.1708</span><br>
</p>
<p><span>$ uname -r</span></p>
<p><span><span>3.10.0-693.2.2.el7.x86_64</span><br>
</span></p>
<p><span><span><br>
</span></span></p>
<p><span><span>Followed the official instructions at&nbsp;<a href=3D"https:=
//www.wireguard.com/install/" class=3D"OWAAutoLink" id=3D"LPlnk596469" prev=
iewremoved=3D"true">https://www.wireguard.com/install/</a>&nbsp;to install<=
/span></span><span style=3D"font-size: 12pt;">&nbsp;the latest&nbsp;wiregua=
rd&nbsp;snapshot
 on a fully up-to-date&nbsp;<span style=3D"font-family: Calibri, Helvetica,=
 sans-serif, EmojiFont, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji=
&quot;, NotoColorEmoji, &quot;Segoe UI Symbol&quot;, &quot;Android Emoji&qu=
ot;, EmojiSymbols; font-size: 16px;">CentOS 7.4&nbsp;</span></span><span st=
yle=3D"font-size: 12pt;">but
 the kernel module&nbsp;</span><span style=3D"font-size: 12pt;">compilation=
 failed</span><span style=3D"font-size: 12pt;">:</span></p>
<p><span></p>
<div><br>
</div>
<div>$ cat /var/lib/dkms/wireguard/0.0.20171001/build/make.log</div>
<div>DKMS make.log for wireguard-0.0.20171001 for kernel 3.10.0-693.2.2.el7=
.x86_64 (x86_64)</div>
<div>Wed Oct&nbsp; 4 13:57:39 UTC 2017</div>
<div>make: Entering directory `/usr/src/kernels/3.10.0-693.2.2.el7.x86_64'<=
/div>
<div>&nbsp; LD&nbsp; &nbsp; &nbsp; /var/lib/dkms/wireguard/0.0.20171001/bui=
ld/built-in.o</div>
<div>&nbsp; CC [M]&nbsp; /var/lib/dkms/wireguard/0.0.20171001/build/main.o<=
/div>
<div>In file included from &lt;command-line&gt;:0:0:</div>
<div>/var/lib/dkms/wireguard/0.0.20171001/build/compat/compat.h:428:0: warn=
ing: &quot;GENL_UNS_ADMIN_PERM&quot; redefined [enabled by default]</div>
<div>&nbsp;#define GENL_UNS_ADMIN_PERM GENL_ADMIN_PERM</div>
<div>&nbsp;^</div>
<div>In file included from include/linux/genetlink.h:4:0,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;from inc=
lude/net/genetlink.h:4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;from /va=
r/lib/dkms/wireguard/0.0.20171001/build/compat/compat.h:406,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;from &lt=
;command-line&gt;:0:</div>
<div>include/uapi/linux/genetlink.h:24:0: note: this is the location of the=
 previous definition</div>
<div>&nbsp;#define GENL_UNS_ADMIN_PERM 0x10</div>
<div>&nbsp;^</div>
<div>&nbsp; CC [M]&nbsp; /var/lib/dkms/wireguard/0.0.20171001/build/noise.o=
</div>
<div>In file included from &lt;command-line&gt;:0:0:</div>
<div>/var/lib/dkms/wireguard/0.0.20171001/build/compat/compat.h:428:0: warn=
ing: &quot;GENL_UNS_ADMIN_PERM&quot; redefined [enabled by default]</div>
<div>&nbsp;#define GENL_UNS_ADMIN_PERM GENL_ADMIN_PERM</div>
<div>&nbsp;^</div>
<div>In file included from include/linux/genetlink.h:4:0,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;from inc=
lude/net/genetlink.h:4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;from /va=
r/lib/dkms/wireguard/0.0.20171001/build/compat/compat.h:406,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;from &lt=
;command-line&gt;:0:</div>
<div>include/uapi/linux/genetlink.h:24:0: note: this is the location of the=
 previous definition</div>
<div>&nbsp;#define GENL_UNS_ADMIN_PERM 0x10</div>
<div>&nbsp;^</div>
<div>&nbsp; CC [M]&nbsp; /var/lib/dkms/wireguard/0.0.20171001/build/device.=
o</div>
<div>In file included from &lt;command-line&gt;:0:0:</div>
<div>/var/lib/dkms/wireguard/0.0.20171001/build/compat/compat.h:428:0: warn=
ing: &quot;GENL_UNS_ADMIN_PERM&quot; redefined [enabled by default]</div>
<div>&nbsp;#define GENL_UNS_ADMIN_PERM GENL_ADMIN_PERM</div>
<div>&nbsp;^</div>
<div>In file included from include/linux/genetlink.h:4:0,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;from inc=
lude/net/genetlink.h:4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;from /va=
r/lib/dkms/wireguard/0.0.20171001/build/compat/compat.h:406,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;from &lt=
;command-line&gt;:0:</div>
<div>include/uapi/linux/genetlink.h:24:0: note: this is the location of the=
 previous definition</div>
<div>&nbsp;#define GENL_UNS_ADMIN_PERM 0x10</div>
<div>&nbsp;^</div>
<div>&nbsp; CC [M]&nbsp; /var/lib/dkms/wireguard/0.0.20171001/build/peer.o<=
/div>
<div>In file included from &lt;command-line&gt;:0:0:</div>
<div>/var/lib/dkms/wireguard/0.0.20171001/build/compat/compat.h:428:0: warn=
ing: &quot;GENL_UNS_ADMIN_PERM&quot; redefined [enabled by default]</div>
<div>&nbsp;#define GENL_UNS_ADMIN_PERM GENL_ADMIN_PERM</div>
<div>&nbsp;^</div>
<div>In file included from include/linux/genetlink.h:4:0,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;from inc=
lude/net/genetlink.h:4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;from /va=
r/lib/dkms/wireguard/0.0.20171001/build/compat/compat.h:406,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;from &lt=
;command-line&gt;:0:</div>
<div>include/uapi/linux/genetlink.h:24:0: note: this is the location of the=
 previous definition</div>
<div>&nbsp;#define GENL_UNS_ADMIN_PERM 0x10</div>
<div>&nbsp;^</div>
<div>&nbsp; CC [M]&nbsp; /var/lib/dkms/wireguard/0.0.20171001/build/timers.=
o</div>
<div>In file included from &lt;command-line&gt;:0:0:</div>
<div>/var/lib/dkms/wireguard/0.0.20171001/build/compat/compat.h:428:0: warn=
ing: &quot;GENL_UNS_ADMIN_PERM&quot; redefined [enabled by default]</div>
<div>&nbsp;#define GENL_UNS_ADMIN_PERM GENL_ADMIN_PERM</div>
<div>&nbsp;^</div>
<div>In file included from include/linux/genetlink.h:4:0,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;from inc=
lude/net/genetlink.h:4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;from /va=
r/lib/dkms/wireguard/0.0.20171001/build/compat/compat.h:406,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;from &lt=
;command-line&gt;:0:</div>
<div>include/uapi/linux/genetlink.h:24:0: note: this is the location of the=
 previous definition</div>
<div>&nbsp;#define GENL_UNS_ADMIN_PERM 0x10</div>
<div>&nbsp;^</div>
<div>&nbsp; CC [M]&nbsp; /var/lib/dkms/wireguard/0.0.20171001/build/queuein=
g.o</div>
<div>In file included from &lt;command-line&gt;:0:0:</div>
<div>/var/lib/dkms/wireguard/0.0.20171001/build/compat/compat.h:428:0: warn=
ing: &quot;GENL_UNS_ADMIN_PERM&quot; redefined [enabled by default]</div>
<div>&nbsp;#define GENL_UNS_ADMIN_PERM GENL_ADMIN_PERM</div>
<div>&nbsp;^</div>
<div>In file included from include/linux/genetlink.h:4:0,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;from inc=
lude/net/genetlink.h:4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;from /va=
r/lib/dkms/wireguard/0.0.20171001/build/compat/compat.h:406,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;from &lt=
;command-line&gt;:0:</div>
<div>include/uapi/linux/genetlink.h:24:0: note: this is the location of the=
 previous definition</div>
<div>&nbsp;#define GENL_UNS_ADMIN_PERM 0x10</div>
<div>&nbsp;^</div>
<div>&nbsp; CC [M]&nbsp; /var/lib/dkms/wireguard/0.0.20171001/build/send.o<=
/div>
<div>In file included from &lt;command-line&gt;:0:0:</div>
<div>/var/lib/dkms/wireguard/0.0.20171001/build/compat/compat.h:428:0: warn=
ing: &quot;GENL_UNS_ADMIN_PERM&quot; redefined [enabled by default]</div>
<div>&nbsp;#define GENL_UNS_ADMIN_PERM GENL_ADMIN_PERM</div>
<div>&nbsp;^</div>
<div>In file included from include/linux/genetlink.h:4:0,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;from inc=
lude/net/genetlink.h:4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;from /va=
r/lib/dkms/wireguard/0.0.20171001/build/compat/compat.h:406,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;from &lt=
;command-line&gt;:0:</div>
<div>include/uapi/linux/genetlink.h:24:0: note: this is the location of the=
 previous definition</div>
<div>&nbsp;#define GENL_UNS_ADMIN_PERM 0x10</div>
<div>&nbsp;^</div>
<div>&nbsp; CC [M]&nbsp; /var/lib/dkms/wireguard/0.0.20171001/build/receive=
.o</div>
<div>In file included from &lt;command-line&gt;:0:0:</div>
<div>/var/lib/dkms/wireguard/0.0.20171001/build/compat/compat.h:428:0: warn=
ing: &quot;GENL_UNS_ADMIN_PERM&quot; redefined [enabled by default]</div>
<div>&nbsp;#define GENL_UNS_ADMIN_PERM GENL_ADMIN_PERM</div>
<div>&nbsp;^</div>
<div>In file included from include/linux/genetlink.h:4:0,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;from inc=
lude/net/genetlink.h:4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;from /va=
r/lib/dkms/wireguard/0.0.20171001/build/compat/compat.h:406,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;from &lt=
;command-line&gt;:0:</div>
<div>include/uapi/linux/genetlink.h:24:0: note: this is the location of the=
 previous definition</div>
<div>&nbsp;#define GENL_UNS_ADMIN_PERM 0x10</div>
<div>&nbsp;^</div>
<div>&nbsp; CC [M]&nbsp; /var/lib/dkms/wireguard/0.0.20171001/build/socket.=
o</div>
<div>In file included from &lt;command-line&gt;:0:0:</div>
<div>/var/lib/dkms/wireguard/0.0.20171001/build/compat/compat.h:428:0: warn=
ing: &quot;GENL_UNS_ADMIN_PERM&quot; redefined [enabled by default]</div>
<div>&nbsp;#define GENL_UNS_ADMIN_PERM GENL_ADMIN_PERM</div>
<div>&nbsp;^</div>
<div>In file included from include/linux/genetlink.h:4:0,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;from inc=
lude/net/genetlink.h:4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;from /va=
r/lib/dkms/wireguard/0.0.20171001/build/compat/compat.h:406,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;from &lt=
;command-line&gt;:0:</div>
<div>include/uapi/linux/genetlink.h:24:0: note: this is the location of the=
 previous definition</div>
<div>&nbsp;#define GENL_UNS_ADMIN_PERM 0x10</div>
<div>&nbsp;^</div>
<div>&nbsp; CC [M]&nbsp; /var/lib/dkms/wireguard/0.0.20171001/build/hashtab=
les.o</div>
<div>In file included from &lt;command-line&gt;:0:0:</div>
<div>/var/lib/dkms/wireguard/0.0.20171001/build/compat/compat.h:428:0: warn=
ing: &quot;GENL_UNS_ADMIN_PERM&quot; redefined [enabled by default]</div>
<div>&nbsp;#define GENL_UNS_ADMIN_PERM GENL_ADMIN_PERM</div>
<div>&nbsp;^</div>
<div>In file included from include/linux/genetlink.h:4:0,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;from inc=
lude/net/genetlink.h:4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;from /va=
r/lib/dkms/wireguard/0.0.20171001/build/compat/compat.h:406,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;from &lt=
;command-line&gt;:0:</div>
<div>include/uapi/linux/genetlink.h:24:0: note: this is the location of the=
 previous definition</div>
<div>&nbsp;#define GENL_UNS_ADMIN_PERM 0x10</div>
<div>&nbsp;^</div>
<div>&nbsp; CC [M]&nbsp; /var/lib/dkms/wireguard/0.0.20171001/build/routing=
table.o</div>
<div>In file included from &lt;command-line&gt;:0:0:</div>
<div>/var/lib/dkms/wireguard/0.0.20171001/build/compat/compat.h:428:0: warn=
ing: &quot;GENL_UNS_ADMIN_PERM&quot; redefined [enabled by default]</div>
<div>&nbsp;#define GENL_UNS_ADMIN_PERM GENL_ADMIN_PERM</div>
<div>&nbsp;^</div>
<div>In file included from include/linux/genetlink.h:4:0,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;from inc=
lude/net/genetlink.h:4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;from /va=
r/lib/dkms/wireguard/0.0.20171001/build/compat/compat.h:406,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;from &lt=
;command-line&gt;:0:</div>
<div>include/uapi/linux/genetlink.h:24:0: note: this is the location of the=
 previous definition</div>
<div>&nbsp;#define GENL_UNS_ADMIN_PERM 0x10</div>
<div>&nbsp;^</div>
<div>&nbsp; CC [M]&nbsp; /var/lib/dkms/wireguard/0.0.20171001/build/ratelim=
iter.o</div>
<div>In file included from &lt;command-line&gt;:0:0:</div>
<div>/var/lib/dkms/wireguard/0.0.20171001/build/compat/compat.h:428:0: warn=
ing: &quot;GENL_UNS_ADMIN_PERM&quot; redefined [enabled by default]</div>
<div>&nbsp;#define GENL_UNS_ADMIN_PERM GENL_ADMIN_PERM</div>
<div>&nbsp;^</div>
<div>In file included from include/linux/genetlink.h:4:0,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;from inc=
lude/net/genetlink.h:4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;from /va=
r/lib/dkms/wireguard/0.0.20171001/build/compat/compat.h:406,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;from &lt=
;command-line&gt;:0:</div>
<div>include/uapi/linux/genetlink.h:24:0: note: this is the location of the=
 previous definition</div>
<div>&nbsp;#define GENL_UNS_ADMIN_PERM 0x10</div>
<div>&nbsp;^</div>
<div>&nbsp; CC [M]&nbsp; /var/lib/dkms/wireguard/0.0.20171001/build/cookie.=
o</div>
<div>In file included from &lt;command-line&gt;:0:0:</div>
<div>/var/lib/dkms/wireguard/0.0.20171001/build/compat/compat.h:428:0: warn=
ing: &quot;GENL_UNS_ADMIN_PERM&quot; redefined [enabled by default]</div>
<div>&nbsp;#define GENL_UNS_ADMIN_PERM GENL_ADMIN_PERM</div>
<div>&nbsp;^</div>
<div>In file included from include/linux/genetlink.h:4:0,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;from inc=
lude/net/genetlink.h:4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;from /va=
r/lib/dkms/wireguard/0.0.20171001/build/compat/compat.h:406,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;from &lt=
;command-line&gt;:0:</div>
<div>include/uapi/linux/genetlink.h:24:0: note: this is the location of the=
 previous definition</div>
<div>&nbsp;#define GENL_UNS_ADMIN_PERM 0x10</div>
<div>&nbsp;^</div>
<div>&nbsp; CC [M]&nbsp; /var/lib/dkms/wireguard/0.0.20171001/build/netlink=
.o</div>
<div>In file included from &lt;command-line&gt;:0:0:</div>
<div>/var/lib/dkms/wireguard/0.0.20171001/build/compat/compat.h:428:0: warn=
ing: &quot;GENL_UNS_ADMIN_PERM&quot; redefined [enabled by default]</div>
<div>&nbsp;#define GENL_UNS_ADMIN_PERM GENL_ADMIN_PERM</div>
<div>&nbsp;^</div>
<div>In file included from include/linux/genetlink.h:4:0,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;from inc=
lude/net/genetlink.h:4,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;from /va=
r/lib/dkms/wireguard/0.0.20171001/build/compat/compat.h:406,</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;from &lt=
;command-line&gt;:0:</div>
<div>include/uapi/linux/genetlink.h:24:0: note: this is the location of the=
 previous definition</div>
<div>&nbsp;#define GENL_UNS_ADMIN_PERM 0x10</div>
<div>&nbsp;^</div>
<div>/var/lib/dkms/wireguard/0.0.20171001/build/netlink.c: In function =91n=
etlink_init=92:</div>
<div>/var/lib/dkms/wireguard/0.0.20171001/build/netlink.c:488:42: error: ma=
cro &quot;genl_register_family_with_ops&quot; passed 3 arguments, but takes=
 just 2</div>
<div>&nbsp; return genl_register_family(&amp;genl_family);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp=
; ^</div>
<div>In file included from &lt;command-line&gt;:0:0:</div>
<div>/var/lib/dkms/wireguard/0.0.20171001/build/compat/compat.h:434:33: err=
or: =91genl_register_family_with_ops=92 undeclared (first use in this funct=
ion)</div>
<div>&nbsp;#define genl_register_family(a) genl_register_family_with_ops(a,=
 (struct genl_ops *)genl_ops, ARRAY_SIZE(genl_ops))</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;^</div>
<div>/var/lib/dkms/wireguard/0.0.20171001/build/netlink.c:488:9: note: in e=
xpansion of macro =91genl_register_family=92</div>
<div>&nbsp; return genl_register_family(&amp;genl_family);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;^</div>
<div>/var/lib/dkms/wireguard/0.0.20171001/build/compat/compat.h:434:33: not=
e: each undeclared identifier is reported only once for each function it ap=
pears in</div>
<div>&nbsp;#define genl_register_family(a) genl_register_family_with_ops(a,=
 (struct genl_ops *)genl_ops, ARRAY_SIZE(genl_ops))</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;^</div>
<div>/var/lib/dkms/wireguard/0.0.20171001/build/netlink.c:488:9: note: in e=
xpansion of macro =91genl_register_family=92</div>
<div>&nbsp; return genl_register_family(&amp;genl_family);</div>
<div>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;^</div>
<div>/var/lib/dkms/wireguard/0.0.20171001/build/netlink.c:489:1: warning: c=
ontrol reaches end of non-void function [-Wreturn-type]</div>
<div>&nbsp;}</div>
<div>&nbsp;^</div>
<div>make[1]: *** [/var/lib/dkms/wireguard/0.0.20171001/build/netlink.o] Er=
ror 1</div>
<div>make: *** [_module_/var/lib/dkms/wireguard/0.0.20171001/build] Error 2=
</div>
<div>make: Leaving directory `/usr/src/kernels/3.10.0-693.2.2.el7.x86_64'</=
div>
<br>
</span>
<p></p>
<p><span><br>
</span></p>
<p><span><span>- A.</span></span></p>
</div>
</body>
</html>

--_000_CY1PR0501MB157904D69DD3E95529A3E04AC4730CY1PR0501MB1579_--
