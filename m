Return-Path: <SRS0=7yF6=Q5=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30695C43381
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 22 Feb 2019 00:23:51 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4D57E2080F
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 22 Feb 2019 00:23:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fastmail.net header.i=@fastmail.net header.b="h4TZidt+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="tfw2RwxZ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4D57E2080F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=fastmail.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1c7667b8;
	Fri, 22 Feb 2019 00:14:41 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 27620ccb
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Feb 2019 00:14:39 +0000 (UTC)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 15f8a37d
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Feb 2019 00:14:39 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 5037B22081
 for <wireguard@lists.zx2c4.com>; Thu, 21 Feb 2019 19:23:30 -0500 (EST)
Received: from imap6 ([10.202.2.56])
 by compute4.internal (MEProxy); Thu, 21 Feb 2019 19:23:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.net; h=
 message-id:in-reply-to:references:date:from:to:subject
 :content-type; s=fm2; bh=GIDV/4X1h3mxCRXfapXEu4ts9u6RxGgCPrtWnOZ
 vDdg=; b=h4TZidt+f982OGWtI/dd5imPhdGlZOk8ubdNrJgx6gopnmCHAp+Ngej
 lH09qJ59THkWIKTFpGqpOo/pcp8VMgTSopy0sljaBExoKADcKWiLeUAoWXGw02eN
 /Ep9qBNBj485WLEutsphf+o3879zeXB5VjFv58rwRfFPpRk9Ye2PjCdEdA6HufP5
 4O0C679mmm0WMzbNrFFvkpI2L+lIGq+Fw08GBjA46DOXCFUPj+l3dTMBz5dhVNK6
 QTrBfcOZu+qkP080lacuPXS43uLoQT3DmFhJNUx2EsySzuQ9Usl5NPZFqhXbsgdC
 RZlKYmgXpaYDBUdhCvyGVcNS5qhL8eg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:references:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=GIDV/4X1h3mxCRXfa
 pXEu4ts9u6RxGgCPrtWnOZvDdg=; b=tfw2RwxZ3OHjHoPYHk4yMhvSYiaqkJ9aC
 JJ0Co3opc14N4Dn5f/5WHWuXOr16qjQJIJI3xYK0OT0woTieKcZpsBKIfPqljWEW
 nRx+rbKzVGoUols+WMXVwb6VJOU8u2QUii8vGViKi928OSEo39moo3tVhnPVXlCU
 iCKcsMz7f5Q0719JCivbRLGDrIwrPutmwIC709fdGaXOqHi1mq7UQj9FpXqqB8UL
 P2uEvWPBhQ98hfki7b1w8ZmDIeFhlvxgib9F3xcUi0l/qIvoSGubzYiPxixByZpw
 K6fkX7OIE95Ml9dkeLY8kySnYE5AI05YWizR+arjyhOHIRfNDe/Xg==
X-ME-Sender: <xms:AUFvXF0AROaLrpScP7X4ymZ4ssruNs3LRoUArk5nj1EV98DBLrfyPQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedutddrtdelgddvtdculddtuddrgedtledrtddtmd
 cutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfhuthen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefofgfkjghffffhvffutgesrgdtre
 erreerjeenucfhrhhomheplhhoghgtrggsihhnsehfrghsthhmrghilhdrnhgvthenucff
 ohhmrghinhepiiigvdgtgedrtghomhenucfrrghrrghmpehmrghilhhfrhhomheplhhogh
 gtrggsihhnsehfrghsthhmrghilhdrnhgvthenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:AUFvXMwjs60Z68Vf4hv7hxEdUVCfN1n5j8807Vb6OEy55hpxeiVbcg>
 <xmx:AUFvXEFaNBdqlthJ_wHLh3UuwpxQm0KUHWqNuv10654oNEL5FCbq9Q>
 <xmx:AUFvXHYzms6Ju2EfrPa-Ott_8kKV7cCMpleoQG7kwEZ9R6F9QPCOqg>
 <xmx:AkFvXJTn8DVRG6MPfr53-Xb1uW3Z0BzdVRhe0YoAQnlmABNp4X7y9A>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id CC28182678; Thu, 21 Feb 2019 19:23:29 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.5-895-g0d23ba6-fmstable-20190213v1
