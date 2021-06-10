Return-Path: <SRS0=GgA3=LE=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_40,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB4EBC47094
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 10 Jun 2021 15:39:39 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DC3C1613E3
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 10 Jun 2021 15:39:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DC3C1613E3
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f28a591a;
	Thu, 10 Jun 2021 15:39:37 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 188e88e0
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 Jun 2021 15:39:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1623339571;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=95p9bDjvZM6Q6GRjYKTo3L7WgWHay6jUkK0iQzQfQss=;
 b=hzMYiEFZFGbt9UHzvH+0shuP+Rw5BZqGqUb5QkSsvezD+IzSSEJBje7ItyhZsak/s79QQ4
 As5oeiOt+rKmDAJGK6K0ji/YWES8Vhs8JPBzciQgGXBg6VFNQtFOEU61yO1EbnB7N1A1lW
 CMzLot1khOgAubHZ/4AS7rpuL0zQVNw=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 5235c6b8
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 10 Jun 2021 15:39:31 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id b9so41384862ybg.10
 for <wireguard@lists.zx2c4.com>; Thu, 10 Jun 2021 08:39:31 -0700 (PDT)
X-Gm-Message-State: AOAM533P9UWMN75pBz4+u0FgFZ1wM+AfWpCQGpBQNrZgAp9AO7oHZIoI
 JQM9yV5revljJf+ckbFtUmgV6Ayty47VfTDkirM=
X-Google-Smtp-Source: ABdhPJzqoZkAs1OvAe+Bkf6RHZIaBa33yAjhihpDxLlJyxzbb3L8JSxPaw0RZL5rK0/qn1KuPX/GsV1aKy6jv5aZrPo=
X-Received: by 2002:a25:bdd3:: with SMTP id g19mr8984087ybk.20.1623339570995; 
 Thu, 10 Jun 2021 08:39:30 -0700 (PDT)
MIME-Version: 1.0
References: <760B19F6-17E7-4276-B2E2-DFE07AB19323@mullvad.net>
 <CAHmME9pKnJouF-Vf20y+1w_TUs1vj1bpOggd+dgm8epfN+8-MA@mail.gmail.com>
In-Reply-To: <CAHmME9pKnJouF-Vf20y+1w_TUs1vj1bpOggd+dgm8epfN+8-MA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 10 Jun 2021 17:39:20 +0200
X-Gmail-Original-Message-ID: <CAHmME9rqAH9a28apwB9Rg1k9Lg1gmBWv3KK_8ZmAdb6H9hBaKQ@mail.gmail.com>
Message-ID: <CAHmME9rqAH9a28apwB9Rg1k9Lg1gmBWv3KK_8ZmAdb6H9hBaKQ@mail.gmail.com>
Subject: Re: WireGuard is broken on iOS 15 beta
To: Andrej Mihajlov <and@mullvad.net>
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

I won't have an updated OS to test this out in until next week at the
earliest, but perhaps this hack will work?
https://git.zx2c4.com/wireguard-apple/commit/?h=jd/fd-search-hack
Let me know if that is successful, or if it blows up.

Jason
