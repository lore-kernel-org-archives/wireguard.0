Return-Path: <SRS0=FiAf=34=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88B21C35242
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  8 Feb 2020 21:26:34 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2AA3122522
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  8 Feb 2020 21:26:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ql0Ot8oE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2AA3122522
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4a6124f9;
	Sat, 8 Feb 2020 21:24:09 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5baf9515
 for <wireguard@lists.zx2c4.com>; Fri, 7 Feb 2020 15:49:31 +0000 (UTC)
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com
 [IPv6:2607:f8b0:4864:20::82c])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cc87d4da
 for <wireguard@lists.zx2c4.com>; Fri, 7 Feb 2020 15:49:31 +0000 (UTC)
Received: by mail-qt1-x82c.google.com with SMTP id w47so2178466qtk.4
 for <wireguard@lists.zx2c4.com>; Fri, 07 Feb 2020 07:50:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=6IDn2wklkCJZV/E2ZEkUXJ3G+h08fOZQwMsD/ZgH308=;
 b=ql0Ot8oEsz/sDYTo3h4I1gR8Tr2G8N+TFD0yosnjCnTvwkvT8lFt9A3si4vs4BD60l
 2Lnc9tw9nP87mfHQIlWk+2/CkJOSyTVLh/1Iyzc4lvI3v/MA7PaUPYNzhsCKri+S2bw0
 E9bC5y7byjx7hVOyhN7IgFkSMQ4PNJN3asigNiU1tfhbUUVTXSezN1FPrAZKxDUONCll
 kqJ1p9L8EDKw2hFOJDRAG6tK+K8YyCFXm1j70LTziMlUpU1yRhuvww3fWTfv90rR6aSM
 wWLRzSX58XpIrgVWOPkcL7ZSw+bEQg8/Q2bm1x59LGCbtPsLtSMui8e6CiTfv80PtI36
 ULdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=6IDn2wklkCJZV/E2ZEkUXJ3G+h08fOZQwMsD/ZgH308=;
 b=RFGIzPcu6kAniZMqG8Gnb5rkC/xn5r0XQ7TP+ZXfaymci+uggshLl0VqWKY7TZ5szr
 wriq8n6cfXXjzC6Gt/MYmSzvH3o3K0788FOOX7ane5ofmyTBQkBOHQr2/b3YMFUxNhih
 k4p3qRAU7MXSHsG9L2kt6qifxnpqEjMFzzw6RtRLO9d+7J/e1lp/xQnVaBuMcYfHr7TR
 kSWh0h4YGv/XAzCwWZd2grn2Uo/qrk+jsit/ip02Och+E+/gRS898FjbfI9fty42POQx
 4OQI17fJ0Qr1Qe8uctkRTAsjPL2qEyfiiMhXfkWKBGy76S6xAjSO7Nx+//nZ+XVS2oaC
 C88A==
X-Gm-Message-State: APjAAAU6M3SKbB33tORM/uVKtgA1jpVY39cnleOtZuymIoP83xbz0spn
 LhqvFjJgWkrkDfUmetUlBaZqlB6tfqBN/TgVryx9kdeQ
X-Google-Smtp-Source: APXvYqyxYUMhrF7fh1EQc0KhScMlBT6aDydcO6SbqWTmmpLvC/Ys257H1WtDn0rDNU0vccq8s9J7UxJWZqCf1PgNNiw=
X-Received: by 2002:ac8:6bc9:: with SMTP id b9mr7972893qtt.108.1581090643663; 
 Fri, 07 Feb 2020 07:50:43 -0800 (PST)
MIME-Version: 1.0
From: Yoni Leitersdorf <litelite@gmail.com>
Date: Fri, 7 Feb 2020 07:50:32 -0800
Message-ID: <CAJFy1VX+ue2JskKZEjnOkMdC6sGVLU=fUSZ_BNOqD__SpZ5EYg@mail.gmail.com>
Subject: Usability issue in MacOS
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Sat, 08 Feb 2020 22:24:08 +0100
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
Content-Type: multipart/mixed; boundary="===============3168676140289464629=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============3168676140289464629==
Content-Type: multipart/alternative; boundary="0000000000002c5f74059dfe5ab6"

--0000000000002c5f74059dfe5ab6
Content-Type: text/plain; charset="UTF-8"

When configuring a tunnel in the MacOS client, there's an option called
"On-Demand". If Ethernet and/or Wi-Fi are checked, the client will
auto-connect the tunnel.

It's a great feature, but the term "On-Demand" is misleading. I would
suggest "Auto-Connect" or "Auto-Establish" instead.

--0000000000002c5f74059dfe5ab6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">When configuring a tunnel in the MacOS client, there&#39;s=
 an option called &quot;On-Demand&quot;. If Ethernet and/or Wi-Fi are check=
ed, the client will auto-connect the tunnel.<div><br></div><div>It&#39;s a =
great feature, but the term &quot;On-Demand&quot; is misleading. I would su=
ggest &quot;Auto-Connect&quot; or &quot;Auto-Establish&quot; instead.</div>=
</div>

--0000000000002c5f74059dfe5ab6--

--===============3168676140289464629==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============3168676140289464629==--