X-Me-Personality: 15697833
Message-Id: <e25e0707-326a-47a3-80fd-967167f6778b@www.fastmail.com>
In-Reply-To: <9e6f49da-bf09-ab90-dba7-ac5587863a31@pallas.us>
References: <CAGCGyt+bsxa-aRoETJFTwvOZ1eb=Q_AemZUwufN_7RYicnnKaw@mail.gmail.com>
 <ac5a35ae-7efb-4143-bf61-a687f6cee8a8@www.fastmail.com>
 <CAGCGytJE5bzXiXB8Go6aHk5OLT0D-m2AnKbRt=Nv1giEVrpsjA@mail.gmail.com>
 <9e6f49da-bf09-ab90-dba7-ac5587863a31@pallas.us>
Date: Thu, 21 Feb 2019 19:23:29 -0500
From: logcabin@fastmail.net
To: wireguard@lists.zx2c4.com
Subject: Re: upgrading raspberry pi required me to re install wireguard
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
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============0444523939657318413=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============0444523939657318413==
Content-Type: multipart/alternative;
 boundary=29e98e42171e4d35b93863803fd4efdb

--29e98e42171e4d35b93863803fd4efdb
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: quoted-printable

If you want to build/install wg from source, you can do what I do (autom=
ation is easy):

Download the source xz file and unpack it using xzcat and tar. Navigate =
to the src directory and build the module and tools using the "make" com=
mand. Then use "sudo make install" to get the wg .ko file replaced with =
the latest one and install any updates to the tools and wg executable. I=
f you do this after a kernel upgrade, you'll need to reboot the pi befor=
e you install the wg kernel module, otherwise it won't find the right ke=
rnel headers.=20

A simple shell script can be made to do all this stuff for you.=20

On Thu, Feb 21, 2019, at 6:30 PM, Derrick Lyndon Pallas wrote:
> I just use DKMS to do it. Check out WireGuard to /usr/src, ln -s WireG=
uard/src WireGuard-0, dkms add WireGuard/0. If it's not auto building, h=
ave you tried dkms install WireGuard/0? ~D


>=20


> On 2/21/19 2:57 PM, Arpit Gupta wrote:
>> Ya reboot did not solve this for me. I will read up on how I can exec=
ute package pre/post install scripts.=20
>>=20
>> Curious to know if the rebuild the module is the responsibility of th=
e os or the package after a kernel upgrade?
>>=20
>> I will try to remember this next time there is a kernel upgrade =F0=9F=
=98=81.
>> =20
>> =20
>>=20
>> --
>>  Arpit
>>=20
>> On Thu, Feb 21, 2019, 4:30 AM <logcabin@fastmail.net> wrote:
>>> Yes, the kernel did get updated, causing the wg module dependencies =
to get out of sync. A reboot after the update should solve this, otherwi=
se you may need to run the package's preinst script to get the modules b=
ack in sync. Should be no need to reinstall the wg packages.
>>>=20
>>> On Thu, Feb 21, 2019, at 2:14 AM, Arpit Gupta wrote:
>>>> Hi All
>>>>=20
>>>> I am running raspberry pi v3 and ran apt-get update and upgrade com=
mands to get upto date. It also ended up updating the kernel i think. I =
should have paid more attention to what all was getting updated.
>>>>=20
>>>> After the update wireguard was not running and upon debugging i fou=
nd that the wireguard kernel module was no longer present. So i uninstal=
led all wireguard packages and installed them again and the module showe=
d up and on reboot system was back to normal. What i was curious was how=
 should one go about doing os/kernel updates in future in order to avoid=
 this issue?
>>>>=20
>>>> I am running
>>>> Linux raspberrypi 4.14.98-v7+ #1200 SMP Tue Feb 12 20:27:48 GMT 201=
9 armv7l GNU/Linux
>>>> No LSB modules are available.
>>>> Distributor ID: Raspbian
>>>> Description: Raspbian GNU/Linux 9.8 (stretch)
>>>> Release: 9.8
>>>> Codename: stretch
>>>>=20
>>>> ii wireguard 0.0.20190123-1 all fast, modern, secure kernel VPN tun=
nel (metapackage)
>>>> ii wireguard-dkms 0.0.20190123-1 all fast, modern, secure kernel VP=
N tunnel (DKMS version)
>>>> ii wireguard-tools 0.0.20190123-1 armhf fast, modern, secure kernel=
 VPN tunnel (userland utilities)
>>>>=20
>>>> --
>>>> Arpit
>>>> _______________________________________________
>>>> WireGuard mailing list
>>>> WireGuard@lists.zx2c4.com
>>>> https://lists.zx2c4.com/mailman/listinfo/wireguard
>>>>=20
>>>=20
>>> _______________________________________________
>>>  WireGuard mailing list
>>>  WireGuard@lists.zx2c4.com
>>>  https://lists.zx2c4.com/mailman/listinfo/wireguard
>>=20
>> _______________________________________________
WireGuard mailing list
>> WireGuard@lists.zx2c4.com
>> https://lists.zx2c4.com/mailman/listinfo/wireguard
>>=20
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
>=20

