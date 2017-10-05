Return-Path: apetrov@vmware.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 972730c7
 for <wireguard@lists.zx2c4.com>; Thu, 5 Oct 2017 07:43:14 +0000 (UTC)
Received: from NAM03-BY2-obe.outbound.protection.outlook.com
 (mail-by2nam03on0088.outbound.protection.outlook.com [104.47.42.88])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 53480e86
 for <wireguard@lists.zx2c4.com>; Thu, 5 Oct 2017 07:43:14 +0000 (UTC)
From: Andrey Petrov <apetrov@vmware.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Subject: Re: CentOS kernel module build failure
Date: Thu, 5 Oct 2017 08:12:18 +0000
Message-ID: <CY1PR0501MB15797EB039F2510EA00B0303C4700@CY1PR0501MB1579.namprd05.prod.outlook.com>
References: <CY1PR0501MB157904D69DD3E95529A3E04AC4730@CY1PR0501MB1579.namprd05.prod.outlook.com>,
 <CAHmME9qQTch=-yCfHr0xTBLk+bHBWw675WEiY8+BM58_2vq+Ug@mail.gmail.com>
In-Reply-To: <CAHmME9qQTch=-yCfHr0xTBLk+bHBWw675WEiY8+BM58_2vq+Ug@mail.gmail.com>
Content-Type: multipart/alternative;
 boundary="_000_CY1PR0501MB15797EB039F2510EA00B0303C4700CY1PR0501MB1579_"
MIME-Version: 1.0
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--_000_CY1PR0501MB15797EB039F2510EA00B0303C4700CY1PR0501MB1579_
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi Jason,


After applying the patch with 'git apply' I got:

