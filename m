Return-Path: <SRS0=FiAf=34=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E87D4C35242
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  8 Feb 2020 21:24:34 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E9DD22522
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  8 Feb 2020 21:24:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bossanova.com header.i=@bossanova.com header.b="Fv+SKpJe"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E9DD22522
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bossanova.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e2fb42f8;
	Sat, 8 Feb 2020 21:20:51 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ee89398f
 for <wireguard@lists.zx2c4.com>; Fri, 7 Feb 2020 16:22:22 +0000 (UTC)
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 28ae186b
 for <wireguard@lists.zx2c4.com>; Fri, 7 Feb 2020 16:22:21 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id w12so3409226wrt.2
 for <wireguard@lists.zx2c4.com>; Fri, 07 Feb 2020 08:23:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bossanova.com; s=bossanova;
 h=mime-version:from:date:message-id:subject:to;
 bh=GQ86HiNxxPbqWjsG7Kwn1PEfimU2PKCB1jNPxeKVLFw=;
 b=Fv+SKpJe8k1ra8av0YNvZLU+MWecispO/4P5uxSzXPWuLDQlhy+C2mwHOc+3WKSM7v
 mNGeJSgRulk96rBEAB4AUzmmlj60ksG7irxIg/ddVpdULd8l2UOCSepEjCn4STDmT852
 kUDFMXAGczmmFdlaOCm7rMVJrQRx3yAzLqAKoHGTvC6A8p+JTyjBRQ9Ql/PrIn/lJDoy
 PK9dJxDQSjmHcQNRdZkWCSlED+TIJRN9ajDxNFANMXj5femC9JISBOONdOPpHs2yK/Tw
 AbpJtdwheO8xoMtRkkT85axWsQJFZpIGXHdNl45BTA64EDuxEAxpQomo9yKTT2FoPYw+
 b/Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=GQ86HiNxxPbqWjsG7Kwn1PEfimU2PKCB1jNPxeKVLFw=;
 b=Bh1IczEQq7k7d+GVt1HlRvz0Qn2JeM4IsZv8rRm8N382b5KW89oIpHj6sBA1fZSt08
 GLzKxyt6eXg0aJYcMkrBCNvzGikK5PvcjtflUujLs2X1SrrklBvefXRA4vz0dWnoYPCR
 nrxqr9WmsUPEJkUDpryVGJDeh8tmvUgIzE2yhHQMmWuCoKR074YKIcSaw5TZVjoGpwG4
 M+DN/mV8cVqdIMk+xbjIN74fD+Sz8Kakm7rpPYiT0uveS06ZM8kWq38Ko+RflgT1I1yU
 UHQlSROz/5iaQgeeHjsz1bMwINen6yVyBLXrUDbbKfF3N6ljwT2qsu+S1ubMvjCjvahc
 kv0Q==
X-Gm-Message-State: APjAAAW/3LZIkpwceNSHYW50WmDHNN+pdVEZ5IKJFdggBOFEehTZ6BAW
 iDh6b/sR2r8zR7mmaQoXWpMFezpQyl/zjAy1PTQkf7cinkM=
X-Google-Smtp-Source: APXvYqxtZuVyMW6LCdTzbJ1d/3cJERlr2zcUZSqbTSHh8FpYdJP8CwrQZ53GybDC7s5Fa5L+fHp4TOGsh5cn78crzzI=
X-Received: by 2002:adf:cd04:: with SMTP id w4mr5807714wrm.219.1581092613033; 
 Fri, 07 Feb 2020 08:23:33 -0800 (PST)
MIME-Version: 1.0
From: Barrett Strausser <barrett@bossanova.com>
Date: Fri, 7 Feb 2020 11:23:22 -0500
Message-ID: <CA+w0pKbV0bUrYfvnZ82Nam2oCODGG5_hv4d+AzqYXvuto3Y_vg@mail.gmail.com>
Subject: CryptoKey Routing Management for Peers
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Sat, 08 Feb 2020 22:20:49 +0100
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
Content-Type: multipart/mixed; boundary="===============7674935445951166861=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============7674935445951166861==
Content-Type: multipart/alternative; boundary="0000000000008ea856059dfecffc"

--0000000000008ea856059dfecffc
Content-Type: text/plain; charset="UTF-8"

Hello All,

I have question correlated but not exactly related to Wireguard.

Following the lines on the project page "It is suitable for both small
embedded devices like smartphones and fully loaded backbone routers"

