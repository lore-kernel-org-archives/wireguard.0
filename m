Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22D07C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 Dec 2021 19:28:24 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id b5b36ff8;
	Mon, 6 Dec 2021 19:28:23 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id e6c8d3d8
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 6 Dec 2021 19:28:21 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 38978CE169F
 for <wireguard@lists.zx2c4.com>; Mon,  6 Dec 2021 19:28:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F075C341C2
 for <wireguard@lists.zx2c4.com>; Mon,  6 Dec 2021 19:28:17 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="A3vCp3T4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1638818895;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=55psIZ/zWVhKOetEG+1klI/OsjNNNkAyI3xTpf5uC6I=;
 b=A3vCp3T4TiVUYupZ1A8kntl1cuCHzOYtLER6EZr5PMuuOQnxcL1ojkBolFQx7MLltWDgtU
 n7EeKv8Hk6LG375Hr1izvmRPFN/Br0DKR2oRWQcmw+CCM9nkqud7ca1vSeskdSngvGU5tb
 mUSmOIpHd36LZI8kYGWfICObNu2eJs8=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 67a89eb1
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 6 Dec 2021 19:28:14 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id j2so34187124ybg.9
 for <wireguard@lists.zx2c4.com>; Mon, 06 Dec 2021 11:28:14 -0800 (PST)
X-Gm-Message-State: AOAM530jsxnJ5uJVrXrbg6WT46x8K4I05FR9h+kdaj0kLa2qbYftlFjy
 WjEreabt92Ag3+B8yvCVRWq0MGJCgdtzx1+td1Q=
X-Google-Smtp-Source: ABdhPJwElUXz278hK3tZRt2emYKvZweZd4RJ+g3tKoXdRZm788jvQiJeVrfeRNRUxjV9THarCenGWFKKEnQgp7zX5Ig=
X-Received: by 2002:a25:a427:: with SMTP id f36mr44989378ybi.245.1638818893893; 
 Mon, 06 Dec 2021 11:28:13 -0800 (PST)
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
 <CAHmME9odv1V9wUrLsX16J68wVD3rq+op0VvaNxtsLGG8Rrz4tQ@mail.gmail.com>
In-Reply-To: <CAHmME9odv1V9wUrLsX16J68wVD3rq+op0VvaNxtsLGG8Rrz4tQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 6 Dec 2021 20:28:02 +0100
X-Gmail-Original-Message-ID: <CAHmME9qhZZWf2SNFGWJepzuLXZx1o+AEa9-QunWupxBE8sk2mA@mail.gmail.com>
Message-ID: <CAHmME9qhZZWf2SNFGWJepzuLXZx1o+AEa9-QunWupxBE8sk2mA@mail.gmail.com>
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

On Mon, Dec 6, 2021 at 7:55 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> Nice detective work! I just loaded this up on the CI, so we'll see if
> this does work across the board.

Looks like https://git.zx2c4.com/wireguard-linux-compat/commit/?id=42c931dbccf9570f10a84e282daf79f385d51623
is all green on https://www.wireguard.com/build-status/ in the
wireguard-linux-compat category. Let me know if that commit looks okay
to you or if you want to adjust something about it. After that, I'll
cut a new compat snapshot release.

Jason