DKMS make.log for wireguard-0.0.20171001 for kernel 3.10.0-693.2.2.el7.x86_=
64 (x86_64)
Thu Oct  5 08:10:00 UTC 2017
make: Entering directory `/usr/src/kernels/3.10.0-693.2.2.el7.x86_64'
  LD      /var/lib/dkms/wireguard/0.0.20171001/build/built-in.o
  CC [M]  /var/lib/dkms/wireguard/0.0.20171001/build/main.o
  CC [M]  /var/lib/dkms/wireguard/0.0.20171001/build/noise.o
  CC [M]  /var/lib/dkms/wireguard/0.0.20171001/build/device.o
  CC [M]  /var/lib/dkms/wireguard/0.0.20171001/build/peer.o
  CC [M]  /var/lib/dkms/wireguard/0.0.20171001/build/timers.o
  CC [M]  /var/lib/dkms/wireguard/0.0.20171001/build/queueing.o
  CC [M]  /var/lib/dkms/wireguard/0.0.20171001/build/send.o
  CC [M]  /var/lib/dkms/wireguard/0.0.20171001/build/receive.o
  CC [M]  /var/lib/dkms/wireguard/0.0.20171001/build/socket.o
  CC [M]  /var/lib/dkms/wireguard/0.0.20171001/build/hashtables.o
  CC [M]  /var/lib/dkms/wireguard/0.0.20171001/build/routingtable.o
  CC [M]  /var/lib/dkms/wireguard/0.0.20171001/build/ratelimiter.o
  CC [M]  /var/lib/dkms/wireguard/0.0.20171001/build/cookie.o
  CC [M]  /var/lib/dkms/wireguard/0.0.20171001/build/netlink.o
/var/lib/dkms/wireguard/0.0.20171001/build/netlink.c: In function =91netlin=
k_init=92:
/var/lib/dkms/wireguard/0.0.20171001/build/netlink.c:488:42: error: macro "=
genl_register_family_with_ops" passed 3 arguments, but takes just 2
  return genl_register_family(&genl_family);
                                          ^
In file included from <command-line>:0:0:
/var/lib/dkms/wireguard/0.0.20171001/build/compat/compat.h:437:33: error: =
=91genl_register_family_with_ops=92 undeclared (first use in this function)
 #define genl_register_family(a) genl_register_family_with_ops(a, (struct g=
enl_ops *)genl_ops, ARRAY_SIZE(genl_ops))
                                 ^
/var/lib/dkms/wireguard/0.0.20171001/build/netlink.c:488:9: note: in expans=
ion of macro =91genl_register_family=92
  return genl_register_family(&genl_family);
         ^
/var/lib/dkms/wireguard/0.0.20171001/build/compat/compat.h:437:33: note: ea=
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

- Andrey

________________________________
From: Jason A. Donenfeld <Jason@zx2c4.com>
Sent: Thursday, October 5, 2017 7:37:53 AM
To: Andrey Petrov
Cc: wireguard@lists.zx2c4.com
Subject: Re: CentOS kernel module build failure

Hey Andrey,

Sorry about that. I fixed it yesterday in the master branch. I'll roll
a new snapshot soon.

https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.zx2c4.com_WireGu=
ard_patch_-3Fid-3D24e742617e47bcdb65ba4ce37fa56a107d75d0f3&d=3DDwIBaQ&c=3Du=
ilaK90D4TOVoH58JNXRgQ&r=3DlWprCbBPq-RqvY_cTASTIoLEQCXNtlLeW_TMY-DsKcc&m=3DS=
_5FETsVfplUfCEryJzb6i4zFDpq7B5RqIFPinAKNms&s=3DtX5rcecy9pMG6HvpQ9xgyLoXmUOr=
wKFDUu4_UlY1X0M&e=3D

Jason

--_000_CY1PR0501MB15797EB039F2510EA00B0303C4700CY1PR0501MB1579_
Content-Type: text/html; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3DWindows-1=
252">
<meta name=3D"Generator" content=3D"Microsoft Exchange Server">
<!-- converted from text --><style><!-- .EmailQuote { margin-left: 1pt; pad=
ding-left: 4pt; border-left: #800000 2px solid; } --></style>
</head>
<body>
<meta content=3D"text/html; charset=3DUTF-8">
<style type=3D"text/css" style=3D"">
<!--
p
	{margin-top:0;
	margin-bottom:0}
-->
</style>
<div dir=3D"ltr">
<div id=3D"x_divtagdefaultwrapper" dir=3D"ltr" style=3D"font-size:12pt; col=
or:#000000; font-family:Calibri,Helvetica,sans-serif">
<p>Hi Jason,</p>
<p><br>
</p>
<p>After applying the patch with 'git apply' I got:</p>
<p></p>
<div><br>
</div>
<div>DKMS make.log for wireguard-0.0.20171001 for kernel 3.10.0-693.2.2.el7=
.x86_64 (x86_64)</div>
<div>Thu Oct&nbsp; 5 08:10:00 UTC 2017</div>
<div>make: Entering directory `/usr/src/kernels/3.10.0-693.2.2.el7.x86_64'<=
/div>
<div>&nbsp; LD&nbsp; &nbsp; &nbsp; /var/lib/dkms/wireguard/0.0.20171001/bui=
ld/built-in.o</div>
<div>&nbsp; CC [M]&nbsp; /var/lib/dkms/wireguard/0.0.20171001/build/main.o<=
/div>
<div>&nbsp; CC [M]&nbsp; /var/lib/dkms/wireguard/0.0.20171001/build/noise.o=
</div>
<div>&nbsp; CC [M]&nbsp; /var/lib/dkms/wireguard/0.0.20171001/build/device.=
o</div>
<div>&nbsp; CC [M]&nbsp; /var/lib/dkms/wireguard/0.0.20171001/build/peer.o<=
/div>
<div>&nbsp; CC [M]&nbsp; /var/lib/dkms/wireguard/0.0.20171001/build/timers.=
o</div>
<div>&nbsp; CC [M]&nbsp; /var/lib/dkms/wireguard/0.0.20171001/build/queuein=
g.o</div>
<div>&nbsp; CC [M]&nbsp; /var/lib/dkms/wireguard/0.0.20171001/build/send.o<=
/div>
<div>&nbsp; CC [M]&nbsp; /var/lib/dkms/wireguard/0.0.20171001/build/receive=
.o</div>
<div>&nbsp; CC [M]&nbsp; /var/lib/dkms/wireguard/0.0.20171001/build/socket.=
o</div>
<div>&nbsp; CC [M]&nbsp; /var/lib/dkms/wireguard/0.0.20171001/build/hashtab=
les.o</div>
<div>&nbsp; CC [M]&nbsp; /var/lib/dkms/wireguard/0.0.20171001/build/routing=
table.o</div>
<div>&nbsp; CC [M]&nbsp; /var/lib/dkms/wireguard/0.0.20171001/build/ratelim=
iter.o</div>
<div>&nbsp; CC [M]&nbsp; /var/lib/dkms/wireguard/0.0.20171001/build/cookie.=
o</div>
<div>&nbsp; CC [M]&nbsp; /var/lib/dkms/wireguard/0.0.20171001/build/netlink=
.o</div>
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
<div>/var/lib/dkms/wireguard/0.0.20171001/build/compat/compat.h:437:33: err=
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
<div>/var/lib/dkms/wireguard/0.0.20171001/build/compat/compat.h:437:33: not=
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
<div><br>
</div>
- Andrey
<p></p>
</div>
<hr tabindex=3D"-1" style=3D"display:inline-block; width:98%">
<div id=3D"x_divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" =
color=3D"#000000" style=3D"font-size:11pt"><b>From:</b> Jason A. Donenfeld =
&lt;Jason@zx2c4.com&gt;<br>
<b>Sent:</b> Thursday, October 5, 2017 7:37:53 AM<br>
<b>To:</b> Andrey Petrov<br>
<b>Cc:</b> wireguard@lists.zx2c4.com<br>
<b>Subject:</b> Re: CentOS kernel module build failure</font>
<div>&nbsp;</div>
</div>
</div>
<font size=3D"2"><span style=3D"font-size:10pt;">
<div class=3D"PlainText">Hey Andrey,<br>
<br>
Sorry about that. I fixed it yesterday in the master branch. I'll roll<br>
a new snapshot soon.<br>
<br>
<a href=3D"https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__git.zx2c4=
.com_WireGuard_patch_-3Fid-3D24e742617e47bcdb65ba4ce37fa56a107d75d0f3&amp;d=
=3DDwIBaQ&amp;c=3DuilaK90D4TOVoH58JNXRgQ&amp;r=3DlWprCbBPq-RqvY_cTASTIoLEQC=
XNtlLeW_TMY-DsKcc&amp;m=3DS_5FETsVfplUfCEryJzb6i4zFDpq7B5RqIFPinAKNms&amp;s=
=3DtX5rcecy9pMG6HvpQ9xgyLoXmUOrwKFDUu4_UlY1X0M&amp;e=3D">https://urldefense=
.proofpoint.com/v2/url?u=3Dhttps-3A__git.zx2c4.com_WireGuard_patch_-3Fid-3D=
24e742617e47bcdb65ba4ce37fa56a107d75d0f3&amp;d=3DDwIBaQ&amp;c=3DuilaK90D4TO=
VoH58JNXRgQ&amp;r=3DlWprCbBPq-RqvY_cTASTIoLEQCXNtlLeW_TMY-DsKcc&amp;m=3DS_5=
FETsVfplUfCEryJzb6i4zFDpq7B5RqIFPinAKNms&amp;s=3DtX5rcecy9pMG6HvpQ9xgyLoXmU=
OrwKFDUu4_UlY1X0M&amp;e=3D</a>
<br>
<br>
Jason<br>
</div>
</span></font>
</body>
</html>

--_000_CY1PR0501MB15797EB039F2510EA00B0303C4700CY1PR0501MB1579_--
