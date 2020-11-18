Return-Path: <SRS0=BAVD=EY=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B082C5519F
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 18 Nov 2020 14:16:45 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8745F2469D
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 18 Nov 2020 14:16:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="T4brBfoi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8745F2469D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3cfefff6;
	Wed, 18 Nov 2020 14:11:32 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c63ee8be
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 18 Nov 2020 14:11:30 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0c2c4df0
 for <wireguard@lists.zx2c4.com>;
 Wed, 18 Nov 2020 14:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=GbzrsIF58cKEPaYEKiv0Fqmkz/o=; b=T4brBf
 oiGOeNReqQKPlJ1LwS/qUKJ0zEJZB6ZY7YyQQnm2tNgC3EytZaiztk35F95iMLz6
 cdEQ1qjNP+YCxTcQmKg1faSwzJuvZIGxEJIeFySiVgifNAErP93ogQcx1IrqWE8y
 Muh2hQxguZqyekj6HuazZqfw2cStsBY05694QBup3PXIft9xJiUv4o7BSSx/iiSZ
 Yg7ZGJnLm7+UBVW4lmFH48qNQYHr7eD/ZbUTuIQjmkiSXMyhntkqIlTlLlVUarwC
 qmKQkuz0dCnEojZuXh3XJ73wNE8gE6u5lql9nE+ZTrjQ6HoD9OXapKNz7c3KVyP9
 57xM0stM6dUE/bLA==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 998a7d99
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 18 Nov 2020 14:12:16 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id t33so1822423ybd.0
 for <wireguard@lists.zx2c4.com>; Wed, 18 Nov 2020 06:16:14 -0800 (PST)
X-Gm-Message-State: AOAM531+DZPRjX1csZa433inhTuBklg4yWQfWVdedAaYiLn+4j59hK/q
 +BYkU9bQAuypF4dCZse3qC6aRzd0yCwM8c9zahU=
X-Google-Smtp-Source: ABdhPJx7/z8EKEIxos9PxbBPYc0ESAu490VhWg5AJSiYnWOf1t1BwW4GyNhWjwr95VmrfHhj3SQX83xPSDCkwGYbOKI=
X-Received: by 2002:a25:16c6:: with SMTP id 189mr5615235ybw.306.1605708974038; 
 Wed, 18 Nov 2020 06:16:14 -0800 (PST)
MIME-Version: 1.0
References: <CA+RcpwUzB+bq15AWCBxg9c-rJw=39UsqLr2j9zDn8Eteip2+yA@mail.gmail.com>
In-Reply-To: <CA+RcpwUzB+bq15AWCBxg9c-rJw=39UsqLr2j9zDn8Eteip2+yA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 18 Nov 2020 15:16:03 +0100
X-Gmail-Original-Message-ID: <CAHmME9oYZeJSJ3mn8NVOFmmqk9diCsbOH7wyeWg4JyF4p=NGAQ@mail.gmail.com>
Message-ID: <CAHmME9oYZeJSJ3mn8NVOFmmqk9diCsbOH7wyeWg4JyF4p=NGAQ@mail.gmail.com>
Subject: Re: Wintun devices and Wireshark/npcap
To: Per Allansson <pallansson@gmail.com>
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

Hi Per,

I noticed the same. It seems like npcap isn't binding to NdisMediumIP
for layer 3 devices. Thanks for posting that github issue. I'll add
some details to it so that the npcap developers can fix it.

Jason
