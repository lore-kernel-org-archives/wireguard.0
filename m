Return-Path: <SRS0=FiAf=34=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,
	MIME_QP_LONG_LINE,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96E15C35242
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  8 Feb 2020 22:00:11 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 14DB520720
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  8 Feb 2020 22:00:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (4096-bit key) header.d=kolabnow.com header.i=@kolabnow.com header.b="R7mKPNY+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 14DB520720
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=alexburke.ca
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b7c4ef44;
	Sat, 8 Feb 2020 21:58:47 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7226a337
 for <wireguard@lists.zx2c4.com>; Sat, 8 Feb 2020 21:37:52 +0000 (UTC)
Received: from mx.kolabnow.com (mx.kolabnow.com [95.128.36.41])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bbf90572
 for <wireguard@lists.zx2c4.com>; Sat, 8 Feb 2020 21:37:52 +0000 (UTC)
Received: from localhost (unknown [127.0.0.1])
 by ext-mx-out001.mykolab.com (Postfix) with ESMTP id 60214F84;
 Sat,  8 Feb 2020 22:39:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kolabnow.com; h=
 in-reply-to:references:message-id:date:date:subject:subject
 :mime-version:from:from:content-transfer-encoding:content-type
 :content-type:received:received:received; s=dkim20160331; t=
 1581197951; x=1583012352; bh=t0ZiYNDjcjIj1kLs1OXebe8fzUtqqt5xDxX
 aUIvxEMs=; b=R7mKPNY+myOmhb1Ui7io8LJFi6qk7dNg//OlPSzQUXEiqeRGlkU
 A75qPsbhDMPFjbvHG3yD8Cy9fnFAn3Fla2fXeqEn1GamjJKNOuZ/jvl/1UyjPpwe
 kPTVfwdH3mmR8AfLIufkfUqMCQaYfyCeoqk3ckfrWnhrS6CDbsSqfjqJQ9n3Hkrw
 6nP1iIWO4xGiUjWzMVqvRZn994b7H5xvpo5bISzf3ryr+OGqSjN8Tqf7LP6WQsOG
 6R4CuzTDZMI34Ch3aUlLGWbbwtnvZyo3YQYp8gNW6h1eu8CEyH3IHkbxvz39BYif
 nDMbX/iaDPWo8RjnVORltSQWyr9doSLXrbmGPXztX7lN1kEVcgrBSQocUu3U7Cpo
 mkXyBwADokR7sCm6lund07yFw6DeR47VqM1pnVgJ6LYzjEqM467KyNT0ItqkpYXx
 /vEWiA8+hj+O0IEn6q22HweOaLqQEHBYRJouIAxgCbp6f8mG4gP71yJ2SZdJ5eOQ
 tweOMlS7MimHTsA/EMQ1AO/TGvm4EtuWNcj7iS6utjiABtVa69kbQIpoReWbOBe1
 H3rgt4Nea0sUuuDNkrfGtlboEpFy30mzcuSR4Z3MxG3CnVSvieer9Vf4koNfXi6h
 brcSEEMj4UWcCkIYHnO0whxO9c29joE1h/4+yH54NDxHT2pi+AWf+j0o=
