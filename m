Return-Path: <SRS0=KrVi=4C=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,MAILING_LIST_MULTI,MIME_QP_LONG_LINE,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66951C3B1BF
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 14 Feb 2020 23:42:12 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 168F0222C4
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 14 Feb 2020 23:42:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 168F0222C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pallas.us
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8c0b4c94;
	Fri, 14 Feb 2020 23:40:01 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6945443e
 for <wireguard@lists.zx2c4.com>;
 Fri, 14 Feb 2020 23:39:57 +0000 (UTC)
Received: from telperion.info (telperion.info [66.160.141.240])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cae57891
 for <wireguard@lists.zx2c4.com>;
 Fri, 14 Feb 2020 23:39:57 +0000 (UTC)
Received: from [192.168.127.216] (184-23-8-77.dsl.static.fusionbroadband.com
 [::ffff:184.23.8.77])
 (AUTH: LOGIN pallas, TLS: TLS1.3,128bits,ECDHE_RSA_AES_128_GCM_SHA256)
 by telperion.info with ESMTPSA
 id 0000000000044094.000000005E47302E.0000686B; Fri, 14 Feb 2020 15:41:33 -0800
From: Derrick Lyndon Pallas <derrick@pallas.us>
Mime-Version: 1.0 (1.0)
Subject: Re: CryptoKey Routing Management for Peers
Date: Fri, 14 Feb 2020 15:40:33 -0800
Message-Id: <1FB426DC-C314-4DBE-BEF9-2A35D49094C4@pallas.us>
References: <CA+w0pKY0KGCBAPYqoTReXdDmB22ctWkczEoK-FFxoR3B8b0wzw@mail.gmail.com>
In-Reply-To: <CA+w0pKY0KGCBAPYqoTReXdDmB22ctWkczEoK-FFxoR3B8b0wzw@mail.gmail.com>
To: Barrett Strausser <barrett@bossanova.com>
X-Mailer: iPhone Mail (17D50)
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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
Content-Type: multipart/mixed; boundary="===============3915432865485896128=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>


--===============3915432865485896128==
Content-Type: multipart/alternative; boundary=Apple-Mail-1D2561C2-CC40-4EF3-9097-D8A8B3480A45
Content-Transfer-Encoding: 7bit


--Apple-Mail-1D2561C2-CC40-4EF3-9097-D8A8B3480A45
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

You might also want to check out https://pypi.org/project/wgnlpy/ which is a=
 Wireguard configuration library for python.

~Derrick =E2=80=A2 iPhone

> On Feb 14, 2020, at 3:02 AM, Barrett Strausser <barrett@bossanova.com> wro=
te:
>=20
> =EF=BB=BF
> I don't doubt that it can handle 1M peers.=20
>=20
> My question was more concerned with can an Organization perform the config=
uration management to handle 1M peers if all configuration is through a stat=
ic IP.
>=20
> If I have 1M peers and .9999 have no change per day, that still leaves 100=
 changes or ~4 per hour. I'd argue it is a good practice to have to restart s=
ervices to pick up those changes.
>=20
> I'll have a look at those links. Thank you very much
>=20
> -b
>=20
>=20
>=20
>> On Sat, Feb 8, 2020 at 4:29 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote=
:
>> WireGuard has an API, via Netlink. This might help you:
>>=20
>> https://git.zx2c4.com/wireguard-tools/tree/contrib/embeddable-wg-library
>> https://git.zx2c4.com/wireguard-tools/tree/src/uapi/linux/wireguard.h
>>=20
>> It can handle 1M peers, yes.
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard

--Apple-Mail-1D2561C2-CC40-4EF3-9097-D8A8B3480A45
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto">You might also want to check out&nbsp;<a hr=
ef=3D"https://pypi.org/project/wgnlpy/">https://pypi.org/project/wgnlpy/</a>=
&nbsp;which is a Wireguard configuration library for python.<br><br><div dir=
=3D"ltr">~Derrick&nbsp;=E2=80=A2 iPhone</div><div dir=3D"ltr"><br><blockquot=
e type=3D"cite">On Feb 14, 2020, at 3:02 AM, Barrett Strausser &lt;barrett@b=
ossanova.com&gt; wrote:<br><br></blockquote></div><blockquote type=3D"cite">=
<div dir=3D"ltr">=EF=BB=BF<div dir=3D"ltr">I don't doubt that it can handle 1=
M peers.&nbsp;<div><br></div><div>My question was more concerned with can an=
 <i>Organization </i>perform the configuration management to handle 1M peers=
 if all configuration is through a static IP.</div><div><br></div><div>If I h=
ave 1M peers and .9999 have no change per day, that still leaves 100 changes=
 or ~4 per hour. I'd argue it is a good practice to have to restart services=
 to pick up those changes.</div><div><br></div><div>I'll have a look at thos=
e links. Thank you very much</div><div><br></div><div>-b</div><div><br></div=
><div><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Sat, Feb 8, 2020 at 4:29 PM Jason A. Donenfeld &lt;<a href=3D=
"mailto:Jason@zx2c4.com">Jason@zx2c4.com</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">WireGuard has an API, via Netlink. Thi=
s might help you:<br>
<br>
<a href=3D"https://git.zx2c4.com/wireguard-tools/tree/contrib/embeddable-wg-=
library" rel=3D"noreferrer" target=3D"_blank">https://git.zx2c4.com/wireguar=
d-tools/tree/contrib/embeddable-wg-library</a><br>
<a href=3D"https://git.zx2c4.com/wireguard-tools/tree/src/uapi/linux/wiregua=
rd.h" rel=3D"noreferrer" target=3D"_blank">https://git.zx2c4.com/wireguard-t=
ools/tree/src/uapi/linux/wireguard.h</a><br>
<br>
It can handle 1M peers, yes.<br>
</blockquote></div>
<span>_______________________________________________</span><br><span>WireGu=
ard mailing list</span><br><span>WireGuard@lists.zx2c4.com</span><br><span>h=
ttps://lists.zx2c4.com/mailman/listinfo/wireguard</span><br></div></blockquo=
te></body></html>=

--Apple-Mail-1D2561C2-CC40-4EF3-9097-D8A8B3480A45--

--===============3915432865485896128==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============3915432865485896128==--
