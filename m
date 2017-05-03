Return-Path: zun-tao.wang@ubisoft.com
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0cf50a3c
 for <wireguard@lists.zx2c4.com>; Wed, 3 May 2017 09:54:01 +0000 (UTC)
Received: from hdc-mail-out01.ubisoft.com (hdc-mail-out01.ubisoft.com
 [202.59.232.69])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 10f6b372
 for <wireguard@lists.zx2c4.com>; Wed, 3 May 2017 09:54:00 +0000 (UTC)
From: Wang Zun Tao <zun-tao.wang@ubisoft.com>
To: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Subject: Installation issue on centos 7 kernel 3.10
Date: Wed, 3 May 2017 10:03:35 +0000
Message-ID: <c5583cece7fa4be893e0a4a527dde90d@HDC-MAIL-EXCH02.ubisoft.org>
Content-Type: multipart/mixed;
 boundary="_004_c5583cece7fa4be893e0a4a527dde90dHDCMAILEXCH02ubisoftorg_"
MIME-Version: 1.0
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>

--_004_c5583cece7fa4be893e0a4a527dde90dHDCMAILEXCH02ubisoftorg_
Content-Type: multipart/alternative;
	boundary="_000_c5583cece7fa4be893e0a4a527dde90dHDCMAILEXCH02ubisoftorg_"

--_000_c5583cece7fa4be893e0a4a527dde90dHDCMAILEXCH02ubisoftorg_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello Team,

I tried to install wireguard via source code on centos 7.
But failed, see below message.
On the wireguard homepage, it says supports 3.10.

Version of centos 7.
[root@localhost ~]# uname -r
3.10.0-514.16.1.el7.x86_64

See whole error message in attachment.

make -C /lib/modules/3.10.0-514.16.1.el7.x86_64/build M=3D/opt/scripts/Wire=
Guard-0.0.20170421/src modules
make[1]: Entering directory `/usr/src/kernels/3.10.0-514.16.1.el7.x86_64'
  CC [M]  /opt/scripts/WireGuard-0.0.20170421/src/main.o
In file included from <command-line>:0:0:
/opt/scripts/WireGuard-0.0.20170421/src/compat/compat.h:13:2: warning: #war=
ning "WireGuard support for kernels < 4.1 should work but is slightly exper=
imental." [-Wcpp]
#warning "WireGuard support for kernels < 4.1 should work but is slightly e=
xperimental."
  ^
In file included from ./arch/x86/include/asm/paravirt_types.h:45:0,
                 from ./arch/x86/include/asm/ptrace.h:64,
                 from ./arch/x86/include/asm/alternative.h:8,
                 from ./arch/x86/include/asm/bitops.h:16,
                 from include/linux/bitops.h:36,
                 from include/linux/kernel.h:10,
                 from include/linux/skbuff.h:17,
                 from include/linux/ip.h:20,
                 from include/linux/if_tunnel.h:4,
                 from include/net/ip_tunnels.h:4,
                 from /opt/scripts/WireGuard-0.0.20170421/src/compat/compat=
.h:62,
                 from <command-line>:0:
/opt/scripts/WireGuard-0.0.20170421/src/compat/compat.h:27:21: error: dupli=
cate member 'data'
#define headers_end data
                     ^


Sincerely,
Wang Zun Tao
IT-GNS - Network and Systems Administrator
Tel: 86 21 5467-4545  x8397
zun-tao.wang@ubisoft.com<mailto:zun-tao.wang@ubisoft.com>


--_000_c5583cece7fa4be893e0a4a527dde90dHDCMAILEXCH02ubisoftorg_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:SimSun;
	panose-1:2 1 6 0 3 1 1 1 1 1;}
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
@font-face
	{font-family:"\@SimSun";
	panose-1:2 1 6 0 3 1 1 1 1 1;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;}
@page WordSection1
	{size:8.5in 11.0in;
	margin:1.0in 1.0in 1.0in 1.0in;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-US" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hello Team, <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I tried to install wireguard via source code on cent=
os 7. <o:p>
</o:p></p>
<p class=3D"MsoNormal">But failed, see below message. <o:p></o:p></p>
<p class=3D"MsoNormal">On the wireguard homepage, it says supports 3.10. <o=
:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Version of centos 7.<o:p></o:p></p>
<p class=3D"MsoNormal">[root@localhost ~]# uname -r<o:p></o:p></p>
<p class=3D"MsoNormal">3.10.0-514.16.1.el7.x86_64<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">See whole error message in attachment. <o:p></o:p></=
p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">make -C /lib/modules/3.10.0-514.16.1.el7.x86_64/buil=
d M=3D/opt/scripts/WireGuard-0.0.20170421/src modules<o:p></o:p></p>
<p class=3D"MsoNormal">make[1]: Entering directory `/usr/src/kernels/3.10.0=
-514.16.1.el7.x86_64'<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; CC [M]&nbsp; /opt/scripts/WireGuard-0.0.20170=
421/src/main.o<o:p></o:p></p>
<p class=3D"MsoNormal">In file included from &lt;command-line&gt;:0:0:<o:p>=
</o:p></p>
<p class=3D"MsoNormal">/opt/scripts/WireGuard-0.0.20170421/src/compat/compa=
t.h:13:2: warning: #warning &quot;WireGuard support for kernels &lt; 4.1 sh=
ould work but is slightly experimental.&quot; [-Wcpp]<o:p></o:p></p>
<p class=3D"MsoNormal">#warning &quot;WireGuard support for kernels &lt; 4.=
1 should work but is slightly experimental.&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp; ^<o:p></o:p></p>
<p class=3D"MsoNormal">In file included from ./arch/x86/include/asm/paravir=
t_types.h:45:0,<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; from ./arch/x86/include/asm/pt=
race.h:64,<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; from ./arch/x86/include/asm/al=
ternative.h:8,<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; from ./arch/x86/include/asm/bi=
tops.h:16,<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; from include/linux/bitops.h:36=
,<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; from include/linux/kernel.h:10=
,<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; from include/linux/skbuff.h:17=
,<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; from include/linux/ip.h:20,<o:=
p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;from include/linux/if_tunnel.h=
:4,<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; from include/net/ip_tunnels.h:=
4,<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; from /opt/scripts/WireGuard-0.=
0.20170421/src/compat/compat.h:62,<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; from &lt;command-line&gt;:0:<o=
:p></o:p></p>
<p class=3D"MsoNormal">/opt/scripts/WireGuard-0.0.20170421/src/compat/compa=
t.h:27:21: error: duplicate member 'data'<o:p></o:p></p>
<p class=3D"MsoNormal">#define headers_end data<o:p></o:p></p>
<p class=3D"MsoNormal">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ^<o:p>=
</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal" style=3D"text-align:justify;text-justify:inter-ideog=
raph"><b><span style=3D"font-size:10.5pt;color:#1F497D">Sincerely,
<o:p></o:p></span></b></p>
<p class=3D"MsoNormal" style=3D"text-align:justify;text-justify:inter-ideog=
raph"><b><span style=3D"font-size:10.5pt;color:#1F497D">Wang Zun Tao</span>=
</b><span style=3D"font-size:10.5pt;color:black"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-align:justify;text-justify:inter-ideog=
raph"><b><span style=3D"color:#F49823">IT-GNS</span></b><span style=3D"colo=
r:#1F497D">&nbsp;&#8211; Network and Systems Administrator</span><span styl=
e=3D"font-size:10.5pt;color:black"><o:p></o:p></span></p>
<p class=3D"MsoNormal" style=3D"text-align:justify;text-justify:inter-ideog=
raph"><span style=3D"font-size:10.0pt;color:#1F497D">Tel: 86 21 5467-4545&n=
bsp; x8397</span><span style=3D"font-size:10.5pt;color:black"><o:p></o:p></=
span></p>
<p class=3D"MsoNormal" style=3D"text-align:justify;text-justify:inter-ideog=
raph"><u><span style=3D"font-size:10.0pt;color:blue"><a href=3D"mailto:zun-=
tao.wang@ubisoft.com"><span style=3D"color:blue">zun-tao.wang@ubisoft.com</=
span></a></span></u><span style=3D"font-size:10.5pt;color:black"><o:p></o:p=
></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_c5583cece7fa4be893e0a4a527dde90dHDCMAILEXCH02ubisoftorg_--

