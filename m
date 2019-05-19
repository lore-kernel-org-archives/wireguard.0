Return-Path: <SRS0=gQ6O=UF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4763EC28D1E
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 Jun 2019 09:49:57 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA6B92064A
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  6 Jun 2019 09:49:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=sendgrid.net header.i=@sendgrid.net header.b="ws0SahG+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EA6B92064A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=creosotehill.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ffd1719f;
	Thu, 6 Jun 2019 09:49:54 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bae54942
 for <wireguard@lists.zx2c4.com>;
 Sun, 19 May 2019 22:26:19 +0000 (UTC)
Received: from o1.office.mobisystems.com (o1.office.mobisystems.com
 [198.37.146.154])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 13c7da3d
 for <wireguard@lists.zx2c4.com>;
 Sun, 19 May 2019 22:26:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sendgrid.net;
 h=subject:from:in-reply-to:references:content-type:mime-version:to;
 s=smtpapi; bh=e4uyv5Ik1ozEeyMSsPCj86RHfFe+i5ax7bv6sVLhBQg=;
 b=ws0SahG+tU+Md5ipmBcED+fNbWsBbjtZpB3Mg/EYnYE8tk9n1deFJ6AAdiAgLlo/sorp
 5AoXBEwcn+YUFt2yvOtLrWLpcwmQrAXeea1PZ1ZBZyRS+jf4xmuUuGlNojG74epYoiUpWH
 WZ0QfXl1SgLENm6nVlfI8zzEq+l5aMQu4=
Received: by filter0037p3iad2.sendgrid.net with SMTP id
 filter0037p3iad2-20574-5CE1D80A-14
 2019-05-19 22:26:18.538199397 +0000 UTC m=+344844.929181464
Received: from groontosotehill.creosotehill.org (unknown [35.227.179.201])
 by ismtpd0001p1las1.sendgrid.net (SG) with ESMTP id vUWu4G_NSWqs5IF6WHbAjg
 for <wireguard@lists.zx2c4.com>; Sun, 19 May 2019 22:26:18.301 +0000 (UTC)
Received: from emily (soekris.creosotehill.org [209.221.139.250])
 by groontcat.creosotehill.org (Postfix) with ESMTPSA id 38DB1720738
 for <wireguard@lists.zx2c4.com>; Sun, 19 May 2019 15:26:16 -0700 (PDT)
Message-ID: <fd79f93aefd266e83ad235c3f8a16073b059268a.camel@creosotehill.org>
Subject: Re: Working on change for: genetlink: make policy common to family
From: Robin Kauffman <robink@creosotehill.org>
Date: Sun, 19 May 2019 22:26:18 +0000 (UTC)
In-Reply-To: <20190517133603.GA16695@wolff.to>
References: <20190513195213.GA30315@wolff.to>
 <20190513202453.GA30656@wolff.to> <20190513212110.GA31106@wolff.to>
 <20190514205016.GA920@wolff.to> <20190515105014.GA12390@wolff.to>
 <20190515110636.GA12769@wolff.to> <20190515111830.GB12769@wolff.to>
 <20190515113325.GA13034@wolff.to>
 <CAHmME9qBF_NaThCCA-Q62mV=qGXzirzO7yVvVOEYg9w_gfRJSw@mail.gmail.com>
 <20190517133603.GA16695@wolff.to>
User-Agent: Evolution 3.33.2 
MIME-Version: 1.0
X-SG-EID: =?us-ascii?Q?JD1WbddfoCN9JDT0g4N+We4VBPDR0yv0uiDnvBjBGzZx7FnAU=2Fkfwt65O58=2FGM?=
 =?us-ascii?Q?bz6yVwVu7OOjKNxfyFzKjKjy0dZXHPC6GM=2FdA6s?=
 =?us-ascii?Q?8+202ItddHP8RHXZQDBu+WcWgdks9u2wGD9yNBe?=
 =?us-ascii?Q?uXq4uzakm3WhsVOYOcwbOgQRxQEnGWPIP8x1LPH?=
 =?us-ascii?Q?BRrFglCmfpSnCNfVDek5qCCieumyTqdqhKLba0E?=
 =?us-ascii?Q?rsXsPFI0g7r01Gx1zUL39RhiXfUugCM+psBCnj?=
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Thu, 06 Jun 2019 11:49:53 +0200
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============2743127544998538546=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>


