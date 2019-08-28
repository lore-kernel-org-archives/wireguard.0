Return-Path: <SRS0=H7Gu=WY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F22EC3A5A3
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 28 Aug 2019 02:30:28 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C564A214DA
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 28 Aug 2019 02:30:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="spw4/gGx"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C564A214DA
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7b3ab796;
	Wed, 28 Aug 2019 02:30:26 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0cbf4afd
 for <wireguard@lists.zx2c4.com>;
 Wed, 28 Aug 2019 02:30:25 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c072b49f
 for <wireguard@lists.zx2c4.com>;
 Wed, 28 Aug 2019 02:30:25 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2149aa16
 for <wireguard@lists.zx2c4.com>;
 Wed, 28 Aug 2019 01:48:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=69CeHjb1sYm1cW5gL+gXDJ/Ql20=; b=spw4/g
 Gx1mYnPYqIqjF/AXyip3SZQT7Xwvb8IAq3q4fks9S5e0DOZFEk7pGIJEbKUC1LDS
 tPiTzguaViL85tmB4p6bFV3/3y4j91UDOQEm92Mu1vvel8fZt4M4EynbFf1ENY3N
 FUqMptc1Uvx0AJ7EWS8F/bSBHiUNp6PD5ifYxpE8LLro4r0jnsea9DHZ2xrF7NcU
 d4lDHTLbNd5AtSNNUlditqRCMAZocxjHoUnRTJnhVxbKGwbXXQEjNy7k8N+pjR3U
 euA1Xqm0+35NcBAJ+wuVxFGBq+MV5Ks3IgpYVDcyHUuNAFx/vaQ2vrGE55hoJfNJ
 96GlJ3ceumZZHJ/g==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a19f216a
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 28 Aug 2019 01:48:18 +0000 (UTC)
Received: by mail-ot1-f51.google.com with SMTP id r20so1252737ota.5
 for <wireguard@lists.zx2c4.com>; Tue, 27 Aug 2019 19:30:24 -0700 (PDT)
X-Gm-Message-State: APjAAAURufyW7WemIHPJDaFhCc0GnzmuOJC62YH3Rew9HVCu7OF8uiYi
 jyan3gTP3IxaQMz+2uwkQ1QTVVP7qVRG9wJQWy8=
X-Google-Smtp-Source: APXvYqyOGoCdsZUQGdoh76Pvcz65SC5a8HE3If91vLIU+7LXvYYwxLvSCt/ml4LJoEPS8LCqEdX23TmWPoljs8ey3kE=
X-Received: by 2002:a9d:675a:: with SMTP id w26mr1417326otm.179.1566959424271; 
 Tue, 27 Aug 2019 19:30:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190828014214.12289-1-rpigott@berkeley.edu>
In-Reply-To: <20190828014214.12289-1-rpigott@berkeley.edu>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 27 Aug 2019 20:30:13 -0600
X-Gmail-Original-Message-ID: <CAHmME9q=Wo_hD-KVnTf=VR4OiR7QAFT922KuGN6KKwU6Mo7Qkw@mail.gmail.com>
Message-ID: <CAHmME9q=Wo_hD-KVnTf=VR4OiR7QAFT922KuGN6KKwU6Mo7Qkw@mail.gmail.com>
Subject: Re: [PATCH v2] wg-quick: linux: Don't fail systemd service when using
 systemd-resolved
To: Ronan Pigott <rpigott314@gmail.com>
Cc: Ronan Pigott <rpigott@berkeley.edu>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
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

On Tue, Aug 27, 2019 at 8:25 PM Ronan Pigott <rpigott314@gmail.com> wrote:
>
> From: Ronan Pigott <rpigott@berkeley.edu>
>
> v2 patch for systemd-resolved support.

Thanks! Merged here with one minor change:
https://git.zx2c4.com/WireGuard/commit/?id=e5a754ec46737ae12436b5ce47f6fd9d613049e1
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
