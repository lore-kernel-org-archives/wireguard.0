Return-Path: <SRS0=ObIi=LA=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66B33C47096
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  6 Jun 2021 09:13:57 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 257CD6135A
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  6 Jun 2021 09:13:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 257CD6135A
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ea43e1bd;
	Sun, 6 Jun 2021 09:13:54 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 147f4c5d
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 6 Jun 2021 09:13:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1622970828;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
 bh=aNbkdlEby8LgnJIllhi/OP0rzeGNi3rbhQHOjphXU1c=;
 b=hAncwdQ4dl/I78DjUCusqYrGL6vbfCk3+HGy6UyZaJe5GO82wqp717yw7cNMTMHVC4Lv1a
 2mJAczzjrlqMqKsRh9o0k9ogjhA1vvx2jA/cFedbMeEGhrXNHOPXdPjg9f+nioa/4bmLrj
 MHNI0B3JJFF7rI7GVkbMd4O4BRc7gLE=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 769e3e9c
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 6 Jun 2021 09:13:48 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id q21so20341640ybg.8
 for <wireguard@lists.zx2c4.com>; Sun, 06 Jun 2021 02:13:48 -0700 (PDT)
X-Gm-Message-State: AOAM531mKPU1qZsRz3zUn4DdIEJIzDEkzPuPtO/Wal3LBfWvsEww4S03
 GUMjCDueYL/+rzc1aqONrNCeEgNtjMW1qA9rz5g=
X-Google-Smtp-Source: ABdhPJw0q+lZqmfE3x+Vri7670v9nLGrbtEfIhdBawl7aGyfp4LRzgWreGLo8zRGutBJbY0AvtIE+ioQ0G/RtY9H+mM=
X-Received: by 2002:a25:bdd3:: with SMTP id g19mr17472024ybk.20.1622970827402; 
 Sun, 06 Jun 2021 02:13:47 -0700 (PDT)
MIME-Version: 1.0
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 6 Jun 2021 11:13:36 +0200
X-Gmail-Original-Message-ID: <CAHmME9rNnBiNvBstb7MPwK-7AmAN0sOfnhdR=eeLrowWcKxaaQ@mail.gmail.com>
Message-ID: <CAHmME9rNnBiNvBstb7MPwK-7AmAN0sOfnhdR=eeLrowWcKxaaQ@mail.gmail.com>
Subject: potentially disallowing IP fragmentation on wg packets, and handling
 routing loops better
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
Cc: Roman Mamedov <rm@romanrm.net>, zrm <zrm@trustiosity.com>, 
 StarBrilliant <coder@poorlab.com>,
 Baptiste Jonglez <baptiste@bitsofnetworks.org>, Joe Holden <jwh@zorins.us>
Content-Type: text/plain; charset="UTF-8"
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

Hi,

WireGuard is an encrypted point-to-multipoint tunnel, where onion
layering of packets via a single interface or multiple is a useful
feature. This makes handling routing loops very hard to manage and
detect. I'm considering changing and simplifying loop mitigation to a
different strategy, but not without some discussion of its
implications.

Specifically the change would be to not allow IP fragmentation of the
encrypted UDP packets. This way, in the case of a loop, eventually the
packet size exceeds MTU, and it gets dropped: dumb and effective.
Depending on how this discussion goes, a compromise would be to not
allow fragmentation, but only for forwarded and kernel-generated
packets, not not for locally generated userspace packets. That's more
complex and I don't like it as much as just disallowing IP
fragmentation all together.

Pros:
- It solves the routing loop problem very simply.
- Usually when people are fragmenting packets like that, things become
very, very slow anyway, and it'd be better to just stop working
entirely, so that people adjust their MTU.
- Is anybody actually relying on this?

Cons:
- Maybe people are running
wireguard-over-gre-over-vxlan-over-l2tp-over-pppoe-over-god-knows-what-else,
and this reduces the MTU to below 1280, yet they still want to put
IPv6 through wireguard, and are willing to accept the performance
implications.
- Some people don't know how to fix their MTUs, and breaking rather
than just becoming really slow isn't the best outcome there, maybe.
- Maybe people are relying on this?

Before anybody asks: we're not going to add a knob for this, simply by
virtue of this being a decision with pros and cons. Please don't bring
that up.

I'd be very interested in opinions about this. Are there additional
pros and cons? I know the matter has come up a few times on the list,
mostly with people _wanting_ fragmentation (I've CCd a few people from
those threads - Roman, I expect you to vigorously argue the
pro-fragmentation stance ;-). but I'm not convinced the outcome of
those threads was correct, other than, "yea, that's easy enough to
enable." But on the other hand, maybe the cons are real enough we
should rethink this.

Please let me know thoughts and ideas.

Thanks,
Jason
