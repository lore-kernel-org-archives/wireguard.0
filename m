Return-Path: <SRS0=Af8f=VO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E31C5C76195
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jul 2019 20:43:10 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7F9F12184E
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 17 Jul 2019 20:43:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=aaomidi.com header.i=@aaomidi.com header.b="QB97dmVv"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7F9F12184E
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=aaomidi.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 97f585ca;
	Wed, 17 Jul 2019 20:40:32 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3a0c5b78
 for <wireguard@lists.zx2c4.com>;
 Wed, 19 Jun 2019 00:41:15 +0000 (UTC)
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 09518a0f
 for <wireguard@lists.zx2c4.com>;
 Wed, 19 Jun 2019 00:41:15 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id e5so34248176iok.4
 for <wireguard@lists.zx2c4.com>; Tue, 18 Jun 2019 17:41:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=aaomidi.com; s=google;
 h=mime-version:from:date:message-id:subject:to;
 bh=lSPRo0uE7wUbB+hLZeOIwMaeKM0+6f9oY0ufYUfjxZ0=;
 b=QB97dmVvUwi5TnggEtHp+G49EU5ta/7qOYF4ZN4MWPh3HfT9TG7UHpydo7ODyY3aRv
 6p0Apch0QlulMLiWebwU47Yu2mwMoiC9yyJYTAccq0Yl8drBgUbXIvk1GBJlnlpZco5h
 oOVCC43LAOByeYvtJB2pZ94PLPTM7vQSj9ONFV7vgTcHKBmRUU3a311EhPRP9XD8tncp
 ayc4FxDYXCiu9s+0Li0LfaEbDJdsg7xxHI6kDmD0F67QG3CKAn0gXfnVtDC0F8SXzIna
 78Co/KtghOdJjkkWzb4maWvSXcvvpSFTLdhPTp6elOwnsCCcOgiIVfr9zhfuZUmuLgfU
 IBZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=lSPRo0uE7wUbB+hLZeOIwMaeKM0+6f9oY0ufYUfjxZ0=;
 b=d9Z8qSFn6bhXDo3GgGU2YHy12/6GMvABL3xlC8u2kkwkhTIM+OtWeFAPLgHCJAl1bE
 jI0Qn47AfxMdDsr6qr/Blx8yjzveTqqDFDA2fQ3qNJomdL9+0s5sPdWtVzf2bXD6L2Pu
 bbNuDoCIrWMuD2MRs575hLvlMn2isuTITVBDixzogxtggetSoAAkoF+eSX+SLyhjJldn
 iF1LLHzARvAP6INF9jEGulCwqzErMJWYaPEOQQckw42MdvKusokVdJJTamqrAMFUroC/
 LsT/mjJemhKXaL0qg3Rol+myQku4sOMljUJwHAvcKHoZUMAJInnkjZ6hi+KuvxAJsZbg
 8htQ==
X-Gm-Message-State: APjAAAV7k7FLNQUVab9HgNYSRqSMQmdMQ98v35Gd6DrCHOSYlycCufiR
 UqjdY/Ikly/NY2oQCDHhS01CrbDKkJw/514ql53nCY3di+Q=
X-Google-Smtp-Source: APXvYqz2msCzB1UBzElP19gfzUqfxmleqVzXA+DH6vnXdvoCB5qUb0zZKpsVV739wHARjSYRQEUTcil7S/64guaRgtU=
X-Received: by 2002:a5d:96cc:: with SMTP id r12mr15556277iol.99.1560904874459; 
 Tue, 18 Jun 2019 17:41:14 -0700 (PDT)
MIME-Version: 1.0
From: Amir Omidi <amir@aaomidi.com>
Date: Tue, 18 Jun 2019 20:41:03 -0400
Message-ID: <CAOG=JU+YmuNkYyzW2mfm_SYxnhhi5JuSxJQ1K15_Ct8DTm9nXw@mail.gmail.com>
Subject: Building DPI bypass systems on top of wireguard
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Wed, 17 Jul 2019 22:40:31 +0200
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
Content-Type: multipart/mixed; boundary="===============7568858149968443253=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============7568858149968443253==
Content-Type: multipart/alternative; boundary="000000000000922447058ba27cb4"

