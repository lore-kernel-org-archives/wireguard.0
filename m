Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 090B1C25B75
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 21 May 2024 11:11:21 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6e670a03;
	Tue, 21 May 2024 11:11:16 +0000 (UTC)
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [2607:f8b0:4864:20::102a])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 04d5a67f
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 21 May 2024 11:11:14 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 98e67ed59e1d1-2bd70bd741bso1599026a91.1
 for <wireguard@lists.zx2c4.com>; Tue, 21 May 2024 04:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1716289873; x=1716894673; darn=lists.zx2c4.com;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=NHsRr4y7m2U14O1yEcxY/DhfVKdlwJQjccZ03YF+KSE=;
 b=Qy/qgey6CkJDEKVaxE9uV5REwcAQbJQMy5X0xSZ03jJ1gGcnccr731HdNwavOfRuQc
 eFaJz/9pBqloRQrD2jRiglQOBYEURiS7eSerLF+c+3cCl52PzRwdEZbp74ghSG7WG/Zj
 ewrrQyEZo/EN15ReMUwHNb/f9Nr9EdWcUIPeuG7Zbi+SmsTv7gD4fIPfke4qjS8N0kc9
 bY6lAHUokGA83KMRU1j89nA74Eyn/XJ1G7Y69E+3zF0+tle5tyADItpv+QoXc02mzuiZ
 H1QXpleUSHNG4L+Q1PZEvfM0fVvuFhQ2T7dvQVsaXgjGQ8j+D4P2QGVkW1qz599XTi01
 RyUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716289873; x=1716894673;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NHsRr4y7m2U14O1yEcxY/DhfVKdlwJQjccZ03YF+KSE=;
 b=WTXd3ZN20yuPzjntsQTtCS+por8xQRse8YqUHnzaHLxuTweOcx7qsbC3FR91uemGKq
 wRTWceJ5zUj8E9l5OKn0F1ZRmHP9WPCAgGUMvk2BkFFHpIkEvU4t94XEtLiH3LlmRWlN
 3LKCd2w0S/sZfDBe3ZLO3/mYUA9c8w78yk2GY0IgLFjv5zf+ZYIlx1cHNXRugLHExCoD
 P/4PAryDXOdorTIehVAlRREqd+Rce5PMPCUsazCKY/FBzPQG4b7GA2p2Zgj+E/O+HlqB
 1ZYkK/ygiWiJRJJy9fhJmDvooDp2af/gFwDQWw4Htvz4oTJ6NpqMUD2EPl5Ac+ErjDcO
 84xw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXDmcZquTotwEGQdtn+lgAMChqI/SP7LVPmduEaSVzxHpLkVnE+itA8Cbb9moZ6KxRJMOz7vrBTRUkQ3MQn+gXBKFI0RbuBipsV
X-Gm-Message-State: AOJu0YwSo6zgGAY7bwfhLSr1KQT7+0K7YrAaQz4NCvJ8IbMQf8iRX6pc
 5cJD95pnDIiq5yQi6edtev5V0dvZHoHJbn4Ud96XOL1e5pRGar6xWM2Eer+tTMcvYqooarhuFis
 lbAi1XzeVyo2NdIG5NUwsfowY4jE=
X-Google-Smtp-Source: AGHT+IEItJuUj3MocTicN4wG2poWxor+c7hektK5NaU5ZKExNbjmeYwYktlKMcmbeIUomI0vyGUPijRxvzIwEBcyXnk=
X-Received: by 2002:a17:90a:bf15:b0:2bd:85e8:79de with SMTP id
 98e67ed59e1d1-2bd85e87aa2mr6104368a91.11.1716289872444; Tue, 21 May 2024
 04:11:12 -0700 (PDT)
MIME-Version: 1.0
References: <87le4cfz0u.fsf@ungleich.ch>
 <20240514113648.neaj6kfazx4fi7af@House.clients.dxld.at>
 <87msojhbq0.fsf@ungleich.ch>
In-Reply-To: <87msojhbq0.fsf@ungleich.ch>
From: Janne Johansson <icepic.dz@gmail.com>
Date: Tue, 21 May 2024 13:11:00 +0200
Message-ID: <CAA6-MF-npREucdWneVw+DWMQi3bG+3zp98VNctErfLMuRkvY9A@mail.gmail.com>
Subject: Re: Wireguard address binding - how to fix?
To: Nico Schottelius <nico.schottelius@ungleich.ch>
Cc: =?UTF-8?Q?Daniel_Gr=C3=B6ber?= <dxld@darkboxed.org>, 
 WireGuard mailing list <wireguard@lists.zx2c4.com>,
 "Jason A. Donenfeld" <Jason@zx2c4.com>
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

Den tis 21 maj 2024 kl 09:50 skrev Nico Schottelius
<nico.schottelius@ungleich.ch>:
> Hello Jason,
> do you mind applying the patch from Daniel? Or is there anything wrong with it?
>
> Daniel: amazing work, I was not aware that you have already put in the
> hard work, thank you so very much!
>
> The world (*) is suffering because of the lack of IP address binding in wireguard.
>
> (*) With world I refer to every engineer that needs to run wireguard in
> non-trivial situations with multiple IP addresses on one host, which is
> extremely common for anything that routes.

Well, the main reason for wg to NOT do anything special is because
routing generally is done by looking at the destination ip and then
using the routing rules which the kernel uses to tell the packet which
interface is considered "best" in order to reach that ip, which is why
icmp and udp acts like this. I am certain that many engineers
hope/think it would be more logical (or fit their designs better) if
it responded on the same interface as the packet came in or whatever
but the reason for wg to act like it does is because this is how
connection-less packets have been acting since ages. The point that
many engineers design wg endpoints "the wrong way" is probably a fault
of education when it comes to how TCP/IP stacks did and do manage IP
output.

I have zero power to decide anything regarding how wg chooses to
implement a workaround for IP being designed the way it is designed,
but I can at least see why it hasn't immediately been accepted even if
it would make some engineers suffer(*) less, at least in the short
term.

There are a lot of workarounds for the times when you did design the
udp service as if it would act like tcp does in multihomed situations,
which includes firewall tricks, or VRF/namespace/routing-domains to
make sure the inner and outer address-pairs for the wg tunnel see
different views of the network to handle this without changing how wg
sends packets.

-- 
May the most significant bit of your life be positive.