--===============2743127544998538546==
Content-Type: multipart/signed; micalg="pgp-sha256";
	protocol="application/pgp-signature"; boundary="=-8gfCZ9DMXO5qdYZZORzh"


--=-8gfCZ9DMXO5qdYZZORzh
Content-Type: multipart/mixed; boundary="=-hczMdmec8axSJd7au/wH"


--=-hczMdmec8axSJd7au/wH
Content-Type: multipart/alternative; boundary="=-4yWFfmeCckB9Ow/M//1e"


--=-4yWFfmeCckB9Ow/M//1e
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi-	I'm having difficulty building the current WireGuard Git master
(c563bb275181a753853447c9c9c3a6767a6a1554) against a slightly older
checkout of Linus' Git master
(72cf0b07418a9c8349aa9137194b1ccba6e54a9d).  The error I get is:=20
CC      net/wireguard/main.oIn file included from <command-
line>:././net/wireguard/compat/compat.h:828:21: error: redeclaration of
enumerator =E2=80=98NLA_UNSPEC=E2=80=99 #define NLA_MIN_LEN
NLA_UNSPEC                     ^~~~~~~~~~./include/net/netlink.h:186:2:
note: in expansion of macro =E2=80=98NLA_MIN_LEN=E2=80=99  NLA_MIN_LEN,  ^~=
~~~~~~~~~In
file included from ./include/net/rtnetlink.h:6,                 from
./include/net/sch_generic.h:17,                 from
./include/linux/filter.h:25,                 from
./include/net/sock.h:64,                 from
./include/linux/tcp.h:23,                 from
./include/linux/ipv6.h:87,                 from
./include/net/ipv6.h:16,                 from
././net/wireguard/compat/compat.h:843,                 from <command-
line>:./include/net/netlink.h:166:2: note: previous definition of
=E2=80=98NLA_UNSPEC=E2=80=99 was here  NLA_UNSPEC,=20
^~~~~~~~~~scripts/Makefile.build:278: recipe for target
'net/wireguard/main.o' failedmake[2]: *** [net/wireguard/main.o] Error
1scripts/Makefile.build:489: recipe for target 'net/wireguard'
failedmake[1]: *** [net/wireguard] Error 2Makefile:1073: recipe for
target 'net' failedmake: *** [net] Error 2
	The full build log (GNU LZMA-compressed) is attached.
		-Robin K.
On Fri, 2019-05-17 at 08:36 -0500, Bruno Wolff III wrote:
> On Fri, May 17, 2019 at 13:12:07 +0200,  "Jason A. Donenfeld" <
> Jason@zx2c4.com> wrote:
> > Thanks for getting this started. This commit should take care of
> > it:
> > https://u9444849.ct.sendgrid.net/wf/click?upn=3DhlnDB5p2SCqcHpy-2Bu-2FD=
u8d88SXVo27bsPhiBQuz8ptM0jOis4sOiwp3Pc-2BAwmdItagQXBksDjcwFAI58qh6deyT-2Bny=
-2FQBJ5h4fuS0zgp1fObf8vTKOP9MwZ48K84-2Fa8V_HW4IRDX4SDmDQg1X-2FvoSrLWdDgphij=
Q89nXdFgsrfVzCVKmUOYslTHsHH18vguEGf3S5bA73VraTmcttvDzqk-2Bh2XO-2F8tYKS7WXf-=
2BeawAdESewRgDJuTQCwmE51AWByFqTKQBNCrA27VZdFyZvf-2FQUnGvUKmPwIIb-2FFgG4e-2B=
Ocg59gDnq-2FDtrSYxGBFMZtf2iz68jHSEDM3EfbdiZtJby2ZOFOjKiCh3Mwg6jm1hgu0-3D
>=20
> Thanks for the fix. I'm using it with Fedora's 5.2.0-
> 0.rc0.git8.1.fc31.x86_64 kernel successfully. (Note not all arches
> built successfully with that kernel, but it was the latest for x86_64
> I could get right now for testing a 5.2 kernel with the new
> fix.)_______________________________________________WireGuard mailing
> listWireGuard@lists.zx2c4.com
> https://u9444849.ct.sendgrid.net/wf/click?upn=3DhlnDB5p2SCqcHpy-2Bu-2FDu8=
cojZAgJwd1eyzYQhFJNTVr6b-2FwB3KjUFMppgiJU-2B1EKJ2WXDtyNFABUqm2tNEA2bg-3D-3D=
_HW4IRDX4SDmDQg1X-2FvoSrLWdDgphijQ89nXdFgsrfVzCVKmUOYslTHsHH18vguEGf3S5bA73=
VraTmcttvDzqk-2Fw8mTLMCgr2KW4laq8Os42fkcjf7GhleHzKrVPUA00meG0-2FDCTfnQ22mZj=
6uTQ-2BTLoa9RAZ-2FyHxvEeEG27asIVxIcaXqHM8QA5MfIT8Ox-2FTn8YS-2BWsMGh5vfyM7VN=
mYLDDumh8Eptc8Ydloro7OSlU-3D
=

