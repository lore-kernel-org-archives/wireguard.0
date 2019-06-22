Return-Path: <SRS0=lEMV=UV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8D0FC43613
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 22 Jun 2019 12:24:40 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4EFD520679
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 22 Jun 2019 12:24:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="U3khWbmL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4EFD520679
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=honson.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c1250e59;
	Sat, 22 Jun 2019 12:24:25 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 15f7fb59
 for <wireguard@lists.zx2c4.com>;
 Sat, 22 Jun 2019 12:24:23 +0000 (UTC)
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com
 [64.147.123.25])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5f2a33e4
 for <wireguard@lists.zx2c4.com>;
 Sat, 22 Jun 2019 12:24:22 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
 by mailout.west.internal (Postfix) with ESMTP id F3AA62D9
 for <wireguard@lists.zx2c4.com>; Sat, 22 Jun 2019 08:24:06 -0400 (EDT)
Received: from imap1 ([10.202.2.51])
 by compute3.internal (MEProxy); Sat, 22 Jun 2019 08:24:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=lf1fDK
 quJUTUk7ZGydfI59Nh3dilET2ryR3DHnuIhrc=; b=U3khWbmLfmN4CKzeuSpqEQ
 2uyvqDTCmdjQjm5rA0g9v0RstAxynoAIUAPMsGrctDnKhmqHufA81sKSgFVPWjP2
 pc2S1ZDKXjQXcf7GpVQX5/kEQ9E8eYR3sRRg72zsaPIt4L2ttaN92h3kF198q8cW
 OBYjc9tzBqhPo5MznNfA+GMYkjdp05Vy3N4gMIseKZZJK7h1wOtcntXJUJNsSrhB
 ViByCArNBMK6GWqVvWPE6p76GD8Z6NiWI2OAFCIkAu2v+pEl58riH5jyEqNyBz1J
 h7vRvDeUrOs/Z/KE+/R51v7RCURIWhut1jCYGPxetUwzQzt4InA7nr2u2uRL5vpA
 ==
X-ME-Sender: <xms:5R0OXT4aMSXfmwdX9dGBEEt6BGlPl7Iqb4ruZPsBAa0RfFB4nZHzlw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduvddrtdekgdehtdcutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecunecujfgurhepofgfggfkjghffffhvffutgesrgdtre
 erreerjeenucfhrhhomhepfdfuthgvvhgvnhcujfhonhhsohhnfdcuoehsthgvvhgvnhes
 hhhonhhsohhnrdhiugdrrghuqeenucffohhmrghinhepfihirhgvghhurghrugdrtghomh
 dpiiigvdgtgedrtghomhenucfrrghrrghmpehmrghilhhfrhhomhepshhtvghvvghnsehh
 ohhnshhonhdrihgurdgruhenucevlhhushhtvghrufhiiigvpedt
X-ME-Proxy: <xmx:5R0OXaJhfYSIWDmKfj_oPDddwxfVCKWYKS0MX3IALoFVQis40dHQ6Q>
 <xmx:5R0OXfzYEdr8WkqYNHHLnxqWbNtjMA9IZn6vpplSpxcqewHM-j241w>
 <xmx:5R0OXSFdFEKNfbzkT7SIxZGdGwijNeNvVSKyy2ALMw_33ufrOvyreA>
 <xmx:5h0OXRppSzXsqcbO30KPXDugwegMEFIAXsAAHNJGKjw9RDq2Ep62gQ>
Received: by mailuser.nyi.internal (Postfix, from userid 501)
 id 87811C200A4; Sat, 22 Jun 2019 08:24:05 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.1.6-730-g63f2c3b-fmstable-20190622v1
Mime-Version: 1.0
Message-Id: <8ea5cf27-c58c-442b-82ea-681acad30007@www.fastmail.com>
In-Reply-To: <9bcc3e74ccde028b05ca66a3145da8bf@krash.be>
References: <9bcc3e74ccde028b05ca66a3145da8bf@krash.be>
Date: Sat, 22 Jun 2019 22:23:50 +1000
From: "Steven Honson" <steven@honson.id.au>
To: wireguard@lists.zx2c4.com
Subject: =?UTF-8?Q?Re:_Wireguard_kernel_module_won't_load_on_kernel_4.19.0-5_(Deb?=
 =?UTF-8?Q?ian_sid/buster)?=
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
Content-Type: multipart/mixed; boundary="===============3009013770553810892=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============3009013770553810892==
Content-Type: multipart/alternative;
 boundary=391ff052e871438b9311e7415df1abbe

--391ff052e871438b9311e7415df1abbe
Content-Type: text/plain

Hi Nils,

I've been unable to reproduce this on a vanilla VM built using `vagrant init debian/buster64; vagrant up`:

