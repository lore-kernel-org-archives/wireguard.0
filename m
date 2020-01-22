Return-Path: <SRS0=wYFz=3R=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83A8DC33CB3
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 28 Jan 2020 10:39:31 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AAD62467E
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 28 Jan 2020 10:39:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GzGePkng"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2AAD62467E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3011c330;
	Tue, 28 Jan 2020 10:39:29 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9acbabd5
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Jan 2020 23:55:48 +0000 (UTC)
Received: from mail-qv1-xf2c.google.com (mail-qv1-xf2c.google.com
 [IPv6:2607:f8b0:4864:20::f2c])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 8ef0cd35
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Jan 2020 23:55:46 +0000 (UTC)
Received: by mail-qv1-xf2c.google.com with SMTP id dc14so648144qvb.9
 for <wireguard@lists.zx2c4.com>; Wed, 22 Jan 2020 15:55:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=WvusaK7kFztCaOT9d+b8xZ1OgWefEgNH8g2A1qbympw=;
 b=GzGePkngzIK7E31RT7PrILDvKm/yI8ghgQY5GKQG8qeGRM6/k2z31wxStAB/4n2x+D
 PslWciHskIsqd8siyFF1xwPcVyMsbXgjweDWPIz/xEtjiDnU67NOWvmIGecD1v7qUd73
 oQ10+KtfXjOIcOJ1BQclQIN83DyXLNf2aGibHRXNvS2/2hBW5kEgWaS5BeWDuNF6GcdC
 /34QW093OKy2vYa/XJgMrOAvckgfpQNNaoWb5m2CWOmx6f7x8pwkJxsU5rhqfTZxlgWG
 VmONJk+cU5hu7fSrnmXpm1Jb8I+BFWmpvXmJ/Uu0QA7I65yg94V8aqoX0MQnCcWVMoh0
 ixHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=WvusaK7kFztCaOT9d+b8xZ1OgWefEgNH8g2A1qbympw=;
 b=QCzpt7le6zkZ9FbiCKGRvEYEkfHcYCI/EqxutEn6UwIeZNNsET+4Sh58SrACzkVnyR
 ItbpbQ3OGlh/7+u5FTN2KmNol/I0qk1iqDbbuKPVBKmtKD2074CLutB2OCulQvUD/NxW
 8riQ47PL+FGGbUOiJ558Wh12oVKzUkW3LGmzWwhGH6uMRSAjXmCDaTLFcKcyhIRiT7Cz
 zrjP4TNCkf4R1ZIOjruIiPvZYDLbksNKUT3+FCRR52CeY6FkYifpNFtP5qaIXnaKiGXj
 +3UK9NBzU1wBa8b10DJInrwvuqlFVwEuAr36t0sCgr76r86WWWOJ6s/eNXtAAubwBlTo
 ZpTw==
X-Gm-Message-State: APjAAAXq76YsGI+XLEYoOdrYPtcTRhRmEj2/aA90LLFZpRsQARwndsA3
 8BAXzAOBNG1PAnk41BFyQvyYkTGEIef2A+YQs4FaU1Wg
X-Google-Smtp-Source: APXvYqx9zVXg4NdJn/ZYHQ0rZXz9jAsBfZWP5H3vaod0eI+8Wh3TIOgs6RdS56oBy3FIMshkGslL+YXJldy5b0+gE7w=
X-Received: by 2002:ad4:5586:: with SMTP id e6mr13516127qvx.92.1579737346142; 
 Wed, 22 Jan 2020 15:55:46 -0800 (PST)
MIME-Version: 1.0
From: Elliot Saba <staticfloat@gmail.com>
Date: Wed, 22 Jan 2020 15:55:10 -0800
Message-ID: <CAGGi21Y2pMuHhhCGH10Y44fQKLgTi9pL7-y9Tw3KZm=5R8B9hQ@mail.gmail.com>
Subject: Automatically updating windows client
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Tue, 28 Jan 2020 11:39:27 +0100
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
Content-Type: multipart/mixed; boundary="===============1663328669533202809=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============1663328669533202809==
Content-Type: multipart/alternative; boundary="0000000000005af7a5059cc34367"

--0000000000005af7a5059cc34367
Content-Type: text/plain; charset="UTF-8"

I have wireguard deployed on quite a few windows servers.  I like the
auto-update functionality builtin to the GUI, but it's a little cumbersome
to login with RDP and click through the menus to perform the auto-update;
it would be much more convenient if I could use the WireGuard CLI interface
to check and auto-update directly, or even if it automatically updated with
no intervention on my part.  This way I can script it with scheduled tasks
or similar.

What do you all think?
-E

--0000000000005af7a5059cc34367
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I have wireguard deployed on quite a few windows servers.=
=C2=A0 I like the auto-update functionality builtin to the GUI, but it&#39;=
s a little cumbersome to login with RDP and click through the menus to perf=
orm the auto-update; it would be much more convenient if I could use the Wi=
reGuard CLI interface to check and auto-update directly, or even if it auto=
matically updated with no intervention on my part.=C2=A0 This way I can scr=
ipt it with scheduled tasks or similar.<div><br></div><div>What do you all =
think?</div><div>-E</div></div>

--0000000000005af7a5059cc34367--

--===============1663328669533202809==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============1663328669533202809==--
