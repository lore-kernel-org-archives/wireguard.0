Return-Path: <SRS0=+SnU=QD=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95BA6C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 16 Nov 2021 14:38:15 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B8E8F61BF5
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 16 Nov 2021 14:38:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B8E8F61BF5
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 77dd7366;
	Tue, 16 Nov 2021 14:35:57 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2959e586
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 16 Nov 2021 14:35:56 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 102EC61C12
 for <wireguard@lists.zx2c4.com>; Tue, 16 Nov 2021 14:35:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="PCkrc5GM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1637073352;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aVvWJd39MYeyeXC45cmKJyUS0lCWpXog0spU1EM+noY=;
 b=PCkrc5GMc1qWLgfXCw1ItycqGQOu16H22orWQS0UumpbaOR014iB/b+YmU9zD6xZiBxnrg
 v6ryvudDe58myVnXCPEBKtwE8M+HN5gAREkBmdEdxC9sK7GgUGER9wHF3pbluSchxBTpv/
 by8XlzzBi+BVw5iqYt65+fYkWG1IvWw=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b50de3ba
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 16 Nov 2021 14:35:52 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id e71so18609054ybh.10
 for <wireguard@lists.zx2c4.com>; Tue, 16 Nov 2021 06:35:51 -0800 (PST)
X-Gm-Message-State: AOAM530myoWhlfIxGJN3b+cCk7TJKo6e+HcPFebuOrUHuLO3Ej+Lg7sH
 R+8i5BMyM/+QK6qR2kxUAJhnJ+pPTLLY5YoOpPg=
X-Google-Smtp-Source: ABdhPJyK8fZhJKugHashqCWYgbrM0WK5WAdHzetQ2HIizA6DknS8jNCPsJEtvdY389KpOzysx5m3hyDpAUEIf1bTVzU=
X-Received: by 2002:a5b:783:: with SMTP id b3mr8299681ybq.328.1637073351028;
 Tue, 16 Nov 2021 06:35:51 -0800 (PST)
MIME-Version: 1.0
References: <20211116081359.975655-1-liuhangbin@gmail.com>
In-Reply-To: <20211116081359.975655-1-liuhangbin@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 16 Nov 2021 15:35:40 +0100
X-Gmail-Original-Message-ID: <CAHmME9pNFe7grqhW7=YQgRq10g4K5bqVuJrq0HonEVNbQSRuYg@mail.gmail.com>
Message-ID: <CAHmME9pNFe7grqhW7=YQgRq10g4K5bqVuJrq0HonEVNbQSRuYg@mail.gmail.com>
Subject: Re: [PATCH wireguard] wireguard: selftests: refactor the test
 structure
To: Hangbin Liu <liuhangbin@gmail.com>
Cc: Shuah Khan <shuah@kernel.org>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>, 
 Netdev <netdev@vger.kernel.org>, linux-kselftest@vger.kernel.org
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

Hi Hangbin,

I don't know how interested in this I am. Splitting things into two
files means more confusing maintenance, and categorizing sections
strictly into functions means there's more overhead when adding tests
(e.g. "where do they fit?"), because the categories you've chosen are
fairly broad, rather than being functions for each specific test. I'd
be more amenable to something _entirely_ granular, because that'd be
consistent, or what we have now, which is just linear. Full
granularity, though, has its own downsides, of increased clutter.
Alternatively, if you'd like to add some comments around the different
areas to better document what's happening, perhaps that'd accomplish
the same thing as this patch.

Jason