--_004_c5583cece7fa4be893e0a4a527dde90dHDCMAILEXCH02ubisoftorg_
Content-Type: text/plain; name="wireguard_make_error.txt"
Content-Description: wireguard_make_error.txt
Content-Disposition: attachment; filename="wireguard_make_error.txt";
	size=15888; creation-date="Wed, 03 May 2017 10:02:52 GMT";
	modification-date="Wed, 03 May 2017 10:02:52 GMT"
Content-Transfer-Encoding: base64

W3Jvb3RAbG9jYWxob3N0IHNyY10jIG1ha2UNCm1ha2UgLUMgL2xpYi9tb2R1bGVzLzMuMTAuMC01
MTQuMTYuMS5lbDcueDg2XzY0L2J1aWxkIE09L29wdC9zY3JpcHRzL1dpcmVHdWFyZC0wLjAuMjAx
NzA0MjEvc3JjIG1vZHVsZXMNCm1ha2VbMV06IEVudGVyaW5nIGRpcmVjdG9yeSBgL3Vzci9zcmMv
a2VybmVscy8zLjEwLjAtNTE0LjE2LjEuZWw3Lng4Nl82NCcNCiAgQ0MgW01dICAvb3B0L3Njcmlw
dHMvV2lyZUd1YXJkLTAuMC4yMDE3MDQyMS9zcmMvbWFpbi5vDQpJbiBmaWxlIGluY2x1ZGVkIGZy
b20gPGNvbW1hbmQtbGluZT46MDowOg0KL29wdC9zY3JpcHRzL1dpcmVHdWFyZC0wLjAuMjAxNzA0
MjEvc3JjL2NvbXBhdC9jb21wYXQuaDoxMzoyOiB3YXJuaW5nOiAjd2FybmluZyAiV2lyZUd1YXJk
IHN1cHBvcnQgZm9yIGtlcm5lbHMgPCA0LjEgc2hvdWxkIHdvcmsgYnV0IGlzIHNsaWdodGx5IGV4
cGVyaW1lbnRhbC4iIFstV2NwcF0NCiAjd2FybmluZyAiV2lyZUd1YXJkIHN1cHBvcnQgZm9yIGtl
cm5lbHMgPCA0LjEgc2hvdWxkIHdvcmsgYnV0IGlzIHNsaWdodGx5IGV4cGVyaW1lbnRhbC4iDQog
IF4NCkluIGZpbGUgaW5jbHVkZWQgZnJvbSAuL2FyY2gveDg2L2luY2x1ZGUvYXNtL3BhcmF2aXJ0
X3R5cGVzLmg6NDU6MCwNCiAgICAgICAgICAgICAgICAgZnJvbSAuL2FyY2gveDg2L2luY2x1ZGUv
YXNtL3B0cmFjZS5oOjY0LA0KICAgICAgICAgICAgICAgICBmcm9tIC4vYXJjaC94ODYvaW5jbHVk
ZS9hc20vYWx0ZXJuYXRpdmUuaDo4LA0KICAgICAgICAgICAgICAgICBmcm9tIC4vYXJjaC94ODYv
aW5jbHVkZS9hc20vYml0b3BzLmg6MTYsDQogICAgICAgICAgICAgICAgIGZyb20gaW5jbHVkZS9s
aW51eC9iaXRvcHMuaDozNiwNCiAgICAgICAgICAgICAgICAgZnJvbSBpbmNsdWRlL2xpbnV4L2tl
cm5lbC5oOjEwLA0KICAgICAgICAgICAgICAgICBmcm9tIGluY2x1ZGUvbGludXgvc2tidWZmLmg6
MTcsDQogICAgICAgICAgICAgICAgIGZyb20gaW5jbHVkZS9saW51eC9pcC5oOjIwLA0KICAgICAg
ICAgICAgICAgICBmcm9tIGluY2x1ZGUvbGludXgvaWZfdHVubmVsLmg6NCwNCiAgICAgICAgICAg
ICAgICAgZnJvbSBpbmNsdWRlL25ldC9pcF90dW5uZWxzLmg6NCwNCiAgICAgICAgICAgICAgICAg
ZnJvbSAvb3B0L3NjcmlwdHMvV2lyZUd1YXJkLTAuMC4yMDE3MDQyMS9zcmMvY29tcGF0L2NvbXBh
dC5oOjYyLA0KICAgICAgICAgICAgICAgICBmcm9tIDxjb21tYW5kLWxpbmU+OjA6DQovb3B0L3Nj
cmlwdHMvV2lyZUd1YXJkLTAuMC4yMDE3MDQyMS9zcmMvY29tcGF0L2NvbXBhdC5oOjI3OjIxOiBl
cnJvcjogZHVwbGljYXRlIG1lbWJlciAnZGF0YScNCiAjZGVmaW5lIGhlYWRlcnNfZW5kIGRhdGEN
CiAgICAgICAgICAgICAgICAgICAgIF4NCmluY2x1ZGUvbGludXgvcmhfa2FiaS5oOjg4OjQxOiBu
b3RlOiBpbiBkZWZpbml0aW9uIG9mIG1hY3JvICdSSF9LQUJJX0VYVEVORCcNCiAjIGRlZmluZSBS
SF9LQUJJX0VYVEVORChfbmV3KSAgICAgICAgICAgX25ldzsNCiAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgXg0KaW5jbHVkZS9saW51eC9za2J1ZmYuaDo3MTg6MjM6IG5v
dGU6IGluIGV4cGFuc2lvbiBvZiBtYWNybyAnaGVhZGVyc19lbmQnDQogIFJIX0tBQklfRVhURU5E
KF9fdTMyIGhlYWRlcnNfZW5kWzBdKQ0KICAgICAgICAgICAgICAgICAgICAgICBeDQpJbiBmaWxl
IGluY2x1ZGVkIGZyb20gaW5jbHVkZS9saW51eC9pcC5oOjIwOjAsDQogICAgICAgICAgICAgICAg
IGZyb20gaW5jbHVkZS9saW51eC9pZl90dW5uZWwuaDo0LA0KICAgICAgICAgICAgICAgICBmcm9t
IGluY2x1ZGUvbmV0L2lwX3R1bm5lbHMuaDo0LA0KICAgICAgICAgICAgICAgICBmcm9tIC9vcHQv
c2NyaXB0cy9XaXJlR3VhcmQtMC4wLjIwMTcwNDIxL3NyYy9jb21wYXQvY29tcGF0Lmg6NjIsDQog
ICAgICAgICAgICAgICAgIGZyb20gPGNvbW1hbmQtbGluZT46MDoNCmluY2x1ZGUvbGludXgvc2ti
dWZmLmg6NzM4OjY6IGVycm9yOiBkdXBsaWNhdGUgbWVtYmVyICdkYXRhJw0KICAgICAqZGF0YTsN
CiAgICAgIF4NCmluY2x1ZGUvbGludXgvc2tidWZmLmg6IEluIGZ1bmN0aW9uICdza2JfcmVzZXRf
dGFpbF9wb2ludGVyJzoNCmluY2x1ZGUvbGludXgvc2tidWZmLmg6MTY4NDoyNDogZXJyb3I6IGlu
dmFsaWQgb3BlcmFuZHMgdG8gYmluYXJ5IC0gKGhhdmUgJ19fdTMyIConIGFuZCAndW5zaWduZWQg
Y2hhciAnKQ0KICBza2ItPnRhaWwgPSBza2ItPmRhdGEgLSBza2ItPmhlYWQ7DQogICAgICAgICAg
ICAgICAgICAgICAgICBeDQppbmNsdWRlL2xpbnV4L3NrYnVmZi5oOiBJbiBmdW5jdGlvbiAnX19z
a2JfcHVzaCc6DQppbmNsdWRlL2xpbnV4L3NrYnVmZi5oOjE3Mjc6MTI6IGVycm9yOiBpbnZhbGlk
IG9wZXJhbmRzIHRvIGJpbmFyeSAtIChoYXZlICdfX3UzMltdJyBhbmQgJ3Vuc2lnbmVkIGludCcp
DQogIHNrYi0+ZGF0YSAtPSBsZW47DQogICAgICAgICAgICBeDQppbmNsdWRlL2xpbnV4L3NrYnVm
Zi5oOjE3Mjk6Mjogd2FybmluZzogcmV0dXJuIGZyb20gaW5jb21wYXRpYmxlIHBvaW50ZXIgdHlw
ZSBbZW5hYmxlZCBieSBkZWZhdWx0XQ0KICByZXR1cm4gc2tiLT5kYXRhOw0KICBeDQppbmNsdWRl
L2xpbnV4L3NrYnVmZi5oOiBJbiBmdW5jdGlvbiAnX19za2JfcHVsbCc6DQppbmNsdWRlL2xpbnV4
L3NrYnVmZi5oOjE3Mzc6MTk6IGVycm9yOiBpbnZhbGlkIG9wZXJhbmRzIHRvIGJpbmFyeSArICho
YXZlICdfX3UzMltdJyBhbmQgJ3Vuc2lnbmVkIGludCcpDQogIHJldHVybiBza2ItPmRhdGEgKz0g
bGVuOw0KICAgICAgICAgICAgICAgICAgIF4NCmluY2x1ZGUvbGludXgvc2tidWZmLmg6IEluIGZ1
bmN0aW9uICdfX3Bza2JfcHVsbCc6DQppbmNsdWRlL2xpbnV4L3NrYnVmZi5oOjE3NTM6MTk6IGVy
cm9yOiBpbnZhbGlkIG9wZXJhbmRzIHRvIGJpbmFyeSArIChoYXZlICdfX3UzMltdJyBhbmQgJ3Vu
c2lnbmVkIGludCcpDQogIHJldHVybiBza2ItPmRhdGEgKz0gbGVuOw0KICAgICAgICAgICAgICAg
ICAgIF4NCmluY2x1ZGUvbGludXgvc2tidWZmLmg6IEluIGZ1bmN0aW9uICdza2JfaGVhZHJvb20n
Og0KaW5jbHVkZS9saW51eC9za2J1ZmYuaDoxNzc4OjE5OiBlcnJvcjogaW52YWxpZCBvcGVyYW5k
cyB0byBiaW5hcnkgLSAoaGF2ZSAnY29uc3QgX191MzIgKicgYW5kICd1bnNpZ25lZCBjaGFyICog
Y29uc3QnKQ0KICByZXR1cm4gc2tiLT5kYXRhIC0gc2tiLT5oZWFkOw0KICAgICAgICAgICAgICAg
ICAgIF4NCmluY2x1ZGUvbGludXgvc2tidWZmLmg6IEluIGZ1bmN0aW9uICdza2JfcmVzZXJ2ZSc6
DQppbmNsdWRlL2xpbnV4L3NrYnVmZi5oOjE4MTc6MTI6IGVycm9yOiBpbnZhbGlkIG9wZXJhbmRz
IHRvIGJpbmFyeSArIChoYXZlICdfX3UzMltdJyBhbmQgJ2ludCcpDQogIHNrYi0+ZGF0YSArPSBs
ZW47DQogICAgICAgICAgICBeDQppbmNsdWRlL2xpbnV4L3NrYnVmZi5oOiBJbiBmdW5jdGlvbiAn
c2tiX2lubmVyX3RyYW5zcG9ydF9vZmZzZXQnOg0KaW5jbHVkZS9saW51eC9za2J1ZmYuaDoxODU4
OjQxOiBlcnJvcjogaW52YWxpZCBvcGVyYW5kcyB0byBiaW5hcnkgLSAoaGF2ZSAndW5zaWduZWQg
Y2hhciAqJyBhbmQgJ2NvbnN0IF9fdTMyIConKQ0KICByZXR1cm4gc2tiX2lubmVyX3RyYW5zcG9y
dF9oZWFkZXIoc2tiKSAtIHNrYi0+ZGF0YTsNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgXg0KaW5jbHVkZS9saW51eC9za2J1ZmYuaDogSW4gZnVuY3Rpb24gJ3NrYl9y
ZXNldF9pbm5lcl90cmFuc3BvcnRfaGVhZGVyJzoNCmluY2x1ZGUvbGludXgvc2tidWZmLmg6MTg2
Mzo0MjogZXJyb3I6IGludmFsaWQgb3BlcmFuZHMgdG8gYmluYXJ5IC0gKGhhdmUgJ19fdTMyICon
IGFuZCAndW5zaWduZWQgY2hhciAnKQ0KICBza2ItPmlubmVyX3RyYW5zcG9ydF9oZWFkZXIgPSBz
a2ItPmRhdGEgLSBza2ItPmhlYWQ7DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICBeDQppbmNsdWRlL2xpbnV4L3NrYnVmZi5oOiBJbiBmdW5jdGlvbiAnc2tiX3Jlc2V0
X2lubmVyX25ldHdvcmtfaGVhZGVyJzoNCmluY2x1ZGUvbGludXgvc2tidWZmLmg6MTg4MDo0MDog
ZXJyb3I6IGludmFsaWQgb3BlcmFuZHMgdG8gYmluYXJ5IC0gKGhhdmUgJ19fdTMyIConIGFuZCAn
dW5zaWduZWQgY2hhciAnKQ0KICBza2ItPmlubmVyX25ldHdvcmtfaGVhZGVyID0gc2tiLT5kYXRh
IC0gc2tiLT5oZWFkOw0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4N
CmluY2x1ZGUvbGludXgvc2tidWZmLmg6IEluIGZ1bmN0aW9uICdza2JfcmVzZXRfaW5uZXJfbWFj
X2hlYWRlcic6DQppbmNsdWRlL2xpbnV4L3NrYnVmZi5oOjE4OTc6MzY6IGVycm9yOiBpbnZhbGlk
IG9wZXJhbmRzIHRvIGJpbmFyeSAtIChoYXZlICdfX3UzMiAqJyBhbmQgJ3Vuc2lnbmVkIGNoYXIg
JykNCiAgc2tiLT5pbm5lcl9tYWNfaGVhZGVyID0gc2tiLT5kYXRhIC0gc2tiLT5oZWFkOw0KICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXg0KaW5jbHVkZS9saW51eC9za2J1ZmYu
aDogSW4gZnVuY3Rpb24gJ3NrYl9yZXNldF90cmFuc3BvcnRfaGVhZGVyJzoNCmluY2x1ZGUvbGlu
dXgvc2tidWZmLmg6MTkxODozNjogZXJyb3I6IGludmFsaWQgb3BlcmFuZHMgdG8gYmluYXJ5IC0g
KGhhdmUgJ19fdTMyIConIGFuZCAndW5zaWduZWQgY2hhciAnKQ0KICBza2ItPnRyYW5zcG9ydF9o
ZWFkZXIgPSBza2ItPmRhdGEgLSBza2ItPmhlYWQ7DQogICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBeDQppbmNsdWRlL2xpbnV4L3NrYnVmZi5oOiBJbiBmdW5jdGlvbiAnc2tiX3Jl
c2V0X25ldHdvcmtfaGVhZGVyJzoNCmluY2x1ZGUvbGludXgvc2tidWZmLmg6MTkzNTozNDogZXJy
b3I6IGludmFsaWQgb3BlcmFuZHMgdG8gYmluYXJ5IC0gKGhhdmUgJ19fdTMyIConIGFuZCAndW5z
aWduZWQgY2hhciAnKQ0KICBza2ItPm5ldHdvcmtfaGVhZGVyID0gc2tiLT5kYXRhIC0gc2tiLT5o
ZWFkOw0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4NCmluY2x1ZGUvbGludXgv
c2tidWZmLmg6IEluIGZ1bmN0aW9uICdza2JfcmVzZXRfbWFjX2hlYWRlcic6DQppbmNsdWRlL2xp
bnV4L3NrYnVmZi5oOjE5NTY6MzA6IGVycm9yOiBpbnZhbGlkIG9wZXJhbmRzIHRvIGJpbmFyeSAt
IChoYXZlICdfX3UzMiAqJyBhbmQgJ3Vuc2lnbmVkIGNoYXIgJykNCiAgc2tiLT5tYWNfaGVhZGVy
ID0gc2tiLT5kYXRhIC0gc2tiLT5oZWFkOw0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Xg0KaW5jbHVkZS9saW51eC9za2J1ZmYuaDogSW4gZnVuY3Rpb24gJ3NrYl90cmFuc3BvcnRfb2Zm
c2V0JzoNCmluY2x1ZGUvbGludXgvc2tidWZmLmg6MjAwMDozNTogZXJyb3I6IGludmFsaWQgb3Bl
cmFuZHMgdG8gYmluYXJ5IC0gKGhhdmUgJ3Vuc2lnbmVkIGNoYXIgKicgYW5kICdjb25zdCBfX3Uz
MiAqJykNCiAgcmV0dXJuIHNrYl90cmFuc3BvcnRfaGVhZGVyKHNrYikgLSBza2ItPmRhdGE7DQog
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4NCmluY2x1ZGUvbGludXgvc2tidWZm
Lmg6IEluIGZ1bmN0aW9uICdza2JfbmV0d29ya19vZmZzZXQnOg0KaW5jbHVkZS9saW51eC9za2J1
ZmYuaDoyMDE1OjMzOiBlcnJvcjogaW52YWxpZCBvcGVyYW5kcyB0byBiaW5hcnkgLSAoaGF2ZSAn
dW5zaWduZWQgY2hhciAqJyBhbmQgJ2NvbnN0IF9fdTMyIConKQ0KICByZXR1cm4gc2tiX25ldHdv
cmtfaGVhZGVyKHNrYikgLSBza2ItPmRhdGE7DQogICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICBeDQppbmNsdWRlL2xpbnV4L3NrYnVmZi5oOiBJbiBmdW5jdGlvbiAnc2tiX2lubmVyX25l
dHdvcmtfb2Zmc2V0JzoNCmluY2x1ZGUvbGludXgvc2tidWZmLmg6MjAyMDozOTogZXJyb3I6IGlu
dmFsaWQgb3BlcmFuZHMgdG8gYmluYXJ5IC0gKGhhdmUgJ3Vuc2lnbmVkIGNoYXIgKicgYW5kICdj
b25zdCBfX3UzMiAqJykNCiAgcmV0dXJuIHNrYl9pbm5lcl9uZXR3b3JrX2hlYWRlcihza2IpIC0g
c2tiLT5kYXRhOw0KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgXg0KaW5j
bHVkZS9saW51eC9za2J1ZmYuaDogSW4gZnVuY3Rpb24gJ3NrYl9oZWFkZXJfcG9pbnRlcic6DQpp
bmNsdWRlL2xpbnV4L3NrYnVmZi5oOjI4NDU6OTogd2FybmluZzogcGFzc2luZyBhcmd1bWVudCA0
IG9mICdfX3NrYl9oZWFkZXJfcG9pbnRlcicgZGlzY2FyZHMgJ2NvbnN0JyBxdWFsaWZpZXIgZnJv
bSBwb2ludGVyIHRhcmdldCB0eXBlIFtlbmFibGVkIGJ5IGRlZmF1bHRdDQogICAgICAgICBza2Jf
aGVhZGxlbihza2IpLCBidWZmZXIpOw0KICAgICAgICAgXg0KaW5jbHVkZS9saW51eC9za2J1ZmYu
aDoyODI4OjIxOiBub3RlOiBleHBlY3RlZCAndm9pZCAqJyBidXQgYXJndW1lbnQgaXMgb2YgdHlw
ZSAnY29uc3QgX191MzIgKicNCiBzdGF0aWMgaW5saW5lIHZvaWQgKl9fc2tiX2hlYWRlcl9wb2lu
dGVyKGNvbnN0IHN0cnVjdCBza19idWZmICpza2IsIGludCBvZmZzZXQsDQogICAgICAgICAgICAg
ICAgICAgICBeDQpJbiBmaWxlIGluY2x1ZGVkIGZyb20gaW5jbHVkZS9uZXQvaXBfdHVubmVscy5o
OjU6MCwNCiAgICAgICAgICAgICAgICAgZnJvbSAvb3B0L3NjcmlwdHMvV2lyZUd1YXJkLTAuMC4y
MDE3MDQyMS9zcmMvY29tcGF0L2NvbXBhdC5oOjYyLA0KICAgICAgICAgICAgICAgICBmcm9tIDxj
b21tYW5kLWxpbmU+OjA6DQppbmNsdWRlL2xpbnV4L25ldGRldmljZS5oOiBBdCB0b3AgbGV2ZWw6
DQppbmNsdWRlL2xpbnV4L25ldGRldmljZS5oOjIzNjU6NDM6IGVycm9yOiBtYWNybyAiZGV2X3Jl
Y3Vyc2lvbl9sZXZlbCIgcGFzc2VkIDEgYXJndW1lbnRzLCBidXQgdGFrZXMganVzdCAwDQogc3Rh
dGljIGlubGluZSBpbnQgZGV2X3JlY3Vyc2lvbl9sZXZlbCh2b2lkKQ0KICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIF4NCmluY2x1ZGUvbGludXgvbmV0ZGV2aWNlLmg6
MjM2NjoxOiBlcnJvcjogZXhwZWN0ZWQgJz0nLCAnLCcsICc7JywgJ2FzbScgb3IgJ19fYXR0cmli
dXRlX18nIGJlZm9yZSAneycgdG9rZW4NCiB7DQogXg0KSW4gZmlsZSBpbmNsdWRlZCBmcm9tIGlu
Y2x1ZGUvbmV0L3J0bmV0bGluay5oOjU6MCwNCiAgICAgICAgICAgICAgICAgZnJvbSBpbmNsdWRl
L25ldC9uZWlnaGJvdXIuaDoyOSwNCiAgICAgICAgICAgICAgICAgZnJvbSBpbmNsdWRlL25ldC9k
c3QuaDoxNywNCiAgICAgICAgICAgICAgICAgZnJvbSBpbmNsdWRlL25ldC9zb2NrLmg6NzIsDQog
ICAgICAgICAgICAgICAgIGZyb20gaW5jbHVkZS9saW51eC90Y3AuaDoyMywNCiAgICAgICAgICAg
ICAgICAgZnJvbSBpbmNsdWRlL2xpbnV4L2lwdjYuaDo2MCwNCiAgICAgICAgICAgICAgICAgZnJv
bSBpbmNsdWRlL25ldC9kc2ZpZWxkLmg6MTEsDQogICAgICAgICAgICAgICAgIGZyb20gaW5jbHVk
ZS9uZXQvaXBfdHVubmVscy5oOjEwLA0KICAgICAgICAgICAgICAgICBmcm9tIC9vcHQvc2NyaXB0
cy9XaXJlR3VhcmQtMC4wLjIwMTcwNDIxL3NyYy9jb21wYXQvY29tcGF0Lmg6NjIsDQogICAgICAg
ICAgICAgICAgIGZyb20gPGNvbW1hbmQtbGluZT46MDoNCmluY2x1ZGUvbmV0L25ldGxpbmsuaDog
SW4gZnVuY3Rpb24gJ25sbXNnX3RyaW0nOg0KaW5jbHVkZS9uZXQvbmV0bGluay5oOjUzNjo0MDog
ZXJyb3I6IGludmFsaWQgb3BlcmFuZHMgdG8gYmluYXJ5IC0gKGhhdmUgJ3Vuc2lnbmVkIGNoYXIg
KicgYW5kICdfX3UzMiAqJykNCiAgIHNrYl90cmltKHNrYiwgKHVuc2lnbmVkIGNoYXIgKikgbWFy
ayAtIHNrYi0+ZGF0YSk7DQogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
Xg0KSW4gZmlsZSBpbmNsdWRlZCBmcm9tIDxjb21tYW5kLWxpbmU+OjA6MDoNCi9vcHQvc2NyaXB0
cy9XaXJlR3VhcmQtMC4wLjIwMTcwNDIxL3NyYy9jb21wYXQvY29tcGF0Lmg6IEF0IHRvcCBsZXZl
bDoNCi9vcHQvc2NyaXB0cy9XaXJlR3VhcmQtMC4wLjIwMTcwNDIxL3NyYy9jb21wYXQvY29tcGF0
Lmg6ODI6MTogd2FybmluZzogaW5pdGlhbGl6YXRpb24gZnJvbSBpbmNvbXBhdGlibGUgcG9pbnRl
ciB0eXBlIFtlbmFibGVkIGJ5IGRlZmF1bHRdDQogfTsNCiBeDQovb3B0L3NjcmlwdHMvV2lyZUd1
YXJkLTAuMC4yMDE3MDQyMS9zcmMvY29tcGF0L2NvbXBhdC5oOjgyOjE6IHdhcm5pbmc6IChuZWFy
IGluaXRpYWxpemF0aW9uIGZvciAnaXB2Nl9zdHViX2ltcGwuaXB2Nl9kc3RfbG9va3VwJykgW2Vu
YWJsZWQgYnkgZGVmYXVsdF0NCkluIGZpbGUgaW5jbHVkZWQgZnJvbSAvb3B0L3NjcmlwdHMvV2ly
ZUd1YXJkLTAuMC4yMDE3MDQyMS9zcmMvY29tcGF0L2NvbXBhdC5oOjg4OjAsDQogICAgICAgICAg
ICAgICAgIGZyb20gPGNvbW1hbmQtbGluZT46MDoNCmluY2x1ZGUvbmV0L2FkZHJjb25mLmg6MTk2
OjMyOiBlcnJvcjogY29uZmxpY3RpbmcgdHlwZXMgZm9yICdpcHY2X3N0dWInDQogZXh0ZXJuIGNv
bnN0IHN0cnVjdCBpcHY2X3N0dWIgKmlwdjZfc3R1YiBfX3JlYWRfbW9zdGx5Ow0KICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBeDQpJbiBmaWxlIGluY2x1ZGVkIGZyb20gPGNvbW1hbmQt
bGluZT46MDowOg0KL29wdC9zY3JpcHRzL1dpcmVHdWFyZC0wLjAuMjAxNzA0MjEvc3JjL2NvbXBh
dC9jb21wYXQuaDo4MzozNzogbm90ZTogcHJldmlvdXMgZGVmaW5pdGlvbiBvZiAnaXB2Nl9zdHVi
JyB3YXMgaGVyZQ0KIHN0YXRpYyBjb25zdCBzdHJ1Y3QgaXB2Nl9zdHViX3R5cGUgKmlwdjZfc3R1
YiA9ICZpcHY2X3N0dWJfaW1wbDsNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICBeDQpJbiBmaWxlIGluY2x1ZGVkIGZyb20gPGNvbW1hbmQtbGluZT46MDowOg0KL29wdC9zY3Jp
cHRzL1dpcmVHdWFyZC0wLjAuMjAxNzA0MjEvc3JjL2NvbXBhdC9jb21wYXQuaDoxMjU6MjA6IGVy
cm9yOiByZWRlZmluaXRpb24gb2YgJ25ldGlmX2tlZXBfZHN0Jw0KIHN0YXRpYyBpbmxpbmUgdm9p
ZCBuZXRpZl9rZWVwX2RzdChzdHJ1Y3QgbmV0X2RldmljZSAqZGV2KQ0KICAgICAgICAgICAgICAg
ICAgICBeDQpJbiBmaWxlIGluY2x1ZGVkIGZyb20gaW5jbHVkZS9uZXQvaXBfdHVubmVscy5oOjU6
MCwNCiAgICAgICAgICAgICAgICAgZnJvbSAvb3B0L3NjcmlwdHMvV2lyZUd1YXJkLTAuMC4yMDE3
MDQyMS9zcmMvY29tcGF0L2NvbXBhdC5oOjYyLA0KICAgICAgICAgICAgICAgICBmcm9tIDxjb21t
YW5kLWxpbmU+OjA6DQppbmNsdWRlL2xpbnV4L25ldGRldmljZS5oOjM5ODE6MjA6IG5vdGU6IHBy
ZXZpb3VzIGRlZmluaXRpb24gb2YgJ25ldGlmX2tlZXBfZHN0JyB3YXMgaGVyZQ0KIHN0YXRpYyBp
bmxpbmUgdm9pZCBuZXRpZl9rZWVwX2RzdChzdHJ1Y3QgbmV0X2RldmljZSAqZGV2KQ0KICAgICAg
ICAgICAgICAgICAgICBeDQpJbiBmaWxlIGluY2x1ZGVkIGZyb20gPGNvbW1hbmQtbGluZT46MDow
Og0KL29wdC9zY3JpcHRzL1dpcmVHdWFyZC0wLjAuMjAxNzA0MjEvc3JjL2NvbXBhdC9jb21wYXQu
aDoxMzM6MDogd2FybmluZzogIm5ldGRldl9hbGxvY19wY3B1X3N0YXRzIiByZWRlZmluZWQgW2Vu
YWJsZWQgYnkgZGVmYXVsdF0NCiAjZGVmaW5lIG5ldGRldl9hbGxvY19wY3B1X3N0YXRzIGFsbG9j
X3BlcmNwdQ0KIF4NCkluIGZpbGUgaW5jbHVkZWQgZnJvbSBpbmNsdWRlL25ldC9pcF90dW5uZWxz
Lmg6NTowLA0KICAgICAgICAgICAgICAgICBmcm9tIC9vcHQvc2NyaXB0cy9XaXJlR3VhcmQtMC4w
LjIwMTcwNDIxL3NyYy9jb21wYXQvY29tcGF0Lmg6NjIsDQogICAgICAgICAgICAgICAgIGZyb20g
PGNvbW1hbmQtbGluZT46MDoNCmluY2x1ZGUvbGludXgvbmV0ZGV2aWNlLmg6MjE4MjowOiBub3Rl
OiB0aGlzIGlzIHRoZSBsb2NhdGlvbiBvZiB0aGUgcHJldmlvdXMgZGVmaW5pdGlvbg0KICNkZWZp
bmUgbmV0ZGV2X2FsbG9jX3BjcHVfc3RhdHModHlwZSkgICAgIFwNCiBeDQpJbiBmaWxlIGluY2x1
ZGVkIGZyb20gPGNvbW1hbmQtbGluZT46MDowOg0KL29wdC9zY3JpcHRzL1dpcmVHdWFyZC0wLjAu
MjAxNzA0MjEvc3JjL2NvbXBhdC9jb21wYXQuaDoxNjU6MjA6IGVycm9yOiBzdGF0aWMgZGVjbGFy
YXRpb24gb2YgJ3NrYl9zY3J1Yl9wYWNrZXQnIGZvbGxvd3Mgbm9uLXN0YXRpYyBkZWNsYXJhdGlv
bg0KIHN0YXRpYyBpbmxpbmUgdm9pZCBza2Jfc2NydWJfcGFja2V0KHN0cnVjdCBza19idWZmICpz
a2IsIGJvb2wgeG5ldCkNCiAgICAgICAgICAgICAgICAgICAgXg0KSW4gZmlsZSBpbmNsdWRlZCBm
cm9tIGluY2x1ZGUvbGludXgvaXAuaDoyMDowLA0KICAgICAgICAgICAgICAgICBmcm9tIGluY2x1
ZGUvbGludXgvaWZfdHVubmVsLmg6NCwNCiAgICAgICAgICAgICAgICAgZnJvbSBpbmNsdWRlL25l
dC9pcF90dW5uZWxzLmg6NCwNCiAgICAgICAgICAgICAgICAgZnJvbSAvb3B0L3NjcmlwdHMvV2ly
ZUd1YXJkLTAuMC4yMDE3MDQyMS9zcmMvY29tcGF0L2NvbXBhdC5oOjYyLA0KICAgICAgICAgICAg
ICAgICBmcm9tIDxjb21tYW5kLWxpbmU+OjA6DQppbmNsdWRlL2xpbnV4L3NrYnVmZi5oOjI4MDk6
Njogbm90ZTogcHJldmlvdXMgZGVjbGFyYXRpb24gb2YgJ3NrYl9zY3J1Yl9wYWNrZXQnIHdhcyBo
ZXJlDQogdm9pZCBza2Jfc2NydWJfcGFja2V0KHN0cnVjdCBza19idWZmICpza2IsIGJvb2wgeG5l
dCk7DQogICAgICBeDQpJbiBmaWxlIGluY2x1ZGVkIGZyb20gPGNvbW1hbmQtbGluZT46MDowOg0K
L29wdC9zY3JpcHRzL1dpcmVHdWFyZC0wLjAuMjAxNzA0MjEvc3JjL2NvbXBhdC9jb21wYXQuaDox
ODM6MTk6IGVycm9yOiByZWRlZmluaXRpb24gb2YgJ3ByYW5kb21fdTMyX21heCcNCiBzdGF0aWMg
aW5saW5lIHUzMiBwcmFuZG9tX3UzMl9tYXgodTMyIGVwX3JvKQ0KICAgICAgICAgICAgICAgICAg
IF4NCkluIGZpbGUgaW5jbHVkZWQgZnJvbSBpbmNsdWRlL2xpbnV4L25ldC5oOjIyOjAsDQogICAg
ICAgICAgICAgICAgIGZyb20gaW5jbHVkZS9saW51eC9za2J1ZmYuaDoyNywNCiAgICAgICAgICAg
ICAgICAgZnJvbSBpbmNsdWRlL2xpbnV4L2lwLmg6MjAsDQogICAgICAgICAgICAgICAgIGZyb20g
aW5jbHVkZS9saW51eC9pZl90dW5uZWwuaDo0LA0KICAgICAgICAgICAgICAgICBmcm9tIGluY2x1
ZGUvbmV0L2lwX3R1bm5lbHMuaDo0LA0KICAgICAgICAgICAgICAgICBmcm9tIC9vcHQvc2NyaXB0
cy9XaXJlR3VhcmQtMC4wLjIwMTcwNDIxL3NyYy9jb21wYXQvY29tcGF0Lmg6NjIsDQogICAgICAg
ICAgICAgICAgIGZyb20gPGNvbW1hbmQtbGluZT46MDoNCmluY2x1ZGUvbGludXgvcmFuZG9tLmg6
NTI6MTk6IG5vdGU6IHByZXZpb3VzIGRlZmluaXRpb24gb2YgJ3ByYW5kb21fdTMyX21heCcgd2Fz
IGhlcmUNCiBzdGF0aWMgaW5saW5lIHUzMiBwcmFuZG9tX3UzMl9tYXgodTMyIGVwX3JvKQ0KICAg
ICAgICAgICAgICAgICAgIF4NCkluIGZpbGUgaW5jbHVkZWQgZnJvbSA8Y29tbWFuZC1saW5lPjow
OjA6DQovb3B0L3NjcmlwdHMvV2lyZUd1YXJkLTAuMC4yMDE3MDQyMS9zcmMvY29tcGF0L2NvbXBh
dC5oOjIwNTowOiB3YXJuaW5nOiAiUzhfTUFYIiByZWRlZmluZWQgW2VuYWJsZWQgYnkgZGVmYXVs
dF0NCiAjZGVmaW5lIFM4X01BWCAoKHM4KShVOF9NQVggPj4gMSkpDQogXg0KSW4gZmlsZSBpbmNs
dWRlZCBmcm9tIGluY2x1ZGUvbGludXgvc2tidWZmLmg6MTc6MCwNCiAgICAgICAgICAgICAgICAg
ZnJvbSBpbmNsdWRlL2xpbnV4L2lwLmg6MjAsDQogICAgICAgICAgICAgICAgIGZyb20gaW5jbHVk
ZS9saW51eC9pZl90dW5uZWwuaDo0LA0KICAgICAgICAgICAgICAgICBmcm9tIGluY2x1ZGUvbmV0
L2lwX3R1bm5lbHMuaDo0LA0KICAgICAgICAgICAgICAgICBmcm9tIC9vcHQvc2NyaXB0cy9XaXJl
R3VhcmQtMC4wLjIwMTcwNDIxL3NyYy9jb21wYXQvY29tcGF0Lmg6NjIsDQogICAgICAgICAgICAg
ICAgIGZyb20gPGNvbW1hbmQtbGluZT46MDoNCmluY2x1ZGUvbGludXgva2VybmVsLmg6MzM6MDog
bm90ZTogdGhpcyBpcyB0aGUgbG9jYXRpb24gb2YgdGhlIHByZXZpb3VzIGRlZmluaXRpb24NCiAj
ZGVmaW5lIFM4X01BWCAgKChzOCkoVThfTUFYPj4xKSkNCiBeDQpJbiBmaWxlIGluY2x1ZGVkIGZy
b20gPGNvbW1hbmQtbGluZT46MDowOg0KL29wdC9zY3JpcHRzL1dpcmVHdWFyZC0wLjAuMjAxNzA0
MjEvc3JjL2NvbXBhdC9jb21wYXQuaDoyMDg6MDogd2FybmluZzogIlMxNl9NQVgiIHJlZGVmaW5l
ZCBbZW5hYmxlZCBieSBkZWZhdWx0XQ0KICNkZWZpbmUgUzE2X01BWCAoKHMxNikoVTE2X01BWCA+
PiAxKSkNCiBeDQpJbiBmaWxlIGluY2x1ZGVkIGZyb20gaW5jbHVkZS9saW51eC9za2J1ZmYuaDox
NzowLA0KICAgICAgICAgICAgICAgICBmcm9tIGluY2x1ZGUvbGludXgvaXAuaDoyMCwNCiAgICAg
ICAgICAgICAgICAgZnJvbSBpbmNsdWRlL2xpbnV4L2lmX3R1bm5lbC5oOjQsDQogICAgICAgICAg
ICAgICAgIGZyb20gaW5jbHVkZS9uZXQvaXBfdHVubmVscy5oOjQsDQogICAgICAgICAgICAgICAg
IGZyb20gL29wdC9zY3JpcHRzL1dpcmVHdWFyZC0wLjAuMjAxNzA0MjEvc3JjL2NvbXBhdC9jb21w
YXQuaDo2MiwNCiAgICAgICAgICAgICAgICAgZnJvbSA8Y29tbWFuZC1saW5lPjowOg0KaW5jbHVk
ZS9saW51eC9rZXJuZWwuaDozNjowOiBub3RlOiB0aGlzIGlzIHRoZSBsb2NhdGlvbiBvZiB0aGUg
cHJldmlvdXMgZGVmaW5pdGlvbg0KICNkZWZpbmUgUzE2X01BWCAgKChzMTYpKFUxNl9NQVg+PjEp
KQ0KIF4NCkluIGZpbGUgaW5jbHVkZWQgZnJvbSA8Y29tbWFuZC1saW5lPjowOjA6DQovb3B0L3Nj
cmlwdHMvV2lyZUd1YXJkLTAuMC4yMDE3MDQyMS9zcmMvY29tcGF0L2NvbXBhdC5oOjIxMTowOiB3
YXJuaW5nOiAiUzMyX01BWCIgcmVkZWZpbmVkIFtlbmFibGVkIGJ5IGRlZmF1bHRdDQogI2RlZmlu
ZSBTMzJfTUFYICgoczMyKShVMzJfTUFYID4+IDEpKQ0KIF4NCkluIGZpbGUgaW5jbHVkZWQgZnJv
bSBpbmNsdWRlL2xpbnV4L3NrYnVmZi5oOjE3OjAsDQogICAgICAgICAgICAgICAgIGZyb20gaW5j
bHVkZS9saW51eC9pcC5oOjIwLA0KICAgICAgICAgICAgICAgICBmcm9tIGluY2x1ZGUvbGludXgv
aWZfdHVubmVsLmg6NCwNCiAgICAgICAgICAgICAgICAgZnJvbSBpbmNsdWRlL25ldC9pcF90dW5u
ZWxzLmg6NCwNCiAgICAgICAgICAgICAgICAgZnJvbSAvb3B0L3NjcmlwdHMvV2lyZUd1YXJkLTAu
MC4yMDE3MDQyMS9zcmMvY29tcGF0L2NvbXBhdC5oOjYyLA0KICAgICAgICAgICAgICAgICBmcm9t
IDxjb21tYW5kLWxpbmU+OjA6DQppbmNsdWRlL2xpbnV4L2tlcm5lbC5oOjM5OjA6IG5vdGU6IHRo
aXMgaXMgdGhlIGxvY2F0aW9uIG9mIHRoZSBwcmV2aW91cyBkZWZpbml0aW9uDQogI2RlZmluZSBT
MzJfTUFYICAoKHMzMikoVTMyX01BWD4+MSkpDQogXg0KSW4gZmlsZSBpbmNsdWRlZCBmcm9tIDxj
b21tYW5kLWxpbmU+OjA6MDoNCi9vcHQvc2NyaXB0cy9XaXJlR3VhcmQtMC4wLjIwMTcwNDIxL3Ny
Yy9jb21wYXQvY29tcGF0Lmg6MjE0OjA6IHdhcm5pbmc6ICJTNjRfTUFYIiByZWRlZmluZWQgW2Vu
YWJsZWQgYnkgZGVmYXVsdF0NCiAjZGVmaW5lIFM2NF9NQVggKChzNjQpKFU2NF9NQVggPj4gMSkp
DQogXg0KSW4gZmlsZSBpbmNsdWRlZCBmcm9tIGluY2x1ZGUvbGludXgvc2tidWZmLmg6MTc6MCwN
CiAgICAgICAgICAgICAgICAgZnJvbSBpbmNsdWRlL2xpbnV4L2lwLmg6MjAsDQogICAgICAgICAg
ICAgICAgIGZyb20gaW5jbHVkZS9saW51eC9pZl90dW5uZWwuaDo0LA0KICAgICAgICAgICAgICAg
ICBmcm9tIGluY2x1ZGUvbmV0L2lwX3R1bm5lbHMuaDo0LA0KICAgICAgICAgICAgICAgICBmcm9t
IC9vcHQvc2NyaXB0cy9XaXJlR3VhcmQtMC4wLjIwMTcwNDIxL3NyYy9jb21wYXQvY29tcGF0Lmg6
NjIsDQogICAgICAgICAgICAgICAgIGZyb20gPGNvbW1hbmQtbGluZT46MDoNCmluY2x1ZGUvbGlu
dXgva2VybmVsLmg6NDI6MDogbm90ZTogdGhpcyBpcyB0aGUgbG9jYXRpb24gb2YgdGhlIHByZXZp
b3VzIGRlZmluaXRpb24NCiAjZGVmaW5lIFM2NF9NQVggICgoczY0KShVNjRfTUFYPj4xKSkNCiBe
DQpJbiBmaWxlIGluY2x1ZGVkIGZyb20gPGNvbW1hbmQtbGluZT46MDowOg0KL29wdC9zY3JpcHRz
L1dpcmVHdWFyZC0wLjAuMjAxNzA0MjEvc3JjL2NvbXBhdC9jb21wYXQuaDoyMjE6MjA6IGVycm9y
OiBzdGF0aWMgZGVjbGFyYXRpb24gb2YgJ21lbXplcm9fZXhwbGljaXQnIGZvbGxvd3Mgbm9uLXN0
YXRpYyBkZWNsYXJhdGlvbg0KIHN0YXRpYyBpbmxpbmUgdm9pZCBtZW16ZXJvX2V4cGxpY2l0KHZv
aWQgKnMsIHNpemVfdCBjb3VudCkNCiAgICAgICAgICAgICAgICAgICAgXg0KSW4gZmlsZSBpbmNs
dWRlZCBmcm9tIGluY2x1ZGUvbGludXgvYml0bWFwLmg6ODowLA0KICAgICAgICAgICAgICAgICBm
cm9tIGluY2x1ZGUvbGludXgvY3B1bWFzay5oOjExLA0KICAgICAgICAgICAgICAgICBmcm9tIC4v
YXJjaC94ODYvaW5jbHVkZS9hc20vY3B1bWFzay5oOjQsDQogICAgICAgICAgICAgICAgIGZyb20g
Li9hcmNoL3g4Ni9pbmNsdWRlL2FzbS9tc3IuaDoxMCwNCiAgICAgICAgICAgICAgICAgZnJvbSAu
L2FyY2gveDg2L2luY2x1ZGUvYXNtL3Byb2Nlc3Nvci5oOjIwLA0KICAgICAgICAgICAgICAgICBm
cm9tIC4vYXJjaC94ODYvaW5jbHVkZS9hc20vdGhyZWFkX2luZm8uaDoyMiwNCiAgICAgICAgICAg
ICAgICAgZnJvbSBpbmNsdWRlL2xpbnV4L3RocmVhZF9pbmZvLmg6NTQsDQogICAgICAgICAgICAg
ICAgIGZyb20gaW5jbHVkZS9saW51eC9wcmVlbXB0Lmg6OSwNCiAgICAgICAgICAgICAgICAgZnJv
bSBpbmNsdWRlL2xpbnV4L3NwaW5sb2NrLmg6NTAsDQogICAgICAgICAgICAgICAgIGZyb20gaW5j
bHVkZS9saW51eC9tbV90eXBlcy5oOjgsDQogICAgICAgICAgICAgICAgIGZyb20gaW5jbHVkZS9s
aW51eC9rbWVtY2hlY2suaDo0LA0KICAgICAgICAgICAgICAgICBmcm9tIGluY2x1ZGUvbGludXgv
c2tidWZmLmg6MTgsDQogICAgICAgICAgICAgICAgIGZyb20gaW5jbHVkZS9saW51eC9pcC5oOjIw
LA0KICAgICAgICAgICAgICAgICBmcm9tIGluY2x1ZGUvbGludXgvaWZfdHVubmVsLmg6NCwNCiAg
ICAgICAgICAgICAgICAgZnJvbSBpbmNsdWRlL25ldC9pcF90dW5uZWxzLmg6NCwNCiAgICAgICAg
ICAgICAgICAgZnJvbSAvb3B0L3NjcmlwdHMvV2lyZUd1YXJkLTAuMC4yMDE3MDQyMS9zcmMvY29t
cGF0L2NvbXBhdC5oOjYyLA0KICAgICAgICAgICAgICAgICBmcm9tIDxjb21tYW5kLWxpbmU+OjA6
DQppbmNsdWRlL2xpbnV4L3N0cmluZy5oOjE1ODo2OiBub3RlOiBwcmV2aW91cyBkZWNsYXJhdGlv
biBvZiAnbWVtemVyb19leHBsaWNpdCcgd2FzIGhlcmUNCiB2b2lkIG1lbXplcm9fZXhwbGljaXQo
dm9pZCAqcywgc2l6ZV90IGNvdW50KTsNCiAgICAgIF4NCkluIGZpbGUgaW5jbHVkZWQgZnJvbSA8
Y29tbWFuZC1saW5lPjowOjA6DQovb3B0L3NjcmlwdHMvV2lyZUd1YXJkLTAuMC4yMDE3MDQyMS9z
cmMvY29tcGF0L2NvbXBhdC5oOjgzOjM3OiB3YXJuaW5nOiAnaXB2Nl9zdHViJyBkZWZpbmVkIGJ1
dCBub3QgdXNlZCBbLVd1bnVzZWQtdmFyaWFibGVdDQogc3RhdGljIGNvbnN0IHN0cnVjdCBpcHY2
X3N0dWJfdHlwZSAqaXB2Nl9zdHViID0gJmlwdjZfc3R1Yl9pbXBsOw0KICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIF4NCm1ha2VbMl06ICoqKiBbL29wdC9zY3JpcHRzL1dpcmVH
dWFyZC0wLjAuMjAxNzA0MjEvc3JjL21haW4ub10gRXJyb3IgMQ0KbWFrZVsxXTogKioqIFtfbW9k
dWxlXy9vcHQvc2NyaXB0cy9XaXJlR3VhcmQtMC4wLjIwMTcwNDIxL3NyY10gRXJyb3IgMg0KbWFr
ZVsxXTogTGVhdmluZyBkaXJlY3RvcnkgYC91c3Ivc3JjL2tlcm5lbHMvMy4xMC4wLTUxNC4xNi4x
LmVsNy54ODZfNjQnDQptYWtlOiAqKiogW21vZHVsZV0gRXJyb3IgMg0K

--_004_c5583cece7fa4be893e0a4a527dde90dHDCMAILEXCH02ubisoftorg_--