--000000000000922447058ba27cb4
Content-Type: text/plain; charset="UTF-8"

Hi,

I've lived in countries under oppressive DPI systems and I want to see if
its possible to create a DPI bypass system using the wireguard protocol.
During my time under these DPI systems, I've seen them evolve and grow and
get stronger and better in detecting various bypass systems.

In Iran, when there's a lot of political news the government deploys a
traffic/endpoint ratio strategy. Essentially, instead of blocking specific
protocols, they block amount of traffic going to a specific IP (or
sometimes IP:PORT combination if they want to be less strict). This breaks
every single bypassing solution as they all rely on sending traffic to
another endpoint.

The strategy I had in mind was creating a microservice VPN that can be
deployed across thousands of endpoints with thousands of IPs and Ports. The
servers would be in contact with each other to "restructure" a packet that
has gone through to them, and send it off to the actual endpoint.

Essentially, the client can split a packet into many pieces, send it off to
a thousand systems, and then get a response back from several servers and
reconstruct the actual message itself. This would break the ratio based
detection system. Alongside general hiding techniques such as masquarding
as https/dns/QUIC traffic, this could be a pretty robust and unstoppable
system. Especially with IPv6 becoming a lot more popular and maintaining an
IP ban list much more expensive.

Thoughts?

Thanks!

--000000000000922447058ba27cb4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:arial,he=
lvetica,sans-serif">Hi,</div><div class=3D"gmail_default" style=3D"font-fam=
ily:arial,helvetica,sans-serif"><br></div><div class=3D"gmail_default" styl=
e=3D"font-family:arial,helvetica,sans-serif">I&#39;ve lived in countries un=
der oppressive DPI systems and I want to see if its possible to create a DP=
I bypass system using the wireguard protocol. During my time under these DP=
I systems, I&#39;ve seen them evolve and grow and get stronger and better i=
n detecting various bypass systems.</div><div class=3D"gmail_default" style=
=3D"font-family:arial,helvetica,sans-serif"><br></div><div class=3D"gmail_d=
efault" style=3D"font-family:arial,helvetica,sans-serif">In Iran, when ther=
e&#39;s a lot of political news the government deploys a traffic/endpoint r=
atio strategy. Essentially, instead of blocking specific protocols, they bl=
ock amount of traffic going to a specific IP (or sometimes IP:PORT combinat=
ion if they want to be less strict). This breaks every single bypassing sol=
ution as they all rely on sending traffic to another endpoint.</div><div cl=
ass=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-serif"><br>=
</div><div class=3D"gmail_default" style=3D"font-family:arial,helvetica,san=
s-serif">The strategy I had in mind was creating a microservice VPN that ca=
n be deployed across thousands of endpoints with thousands of IPs and Ports=
. The servers would be in contact with each other to &quot;restructure&quot=
; a packet that has gone through to them, and send it off to the actual end=
point.</div><div class=3D"gmail_default" style=3D"font-family:arial,helveti=
ca,sans-serif"><br></div><div class=3D"gmail_default" style=3D"font-family:=
arial,helvetica,sans-serif">Essentially, the client can split a packet into=
 many pieces, send it off to a thousand systems, and then get a response ba=
ck from several servers and reconstruct the actual message itself. This wou=
ld break the ratio based detection system. Alongside general hiding techniq=
ues such as masquarding as https/dns/QUIC traffic, this could be a pretty r=
obust and unstoppable system. Especially with IPv6 becoming a lot more popu=
lar and maintaining an IP ban list much more expensive.</div><div class=3D"=
gmail_default" style=3D"font-family:arial,helvetica,sans-serif"><br></div><=
div class=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-serif=
">Thoughts?</div><div class=3D"gmail_default" style=3D"font-family:arial,he=
lvetica,sans-serif"><br></div><div class=3D"gmail_default" style=3D"font-fa=
mily:arial,helvetica,sans-serif">Thanks!</div><div class=3D"gmail_default" =
style=3D"font-family:arial,helvetica,sans-serif"><br></div></div>

--000000000000922447058ba27cb4--

--===============7568858149968443253==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============7568858149968443253==--
