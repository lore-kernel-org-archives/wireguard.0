Return-Path: <SRS0=gmne=R2=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FB18C43381
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 23 Mar 2019 00:03:35 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 022B5213F2
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 23 Mar 2019 00:03:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=archlinux-us.20150623.gappssmtp.com header.i=@archlinux-us.20150623.gappssmtp.com header.b="Kt0OqAS5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 022B5213F2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=archlinux.us
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b8e7ec75;
	Sat, 23 Mar 2019 00:02:44 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2ab2e29a
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Mar 2019 19:24:27 +0000 (UTC)
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 408836ff
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Mar 2019 19:24:27 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id j132so2595351oib.2
 for <wireguard@lists.zx2c4.com>; Fri, 22 Mar 2019 12:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=archlinux-us.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=KLzXNJkEXgNd47vanq9iHvMcaPsO3u3VyRElhzluOCc=;
 b=Kt0OqAS5+FcSETKW+Z3yKMc9MkNbL+9uD7Y9lGxb732iLhm40xga+5QpI+DNPNJ8/q
 qZ3C84iHstt8XqEZ5MjRXh0vhO5xM0tqQ8fOVZiHCjiXz/bTT1aExy5bKna/8fuiouf3
 QQ9p84srBkMFamtQXGtDBMXohyp7yP7uJPxSGDj6u2xaZ7+5vTJqVlyCWJfNNykzgkxS
 NmQ17aHYbo3ra7DJT81BfrEBoIZ3Hy7bow99S4l/TNh250C4rb005Cy1gGbUu8PlYQLu
 9dVXzOb/9WlYwS8+OOTf+o1JNsojPxaITWBz9KAv1O2ScL1gSd9U3gALJJp7xKhEBuHH
 hGXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=KLzXNJkEXgNd47vanq9iHvMcaPsO3u3VyRElhzluOCc=;
 b=lsaZGidJ1TT0wn19wHGEhHRxPvpz0f7emnfV+lBMIrD/3zFm/P6ChFXUl296UxZTZH
 0oSSD6qtYK15Qf8eSQ7NtsRZoxae6pxuRSwTZTUL/HCpkkguXM0PTxlCwZp0m0S7xF68
 6UZe1jtxmLbNpM+tUyK/VFME8A5DWgu11PfinduTRy8QTVEnSz7fuLhvnK8/XCEvecxo
 mbD4MVRxV6jJBjmY2JZBbaw4sdsyX3tv2BUARapcohqeAOulpWVNLU81JXu62WHIJ5f7
 HE6SJD4kLcgtrG4x3QsfaMQnN7vj+Tbr8qs+RIDRF8D/JqtRjZbGxYxU4MYVwt1ZabgA
 rrhA==
X-Gm-Message-State: APjAAAV2qQXdBbpN4445UVjrd0x7LkvtsDMZQx22Di4LQaCDXkVVoHFW
 pUzrivHnxbFZIAPU7693oHHeQzeIlsVWEzzuCToX8RccXBo=
X-Google-Smtp-Source: APXvYqy9qo3lakBuv1ooK+5vtQeigPOxR9ObEkhNol2UVxSzR6rx4maKz791B2123pNWK5Ah2AZnPe+H3CrlZXCwyMo=
X-Received: by 2002:aca:54c3:: with SMTP id i186mr3048082oib.16.1553282701643; 
 Fri, 22 Mar 2019 12:25:01 -0700 (PDT)
MIME-Version: 1.0
From: John <graysky@archlinux.us>
Date: Fri, 22 Mar 2019 15:24:51 -0400
Message-ID: <CAO_nJAYPMoBNaKqNW10TRQSKA2EV_-9XqOhJmPmNVm4OuedOAw@mail.gmail.com>
Subject: TestFlight is no longer accepting testers ... new link needed?
To: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>
X-Mailman-Approved-At: Sat, 23 Mar 2019 01:02:42 +0100
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

Is TestFlight for the iOS app no longer active?  Looking to get the
latest build of the iOS client in hopes it is more robust for me (I
see 0.0.20190319-5 a few days ago).
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