root@buster:/home/vagrant# modprobe wireguard
root@buster:/home/vagrant# modinfo wireguard
filename: /lib/modules/4.19.0-5-amd64/updates/dkms/wireguard.ko
alias: net-pf-16-proto-16-family-wireguard
alias: rtnl-link-wireguard
version: 0.0.20190601
author: Jason A. Donenfeld <Jason@zx2c4.com>
description: WireGuard secure network tunnel
license: GPL v2
srcversion: 69000E9D4B2B253E97C189A
depends: udp_tunnel,ip6_udp_tunnel
retpoline: Y
name: wireguard
vermagic: 4.19.0-5-amd64 SMP mod_unload modversions
root@buster:/home/vagrant# dmesg | grep wireguard
[ 17.664193] wireguard: loading out-of-tree module taints kernel.
[ 17.664231] wireguard: module verification failed: signature and/or required key missing - tainting kernel
[ 17.665555] wireguard: WireGuard 0.0.20190601 loaded. See www.wireguard.com for information.
[ 17.665556] wireguard: Copyright (C) 2015-2019 Jason A. Donenfeld <Jason@zx2c4.com>. All Rights Reserved.
root@buster:/home/vagrant# uname -a
Linux buster 4.19.0-5-amd64 #1 SMP Debian 4.19.37-3 (2019-05-15) x86_64 GNU/Linux

The above output was from the WireGuard package from testing, I got similar results compiling WireGuard 0.0.20190601 from source too.

Can you check which version of the linux-image-4.19.0-5-amd64 package you have installed? I'm running 4.19.37-3 for reference.

Cheers,
Steven

On Fri, 21 Jun 2019, at 12:58 AM, Nils Cant wrote:
> Hello,
> 
> I'm unable to load the wireguard kernel module on Debian Sid or Debian Buster. (4.19.0-5-amd64 kernel)
> (Debian buster is scheduled to be promoted to stable in a couple of weeks)
> 
> root@buster:~# modprobe wireguard
> modprobe: ERROR: could not insert 'wireguard': Invalid argument
> root@buster:~# modinfo wireguard
> filename: /lib/modules/4.19.0-5-amd64/updates/dkms/wireguard.ko
> alias: net-pf-16-proto-16-family-wireguard
> alias: rtnl-link-wireguard
> version: 0.0.20190601
> author: Jason A. Donenfeld <Jason@zx2c4.com>
> description: WireGuard secure network tunnel
> license: GPL v2
> srcversion: 69000E9D4B2B253E97C189A
> depends: udp_tunnel,ip6_udp_tunnel
> retpoline: Y
> name: wireguard
> vermagic: 4.19.0-5-amd64 SMP mod_unload modversions
> 
> The same version seems to work fine on Debian Stretch (4.9.0-9) or Fedora Core 30 (5.1.11-300)
> 
> The kernel ring throws a number of symbol version errors:
> 
> [...]
> [ 97.450944] wireguard: loading out-of-tree module taints kernel.
> [ 97.453335] wireguard: module verification failed: signature and/or required key missing - tainting kernel
> [ 97.457727] wireguard: disagrees about version of symbol skb_put
> [ 97.459772] wireguard: Unknown symbol skb_put (err -22)
> [ 97.461555] wireguard: disagrees about version of symbol ip6_dst_hoplimit
> [ 97.463609] wireguard: Unknown symbol ip6_dst_hoplimit (err -22)
> [ 97.465590] wireguard: disagrees about version of symbol consume_skb
> [ 97.467495] wireguard: Unknown symbol consume_skb (err -22)
> [ 97.469326] wireguard: disagrees about version of symbol udp_sock_create4
> [...]
> 
> I have tried both the apt package from debian unstable, as well as compile from source.
> 
> Any idea what could be going wrong? Is this a Debian kernel bug?
> 
> 
> Thanks in advance,
> 
> Nils
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
> 

--391ff052e871438b9311e7415df1abbe
Content-Type: text/html
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head><title></title><style type=3D"text/css">p.Mso=
Normal,p.MsoNoSpacing{margin:0}</style></head><body><div>Hi Nils,<br></d=
iv><div><br></div><div>I've been unable to reproduce this on a vanilla V=
M built using `vagrant init debian/buster64; vagrant up`:<br></div><div>=
<br></div><div>root@buster:/home/vagrant# modprobe wireguard<br></div><d=
iv>root@buster:/home/vagrant# modinfo wireguard<br></div><div>filename:&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; /lib/modules/4.19.0-5-amd64/updates/=
dkms/wireguard.ko<br></div><div>alias:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp; net-pf-16-proto-16-family-wireguard<br></div><div>a=
lias:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; rtnl-link-wi=
reguard<br></div><div>version:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=
 0.0.20190601<br></div><div>author:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp; Jason A. Donenfeld &lt;<a href=3D"mailto:Jason@zx2c4.com">Ja=
