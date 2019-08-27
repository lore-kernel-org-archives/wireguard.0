Return-Path: <SRS0=ZPcD=WX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 900D3C3A5A3
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 27 Aug 2019 07:35:51 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D410622CF8
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 27 Aug 2019 07:35:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D410622CF8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=intnet.mu
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 337e83bc;
	Tue, 27 Aug 2019 07:35:49 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 58c1789d
 for <wireguard@lists.zx2c4.com>;
 Tue, 27 Aug 2019 07:35:46 +0000 (UTC)
Received: from smtp2.intnet.mu (mta06.intnet.mu [196.20.130.6])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8a27944b
 for <wireguard@lists.zx2c4.com>;
 Tue, 27 Aug 2019 07:35:46 +0000 (UTC)
Received: from adsl-151-245.myt.mu (HELO ys-hkm-ysn-lbd.eh-zohr)
 ([41.212.151.245])
 by smtp2.intnet.mu with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
 27 Aug 2019 11:35:42 +0400
From: Vincent <mercier@intnet.mu>
Message-Id: <F1E42EF5-FCB7-4438-9A12-70C43C85DB3A@intnet.mu>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Subject: Re: [ANNOUNCE] OPNsense 19.7 supports WireGuard
Date: Tue, 27 Aug 2019 11:35:40 +0400
In-Reply-To: <8f65fe2a-d5ab-931c-75fa-850433a53bf1@spam-fetish.org>
To: "Muenz, Michael" <m.muenz@spam-fetish.org>
References: <DDEE689A-E2B5-414A-8233-F08B06278F0B@intnet.mu>
 <8f65fe2a-d5ab-931c-75fa-850433a53bf1@spam-fetish.org>
X-Mailer: Apple Mail (2.3445.9.1)
Cc: wireguard@lists.zx2c4.com
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
Content-Type: multipart/mixed; boundary="===============1523686158140078720=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>


--===============1523686158140078720==
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_150E35E3-CB10-40F0-98AD-C6F1564CDD55"


--Apple-Mail=_150E35E3-CB10-40F0-98AD-C6F1564CDD55
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii

yes, thx, got it


Vincent Mercier
mercier@intnet.mu <mailto:mercier@intnet.mu?subject=3Dre:> - (+230) 5256 =
8254 <callto:+23052568254> <mailto:mercier@intnet.mu?subject=3Dre:> -  =
<callto:+2302568254>iptel : 82568254 <sip: 82568254@iptel.org>

> On 27 Aug 2019, at 09:15, Muenz, Michael <m.muenz@spam-fetish.org> =
wrote:
>=20
> Am 27.08.2019 um 06:28 schrieb Vincent:
>> Is there any particular tweeks required to install the announed =
wireguard in opnsense?
>> non listed under plugin and neither pkg install in opnsense 19.7.2
>>=20
>>=20
>>=20
> Ah, you are running 32bit version? WireGuard depends on Go which has =
some nasty compilation errors on FreeBSD/32bit, so it's only supported =
for 64bit installations.
>=20
>=20
> Best,
>=20
> Michael
>=20


--Apple-Mail=_150E35E3-CB10-40F0-98AD-C6F1564CDD55
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D"">yes, =
thx, got it<div class=3D""><br class=3D""></div><div class=3D""><br =
class=3D""></div><div class=3D""><div class=3D"">
<strong class=3D"" style=3D"font-family: 'Lucida Grande', Verdana, =
Arial, sans-serif; font-size: 10px;">Vincent Mercier</strong><br =
class=3D"" style=3D"font-family: 'Lucida Grande', Verdana, Arial, =
sans-serif; font-size: 10px;"><a =
href=3D"mailto:mercier@intnet.mu?subject=3Dre:" class=3D"" =
style=3D"font-family: 'Lucida Grande', Verdana, Arial, sans-serif; =
font-size: 10px; text-decoration: none; color: rgb(0, 125, =
154);">mercier@intnet.mu</a><span style=3D"font-family: 'Lucida Grande', =
Verdana, Arial, sans-serif; font-size: 10px;" =
class=3D"">&nbsp;-&nbsp;</span><a href=3D"callto:+23052568254" class=3D"" =
style=3D"font-family: 'Lucida Grande', Verdana, Arial, sans-serif; =
font-size: 10px; text-decoration: none; color: rgb(0, 125, 154);">(+230) =
5256 8254</a><a href=3D"mailto:mercier@intnet.mu?subject=3Dre:" class=3D""=
 style=3D"font-family: 'Lucida Grande', Verdana, Arial, sans-serif; =
font-size: 10px; text-decoration: none; color: rgb(0, 125, =
154);"></a><span style=3D"font-family: 'Lucida Grande', Verdana, Arial, =
sans-serif; font-size: 10px;" class=3D"">&nbsp;-&nbsp;</span><a =
href=3D"callto:+2302568254" class=3D"" style=3D"font-family: 'Lucida =
Grande', Verdana, Arial, sans-serif; font-size: 10px; text-decoration: =
none; color: rgb(0, 125, 154);"></a><span style=3D"font-family: 'Lucida =
Grande', Verdana, Arial, sans-serif; font-size: 10px;" class=3D"">iptel =
:&nbsp;</span><a href=3D"SIP: 82568254@iptel.org" class=3D"" =
style=3D"font-family: 'Lucida Grande', Verdana, Arial, sans-serif; =
font-size: 10px; text-decoration: none; color: rgb(0, 125, =
154);">82568254</a>
</div>
<div style=3D""><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">On 27 Aug 2019, at 09:15, Muenz, Michael &lt;<a =
href=3D"mailto:m.muenz@spam-fetish.org" =
class=3D"">m.muenz@spam-fetish.org</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div class=3D"">Am =
27.08.2019 um 06:28 schrieb Vincent:<br class=3D""><blockquote =
type=3D"cite" class=3D"">Is there any particular tweeks required to =
install the announed wireguard in opnsense?<br class=3D"">non listed =
under plugin and neither pkg install in opnsense 19.7.2<br class=3D""><br =
class=3D""><br class=3D""><br class=3D""></blockquote>Ah, you are =
running 32bit version? WireGuard depends on Go which has some nasty =
compilation errors on FreeBSD/32bit, so it's only supported for 64bit =
installations.<br class=3D""><br class=3D""><br class=3D"">Best,<br =
class=3D""><br class=3D"">Michael<br class=3D""><br =
class=3D""></div></div></blockquote></div><br =
class=3D""></div></body></html>=

--Apple-Mail=_150E35E3-CB10-40F0-98AD-C6F1564CDD55--

--===============1523686158140078720==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============1523686158140078720==--