--=-4yWFfmeCckB9Ow/M//1e
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr"><head></head><body style=3D"text-align: left; direction: =
ltr; word-wrap: break-word; -webkit-nbsp-mode: space; line-break: after-whi=
te-space;"><div>Hi-</div><div>	I'm having difficulty building the current W=
ireGuard Git master (c563bb275181a753853447c9c9c3a6767a6a1554) against a sl=
ightly older checkout of Linus' Git master (72cf0b07418a9c8349aa9137194b1cc=
ba6e54a9d).  The error I get is:</div><div><font face=3D"monospace" size=3D=
"3">&nbsp; CC&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;net/wireguard/main.o</font=
></div><div><font face=3D"monospace" size=3D"3">In file included from &lt;c=
ommand-line&gt;:</font></div><div><font face=3D"monospace" size=3D"3">././n=
et/wireguard/compat/compat.h:828:21: error: redeclaration of enumerator =E2=
=80=98NLA_UNSPEC=E2=80=99</font></div><div><font face=3D"monospace" size=3D=
"3">&nbsp;#define NLA_MIN_LEN NLA_UNSPEC</font></div><div><font face=3D"mon=
ospace" size=3D"3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;^~~~~=
~~~~~</font></div><div><font face=3D"monospace" size=3D"3">./include/net/ne=
tlink.h:186:2: note: in expansion of macro =E2=80=98NLA_MIN_LEN=E2=80=99</f=
ont></div><div><font face=3D"monospace" size=3D"3">&nbsp; NLA_MIN_LEN,</fon=
t></div><div><font face=3D"monospace" size=3D"3">&nbsp; ^~~~~~~~~~~</font><=
/div><div><font face=3D"monospace" size=3D"3">In file included from ./inclu=
de/net/rtnetlink.h:6,</font></div><div><font face=3D"monospace" size=3D"3">=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;from ./include/net/sch_generic.h:17,</font></div=
><div><font face=3D"monospace" size=3D"3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;from .=
/include/linux/filter.h:25,</font></div><div><font face=3D"monospace" size=
=3D"3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;from ./include/net/sock.h:64,</font></div=
><div><font face=3D"monospace" size=3D"3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;from .=
/include/linux/tcp.h:23,</font></div><div><font face=3D"monospace" size=3D"=
3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;from ./include/linux/ipv6.h:87,</font></div><=
div><font face=3D"monospace" size=3D"3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;from ./i=
nclude/net/ipv6.h:16,</font></div><div><font face=3D"monospace" size=3D"3">=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;from ././net/wireguard/compat/compat.h:843,</fon=
t></div><div><font face=3D"monospace" size=3D"3">&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;from &lt;command-line&gt;:</font></div><div><font face=3D"monospace" size=
=3D"3">./include/net/netlink.h:166:2: note: previous definition of =E2=80=
=98NLA_UNSPEC=E2=80=99 was here</font></div><div><font face=3D"monospace" s=
ize=3D"3">&nbsp; NLA_UNSPEC,</font></div><div><font face=3D"monospace" size=
=3D"3">&nbsp; ^~~~~~~~~~</font></div><div><font face=3D"monospace" size=3D"=
3">scripts/Makefile.build:278: recipe for target 'net/wireguard/main.o' fai=
led</font></div><div><font face=3D"monospace" size=3D"3">make[2]: *** [net/=
wireguard/main.o] Error 1</font></div><div><font face=3D"monospace" size=3D=
"3">scripts/Makefile.build:489: recipe for target 'net/wireguard' failed</f=
ont></div><div><font face=3D"monospace" size=3D"3">make[1]: *** [net/wiregu=
ard] Error 2</font></div><div><font face=3D"monospace" size=3D"3">Makefile:=
1073: recipe for target 'net' failed</font></div><div><font face=3D"monospa=
ce" size=3D"3">make: *** [net] Error 2</font></div><div><font face=3D"monos=
pace" size=3D"3"></font></div><div><font face=3D"monospace" size=3D"3"></fo=
nt><br></div><div>	The full build log (GNU LZMA-compressed) is attached.</d=
iv><div><br></div><div>		-Robin K.</div><div><br></div><div>On Fri, 2019-05=
-17 at 08:36 -0500, Bruno Wolff III wrote:</div><blockquote type=3D"cite" s=
tyle=3D"margin:0 0 0 .8ex; border-left:2px #729fcf solid;padding-left:1ex">=
<pre>On Fri, May 17, 2019 at 13:12:07 +0200,</pre><pre>  "Jason A. Donenfel=
d" &lt;</pre><a href=3D"mailto:Jason@zx2c4.com"><pre>Jason@zx2c4.com</pre><=
/a><pre>&gt; wrote:</pre><blockquote type=3D"cite" style=3D"margin:0 0 0 .8=
ex; border-left:2px #729fcf solid;padding-left:1ex"><pre>Thanks for getting=
 this started. This commit should take care of it:</pre><pre><br></pre><a h=
