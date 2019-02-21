Return-Path: <SRS0=i+YM=Q4=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CBDFC43381
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 21 Feb 2019 12:29:29 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DAB192085A
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 21 Feb 2019 12:29:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=fastmail.net header.i=@fastmail.net header.b="IYHQRdMs";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="En8EY9w2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DAB192085A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=fastmail.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 58cb4393;
	Thu, 21 Feb 2019 12:20:28 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2ff7a391
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Feb 2019 12:20:26 +0000 (UTC)
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
 [66.111.4.26])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 695f5a44
 for <wireguard@lists.zx2c4.com>;
 Thu, 21 Feb 2019 12:20:26 +0000 (UTC)
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
 by mailout.nyi.internal (Postfix) with ESMTP id 02A8120A82
 for <wireguard@lists.zx2c4.com>; Thu, 21 Feb 2019 07:28:59 -0500 (EST)
Received: from imap6 ([10.202.2.56])
 by compute4.internal (MEProxy); Thu, 21 Feb 2019 07:28:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fastmail.net; h=
 message-id:in-reply-to:references:date:from:to:subject
 :content-type; s=fm2; bh=sqdR85jqYuiGpdmUH9LekqOWaVvNOQhLp3Jt1o+
 fYKI=; b=IYHQRdMs9IaRLcJcp0HVUvvJHj9oTFmsaz0CelgtO9yWMF5dk7s8u4y
 LvskxxLmzgbuWJqnv0c75OuyE3Vd9Sy/y4UawofZN1+VGZGDXH1ZZAV1MUd7uMbN
 B9CRCwAkt909UM3AgLKZf9PwKZ4xZD+pc/d8oLLQdpGHF7LAYDqSJY4pUzxOnTAg
 O18lkgfk08RuF6Zz8jLxHtWc8i9FlG0qg5KyTyW9YftR/TlSV5z14vLd11FCcUjY
 n8hPpFLRhO6+fa8st99RlLHNZW8U5Wyicd9fbO+88DuYOmOsKw4KyCGFkNJAS33I
 av5bYA0FxkS1XGxKtXWY56RD/JZ6N6g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:references:subject:to:x-me-proxy:x-me-proxy
 :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=sqdR85jqYuiGpdmUH
 9LekqOWaVvNOQhLp3Jt1o+fYKI=; b=En8EY9w2o0Y+ZiVriPPQJYA7jxivo9OCD
 wH7X3gYW2snFe3y5WtkIojALLyOf2mNnPTROAWcSEsUcsgxJKpnIaINFhP74sEYj
 4PGP2ndKmrdGYl+0oOVyNbuOLb2W4K3zNQB7CTqUeUqYIQFImWv9dS1DMBwwNdC4
 Fws8UsYgKte90KDI1l2zg+u1BMeORGJDbQYMsgYj1FsZsRBb54CWB38SW+HirxOV
 Bk5sK3qHULkY7Q9i3xOG4GuZ3cDjVc8mmB4wYsFiRmfPV1lzrJYeoP3fQlea3ZiT
 IMCxcsublJ2OtjTek2hllUEd6/en2uHVALIdHtKMR1eis+j81YGSw==
X-ME-Sender: <xms:ipluXBovaYXhAzFCo2O-i6NdVT9jbJiubBNwqyOGQWorjrZ15o69QA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedutddrtdekgdegvdculddtuddrgedtledrtddtmd
 cutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfhuthen
 uceurghilhhouhhtmecufedttdenucenucfjughrpefofgfkjghffffhvffutgesrgdtre
 erreertdenucfhrhhomheplhhoghgtrggsihhnsehfrghsthhmrghilhdrnhgvthenucff
 ohhmrghinhepiiigvdgtgedrtghomhenucfrrghrrghmpehmrghilhhfrhhomheplhhogh
 gtrggsihhnsehfrghsthhmrghilhdrnhgvthenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:ipluXH5fN-c36qcI07HnnNVISjSKxYtiMgJeMjs4-9YB6uFUF53fOQ>
 <xmx:ipluXJPJMUDs-r-50rd05TBiMA4eev0VxcczIlYZXq4yyCPSdlhRDw>
 <xmx:ipluXBPvz2zqKdKpa3bwHWWhuj1qH427PaHwbhm5_JY2o0HZgrwang>
 <xmx:ipluXMBdEVV5lEwHi5fnfSpSWliys4Kxir6FVeuaaRbNZYVvjQrRCg>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 6F75A82678; Thu, 21 Feb 2019 07:28:58 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.5-895-g0d23ba6-fmstable-20190213v1
X-Me-Personality: 15697833
Message-Id: <ac5a35ae-7efb-4143-bf61-a687f6cee8a8@www.fastmail.com>
In-Reply-To: <CAGCGyt+bsxa-aRoETJFTwvOZ1eb=Q_AemZUwufN_7RYicnnKaw@mail.gmail.com>
References: <CAGCGyt+bsxa-aRoETJFTwvOZ1eb=Q_AemZUwufN_7RYicnnKaw@mail.gmail.com>
Date: Thu, 21 Feb 2019 07:28:58 -0500
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
Content-Type: multipart/mixed; boundary="===============6673903817746462242=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============6673903817746462242==
Content-Type: multipart/alternative;
 boundary=e465c574f50441bd9d858ebd27e9bef3