--29e98e42171e4d35b93863803fd4efdb
Content-Type: text/html;charset=utf-8
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head><title></title><style type=3D"text/css">p.Mso=
Normal,p.MsoNoSpacing{margin:0}</style></head><body><div style=3D"font-f=
amily:Arial;">If you want to build/install wg from source, you can do wh=
at I do (automation is easy):<br></div><div style=3D"font-family:Arial;"=
><br></div><div style=3D"font-family:Arial;">Download the source xz file=
 and unpack it using xzcat and tar.&nbsp; Navigate to the src directory =
and build the module and tools using the "make" command. Then use "sudo =
make install" to get the wg .ko file replaced with the latest one and in=
stall any updates to the tools and wg executable. If you do this after a=
 kernel upgrade, you'll need to reboot the pi before you install the wg =
kernel module, otherwise it won't find the right kernel headers. <br></d=
iv><div style=3D"font-family:Arial;"><br></div><div style=3D"font-family=
:Arial;">A simple shell script can be made to do all this stuff for you.=
 <br></div><div style=3D"font-family:Arial;"><br></div><div style=3D"fon=
t-family:Arial;">On Thu, Feb 21, 2019, at 6:30 PM, Derrick Lyndon Pallas=
 wrote:<br></div><blockquote type=3D"cite" id=3D"fastmail-quoted"><p>I j=
ust use DKMS to do it. Check out WireGuard to /usr/src, ln -s
      WireGuard/src WireGuard-0, dkms add WireGuard/0. If it's not auto
      building, have you tried dkms install WireGuard/0? ~D<br></p><p><b=
r></p><div class=3D"fastmail-quoted-moz-cite-prefix">On 2/21/19 2:57 PM,=
 Arpit Gupta wrote:<br></div><blockquote cite=3D"mid:CAGCGytJE5bzXiXB8Go=
6aHk5OLT0D-m2AnKbRt=3DNv1giEVrpsjA@mail.gmail.com" type=3D"cite"><div di=
r=3D"auto"><div style=3D"font-family:Arial;">Ya reboot did not solve thi=
s for me. I will read
        up on how I can execute package pre/post install scripts. <br></=
div><div dir=3D"auto"><br></div><div dir=3D"auto">Curious to know if the=
 rebuild the module is the
          responsibility of the os or the package after a kernel
          upgrade?<br></div><div dir=3D"auto"><br></div><div dir=3D"auto=
"><div style=3D"font-family:Arial;">I will try to remember this next tim=
e there is a
          kernel upgrade =F0=9F=98=81.<br></div><div style=3D"font-famil=
y:Arial;"> <br></div><div style=3D"font-family:Arial;"> <br></div><div d=
ir=3D"auto"><div style=3D"font-family:Arial;"><br></div><div style=3D"fo=
nt-family:Arial;">--<br></div><div style=3D"font-family:Arial;"> Arpit<b=
r></div></div></div></div><div style=3D"font-family:Arial;"><br></div><d=
iv class=3D"fastmail-quoted-gmail_quote"><div class=3D"fastmail-quoted-g=
mail_attr" dir=3D"ltr">On Thu, Feb 21, 2019, 4:30 AM
          &lt;<a href=3D"mailto:logcabin@fastmail.net">logcabin@fastmail=
.net</a>&gt; wrote:<br></div><blockquote style=3D"margin-top:0px;margin-=
right:0px;margin-bottom:0px;margin-left:0.8ex;border-left-width:1px;bord=
er-left-style:solid;border-left-color:rgb(204, 204, 204);padding-left:1e=
x;" class=3D"fastmail-quoted-gmail_quote"><div><div style=3D"font-family=
:Arial;">Yes, the kernel did get
              updated, causing the wg module dependencies to get out of
              sync. A reboot after the update should solve this,
              otherwise you may need to run the package's preinst script=

              to get the modules back in sync. Should be no need to
              reinstall the wg packages.<br></div><div style=3D"font-fam=
ily:Arial;"><br></div><div style=3D"font-family:Arial;">On Thu, Feb 21, =
2019, at 2:14
              AM, Arpit Gupta wrote:<br></div><blockquote id=3D"fastmail=
-quoted-m_-2690143954488973293fastmail-quoted" type=3D"cite"><div dir=3D=
"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div style=3D"f=
ont-family:Arial;">Hi All<br></div><div><br></div><div>I am running rasp=
berry pi v3 and ran apt-get
                        update and upgrade commands to get upto date. It=

                        also ended up updating the kernel i think. I
                        should have paid more attention to what all was
                        getting updated.<br></div><div><br></div><div>Af=
