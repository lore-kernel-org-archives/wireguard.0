Return-Path: <SRS0=YVay=N6=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ECA6C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  8 Sep 2021 11:28:55 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85F8060EE6
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  8 Sep 2021 11:28:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 85F8060EE6
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ed6558fe;
	Wed, 8 Sep 2021 11:27:31 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a858c6ed
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 8 Sep 2021 11:27:29 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AE51D60EE6
 for <wireguard@lists.zx2c4.com>; Wed,  8 Sep 2021 11:27:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="I/1fwZMJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1631100444;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=a1wqLRAjQGQbL5Ky9793jaFJYPOWY+qCKsygcQkNMnU=;
 b=I/1fwZMJdlrivF4T0fRC+1O8hYK77EBb2N4NVvyYGHbPX8WW1XKimJmPWjQ7c9rYqIYXtc
 ZgdnSOcycX6q2wF80uwkilKf8cHvqF+Qd5pdkABP+3FGm8Y4g4/qnRdFm7tqonj7DBTxa7
 8jCybFdXdgE5h0Hq2vpJfPM57S5HPyc=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d934784f
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 8 Sep 2021 11:27:24 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id c6so3475525ybm.10
 for <wireguard@lists.zx2c4.com>; Wed, 08 Sep 2021 04:27:24 -0700 (PDT)
X-Gm-Message-State: AOAM530dJyTX0dhET7yS+AvGtDuhbo0WV3NhgJ6vtST0u0aTEKLnOyp0
 IUbE/o/JSGHkVeoXGsEdPhPOjWTcj5eRoDKMmjw=
X-Google-Smtp-Source: ABdhPJyc9K7c0UeY7LWpa1WLVs/jCnQb0RO0Eqvco1gj6mJUZ1r2lBZUnhai4+U1VSXRFVL2ey1jYQX9WDYgY2Tv5mc=
X-Received: by 2002:a25:938d:: with SMTP id a13mr4754369ybm.62.1631100442956; 
 Wed, 08 Sep 2021 04:27:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210806044315.169657-1-someguy@effective-light.com>
 <OD24ZQ.IQOQXX8U0YST@effective-light.com>
In-Reply-To: <OD24ZQ.IQOQXX8U0YST@effective-light.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 8 Sep 2021 13:27:12 +0200
X-Gmail-Original-Message-ID: <CAHmME9oSo=4BtfO+=327n=gsor5gWcvhzAMS_BpqQ-6=6yxVRA@mail.gmail.com>
Message-ID: <CAHmME9oSo=4BtfO+=327n=gsor5gWcvhzAMS_BpqQ-6=6yxVRA@mail.gmail.com>
Subject: Re: [PATCH] wireguard: convert index_hashtable and pubkey_hashtable
 into rhashtables
To: someguy@effective-light.com
Cc: LKML <linux-kernel@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>, 
 Netdev <netdev@vger.kernel.org>
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

Hi Hamza,

Thanks for this patch. I have a few concerns/questions about it:

- What's performance like? Does the abstraction of rhashtable
introduce overhead? These are used in fast paths -- for every packet
-- so being quick is important.

- How does this interact with the timing side channel concerns in the
comment of the file? Will the time required to find an unused index
leak the number of items in the hash table? Do we need stochastic
masking? Or is the construction of rhashtable such that we always get
ball-park same time?

Thanks,
Jason