ref=3D"https://u9444849.ct.sendgrid.net/wf/click?upn=3DhlnDB5p2SCqcHpy-2Bu-=
2FDu8d88SXVo27bsPhiBQuz8ptM0jOis4sOiwp3Pc-2BAwmdItagQXBksDjcwFAI58qh6deyT-2=
Bny-2FQBJ5h4fuS0zgp1fNoOm-2Fpr-2FhkCG6LUHRszd05_HW4IRDX4SDmDQg1X-2FvoSrLWdD=
gphijQ89nXdFgsrfVzCVKmUOYslTHsHH18vguEGf3S5bA73VraTmcttvDzqk6p17RIbMlCC21Eg=
nYv9O5Je1UU2JehUAJCX-2FRQnXPTazfsBNFegDfle-2Fayp-2FURxcBKKJZCjaAWd9-2Ba2B1u=
qLrT0HkhC2HfufaBxUPblqDtWoPbjRPubzwGp5XtslZujRVNAyHyFQV-2FEepSGPviu6NE-3D">=
<pre>https://git.zx2c4.com/WireGuard/commit/?id=3D7a83d1e6da8aa27da8fd4d06e=
6b7d11198c7c049</pre></a><pre><br></pre></blockquote><pre><br></pre><pre>Th=
anks for the fix. I'm using it with Fedora's 5.2.0-0.rc0.git8.1.fc31.x86_64=
 </pre><pre>kernel successfully. (Note not all arches built successfully wi=
th that </pre><pre>kernel, but it was the latest for x86_64 I could get rig=
ht now for testing </pre><pre>a 5.2 kernel with the new fix.)</pre><pre>___=
____________________________________________</pre><pre>WireGuard mailing li=
st</pre><a href=3D"mailto:WireGuard@lists.zx2c4.com"><pre>WireGuard@lists.z=
x2c4.com</pre></a><pre><br></pre><a href=3D"https://u9444849.ct.sendgrid.ne=
t/wf/click?upn=3DhlnDB5p2SCqcHpy-2Bu-2FDu8cojZAgJwd1eyzYQhFJNTVr6b-2FwB3KjU=
FMppgiJU-2B1EK7wTXcWdsFaBfWZ6vVx22Gg-3D-3D_HW4IRDX4SDmDQg1X-2FvoSrLWdDgphij=
Q89nXdFgsrfVzCVKmUOYslTHsHH18vguEGf3S5bA73VraTmcttvDzqkwUJJO6KynSgszwEdCLd4=
6c13Z-2BKFt4hbgoHKvQBtsM3F6c6wTQT22dyGXBIBLw2ige9X9-2FghmonG-2F9RyAvllH9z4B=
RnFZJPDMwR9yzM-2BvRS0trSOOKRdxGu3FKCAXZ-2Fs0lT6TONUmDsiOY-2FrDnehVY-3D"><pr=
e>https://lists.zx2c4.com/mailman/listinfo/wireguard</pre></a><pre><br></pr=
e></blockquote><img src=3D"https://u9444849.ct.sendgrid.net/wf/open?upn=3DH=
W4IRDX4SDmDQg1X-2FvoSrLWdDgphijQ89nXdFgsrfVzCVKmUOYslTHsHH18vguEGf3S5bA73Vr=
aTmcttvDzqk6xsYaZtaxHOnTIl2SmvoBCoRj7uUSpwjGe8Mkyk8-2Bhm4aoqMP3EtOVgiW9lWHq=
tV0cf2vbZ5FE0xtQY-2F6SMs-2BB1yYCL26RB8Nn8j7RzymfG-2FRmHZrA0Yi6bCJF83LAAUd7Q=
M08wDpdwUgJMoWPKfzw-3D" alt=3D"" width=3D"1" height=3D"1" border=3D"0" styl=
e=3D"height:1px !important;width:1px !important;border-width:0 !important;m=
argin-top:0 !important;margin-bottom:0 !important;margin-right:0 !important=
;margin-left:0 !important;padding-top:0 !important;padding-bottom:0 !import=
ant;padding-right:0 !important;padding-left:0 !important;"/></body></html>
=

