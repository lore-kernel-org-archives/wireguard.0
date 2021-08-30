Return-Path: <SRS0=ArOK=NX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84156C432BE
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  1 Sep 2021 13:44:26 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AB4EE60BD3
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  1 Sep 2021 13:44:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org AB4EE60BD3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d87c4a8a;
	Wed, 1 Sep 2021 13:44:23 +0000 (UTC)
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [2a00:1450:4864:20::235])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 3b98982e
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Aug 2021 13:20:00 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id q21so25824745ljj.6
 for <wireguard@lists.zx2c4.com>; Mon, 30 Aug 2021 06:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=3eZA4kwr38YnlBl0JQN5XDfa8e7CyMzPI4g62xrRlM4=;
 b=t6uZCQsdEfQER3LWZyBkK2eLhXBD1rlWzWjrKBvorsx7jAOIJ9GG8ofC2HDZ/XdbZj
 3Lr3kC5UP5ct31zU416Jgdw49ZYNsFIM8QdO9AnCCLi7zo3M4lDZEMxUsF5D3hHHmT06
 sP8ed9z1lUw0WD/TMKGTWrZGjcshMA0gQVGoEzm9R/0GrUyfyRAitf6DdGM5MnhUDoe4
 bUo4avNLIKbKAlV8iUJ36qcja3KwEqderD2z+18N4UHcSJ9PNCpdSMcO5QW6XiTWduRa
 GsDNsoVAnl/FvKpQWOsloqSQ4Gjabl7y21xnahH9MH2Ig+wMgVHu7RsDdpaUzXZ9OdYs
 dR1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=3eZA4kwr38YnlBl0JQN5XDfa8e7CyMzPI4g62xrRlM4=;
 b=DtoE4u15HGq/zPcWJ9tbVstE1jY+kGLHnrr5KQmIBZm/r7tsyNInyaoObVv3guqZGM
 oFYIT4oh7eeCg/6mUcgUMF/dScbuRsLPbBgISNrw1YJywoFx/R9QXSnblmzWcRSsV38l
 8BBGeHEcqWuSEah3fejDvfRnDuQ+FmE06YP+CE59oOl8smmusfQfzydq4NRX8CiDol+N
 ibJA30mTakejL161rGYau3tSxuh1m7qaURHgjzdg7cnznql8ETf2zLuO/Y3oKmmzcm8d
 cvy5owKr/c1f9NfombQ9SnQLjYEro9fHFYh9mHFROGC8GRcoHLarjlxXfEYb/T5FPkKQ
 antg==
X-Gm-Message-State: AOAM530bEuTfUuwOCLQuWZbpEyb78h59hQvOqCBb9kuzrtjry6OWfgIW
 8eCvn05sJZPUB4bbKv3Hwnceyb64sZS9t5BjkNkXdtY/plaSsGt8
X-Google-Smtp-Source: ABdhPJw5SnNth1PRY7GdTqkmPL0dtbTQDpAqjs/3VzkAs1MhE51ouq5I7gNhpxkseJ2WWK1+2GsVcsg6g9dKbA9DUoM=
X-Received: by 2002:a05:651c:17a6:: with SMTP id
 bn38mr20875053ljb.67.1630329599391; 
 Mon, 30 Aug 2021 06:19:59 -0700 (PDT)
MIME-Version: 1.0
From: Kassem Omega <kassemomega@gmail.com>
Date: Mon, 30 Aug 2021 09:19:46 -0400
Message-ID: <CAJaZ5dPHbc5s=JiCbuBKAGf1Nb3vw0xL9W7_=Na4Skt_pjnWZw@mail.gmail.com>
Subject: Suggestion for WireGuard
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 01 Sep 2021 13:44:22 +0000
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

I sent this before a couple of times to the mailing list but either it
didn't go through or it is forbidden somehow? I never got any decision
from the list moderator that it is forbidden to send suggestions at
all. Hopefully someone can answer with anything.

I was wondering if there is any chance of adding the opposite of
AllowedIPs option to WireGuard?

Currently, WireGuard has a whitelist option only that specifies which
IPs to go through it, however I believe adding the blacklist option
would be beneficial and easier to configure.

The use case: allowing all traffic to go through WireGuard except
specific ranges.

Right now to do this I must use this long list of ranges to achieve this:

AllowedIPs = 0.0.0.0/5, 8.0.0.0/7, 11.0.0.0/8, 12.0.0.0/6, 16.0.0.0/4,
32.0.0.0/3, 64.0.0.0/2, 128.0.0.0/3, 160.0.0.0/5, 168.0.0.0/6,
172.0.0.0/12, 172.16.0.0/24, 172.32.0.0/11, 172.64.0.0/10,
172.128.0.0/9, 173.0.0.0/8, 174.0.0.0/7, 176.0.0.0/4, 192.0.0.0/9,
192.128.0.0/11, 192.160.0.0/13, 192.169.0.0/16, 192.170.0.0/15,
192.172.0.0/14, 192.176.0.0/12, 192.192.0.0/10, 193.0.0.0/8,
194.0.0.0/7, 196.0.0.0/6, 200.0.0.0/5, 208.0.0.0/4, 8.8.8.8/32

However, if the DisallowedIPs option is available, I'd simply use:

DisallowedIPs = 192.168.0.0/16, 10.0.0.0/8

What do you think?

Thank you.
Kassem