ter the update wireguard was not running
                        and upon debugging i found that the wireguard
                        kernel module was no longer present. So i
                        uninstalled all wireguard packages and installed=

                        them again and the module showed up and on
                        reboot system was back to normal. What i was
                        curious was how should one go about doing
                        os/kernel updates in future in order to avoid
                        this issue?<br></div><div><br></div><div>I am ru=
nning<br></div><div>Linux raspberrypi 4.14.98-v7+ #1200 SMP Tue
                        Feb 12 20:27:48 GMT 2019 armv7l GNU/Linux<br></d=
iv><div><div>No LSB modules are available.<br></div><div>Distributor ID:=
<span style=3D"white-space:pre-wrap;"> </span>Raspbian<br></div><div>Des=
cription:<span style=3D"white-space:pre-wrap;"> </span>Raspbian
                          GNU/Linux 9.8 (stretch)<br></div><div>Release:=
<span style=3D"white-space:pre-wrap;"> </span>9.8<br></div><div>Codename=
:<span style=3D"white-space:pre-wrap;"> </span>stretch<br></div><div><br=
></div><div><div>ii&nbsp; wireguard&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                            &nbsp;0.0.20190123-1&nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;all&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                            fast, modern, secure kernel VPN tunnel
                            (metapackage)<br></div><div>ii&nbsp; wiregua=
rd-dkms&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                            0.0.20190123-1&nbsp; &nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp;all&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                            fast, modern, secure kernel VPN tunnel (DKMS=

                            version)<br></div><div>ii&nbsp; wireguard-to=
ols&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                            &nbsp;0.0.20190123-1&nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp; &nbsp; &nbsp; &nbsp;armhf&nbsp; &nbsp; &nbsp; &nbsp;
                            fast, modern, secure kernel VPN tunnel
                            (userland utilities)<br></div></div><div><br=
></div><div><div dir=3D"ltr" class=3D"fastmail-quoted-m_-269014395448897=
3293fastmail-quoted-gmail_signature"><div dir=3D"ltr"><div>--<br></div><=
div style=3D"font-family:Arial;">Arpit<br></div></div></div></div></div>=
</div></div></div></div><div>___________________________________________=
____<br></div><div>WireGuard mailing list<br></div><div><a rel=3D"norefe=
rrer" href=3D"mailto:WireGuard@lists.zx2c4.com">WireGuard@lists.zx2c4.co=
m</a><br></div><div><a rel=3D"noreferrer" href=3D"https://lists.zx2c4.co=
m/mailman/listinfo/wireguard">https://lists.zx2c4.com/mailman/listinfo/w=
ireguard</a><br></div><div><br></div></blockquote><div style=3D"font-fam=
ily:Arial;"><br></div></div><div style=3D"font-family:Arial;">__________=
_____________________________________<br></div><div style=3D"font-family=
:Arial;"> WireGuard mailing list<br></div><div style=3D"font-family:Aria=
l;"> <a rel=3D"noreferrer" href=3D"mailto:WireGuard@lists.zx2c4.com">Wir=
eGuard@lists.zx2c4.com</a><br></div><div style=3D"font-family:Arial;"> <=
a rel=3D"noreferrer noreferrer" href=3D"https://lists.zx2c4.com/mailman/=
listinfo/wireguard">https://lists.zx2c4.com/mailman/listinfo/wireguard</=
a><br></div></blockquote></div><div style=3D"font-family:Arial;"><br></d=
iv><pre class=3D"fastmail-quoted-moz-quote-pre" wrap=3D"">______________=
_________________________________
WireGuard mailing list
<a href=3D"mailto:WireGuard@lists.zx2c4.com" class=3D"fastmail-quoted-mo=
z-txt-link-abbreviated">WireGuard@lists.zx2c4.com</a>
<a href=3D"https://lists.zx2c4.com/mailman/listinfo/wireguard" class=3D"=
fastmail-quoted-moz-txt-link-freetext">https://lists.zx2c4.com/mailman/l=
istinfo/wireguard</a>
<br></pre></blockquote><div>____________________________________________=
___<br></div><div>WireGuard mailing list<br></div><div>WireGuard@lists.z=
x2c4.com<br></div><div>https://lists.zx2c4.com/mailman/listinfo/wireguar=
d<br></div><div><br></div></blockquote><div style=3D"font-family:Arial;"=
><br></div></body></html>
--29e98e42171e4d35b93863803fd4efdb--

--===============0444523939657318413==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============0444523939657318413==--