--=-4yWFfmeCckB9Ow/M//1e--

--=-hczMdmec8axSJd7au/wH
Content-Type: application/x-xz; name="kernel_build_log_2019051801.txt.xz"
Content-Disposition: attachment; filename="kernel_build_log_2019051801.txt.xz"
Content-Transfer-Encoding: base64

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
dCwAAbeIAs65EBd6hFyxxGf7AgAAAAAEWVo=


--=-hczMdmec8axSJd7au/wH--

--=-8gfCZ9DMXO5qdYZZORzh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEeb23hKK/qMX9zYmTtTUkezcK7JYFAlzh2AEACgkQtTUkezcK
7JZC7g//QzbOKxUSkmMLuUKfETYgTHmOg+UeZZuxDAftXlhmr9tj6EQVHm91GutB
EYkR7SX/0Z1Ar7Wwefsl75HU6bjZil63nIfBUqSwqj8vROdMcgEnYNo0VlIuKCPB
2Etr5aAXguiLTKEr+enA3RMXFBtwXG7y/YzK7LsEQyz/u3KCPUUDhBsmqadxbSit
0/SM64MSpPuBPrTyz8E0+apiZKC/WeoPFhrbBhNfpVAzNkV7yHZ2ZuU+1OXcPyoL
o/r4WQlriUOBhObysJRkOZILiFen/oo/hfxjIC0KLZqHTjyyN6cdmsipY/9rGADX
6RMlSUWCvnwLWb57mUTfcDTqvuFzhzwTJrsXXFr5oy+klvWmmnsPFb0klnSvBvmy
qXtsYhkvtJTaEYjyqVNMYMKodfWLL52PLt1w5cP0PzIG2Q9a7jPh5TgqVbGl4oEb
A+Tqxp9iJj9JG5nhLh1LQ7+DT5dTxSd9LXgQVBfUj/DfI9+iRXrpqRRvW+h+6s03
BsY6BeogpPamqsSYwtjwm3/O5onk5oPqfQgfWPRdBOiGThIdhDStaVaHQIDz8wDu
yRVNZyC0Ng/jM5iizC4aZHkDpg7TBwFScX4l4Rw/8TTPcPvHgbNX0btWPOCYJRG3
1M0ie7foaMUg0ICnWNXGH9P1lGJQa/aJBfVcxvZL4D2u8V4/mAw=
=x21M
-----END PGP SIGNATURE-----

--=-8gfCZ9DMXO5qdYZZORzh--


--===============2743127544998538546==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============2743127544998538546==--

