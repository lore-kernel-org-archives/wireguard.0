Return-Path: <SRS0=k5hk=KA=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61604C433B4
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  5 May 2021 10:36:29 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F04C613BC
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  5 May 2021 10:36:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F04C613BC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 22144eac;
	Wed, 5 May 2021 10:35:30 +0000 (UTC)
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [2607:f8b0:4864:20::b2f])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 4199a1af
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 4 May 2021 17:50:57 +0000 (UTC)
Received: by mail-yb1-xb2f.google.com with SMTP id h202so4273361ybg.11
 for <wireguard@lists.zx2c4.com>; Tue, 04 May 2021 10:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=5COEmvaUHVL5dNL5U1H5ej47ZMCf5CHBJ1Q//natFdI=;
 b=PAMDR6aDrAxvYJc5MCpunZU1rSM1HjOZg0773s18F9SgGUAYP1hyozRNkXoCYP9Mvd
 +s1fINJiYHme4OBwNlcORjWP4Iow8gnXtXbUK1sdaqqtoX/7KKl3iZDaTkQs8/+4OOBn
 X377r1dQeuuSH0J0PGvhK42jLjdk5JvDfMke1bcupPRfoafHYHIQP1OgVgR4jBB1WA/d
 AzgnxbeojKSkD0i7C/amx8dAGu/9GgP2I9l33lPtJ8x5hIHS02hHmgYmCQP/tzOnd9QT
 gXmw2xPiRqfy0d/W0AhAQ+KjuyjM4wJl0uEHJ2fYYtCtpQ3IEwfxliQQuOPBsw0OywLd
 FNRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=5COEmvaUHVL5dNL5U1H5ej47ZMCf5CHBJ1Q//natFdI=;
 b=tBOigHVlCRcPVcSWCJxp28GNjXZJq+r7PvwEy8Da4hv+ATtP/bWn//AhknngnYcPuS
 Od3EFj7CI5l6F2z8/N25TV+NmnygkyOZ8WtDT2DNqmSdRtYSKg3F7QjvAifgZecCIXvz
 p8gGkj5y9ax618M1/OR7Nb+QWHOTpkU0XvoauIdnNSzF/TJABTsGwJ7bLB7dS6Tywb3p
 49mJfzHLwU1MyjIaZrMz1ryCAETq3E7/CpJXxfuuQkW1uS8iX2T/ja/x+Mia3esiz/wn
 JzJC9muCKcs33ZtRzMwG17LsXViJJsYC/iugPOcfZwj1OGw9SfO4+KhPfHsUUS0f2lef
 +Spw==
X-Gm-Message-State: AOAM531PVDie0uzj/9gKzgMqt254wVG/w8CFEr4cRJUtMTNXBT1nvLwf
 zk3Q8QS/x8DEooeyFAG4zwdlMPIMIA8Wv8UdaytcXLrM/Olafii+
X-Google-Smtp-Source: ABdhPJz0Y5QU6ogzA/BUnUX9T4arVULHqvSAMD/525j3SziRhiq32ywgQQkMpWlNWxYQteM0UgUhjZ4NCXX8jUUS4f8=
X-Received: by 2002:a25:aaa9:: with SMTP id t38mr34694995ybi.263.1620150656362; 
 Tue, 04 May 2021 10:50:56 -0700 (PDT)
MIME-Version: 1.0
From: Andrei Melnikov <andy.melnikov@gmail.com>
Date: Tue, 4 May 2021 13:50:45 -0400
Message-ID: <CAMQuNGBHks8Pv4Ys4HapHNFtYW7BjtmWq4gsvin13DznxJNh4w@mail.gmail.com>
Subject: Android logs - entry index(342) is beyond type entryCount(180)
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 05 May 2021 10:35:28 +0000
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.30rc1
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

My log is filled with the following messages:

05-04 13:39:46.569 18563 18563 W ResourceType: For resource
0x7f120156, entry index(342) is beyond type entryCount(180)
05-04 13:39:46.569 18563 18563 W ResourceType: For resource
0x7f12016d, entry index(365) is beyond type entryCount(180)

Is it normal?

-- 
Andrei
