Return-Path: <SRS0=IBFn=JW=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7B42C433ED
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Apr 2021 12:24:37 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5A0D61177
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Apr 2021 12:24:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5A0D61177
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ntrv.dk
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9f5bd1c9;
	Sun, 25 Apr 2021 12:21:44 +0000 (UTC)
Received: from mail-relay.contabo.net (mail-relay.contabo.net [161.97.176.84])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 9ae05d13
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Apr 2021 12:21:42 +0000 (UTC)
Received: from pxmg2.contabo.net (localhost.localdomain [127.0.0.1])
 by mail-relay.contabo.net (Proxmox) with ESMTP id 3A06B101052
 for <wireguard@lists.zx2c4.com>; Sun, 25 Apr 2021 14:21:42 +0200 (CEST)
Received: from m14060.contaboserver.net (m14060.contabo.net [213.136.93.170])
 by mail-relay.contabo.net (Proxmox) with ESMTPS id 8E3001012C0
 for <wireguard@lists.zx2c4.com>; Sun, 25 Apr 2021 14:21:41 +0200 (CEST)
Received: from mail-qv1-f48.google.com ([209.85.219.48]:39780)
 by m14060.contaboserver.net with esmtpsa (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256 (Exim 4.94)
 (envelope-from <ch@ntrv.dk>) id 1ladlc-0007ys-9s
 for wireguard@lists.zx2c4.com; Sun, 25 Apr 2021 14:21:41 +0200
Received: by mail-qv1-f48.google.com with SMTP id 3so1202169qvp.6
 for <wireguard@lists.zx2c4.com>; Sun, 25 Apr 2021 05:21:40 -0700 (PDT)
X-Gm-Message-State: AOAM533WGMjGmBA6Bw7GT0g/aYKbRMqydyDBrNrkmfYtFvfCtZ+CEdEp
 vhwqSsh2D5a3aKsUuGfjOgTcjKM3/AXMGkyZGV0=
X-Google-Smtp-Source: ABdhPJzKN0DvqeYoQFAop191Kqju1LKfk+4ltRrq7qz27Py3bNsVqWTKxGlMH8FkFYYaPZo5WsNNe+7e4TjAzt+N8cc=
X-Received: by 2002:a0c:8c03:: with SMTP id n3mr5757600qvb.32.1619353299609;
 Sun, 25 Apr 2021 05:21:39 -0700 (PDT)
MIME-Version: 1.0
References: <0c8b4be5-ee9d-4f19-7179-ad08a28d0574.ref@yahoo.co.uk>
 <0c8b4be5-ee9d-4f19-7179-ad08a28d0574@yahoo.co.uk>
In-Reply-To: <0c8b4be5-ee9d-4f19-7179-ad08a28d0574@yahoo.co.uk>
From: Chriztoffer Hansen <ch@ntrv.dk>
Date: Sun, 25 Apr 2021 14:21:02 +0200
X-Gmail-Original-Message-ID: <CA+cYV6uTvNYv3wkZ9vS8wBP5BHEmg8rZHg7WBvyRkHdd+fjpVg@mail.gmail.com>
Message-ID: <CA+cYV6uTvNYv3wkZ9vS8wBP5BHEmg8rZHg7WBvyRkHdd+fjpVg@mail.gmail.com>
Subject: Re: wgX iface as slave to a bridge - Linux
To: lejeczek <peljasz@yahoo.co.uk>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - m14060.contaboserver.net
X-AntiAbuse: Original Domain - lists.zx2c4.com
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - ntrv.dk
X-Get-Message-Sender-Via: m14060.contaboserver.net: authenticated_id:
 ch@ntrv.dk
X-Authenticated-Sender: m14060.contaboserver.net: ch@ntrv.dk
X-Source: 
X-Source-Args: 
X-Source-Dir: 
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

> Can wiregurard ifaces be enslaved by LInux bridge? I tried
> but it did not work for me. Similarly "mavclan" -
> would/should wireguard work that way?

Why would you want to enslave an L3-only capable interface to an L2 bridge?

What is your use case behind the question?

-- 
Chriztoffer