How are folks thinking about the management of the CryptoKey Routing for
large number of peers especially embedded devices. I have on order of 100K
- 1M Devices.

Would Wireguard ever consider a API/Interface call instead of a static file?

Thank you all,

-Barrett

--0000000000008ea856059dfecffc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div style=3D"text-align:justify"><font color=3D"#2c3e50" =
face=3D"Lato, Helvetica Neue, Helvetica, Arial, sans-serif"><span style=3D"=
font-size:15px">Hello All,</span></font></div><div style=3D"text-align:just=
ify"><font color=3D"#2c3e50" face=3D"Lato, Helvetica Neue, Helvetica, Arial=
, sans-serif"><span style=3D"font-size:15px"><br></span></font></div><div s=
tyle=3D"text-align:justify"><font color=3D"#2c3e50" face=3D"Lato, Helvetica=
 Neue, Helvetica, Arial, sans-serif"><span style=3D"font-size:15px">I have =
question correlated but not exactly related to Wireguard.</span></font></di=
v><div style=3D"text-align:justify"><font color=3D"#2c3e50" face=3D"Lato, H=
elvetica Neue, Helvetica, Arial, sans-serif"><span style=3D"font-size:15px"=
><br></span></font></div><div style=3D"text-align:justify"><font color=3D"#=
2c3e50" face=3D"Lato, Helvetica Neue, Helvetica, Arial, sans-serif"><span s=
tyle=3D"font-size:15px">Following the lines on the project page &quot;I</sp=
an></font><span style=3D"color:rgb(44,62,80);font-family:Lato,&quot;Helveti=
ca Neue&quot;,Helvetica,Arial,sans-serif;font-size:15px">t is suitable for =
both small embedded devices like smartphones and fully loaded backbone rout=
ers&quot;</span></div><div style=3D"text-align:justify"><span style=3D"colo=
r:rgb(44,62,80);font-family:Lato,&quot;Helvetica Neue&quot;,Helvetica,Arial=
,sans-serif;font-size:15px"><br></span></div><div style=3D"text-align:justi=
fy"><span style=3D"color:rgb(44,62,80);font-family:Lato,&quot;Helvetica Neu=
e&quot;,Helvetica,Arial,sans-serif;font-size:15px">How are folks thinking=
=C2=A0about the management of the CryptoKey Routing for large number of pee=
rs especially embedded devices. I have on order of 100K - 1M Devices.</span=
></div><div style=3D"text-align:justify"><span style=3D"color:rgb(44,62,80)=
;font-family:Lato,&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif;fon=
t-size:15px"><br></span></div><div style=3D"text-align:justify"><span style=
=3D"color:rgb(44,62,80);font-family:Lato,&quot;Helvetica Neue&quot;,Helveti=
ca,Arial,sans-serif;font-size:15px">Would Wireguard ever consider a API/Int=
erface call instead of a static file?</span></div><div style=3D"text-align:=
justify"><span style=3D"color:rgb(44,62,80);font-family:Lato,&quot;Helvetic=
a Neue&quot;,Helvetica,Arial,sans-serif;font-size:15px"><br></span></div><d=
iv style=3D"text-align:justify"><span style=3D"color:rgb(44,62,80);font-fam=
ily:Lato,&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif;font-size:15=
px">Thank you all,</span></div><div style=3D"text-align:justify"><span styl=
e=3D"color:rgb(44,62,80);font-family:Lato,&quot;Helvetica Neue&quot;,Helvet=
ica,Arial,sans-serif;font-size:15px"><br></span></div><div style=3D"text-al=
ign:justify"><span style=3D"color:rgb(44,62,80);font-family:Lato,&quot;Helv=
etica Neue&quot;,Helvetica,Arial,sans-serif;font-size:15px">-Barrett</span>=
</div><div style=3D"text-align:justify"><span style=3D"color:rgb(44,62,80);=
font-family:Lato,&quot;Helvetica Neue&quot;,Helvetica,Arial,sans-serif;font=
-size:15px"><br></span></div><div style=3D"text-align:justify"><span style=
=3D"color:rgb(44,62,80);font-family:Lato,&quot;Helvetica Neue&quot;,Helveti=
ca,Arial,sans-serif;font-size:15px"><br></span></div></div>

--0000000000008ea856059dfecffc--

--===============7674935445951166861==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============7674935445951166861==--
