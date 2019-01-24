Return-Path: <SRS0=u0A/=QA=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15FA0C282C3
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 24 Jan 2019 03:37:38 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A8B52184B
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 24 Jan 2019 03:37:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q948qYaH"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A8B52184B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d987614d;
	Thu, 24 Jan 2019 03:32:26 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1ded7660
 for <wireguard@lists.zx2c4.com>;
 Thu, 24 Jan 2019 03:32:24 +0000 (UTC)
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2106f530
 for <wireguard@lists.zx2c4.com>;
 Thu, 24 Jan 2019 03:32:24 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id r200so3486782iod.11
 for <wireguard@lists.zx2c4.com>; Wed, 23 Jan 2019 19:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=/kpViVbCMAsaWHvTnJOlRemKeAQvNtH+n5eECExrCoE=;
 b=q948qYaHJggAt4ZppKLQPEAOTRwK7BXxtaO1HGTw0r/VebOyn/sdqT+73xKh8x+j+P
 tczN/Y+Ih+Fi0YxP2SNZBaZZWeN6Qm/zbvRYV5MiZ4ntQK9ifLoni/f9lEX3UYQebxRo
 9xUemToMxScYXYc754pzwaSUsCXaNgMK3NDJ4/hiaw/rEbZe4zh7/R5X5q6nsIsaDZLi
 D4OqR6Wv4ArTg94Wzj5r/pRxe3Vodn0Bbek7Lmaszl/XXDHQ6ww83sgYWF0+9bDEOiuy
 fpRntrrdS72ENIzVJs+DkEMEDBgYHnhVujh6HBMotQf41+kqde9H72WU2KGQbI0oMll2
 fIEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=/kpViVbCMAsaWHvTnJOlRemKeAQvNtH+n5eECExrCoE=;
 b=Rv7gUT1iZgEEoMOitZpcvwuni2sD0KC4ZMK5UP2PhjUOjh887K05O09nWNCM+Li0Ag
 3Qgkfo3JYh3yUGDQDgzh76i7Zdnjy/kyA5TuHzt+bS7FrHszCjmmBlgbE3mVz2Uk1XFG
 JXSSSe0RmMsqeX0ovjYT+XS1z3tAjJI7AEcE6nKevRKn08WhgTAAj0YeFS9/TPddPXLB
 PewikMX94eVIJ1x7/uDtUDOfR5hW+Bmw+9syUvXuMrznV5NeBG33tHUMM8GYBuTXjtw5
 M5dlobB/JXJ5PF9lDveatuGU7NEK5LfPCVdCCNmfBdVrfWDXMLpn9VqaxP0TVDcCm+yO
 +XQA==
X-Gm-Message-State: AHQUAubjfYd/sFcTFSbdU4PnefFbMylmARBDwnxg3mWbhChtfK2EcixT
 4270JaZg7nhF0iPf27qxsi09UoMVtzah7ObFU6mV7r3J
X-Google-Smtp-Source: ALg8bN76wAqqx/uCS1Kilqeuiv7RrLIog9gq3gMy+eh5gNJ5GOBR3zYyoAc3+DpnOaJouCiafNhESssi8F1uRTw8iOg=
X-Received: by 2002:a5d:8747:: with SMTP id k7mr2617341iol.279.1548301052103; 
 Wed, 23 Jan 2019 19:37:32 -0800 (PST)
MIME-Version: 1.0
From: Caleb Spare <cespare@gmail.com>
Date: Wed, 23 Jan 2019 19:37:20 -0800
Message-ID: <CAGeFq+=O7Y6o0pEHVessWZUZR5ZLCeWuHNkMGY-Y2MHKAqU=Sg@mail.gmail.com>
Subject: Search domains with wg-quick
To: wireguard@lists.zx2c4.com
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

I use Wireguard in a typical sort of "corp VPN" scenario. I use
wg-quick to bring my wg0 up and down.

What is the best way to add a search domain when my wg0 is up?

After reading the wg-quick source, I came up with this proof of
concept that *does* work on my machine:

PostUp = echo 'search mysite.com' | resolvconf -a tun.search -m 0 -x
PreDown = resolvconf -d tun.search

However, there are some problems:

- That "tun.search" string is just something I made up after seeing
the "tun.wg0" that wg-quick uses. What should I put there?
- I don't even know how the -m 0 -x flags work, or whether they're
necesary. (There was an interesting discussion between Jason and
Lennart Poettering over here, though:
https://github.com/systemd/systemd/pull/8296/files#r171215541)
- I guess I need to take some different approach in macOS; some
googling talks about "networksetup -setsearchdomains"?

Anyway, would it be reasonable to teach wg-quick about search domains,
or is doing some kind of PostUp/PreDown stuff going to be my only
option?

BTW in OpenVPN we do this with

push "dhcp-option DOMAIN mysite.com"
push "dhcp-option DNS 1.2.3.4"

Thanks!
Caleb
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