X-Virus-Scanned: amavisd-new at mykolab.com
Received: from mx.kolabnow.com ([127.0.0.1])
 by localhost (ext-mx-out001.mykolab.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MyX32pbiXz4K; Sat,  8 Feb 2020 22:39:11 +0100 (CET)
Received: from int-mx001.mykolab.com (unknown [10.9.13.1])
 by ext-mx-out001.mykolab.com (Postfix) with ESMTPS id 9F4DBA15;
 Sat,  8 Feb 2020 22:39:10 +0100 (CET)
Received: from ext-subm003.mykolab.com (unknown [10.9.6.3])
 by int-mx001.mykolab.com (Postfix) with ESMTPS id B2AE73C7;
 Sat,  8 Feb 2020 22:39:08 +0100 (CET)
From: Alex Burke <alex@alexburke.ca>
Mime-Version: 1.0 (1.0)
Subject: Re: Usability issue in MacOS
Date: Sat, 8 Feb 2020 22:39:04 +0100
Message-Id: <4F546589-A0CC-40E7-A414-D5835D81ACAA@alexburke.ca>
References: <CAJFy1VX+ue2JskKZEjnOkMdC6sGVLU=fUSZ_BNOqD__SpZ5EYg@mail.gmail.com>
In-Reply-To: <CAJFy1VX+ue2JskKZEjnOkMdC6sGVLU=fUSZ_BNOqD__SpZ5EYg@mail.gmail.com>
To: Yoni Leitersdorf <litelite@gmail.com>
X-Mailman-Approved-At: Sat, 08 Feb 2020 22:58:46 +0100
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
Content-Type: multipart/mixed; boundary="===============8751914061411371810=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>


--===============8751914061411371810==
Content-Type: multipart/alternative; boundary=Apple-Mail-A9791912-244F-4261-9455-9BA5ED9CB715
Content-Transfer-Encoding: 7bit


--Apple-Mail-A9791912-244F-4261-9455-9BA5ED9CB715
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hey Yoni,

This is consistent with Apple's terminology [0], which I agree is not intuit=
ive.

Cheers,
Alex

[0] https://developer.apple.com/documentation/networkextension/personal_vpn/=
vpn_on_demand_rules


> El 8 febr 2020, a les 22:25, Yoni Leitersdorf <litelite@gmail.com> va escr=
iure:
>=20
> =EF=BB=BF
> When configuring a tunnel in the MacOS client, there's an option called "O=
n-Demand". If Ethernet and/or Wi-Fi are checked, the client will auto-connec=
t the tunnel.
>=20
> It's a great feature, but the term "On-Demand" is misleading. I would sugg=
est "Auto-Connect" or "Auto-Establish" instead.
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard

--Apple-Mail-A9791912-244F-4261-9455-9BA5ED9CB715
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto"><div dir=3D"ltr">Hey Yoni,</div><div dir=3D=
"ltr"><br></div><div dir=3D"ltr">This is consistent with Apple's terminology=
 [0], which I agree is not intuitive.</div><div dir=3D"ltr"><br></div><div d=
ir=3D"ltr">Cheers,</div><div dir=3D"ltr">Alex</div><div dir=3D"ltr"><br></di=
v><div dir=3D"ltr">[0]&nbsp;<a href=3D"https://developer.apple.com/documenta=
tion/networkextension/personal_vpn/vpn_on_demand_rules">https://developer.ap=
ple.com/documentation/networkextension/personal_vpn/vpn_on_demand_rules</a><=
/div><div dir=3D"ltr"><br></div><div dir=3D"ltr"><br><blockquote type=3D"cit=
e">El 8 febr 2020, a les 22:25, Yoni Leitersdorf &lt;litelite@gmail.com&gt; v=
a escriure:<br><br></blockquote></div><blockquote type=3D"cite"><div dir=3D"=
ltr">=EF=BB=BF<div dir=3D"ltr">When configuring a tunnel in the MacOS client=
, there's an option called "On-Demand". If Ethernet and/or Wi-Fi are checked=
, the client will auto-connect the tunnel.<div><br></div><div>It's a great f=
eature, but the term "On-Demand" is misleading. I would suggest "Auto-Connec=
t" or "Auto-Establish" instead.</div></div>
<span>_______________________________________________</span><br><span>WireGu=
ard mailing list</span><br><span>WireGuard@lists.zx2c4.com</span><br><span>h=
ttps://lists.zx2c4.com/mailman/listinfo/wireguard</span><br></div></blockquo=
te></body></html>=

--Apple-Mail-A9791912-244F-4261-9455-9BA5ED9CB715--

--===============8751914061411371810==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============8751914061411371810==--
