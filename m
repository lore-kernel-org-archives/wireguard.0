Return-Path: <SRS0=ph/y=QX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08544C43381
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 16 Feb 2019 01:26:36 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25E74222A1
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 16 Feb 2019 01:26:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="W6aZ6uuk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 25E74222A1
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 937d9cad;
	Sat, 16 Feb 2019 01:18:27 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cc200246
 for <wireguard@lists.zx2c4.com>;
 Sat, 16 Feb 2019 01:18:25 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cc1f5ca7
 for <wireguard@lists.zx2c4.com>;
 Sat, 16 Feb 2019 01:18:25 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ec784154
 for <wireguard@lists.zx2c4.com>;
 Sat, 16 Feb 2019 01:09:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :from:date:message-id:subject:to:content-type; s=mail; bh=KVPqvL
 D0sfPcFC9itKL+Za6zYMY=; b=W6aZ6uukC5vhdzg6ooTM4geWws/gzH3kFkUOFc
 hDz701fsbKbnXy70fW53/WD+KDAD+XyubjUY3+p9MT9gR8bDhCPRy/0AwtflqEAz
 bNs4WvPZ9m3uEHItRu0dJDXxlV8hWN3rZaT8Ph5gJM9N6x7c8arajP7rjVljL9Lt
 NvT6kLGx6vE+sNd5WqSY3shz6MXvgAM3msWIUNmOJi4+jhKr+Bc06V0PS7yGAmMf
 0P/M37F1280nB/v0u07D2yEs8Z9UAj2dyTUxerC7pBOhZIQCRppJ2oOrh+6LTzyT
 6SeQtn/TB0Rsz6e3qOaExAs8RLjwWop6PGJz6r92PR7rBong==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 180d793a
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 16 Feb 2019 01:09:11 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id 32so19648715ota.12
 for <wireguard@lists.zx2c4.com>; Fri, 15 Feb 2019 17:26:31 -0800 (PST)
X-Gm-Message-State: AHQUAuay654rWGAnP1tUNmmST0fwWRgqKJog8m5qYNuo33lZzCYUlY1j
 8pHyWjL4BLgYiN9rtEstoM5ByxbXPrmwH7T5pPg=
X-Google-Smtp-Source: AHgI3IbBf3x+vYJbKr1941MBPG/W6yN1oZDHw2agfa7Ui38OnLyUVnaqM12IVLHq0xC3/WJ7/2peUjHB+rnzQ42w6J8=
X-Received: by 2002:a9d:4e5:: with SMTP id 92mr7851550otm.199.1550280390782;
 Fri, 15 Feb 2019 17:26:30 -0800 (PST)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 16 Feb 2019 02:26:20 +0100
X-Gmail-Original-Message-ID: <CAHmME9qjTJbWYVr9cToXpfnshGkppcqVS5=iVzqsrjS+v_aF+w@mail.gmail.com>
Message-ID: <CAHmME9qjTJbWYVr9cToXpfnshGkppcqVS5=iVzqsrjS+v_aF+w@mail.gmail.com>
Subject: WireGuard for macOS
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hey everyone,

After many months of hard work, Roopesh, Eric, and I are pleased to
announce an initial version of WireGuard for macOS:

https://itunes.apple.com/us/app/wireguard/id1451685025?ls=1&mt=12

This is built from the same code base as our existing iOS app and
makes use of Apple's Network Extension API to provide native
integration into the operating system's networking stack. The
application lives in the status bar, and after importing a
configuration, the ordinary System Preferences networking item may
also be used to control each tunnel. Because it uses these deep
integration APIs, we're only allowed to distribute the application
using the macOS App Store (whose rejections, appeals, and eventual
acceptance made for quite the stressful saga over the last week and a
half). Compared to the current CLI integration, we expect the
WireGuard experience using this app to be excellent.

For curious folks without a Mac (or without the patience to cajole KVM
into booting macOS), I've assembled a few screenshots:
https://data.zx2c4.com/wireguard-for-macos-screenshots-february-2019/

This is new software, and there will certainly be problems. Don't
hesitate to email team@wireguard.com directly with bugs as you
encounter them.

Enjoy!

Regards,
Jason

PS: Because people will inevitably ask: yes, a Windows client is on
its way, and it will have a very similar interface to this macOS one.
We're taking the long and careful route, writing a new TUN driver for
Windows 7+ called "Wintun" that we expect to be safer and faster than
the current popular OpenVPN TUN driver, and also suitable for all
projects, not just for WireGuard. We already have packets flowing and
things generally work well, but polish will require a bit of patience.
If you'd like to help and have an appetite for NDIS drivers, Win32 GUI
programming, or Go, please do get in touch.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
