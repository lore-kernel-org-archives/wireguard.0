Return-Path: <SRS0=mIIS=PF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FA15C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 17 Oct 2021 00:58:09 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2597060FDC
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 17 Oct 2021 00:58:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2597060FDC
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e86d6bae;
	Sun, 17 Oct 2021 00:52:50 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 80b31e99
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 17 Oct 2021 00:52:47 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id AA05E604DC
 for <wireguard@lists.zx2c4.com>; Sun, 17 Oct 2021 00:52:45 +0000 (UTC)
Authentication-Results: mail.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="kxy/v0KE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1634431963;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=FJIuKjRAhhixfVFnAajHURi6SxUwX5+a1yvX+oUTaKg=;
 b=kxy/v0KEgMSri9GHLmz8EphHrDj+K0WSlVALiQ2AnOQf4lA+KL4KpV7Y6QYyllvcKd0kbf
 EkQABeOoEXx2A5jMBefjWTEUej1CIIDzAWW8RG8Jis7C4NP4pu4iL2fOv2Fd18DNQ3mg6e
 5FUlHThaA9R/dNKprTUE+B6VIq7dHTU=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c9db2f68
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 17 Oct 2021 00:52:43 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id n65so114254ybb.7
 for <wireguard@lists.zx2c4.com>; Sat, 16 Oct 2021 17:52:43 -0700 (PDT)
X-Gm-Message-State: AOAM533hIU97wsYpW7Ju8tZzomQEBjUl/Nrwz1+eFfKIdMVUe4y0/qAi
 vlGQWBbakcHufSg9E5AJYn4v/7xscL7MZFFkF44=
X-Google-Smtp-Source: ABdhPJyHsCnIRSSidA40ME5TbqpNHoUT6g+HTxLxsz01RqITBczw7IqpF94SeS225jgTkc9JfVMCWiYDsfqyuxJ9gnI=
X-Received: by 2002:a5b:783:: with SMTP id b3mr21719542ybq.328.1634431962795; 
 Sat, 16 Oct 2021 17:52:42 -0700 (PDT)
MIME-Version: 1.0
References: <DM6PR01MB4444144DA39B5197C71D9762D7BA9@DM6PR01MB4444.prod.exchangelabs.com>
In-Reply-To: <DM6PR01MB4444144DA39B5197C71D9762D7BA9@DM6PR01MB4444.prod.exchangelabs.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 16 Oct 2021 18:52:32 -0600
X-Gmail-Original-Message-ID: <CAHmME9p=qmQhJ5SQRhorjZJzVDpaX7BK1EA7douTwY856y9t1A@mail.gmail.com>
Message-ID: <CAHmME9p=qmQhJ5SQRhorjZJzVDpaX7BK1EA7douTwY856y9t1A@mail.gmail.com>
Subject: Re: [PATCH] Fixed null pointer exception when user namespace is empty
To: Aaron Avery <aavery77@hotmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Hi Aaron,

That patch is missing your Signed-off-by line, so I won't be able to
take it as-is.

However, I also wonder if it makes sense. I just grepped the entire
kernel and I couldn't find any other instances of net->user_ns being
NULL checked. Is it possible that there's a bug in QNAP's kernel
somewhere? Or you're compiling against the wrong .config so the struct
offsets are wrong? Or something else? When should net->user_ns be
NULL?

Thanks,
Jason