--e465c574f50441bd9d858ebd27e9bef3
Content-Type: text/plain

Yes, the kernel did get updated, causing the wg module dependencies to get out of sync. A reboot after the update should solve this, otherwise you may need to run the package's preinst script to get the modules back in sync. Should be no need to reinstall the wg packages.

On Thu, Feb 21, 2019, at 2:14 AM, Arpit Gupta wrote:
> Hi All
> 
> I am running raspberry pi v3 and ran apt-get update and upgrade commands to get upto date. It also ended up updating the kernel i think. I should have paid more attention to what all was getting updated.
> 
> After the update wireguard was not running and upon debugging i found that the wireguard kernel module was no longer present. So i uninstalled all wireguard packages and installed them again and the module showed up and on reboot system was back to normal. What i was curious was how should one go about doing os/kernel updates in future in order to avoid this issue?
> 
> I am running
> Linux raspberrypi 4.14.98-v7+ #1200 SMP Tue Feb 12 20:27:48 GMT 2019 armv7l GNU/Linux
> No LSB modules are available.
> Distributor ID: Raspbian
> Description: Raspbian GNU/Linux 9.8 (stretch)
> Release: 9.8
> Codename: stretch
> 
> ii wireguard 0.0.20190123-1 all fast, modern, secure kernel VPN tunnel (metapackage)
> ii wireguard-dkms 0.0.20190123-1 all fast, modern, secure kernel VPN tunnel (DKMS version)
> ii wireguard-tools 0.0.20190123-1 armhf fast, modern, secure kernel VPN tunnel (userland utilities)
> 
> --
> Arpit
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
> 

--e465c574f50441bd9d858ebd27e9bef3
Content-Type: text/html
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head><title></title><style type=3D"text/css">p.Mso=
Normal,p.MsoNoSpacing{margin:0}</style></head><body><div style=3D"font-f=
amily:Arial;">Yes, the kernel did get updated, causing the wg module dep=
endencies to get out of sync. A reboot after the update should solve thi=
s, otherwise you may need to run the package's preinst script to get the=
 modules back in sync. Should be no need to reinstall the wg packages.<b=
r></div><div style=3D"font-family:Arial;"><br></div><div style=3D"font-f=
amily:Arial;">On Thu, Feb 21, 2019, at 2:14 AM, Arpit Gupta wrote:<br></=
div><blockquote type=3D"cite" id=3D"fastmail-quoted"><div dir=3D"ltr"><d=
iv dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div style=3D"font-fami=
ly:Arial;">Hi All<br></div><div><br></div><div>I am running raspberry pi=
 v3 and ran apt-get update and upgrade commands to get upto date. It als=
o ended up updating the kernel i think. I should have paid more attentio=
n to what all was getting updated.<br></div><div><br></div><div>After th=
e update wireguard was not running and upon debugging i found that the w=
ireguard kernel module was no longer present. So i uninstalled all wireg=
uard packages and installed them again and the module showed up and on r=
eboot system was back to normal. What i was curious was how should one g=
o about doing os/kernel updates in future in order to avoid this issue?<=
br></div><div><br></div><div>I am running<br></div><div>Linux raspberryp=
i 4.14.98-v7+ #1200 SMP Tue Feb 12 20:27:48 GMT 2019 armv7l GNU/Linux<br=
></div><div><div>No LSB modules are available.<br></div><div>Distributor=
 ID:<span style=3D"white-space:pre;"> </span>Raspbian<br></div><div>Desc=
ription:<span style=3D"white-space:pre;"> </span>Raspbian GNU/Linux 9.8 =
(stretch)<br></div><div>Release:<span style=3D"white-space:pre;"> </span=
>9.8<br></div><div>Codename:<span style=3D"white-space:pre;"> </span>str=
etch<br></div><div><br></div><div><div>ii&nbsp; wireguard&nbsp; &nbsp; &=
nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;0.0.=
20190123-1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;all&nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; fast, modern, secure kernel VPN tunnel (m=
etapackage)<br></div><div>ii&nbsp; wireguard-dkms&nbsp; &nbsp; &nbsp; &n=
bsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 0.0.20190123-1&nbsp; &nbsp; &nbs=
p; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;all&nbsp; &nbsp; &nbsp; &nbsp; &nbs=
p; fast, modern, secure kernel VPN tunnel (DKMS version)<br></div><div>i=
i&nbsp; wireguard-tools&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; =
&nbsp; &nbsp;0.0.20190123-1&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nb=
sp; &nbsp;armhf&nbsp; &nbsp; &nbsp; &nbsp; fast, modern, secure kernel V=
PN tunnel (userland utilities)<br></div></div><div><br></div><div><div c=
lass=3D"fastmail-quoted-gmail_signature" dir=3D"ltr"><div dir=3D"ltr"><d=
iv>--<br></div><div style=3D"font-family:Arial;">Arpit<br></div></div></=
div></div></div></div></div></div></div><div>___________________________=
____________________<br></div><div>WireGuard mailing list<br></div><div>=
WireGuard@lists.zx2c4.com<br></div><div>https://lists.zx2c4.com/mailman/=
listinfo/wireguard<br></div><div><br></div></blockquote><div style=3D"fo=
nt-family:Arial;"><br></div></body></html>
--e465c574f50441bd9d858ebd27e9bef3--

--===============6673903817746462242==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============6673903817746462242==--
