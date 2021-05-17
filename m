Return-Path: <SRS0=pvJ2=KM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CF389C433ED
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 17 May 2021 15:07:33 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DF69B610CD
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 17 May 2021 15:07:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DF69B610CD
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5e9aade9;
	Mon, 17 May 2021 15:07:31 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 717a0315
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 May 2021 15:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1621264043;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=bq3B2H6AF5dfcEbdwP4p9oVzonQcHYXPPlWtty2wJ9U=;
 b=FOm2EH/7o1zObhWSGXOjIy8S+KSwhP/y49mpLVVGnqiTSiQV/0t15EEJLq3oHa3eeard/x
 iZGqmJ/P32Vn9qdJnef+tX6GxtI+nQjXPMh4NeD5SEhRm9tRxyG5t2E44DcdjePPsW8VkL
 J8M4o6EjUpVOrxiv66IPzLnFXVslMuw=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id efed56c6
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 May 2021 15:07:23 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id q144so9056907ybq.0
 for <wireguard@lists.zx2c4.com>; Mon, 17 May 2021 08:07:23 -0700 (PDT)
X-Gm-Message-State: AOAM533AMnYO1oJdj9Nq5fLpareLFQZutQtTeH39b0aSZXDog6RLY3GP
 0Euskr2BtbNfPVbqvBqQpK1O9KvV9NKjcCG0hvU=
X-Google-Smtp-Source: ABdhPJxijHx6jUZa6f4kTCd0Av2lCcIgTiPPLfBuy3B6tM3LHUIW3OojN/00Sizc5GyiRy7J3C2BtOPWg652tnYzdqM=
X-Received: by 2002:a25:bb89:: with SMTP id y9mr386455ybg.456.1621264042990;
 Mon, 17 May 2021 08:07:22 -0700 (PDT)
MIME-Version: 1.0
References: <CAONL4-+8aiE3tKUn04rp8Zjc=j8vRO56OxLk5k0MoE5aqtURbA@mail.gmail.com>
In-Reply-To: <CAONL4-+8aiE3tKUn04rp8Zjc=j8vRO56OxLk5k0MoE5aqtURbA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 17 May 2021 17:07:12 +0200
X-Gmail-Original-Message-ID: <CAHmME9pDQCKGR+bkDREd47y9nXr2Bs-kKOgnmjN6AoP2PddRug@mail.gmail.com>
Message-ID: <CAHmME9pDQCKGR+bkDREd47y9nXr2Bs-kKOgnmjN6AoP2PddRug@mail.gmail.com>
Subject: Re: wireguard.exe no MessageBox option?
To: Andrew Burkett <burkett.andrew@gmail.com>
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

Hi Andrew,

It's a bit tricky, because UI apps are treated differently than
console apps: cmd.exe won't wait for them to complete, and they get
empty stdio handles. But I've used the latter property to detect
what's up and hopefully achieve some kind of compromise. Let me know
if this commit does the trick:

https://git.zx2c4.com/wireguard-windows/commit/?id=ed59b1b2e834b6d35b11bab63551b21bc60d7f35

Basically, if stderr is available, logs go there. Otherwise if stdout
is available, logs go there. Otherwise errors show in a message box.

So this should allow you to do things like:

wireguard /installtunnelservice ... 2>C:\path\to\log.txt

Jason
