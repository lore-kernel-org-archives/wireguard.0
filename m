Return-Path: <SRS0=UgTS=M7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E953C4338F
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  8 Aug 2021 23:16:25 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7D74B603E7
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  8 Aug 2021 23:16:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7D74B603E7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0a1b0469;
	Sun, 8 Aug 2021 23:02:01 +0000 (UTC)
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [2a00:1450:4864:20::12e])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d7414dd4
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 25 Jun 2021 05:06:24 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id r5so14295760lfr.5
 for <wireguard@lists.zx2c4.com>; Thu, 24 Jun 2021 22:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=ku6czhqagZS/BBHcVLy0q+qyJZUnvGibUDEZLxUv24s=;
 b=kw7xUIDB6IZqMIH0rwill+FiYU+BCCDzQZ0HWPVOw27+6yutaSrrBn35AxLrlJ+aJr
 hPu/Moqf1YQ0KPLObKPRJEXeFZ1PLHJZnM3ZT8DAVE8i8no3HZWWvAGSU85ARTC8VZ05
 cjSNc5fM9c1gRiOxH3P4mHCBTcvapkY0YU5UUpAEOho+r2/VytaVPyhhvCFJMv/zueGg
 XLvQtT5xbCAeWpBC/jedElBCtkX8D4eYSJDnNA8iiT7i5E9WTmBaRK8K0KH4w4awGoco
 m42GAO0p0PFyWNkwBXDAf46Spga+Q5Gk/yyu8APiNivDuEq/gKqwlhRS5/KVHOt88uBx
 4gEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=ku6czhqagZS/BBHcVLy0q+qyJZUnvGibUDEZLxUv24s=;
 b=UkyhiEmGW2VW1V5+UXxi4xhqNhhlHKeXLBZNE8WA1995JmszBMMqJ+dO4afVV5S4SH
 ZwFM1tqqSdEzf8tHWLE40WBYodRNFTE8e99n2yHVbA9G+6kqjHVsns2q6uUI+MjJRakC
 FVG+QBqMf8DwsDx+AU41OzZDklYjdcFM1Cq97v5UgzQhLm5pv5pA2/C1YyvsS8Y6Qmyw
 0xIhVNPaPkfbzmjIrJwlcZQ1w/JLgZ/Qkg6dnyfNE0PK5DvhFpU05zJUQLvqXIi5E1Vg
 fGoWIUguuWz+K8as5zialj9VsfRfLJjyoAesu4l36FrYRs4zE92H6wS3btmc08xwg+ZM
 rqhw==
X-Gm-Message-State: AOAM531LA9UL/UfeMbA4nvpbheZPqdHdpPXB9bGAxSc7MrqVVm49hBZj
 HIUhYeESc84HBGfnAqh3AuVgKzov1sNCm54YIOOt3ylKuJEcKQ==
X-Google-Smtp-Source: ABdhPJzZqARyWbaNHRJuWEgB7ptCBEWW11QPukig+/e+cBj5hktZkV5wPVQVDxsmHgh5mqyg6jr7pIlEp7m5rBdIgyg=
X-Received: by 2002:a19:fc14:: with SMTP id a20mr3309876lfi.86.1624597583865; 
 Thu, 24 Jun 2021 22:06:23 -0700 (PDT)
MIME-Version: 1.0
From: Tom Yan <tom.ty89@gmail.com>
Date: Fri, 25 Jun 2021 13:06:12 +0800
Message-ID: <CAGnHSEkLm4OjH2NanNVidHoQZdoAWQHKBcPFCvHrEYa9R8vtPw@mail.gmail.com>
Subject: Wireguard MTU limitation on a server / forwarding peer
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sun, 08 Aug 2021 23:02:00 +0000
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

Hi all,

So I notice that wg-quick (and the Windows client) will use (the MTU
of the default route interface - 80) as the MTU of the tunnel
interface. Although I've read a mail about where the 80 comes from, I
don't exactly know why the MTU of the tunnel interface needs to be
that. I assume that it's for a reason like "to avoid encapsulated
packets from being needed to be fragmented locally".

I also notice that if on a server / forwarding peer, the MTU of the
default route interface is smaller than the usual 1500, say 1460, and
hence the MTU of the tunnel interface is capped at 1380, on its client
peers I pretty much also need to cap the tunnel interface MTU at that
(instead of letting it "falling back" to the usual 1420), seemingly
have something to do with TCP MSS (which might be possible to
workaround/fix with an ip/nftable rule instead I guess).

My biggest doubt is however, whether I should "sync" the tunnel
interface MTU of all peers. Say that on a / the server / forwarding
peer is the usual 1420 by default, but it's known that it will serve /
forward for client peers whose tunnel interface MTU would be as small
as / needs to be capped at, say 1280. Should I set the tunnel
interface MTU on the server / forwarding peer (and hence all of its
other client peers) to 1280? (If it matters, say I don't need
"client-to-client" communication.)

(As you may have guessed, the "trigger" of this question / mail is
that the default MTU used by the Android wireguard client is 1280.
Although it's perhaps fine to bump it to 1420 on many devices, I do
notice that at least on one of my phones the MTU of the cellular
interface is apparently 1400.)

Regards,
Tom
