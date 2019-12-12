Return-Path: <SRS0=NvnE=2C=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61D6CC43603
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 12 Dec 2019 09:53:36 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AEE0D214AF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 12 Dec 2019 09:53:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="W0zjhyFu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AEE0D214AF
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2eaa20ed;
	Thu, 12 Dec 2019 09:53:08 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5e1eacc5
 for <wireguard@lists.zx2c4.com>;
 Thu, 12 Dec 2019 09:53:06 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1ff7282a
 for <wireguard@lists.zx2c4.com>;
 Thu, 12 Dec 2019 09:53:06 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 58ae5a73
 for <wireguard@lists.zx2c4.com>;
 Thu, 12 Dec 2019 08:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=uLMjB8m4/DGzwbgB4YAjzY8FX+s=; b=W0zjhy
 FuZk2iDgknFlmyo7GxA2cpuOWLEZgWuRp3L6VPFZIkKIMGeClAq3vJMrh1Njxztl
 KYpyG6juhnFoNZDCN/yctB02IqatVHaPrJZmaZom4SSV3KU6NIdu2mXIZ6cG6Aiz
 yLlE/YLgFSv8Qavk+h4NwoFs0zHjP3h2fEqJY9WSApOixeN9Y9nbHOUBlrkZYwYP
 v8caggK+asJGXMQYqXyo/CNGzQxyEfRmRwRQgS5Q4KbZ9gEMmiAje00JBWZIjBfk
 lDKIOVdCfHphrXiMMYR415/QgNqFKjQMDy6x6t5qIGQxljs7CQTb2bdAubeQAdzd
 UoqSgYghBxJCT9hQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a85a4d8f
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 12 Dec 2019 08:57:19 +0000 (UTC)
Received: by mail-ot1-f47.google.com with SMTP id r27so1235142otc.8
 for <wireguard@lists.zx2c4.com>; Thu, 12 Dec 2019 01:53:06 -0800 (PST)
X-Gm-Message-State: APjAAAWNJygRbezzJNBtwIcsgLgT3v8keygUC6f7SNvCo1wBrjrVJorV
 DX3o9x2FnvWVSTfsoAc6tdOt7TxLOBT71b1Jqes=
X-Google-Smtp-Source: APXvYqzzCr8AIVVzRHm5jB+v++pLKtoFo36nbLfIhws6k4JnwsU8tvA44DpopjLtyjY6u6I87eEYZ1DhGjq6VqKLNOw=
X-Received: by 2002:a05:6830:1b6a:: with SMTP id
 d10mr7471945ote.52.1576144385762; 
 Thu, 12 Dec 2019 01:53:05 -0800 (PST)
MIME-Version: 1.0
References: <20191212091527.35293-1-yuehaibing@huawei.com>
In-Reply-To: <20191212091527.35293-1-yuehaibing@huawei.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 12 Dec 2019 10:52:54 +0100
X-Gmail-Original-Message-ID: <CAHmME9pVuOR-EMxXVHVqippJ6UL4cMEoXZ4hoooK-qtQ=az5uQ@mail.gmail.com>
Message-ID: <CAHmME9pVuOR-EMxXVHVqippJ6UL4cMEoXZ4hoooK-qtQ=az5uQ@mail.gmail.com>
Subject: Re: [PATCH net-next] net: Remove unused including <linux/version.h>
To: YueHaibing <yuehaibing@huawei.com>
Cc: Netdev <netdev@vger.kernel.org>, kernel-janitors@vger.kernel.org,
 "David S . Miller" <davem@davemloft.net>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>,
 LKML <linux-kernel@vger.kernel.org>
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

On Thu, Dec 12, 2019 at 10:18 AM YueHaibing <yuehaibing@huawei.com> wrote:
>
> Remove including <linux/version.h> that don't need it.
>
> Signed-off-by: YueHaibing <yuehaibing@huawei.com>

Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>

Thanks. Committed with some wording changes to wireguard-linux.git for staging:

https://git.kernel.org/pub/scm/linux/kernel/git/zx2c4/wireguard-linux.git/commit/?id=062fd1993cdbf64a57395320c719e58b9a75b767

I'll re-send this to net-next as part of a cleanup series I'm
preparing in a few days.

Jason
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
