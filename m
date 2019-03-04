Return-Path: <SRS0=972F=RL=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A92EBC43381
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  8 Mar 2019 15:26:39 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E870A20868
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  8 Mar 2019 15:26:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wades-im.20150623.gappssmtp.com header.i=@wades-im.20150623.gappssmtp.com header.b="x9IFdfRD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E870A20868
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=wades.im
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 82c37900;
	Fri, 8 Mar 2019 15:15:53 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id da0592ad
 for <wireguard@lists.zx2c4.com>; Mon, 4 Mar 2019 16:51:26 +0000 (UTC)
Received: from mail-ua1-x935.google.com (mail-ua1-x935.google.com
 [IPv6:2607:f8b0:4864:20::935])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 86331b7e
 for <wireguard@lists.zx2c4.com>; Mon, 4 Mar 2019 16:51:26 +0000 (UTC)
Received: by mail-ua1-x935.google.com with SMTP id e15so5044580uam.3
 for <wireguard@lists.zx2c4.com>; Mon, 04 Mar 2019 09:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=wades-im.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=t85DAgqeA8SpJUtYRM2/JENrChGx8MLZWnQs8zC1FdY=;
 b=x9IFdfRDDD9MHiRsqDgdIOmpgCnWrQ5XMOzF8K4hc5mikpJWGwN1umNoi+yW5P/Upn
 0YA8oIMRb8a0vG06TI5dSTEp39C3kukHgIVCfDeX2QwvCPgPlwCa/1FNcoY3VZVpUt+t
 ajLC2MVkLNG7AH+G3S30qjsxchyCpimB8jKbTjClXddWlhPTPyhD4kRFfTA5YHEzDBLx
 DivPb5/f5YzAaVmSXRst6lcm0a5O2vyxyhMDZTuvExambrtADLitY/nXs9q5aaZVX5rJ
 lo9dlCoAOoRHP20tyUCvEOgWmOXuCEmpFsizqvFOt9dsx5lfFhTUOBIdYrwpd8m/FNW3
 UhHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=t85DAgqeA8SpJUtYRM2/JENrChGx8MLZWnQs8zC1FdY=;
 b=a/F8NKWeTV6LVRaHvfDqSzmeYObRhL6vu5JBx+l9q32X8aJ+qIldAurjc3Ms2unw03
 MYo4VjBKhhjiSVEp98Wt0S0TuVZi3njhU/TERxwCSnvibnFyAhxNriAAsf2oilFne6F7
 VBRbviSgmCsv2C0Pu7pUOl8p8kPqCaSXQ9Sv2ad6gWwV+i2+prsqnbZR0SbSJM75Wke8
 nuE73BR5JP/z8C8hSuQTM+TYCsXPC/oXeLoSkEeMEBGmemjBiSbmDtoBSicnsc9D7WhX
 dtUvqfVFF6lrV4FgtM4mq0ZuThson8/3f3UUH/MUEQXuK+ZIrbQpqXVxtkbNN8EpXh8Z
 55Zg==
X-Gm-Message-State: APjAAAWPxZwkiIpE/mkLy74d5GU0xkj4qQrWlu1yY85qs3SygxTyBNeC
 J097ffwHOqmXFzrOBU8bHrf8suOhrsIaiOc/J/s1D7Kn
X-Google-Smtp-Source: APXvYqyQcvRalIKgxXJ5Mk/3sg7yT1k9D6YzG0S9YqYcxxq06+jpgI0P+F2XF2QqYKbbJ7mAIuWygdyFXfH3RluM9fM=
X-Received: by 2002:ab0:3445:: with SMTP id a5mr9945475uaq.130.1551718896755; 
 Mon, 04 Mar 2019 09:01:36 -0800 (PST)
MIME-Version: 1.0
From: Wade Simmons <wade@wades.im>
Date: Mon, 4 Mar 2019 12:01:25 -0500
Message-ID: <CAF63tRoybmhewSoPwuX+uLxiRxXU=FOLa4vzYWi1CU9NZj19qw@mail.gmail.com>
Subject: wireguard-ios license
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Fri, 08 Mar 2019 16:15:49 +0100
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
Content-Type: multipart/mixed; boundary="===============3692482256083573190=="
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

--===============3692482256083573190==
Content-Type: multipart/alternative; boundary="000000000000a1e7f8058347b5f7"

--000000000000a1e7f8058347b5f7
Content-Type: text/plain; charset="UTF-8"

Most of the files in wireguard-ios have the MIT license specified in their
header, but there are a few files that specify GPL:

    wireguard-go-bridge/wireguard.h
    wireguard-go-bridge/Makefile
    WireGuard/WireGuard/Crypto/x25519.c
    WireGuard/Shared/Model/key.h
    WireGuard/Shared/Model/key.c
    WireGuard/WireGuard/UI/macOS/View/highlighter.h
    WireGuard/WireGuard/UI/macOS/View/highlighter.c

I assume that these are incorrect as the root README and COPYING files
specify MIT, but I wanted to double check here first. Can anyone verify or
fix these headers?

Thanks,
Wade Simmons

--000000000000a1e7f8058347b5f7
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Most of the files in wireguard-ios h=
ave the MIT license specified in their header, but there are a few files th=
at specify GPL:</div><div><br></div><div><div>=C2=A0 =C2=A0 wireguard-go-br=
idge/wireguard.h</div><div>=C2=A0 =C2=A0 wireguard-go-bridge/Makefile</div>=
<div>=C2=A0 =C2=A0 WireGuard/WireGuard/Crypto/x25519.c</div><div>=C2=A0 =C2=
=A0 WireGuard/Shared/Model/key.h</div><div>=C2=A0 =C2=A0 WireGuard/Shared/M=
odel/key.c</div><div>=C2=A0 =C2=A0 WireGuard/WireGuard/UI/macOS/View/highli=
ghter.h</div><div>=C2=A0 =C2=A0 WireGuard/WireGuard/UI/macOS/View/highlight=
er.c</div></div><div><br></div><div>I assume that these are incorrect as th=
e root README and COPYING files specify MIT, but I wanted to double check h=
ere first. Can anyone verify or fix these headers?</div><div><br></div><div=
>Thanks,</div><div>Wade Simmons</div></div></div>

--000000000000a1e7f8058347b5f7--

--===============3692482256083573190==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard

--===============3692482256083573190==--
