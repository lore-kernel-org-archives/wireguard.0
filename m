Return-Path: <SRS0=lEMV=UV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2417AC43613
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 22 Jun 2019 07:50:50 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8798F2089E
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 22 Jun 2019 07:50:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8798F2089E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=krash.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 800d7d28;
	Sat, 22 Jun 2019 07:50:32 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a60bc0af
 for <wireguard@lists.zx2c4.com>;
 Thu, 20 Jun 2019 14:58:26 +0000 (UTC)
Received: from piranha.krash.be (piranha.krash.be [IPv6:2a01:4f8:192:7148::8])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3c27da40
 for <wireguard@lists.zx2c4.com>;
 Thu, 20 Jun 2019 14:58:26 +0000 (UTC)
Received: from rainloop.krash.be (koi.krash.be [144.76.116.88])
 by piranha.krash.be (Postfix) with ESMTPSA id 4DA2710031387
 for <wireguard@lists.zx2c4.com>; Thu, 20 Jun 2019 16:58:23 +0200 (CEST)
MIME-Version: 1.0
Date: Thu, 20 Jun 2019 14:58:24 +0000
X-Mailer: RainLoop/1.12.1
From: "Nils Cant" <nils@krash.be>
Message-ID: <9bcc3e74ccde028b05ca66a3145da8bf@krash.be>
Subject: Wireguard kernel module won't load on kernel 4.19.0-5 (Debian
 sid/buster)
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Sat, 22 Jun 2019 09:50:24 +0200
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
Content-Type: multipart/mixed; boundary="===============8299081086566324487=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>


--===============8299081086566324487==
Content-Type: multipart/alternative;
 boundary="--=_RainLoop_555_262225681.1561042704"


----=_RainLoop_555_262225681.1561042704
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hello,=0A=0AI'm unable to load the wireguard kernel module on Debian Sid =
or Debian Buster. (4.19.0-5-amd64 kernel)=0A(Debian buster is scheduled t=
o be promoted to stable in a couple of weeks)=0A=0Aroot@buster:~# modprob=
e wireguard=0Amodprobe: ERROR: could not insert 'wireguard': Invalid argu=
ment=0Aroot@buster:~# modinfo wireguard=0Afilename: /lib/modules/4.19.0-5=
-amd64/updates/dkms/wireguard.ko=0Aalias: net-pf-16-proto-16-family-wireg=
uard=0Aalias: rtnl-link-wireguard=0Aversion: 0.0.20190601=0Aauthor: Jason=
 A. Donenfeld <Jason@zx2c4.com>=0Adescription: WireGuard secure network t=
unnel=0Alicense: GPL v2=0Asrcversion: 69000E9D4B2B253E97C189A=0Adepends: =
udp_tunnel,ip6_udp_tunnel=0Aretpoline: Y=0Aname: wireguard=0Avermagic: 4.=
19.0-5-amd64 SMP mod_unload modversions=0A=0AThe same version seems to wo=
rk fine on Debian Stretch (4.9.0-9) or Fedora Core 30 (5.1.11-300)=0A=0AT=
he kernel ring throws a number of symbol version errors:=0A=0A[...]=0A[ 9=
7.450944] wireguard: loading out-of-tree module taints kernel.=0A[ 97.453=
335] wireguard: module verification failed: signature and/or required key=
 missing - tainting kernel=0A[ 97.457727] wireguard: disagrees about vers=
ion of symbol skb_put=0A[ 97.459772] wireguard: Unknown symbol skb_put (e=
rr -22)=0A[ 97.461555] wireguard: disagrees about version of symbol ip6_d=
st_hoplimit=0A[ 97.463609] wireguard: Unknown symbol ip6_dst_hoplimit (er=
r -22)=0A[ 97.465590] wireguard: disagrees about version of symbol consum=
e_skb=0A[ 97.467495] wireguard: Unknown symbol consume_skb (err -22)=0A[ =
97.469326] wireguard: disagrees about version of symbol udp_sock_create4=
=0A[...]=0A=0AI have tried both the apt package from debian unstable, as =
well as compile from source.=0A=0AAny idea what could be going wrong? Is =
this a Debian kernel bug?=0AThanks in advance,=0A=0ANils

----=_RainLoop_555_262225681.1561042704
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE html><html><head><meta http-equiv=3D"Content-Type" content=3D"t=
ext/html; charset=3Dutf-8" /></head><body><div data-html-editor-font-wrap=
per=3D"true" style=3D"font-family: arial, sans-serif; font-size: 13px;">H=
ello,<br><br>I'm unable to load the wireguard kernel module on Debian Sid=
 or Debian Buster. (4.19.0-5-amd64 kernel)<br>(Debian buster is scheduled=
 to be promoted to stable in a couple of weeks)<br><br>root@buster:~# mod=
probe wireguard<br>modprobe: ERROR: could not insert 'wireguard': Invalid=
 argument<br>root@buster:~# modinfo wireguard<br>filename: /lib/modules/4=
.19.0-5-amd64/updates/dkms/wireguard.ko<br>alias: net-pf-16-proto-16-fami=
ly-wireguard<br>alias: rtnl-link-wireguard<br>version: 0.0.20190601<br>au=
thor: Jason A. Donenfeld &lt;Jason@zx2c4.com&gt;<br>description: WireGuar=
d secure network tunnel<br>license: GPL v2<br>srcversion: 69000E9D4B2B253=
E97C189A<br>depends: udp_tunnel,ip6_udp_tunnel<br>retpoline: Y<br>name: w=
ireguard<br>vermagic: 4.19.0-5-amd64 SMP mod_unload modversions<br><br>Th=
e same version seems to work fine on Debian Stretch (4.9.0-9) or Fedora C=
ore 30 (5.1.11-300)<br><br>The kernel ring throws a number of symbol vers=
ion errors:<br><br>[...]<br>[ 97.450944] wireguard: loading out-of-tree m=
odule taints kernel.<br>[ 97.453335] wireguard: module verification faile=
d: signature and/or required key missing - tainting kernel<br>[ 97.457727=
] wireguard: disagrees about version of symbol skb_put<br>[ 97.459772] wi=
reguard: Unknown symbol skb_put (err -22)<br>[ 97.461555] wireguard: disa=
grees about version of symbol ip6_dst_hoplimit<br>[ 97.463609] wireguard:=
 Unknown symbol ip6_dst_hoplimit (err -22)<br>[ 97.465590] wireguard: dis=
agrees about version of symbol consume_skb<br>[ 97.467495] wireguard: Unk=
nown symbol consume_skb (err -22)<br>[ 97.469326] wireguard: disagrees ab=
out version of symbol udp_sock_create4<br>[...]<br><br>I have tried both =
the apt package from debian unstable, as well as compile from source.<br>=
<br>Any idea what could be going wrong? Is this a Debian kernel bug?<br><=
br><br>Thanks in advance,<br><br>Nils<br> </div></body></html>

----=_RainLoop_555_262225681.1561042704--

--===============8299081086566324487==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============8299081086566324487==--
