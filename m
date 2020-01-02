Return-Path: <SRS0=ofmn=26=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55915C33CA3
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  9 Jan 2020 06:02:23 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E613C20721
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  9 Jan 2020 06:02:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="l4W2UvBH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E613C20721
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4043b171;
	Thu, 9 Jan 2020 06:02:22 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 52a2b96e
 for <wireguard@lists.zx2c4.com>; Thu, 2 Jan 2020 08:41:05 +0000 (UTC)
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 98439cb3
 for <wireguard@lists.zx2c4.com>; Thu, 2 Jan 2020 08:41:05 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id a15so56111020otf.1
 for <wireguard@lists.zx2c4.com>; Thu, 02 Jan 2020 00:41:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=QFAC8TIbueP22p1wB+pxHE2ZL/ctAVczMAXBpqdb5dY=;
 b=l4W2UvBHIFtuoTjAY8QmNQ/YRczcuFbmsGtFK2Jd8y4ucH0vlcowdfuPlUqk/IE6za
 zvbMarJTlcRLiszVREqkUC220uSdv6rrzCE+/JE2KsUs1Mw8Az+CU0I/uEAkJKK4T8cZ
 Q2GzG+oNGA2elKqDj++cHIv4bbYfWJEn4p++/fjqD6+vYOkBH6JZgPIpUo+kCMVBGfk2
 vmD/XbzB233Uv2TBLmkiXD+QUZz4hZmGBwIHfBHjBMKQrG3QVFroexdtfPnY3fz48SIl
 uqjtIcHRk89QNjRBsRmagcBgbyy2D8lsHs2NQfHnQibNAbNehyuHdbsRg3gQKUToLKDE
 ThKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=QFAC8TIbueP22p1wB+pxHE2ZL/ctAVczMAXBpqdb5dY=;
 b=rXicoKYYLgG8pPJmnsUBbTwXAVQDkHZQT2cgpO39CQFgc7lEYrvOCNvQ7Z3s3qFYPw
 VPNqfmIx9dox55cqoQ1S2Jj2Dz6il9Zf3bNuyHa13WPfsFd0SRD8bg+3wRZaictO22Zb
 bt0JE3bgYDgOT3S6JQvJyNX51GqAVPZ10ynQR+aeBBJpnZZfhPnsmGuIoT9zgNhYeymd
 EeBKaoXoLabZQveuiv8zU2kCQKyx30j7pJXnpLa3p69hxcRb8zjRuPk8nsrXaM3gpph9
 Emd5AdYFWaz6d6GNgIIvrAnt29cYMUEWYBTkWdFYHs1Wy2caDVp5lUaMByk40oJrneKt
 hC+A==
X-Gm-Message-State: APjAAAXKMSPDPMYfBXoKkx/kwLa9OwZRXdoxm30waCgye61lqbHqKyS/
 bNfgwpzNug+ilDrXPVzjHFb7rcrhsGFWJ+g/0fDqPwsl
X-Google-Smtp-Source: APXvYqym9b6iySGOEk9Lqph0OGkJiRoD4/bO+SbqYEcWhXwJlXLALOc3VW2qOcBhDLnCJgGwZzyhFVll6xGdkxTtd2E=
X-Received: by 2002:a05:6830:1755:: with SMTP id
 21mr91795331otz.323.1577954464157; 
 Thu, 02 Jan 2020 00:41:04 -0800 (PST)
MIME-Version: 1.0
From: Siyuan Ren <netheril96@gmail.com>
Date: Thu, 2 Jan 2020 16:40:53 +0800
Message-ID: <CAPhtH6a+0s0qQirQ4eXNN5vhmXios8Ln0o=j06tb8EZKPNAyKQ@mail.gmail.com>
Subject: Bug report: WireGuard iOS prioritizes IPv4 over IPv6
To: wireguard@lists.zx2c4.com
X-Mailman-Approved-At: Thu, 09 Jan 2020 07:02:19 +0100
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

I am using WireGuard on my iPhone, and the endpoint is specified by a
domain name that has both AAAA and A record. When I turn on WireGuard
in a network with dual IPv6 and IPv4, I find out that WireGuard
chooses IPv4 by executing "wg" on my server. If I explicitly set the
endpoint as IPv6 address, WireGuard works just fine, so it is not a
misconfiguration on my server.

Most operating systems prioritize IPv6 over IPv4, so it is baffling
why WireGuard iOS goes the other way. More importantly, this is not a
theoretical discussion for me: in my case, IPv6 has better performance
due to less congestion (as fewer people utilize it). I also have an
IKEv2/IPSec VPN configured on the same server, and it performs better
because it always prioritize IPv6.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
