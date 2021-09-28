Return-Path: <SRS0=89gA=OS=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CBAABC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 28 Sep 2021 03:25:23 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0DB70611F0
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 28 Sep 2021 03:25:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0DB70611F0
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 31229512;
	Tue, 28 Sep 2021 03:23:01 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 4a07c339
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Sep 2021 03:22:59 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id BF21F611F0
 for <wireguard@lists.zx2c4.com>; Tue, 28 Sep 2021 03:22:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="JaFPVDVr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1632799376;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YVbfOvJhR4HG3DcTmqvSfZylxTE3BT4gD25v4VMI6gU=;
 b=JaFPVDVrCJZtLcU0MN0vonqGPOAn7GlH+VMirMiFueGCMzWEjhWdoxnO0e1nquEzbrcBrQ
 Kp4+5R7kdE12SY7Vpsd6buUB+gbXZgPF0kSnMCvAaYuz38uFVvtXckbPVjcahIWM8KC/7S
 vfS61Es2wJP3mmmy0fSxnNUAPTK9dyw=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id bb11c865
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 28 Sep 2021 03:22:56 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id i84so28675641ybc.12
 for <wireguard@lists.zx2c4.com>; Mon, 27 Sep 2021 20:22:55 -0700 (PDT)
X-Gm-Message-State: AOAM532FK17aKT3jw8n+B8K/uov6kNoLQ3n3NY45rMBjtBW7O3GdjAWO
 hyzUm0KaB9S+WPOHK6DTr7rBBpNvGjTGzDV8yR4=
X-Google-Smtp-Source: ABdhPJyODnGkFeqSnOf0IQfNi3jsSOjxlakHamUf0qcVjkoEiC5YnQLgmhj0r2UrXj1xM7Onqi7vzvWoN4YhnOBx79A=
X-Received: by 2002:a25:664c:: with SMTP id z12mr4018256ybm.62.1632799375200; 
 Mon, 27 Sep 2021 20:22:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210928031938.17902-1-xiyou.wangcong@gmail.com>
In-Reply-To: <20210928031938.17902-1-xiyou.wangcong@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 27 Sep 2021 21:22:44 -0600
X-Gmail-Original-Message-ID: <CAHmME9rbfBHUnoifdQV6pOp8MHwowEp7ooOhV-JSJmanRzksLA@mail.gmail.com>
Message-ID: <CAHmME9rbfBHUnoifdQV6pOp8MHwowEp7ooOhV-JSJmanRzksLA@mail.gmail.com>
Subject: Re: [Patch net] wireguard: preserve skb->mark on ingress side
To: Cong Wang <xiyou.wangcong@gmail.com>
Cc: Netdev <netdev@vger.kernel.org>, 
 WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Cong Wang <cong.wang@bytedance.com>, Peilin Ye <peilin.ye@bytedance.com>
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

Hi Cong,

I'm not so sure this makes sense, as the inner packet is in fact
totally different. If you want to distinguish the ingress interface,
can't you just use `iptables -i wg0` or `ip rule add ... iif wg0`?

Jason