son@zx2c4.com</a>&gt;<br></div><div>description:&nbsp;&nbsp;&nbsp; WireG=
uard secure network tunnel<br></div><div>license:&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp; GPL v2<br></div><div>srcversion:&nbsp;&nbsp;&nbsp;&n=
bsp; 69000E9D4B2B253E97C189A<br></div><div>depends:&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp; udp_tunnel,ip6_udp_tunnel<br></div><div>retpoline:=
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Y<br></div><div>name:&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; wireguard<br></div><div>vermagi=
c:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 4.19.0-5-amd64 SMP mod_unload mod=
versions<br></div><div>root@buster:/home/vagrant# dmesg | grep wireguard=
<br></div><div>[&nbsp;&nbsp; 17.664193] wireguard: loading out-of-tree m=
odule taints kernel.<br></div><div>[&nbsp;&nbsp; 17.664231] wireguard: m=
odule verification failed: signature and/or required key missing - taint=
ing kernel<br></div><div>[&nbsp;&nbsp; 17.665555] wireguard: WireGuard 0=
.0.20190601 loaded. See <a href=3D"http://www.wireguard.com">www.wiregua=
rd.com</a> for information.<br></div><div>[&nbsp;&nbsp; 17.665556] wireg=
uard: Copyright (C) 2015-2019 Jason A. Donenfeld &lt;<a href=3D"mailto:J=
ason@zx2c4.com">Jason@zx2c4.com</a>&gt;. All Rights Reserved.<br></div><=
div>root@buster:/home/vagrant# uname -a<br></div><div>Linux buster 4.19.=
0-5-amd64 #1 SMP Debian 4.19.37-3 (2019-05-15) x86_64 GNU/Linux<br></div=
><div><br></div><div>The above output was from the WireGuard package fro=
m testing, I got similar results compiling WireGuard 0.0.20190601 from s=
ource too.<br></div><div><br></div><div>Can you check which version of t=
he linux-image-4.19.0-5-amd64 package you have installed? I'm running 4.=
19.37-3 for reference.<br></div><div><br></div><div>Cheers,<br></div><di=
v>Steven<br></div><div><br></div><div>On Fri, 21 Jun 2019, at 12:58 AM, =
Nils Cant wrote:<br></div><blockquote type=3D"cite" id=3D"qt"><div style=
=3D"font-family:arial, sans-serif;font-size:13px;"><div>Hello,<br></div>=
<div><br></div><div>I'm unable to load the wireguard kernel module on De=
bian Sid or Debian Buster. (4.19.0-5-amd64 kernel)<br></div><div>(Debian=
 buster is scheduled to be promoted to stable in a couple of weeks)<br><=
/div><div><br></div><div>root@buster:~# modprobe wireguard<br></div><div=
>modprobe: ERROR: could not insert 'wireguard': Invalid argument<br></di=
v><div>root@buster:~# modinfo wireguard<br></div><div>filename: /lib/mod=
ules/4.19.0-5-amd64/updates/dkms/wireguard.ko<br></div><div>alias: net-p=
f-16-proto-16-family-wireguard<br></div><div>alias: rtnl-link-wireguard<=
br></div><div>version: 0.0.20190601<br></div><div>author: Jason A. Donen=
feld &lt;Jason@zx2c4.com&gt;<br></div><div>description: WireGuard secure=
 network tunnel<br></div><div>license: GPL v2<br></div><div>srcversion: =
69000E9D4B2B253E97C189A<br></div><div>depends: udp_tunnel,ip6_udp_tunnel=
<br></div><div>retpoline: Y<br></div><div>name: wireguard<br></div><div>=
vermagic: 4.19.0-5-amd64 SMP mod_unload modversions<br></div><div><br></=
div><div>The same version seems to work fine on Debian Stretch (4.9.0-9)=
 or Fedora Core 30 (5.1.11-300)<br></div><div><br></div><div>The kernel =
ring throws a number of symbol version errors:<br></div><div><br></div><=
div>[...]<br></div><div>[ 97.450944] wireguard: loading out-of-tree modu=
le taints kernel.<br></div><div>[ 97.453335] wireguard: module verificat=
ion failed: signature and/or required key missing - tainting kernel<br><=
/div><div>[ 97.457727] wireguard: disagrees about version of symbol skb_=
put<br></div><div>[ 97.459772] wireguard: Unknown symbol skb_put (err -2=
2)<br></div><div>[ 97.461555] wireguard: disagrees about version of symb=
ol ip6_dst_hoplimit<br></div><div>[ 97.463609] wireguard: Unknown symbol=
 ip6_dst_hoplimit (err -22)<br></div><div>[ 97.465590] wireguard: disagr=
ees about version of symbol consume_skb<br></div><div>[ 97.467495] wireg=
uard: Unknown symbol consume_skb (err -22)<br></div><div>[ 97.469326] wi=
reguard: disagrees about version of symbol udp_sock_create4<br></div><di=
v>[...]<br></div><div><br></div><div>I have tried both the apt package f=
rom debian unstable, as well as compile from source.<br></div><div><br><=
/div><div>Any idea what could be going wrong? Is this a Debian kernel bu=
g?<br></div><div><br></div><div><br></div><div>Thanks in advance,<br></d=
iv><div><br></div><div>Nils<br></div></div><div>________________________=
_______________________<br></div><div>WireGuard mailing list<br></div><d=
iv>WireGuard@lists.zx2c4.com<br></div><div>https://lists.zx2c4.com/mailm=
an/listinfo/wireguard<br></div><div><br></div></blockquote><div><br></di=
v></body></html>
--391ff052e871438b9311e7415df1abbe--

--===============3009013770553810892==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============3009013770553810892==--
