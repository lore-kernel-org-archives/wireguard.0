Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E89BCC433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 Dec 2021 18:56:08 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id fa14cabf;
	Mon, 6 Dec 2021 18:56:07 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 802e08f4
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 6 Dec 2021 18:56:05 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id B6E90CE17A9
 for <wireguard@lists.zx2c4.com>; Mon,  6 Dec 2021 18:56:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91A9FC341C1
 for <wireguard@lists.zx2c4.com>; Mon,  6 Dec 2021 18:55:59 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="GzVHGJCI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1638816958;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aaFqwhKaXVaxjZbLRBgZkbFWOe09ruM6xx7DOJdUf/k=;
 b=GzVHGJCIJWlj8Q/SoZe5HCjj8hmYFqVveQOcy71UbWA2JR9ksK7EuO1hxAR4JJKwwtWawU
 oSDldkcT2a7Dw6nT/CytYY/6LK6W/wuU3Ht8CRKEcbMix9y7g8Sv8Ucucvdwh4lTkaUN7G
 edHCuQ+Vm/dxndcc+wNievx/gB1nA+k=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 1c6eec0d
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 6 Dec 2021 18:55:58 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id x32so33913054ybi.12
 for <wireguard@lists.zx2c4.com>; Mon, 06 Dec 2021 10:55:57 -0800 (PST)
X-Gm-Message-State: AOAM531zSpgDQwIvzqRHugVQvbyYf3scKN8xteEFE2ejevVKJF6o4y8g
 ltEjWiDsKvJ3lEsCAspOl4uWaEP72sJH4PKVh40=
X-Google-Smtp-Source: ABdhPJxAPOnT8J69aV/9WT/8ES1yg9FDkQhFen6eVY7Iekz8cGSymZxde5NcDG9t2v08HpeOd7fJUQq9RBQuVlOOFd0=
X-Received: by 2002:a25:13c6:: with SMTP id 189mr44685216ybt.113.1638816957275; 
 Mon, 06 Dec 2021 10:55:57 -0800 (PST)
MIME-Version: 1.0
References: <20210706132714.8220-1-minipli@grsecurity.net>
 <CAHmME9o38fA4_nDVyS9FvO1EL-Z4fS+a2eCo6Xq7VzMSrPYNKQ@mail.gmail.com>
 <c772d6c2-dac7-8c11-7c41-aaa6435a0bd6@grsecurity.net>
 <CAHmME9oyopU8euSuVy7su91fia6xG5V+9i+QodCBdTGdR_rD5Q@mail.gmail.com>
 <3a2d41dc-effb-158c-4a52-d7eb282ecb7e@grsecurity.net>
 <CAHmME9r4gspVnZGhgHhB1nR6FvOaryLoZvAJwpRU=-=rrbdoqQ@mail.gmail.com>
 <5bcdecdb-fbc0-4714-895d-1b1e6a87287a@grsecurity.net>
 <CAHmME9opYoaoSTHud9sF4BOFBPS=NVYPJSGQr37bxNai26MGFg@mail.gmail.com>
 <1ef9bbf4-b8f8-18df-3c80-3181c2b5b9c5@grsecurity.net>
In-Reply-To: <1ef9bbf4-b8f8-18df-3c80-3181c2b5b9c5@grsecurity.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 6 Dec 2021 19:55:46 +0100
X-Gmail-Original-Message-ID: <CAHmME9odv1V9wUrLsX16J68wVD3rq+op0VvaNxtsLGG8Rrz4tQ@mail.gmail.com>
Message-ID: <CAHmME9odv1V9wUrLsX16J68wVD3rq+op0VvaNxtsLGG8Rrz4tQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] wireguard-linux-compat: grsecurity compat patches
To: Mathias Krause <minipli@grsecurity.net>
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

Hi Mathias,

Nice detective work! I just loaded this up on the CI, so we'll see if
this does work across the board.

It sounds like the original code also had this bug -- the "r"(out)
should be in the output constraints, not in the input constraints,
right? Sounds like something I should report to the EverCrypt authors
and also fix upstream too then.

Jason
