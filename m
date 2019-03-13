Return-Path: <SRS0=DyWu=RQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB087C43381
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 13 Mar 2019 20:45:04 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 206BA2077B
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 13 Mar 2019 20:45:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="O7YHGWFR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 206BA2077B
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 11c64f78;
	Wed, 13 Mar 2019 20:33:22 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0d514b40
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Mar 2019 20:33:20 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 985d3257
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Mar 2019 20:33:20 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 647c31f7
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Mar 2019 20:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=KfFbzfTaZWyRC7axFC/+8aEqJ0k=; b=O7YHGW
 FRoE3DUe/9Es1zr/rqUU2VqBVXJ3EK7mY0ClYyAP5IE7MKTDZG0end0WoF5VOzhy
 zipY4zZcX6Osg3AvlkfcaRNXoPUiABGnePa5WlCI/7B3y9cpCfBZA70ZkJzzgSol
 af3jDzZ+/9vKGQJBREZQs7E4M7gjuO2PZAFaEzkA73Y+n+qsmMLsgpSOyd6c3Mfx
 K8m5JReOkirycSdjzkRCqXoMTm/sbCMhgWMW7f4/IOdisa+HbpXq+IX5dXIX9yCB
 7NyxvmcWAyPLxswfB+wA9dTq3LtHQlCELGVUzw5K8WI+c88H9Nc8akYXzd/Jug0m
 UMIMggAqbSt5tRPg==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3facc95d
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Mar 2019 20:24:06 +0000 (UTC)
Received: by mail-oi1-f181.google.com with SMTP id t206so2613457oib.3
 for <wireguard@lists.zx2c4.com>; Wed, 13 Mar 2019 13:44:44 -0700 (PDT)
X-Gm-Message-State: APjAAAVJMPE7AOe/RbL81VIbm+h0PIe71btUVcyEO9833688qElyWx29
 Exj0n9TkfYGJyae/0RLi+wL7tOnHBB4rP0YAwLs=
X-Google-Smtp-Source: APXvYqyv0bcufj1jWFK7crMLvQ/5JE5ub5m747RqXTtA53A1aKPVzq1tx6GLZuHC1Tz9Ch+2vwYCb3GQYKpMCohAISM=
X-Received: by 2002:aca:eb52:: with SMTP id j79mr44312oih.119.1552509883888;
 Wed, 13 Mar 2019 13:44:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190313183818.GA4501@wolff.to> <20190313185259.GA4579@wolff.to>
In-Reply-To: <20190313185259.GA4579@wolff.to>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 13 Mar 2019 14:44:33 -0600
X-Gmail-Original-Message-ID: <CAHmME9pfdqfW_7+_vWcN-YJcJcG7hFpBWpw8251Y_Nv5v5FxFg@mail.gmail.com>
Message-ID: <CAHmME9pfdqfW_7+_vWcN-YJcJcG7hFpBWpw8251Y_Nv5v5FxFg@mail.gmail.com>
Subject: Re: Pre 5.1-rc1 build issue
To: Bruno Wolff III <bruno@wolff.to>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

On Wed, Mar 13, 2019 at 12:53 PM Bruno Wolff III <bruno@wolff.to> wrote:
> I got something that seems to be working. So I'm good until the real fixes
> are ready.

Perhaps your [fake?!] fixes could become the real fixes if you ran
`git send-email` to the mailing list?

Jason
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
