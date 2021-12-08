Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A534C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  8 Dec 2021 15:02:36 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 3a2c4f9c;
	Wed, 8 Dec 2021 14:57:17 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org
 [2604:1380:40e1:4800::1])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 8a3aa71e
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 8 Dec 2021 14:57:15 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id E53C7CE1FAC
 for <wireguard@lists.zx2c4.com>; Wed,  8 Dec 2021 14:57:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1FD3C341C3
 for <wireguard@lists.zx2c4.com>; Wed,  8 Dec 2021 14:57:09 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="HexVGM6a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1638975429;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=HFhBVdHV1dd3TP+sapcg4KDjVTG6N6TpY315zNho5zk=;
 b=HexVGM6a9Usj31Pv6QM3PQaLg2GrEqTI7sCK3x1sSTS3J/52pAYz0JR5bvzrtK7PbmBdWG
 IKgvHOoAgIRwbZqumEzeWJCRRCmifZ2Y+V+WRYM8UenNv7gJKeyddsvXHx9ufLpijSprav
 t3OR9iwfH8lQgsAGWgejhzccN5AAj0U=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id cee7d105
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 8 Dec 2021 14:57:08 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id v64so6584158ybi.5
 for <wireguard@lists.zx2c4.com>; Wed, 08 Dec 2021 06:57:08 -0800 (PST)
X-Gm-Message-State: AOAM530y94ZqkM+SSb5x+UHlqG2tnTeYin72TPY+hEaoc3CACOLZARPn
 RMYph9Gp7kUrNXooqCdzeCHo+6KdwTeh1UQdczI=
X-Google-Smtp-Source: ABdhPJwuAyma97rLRUogqdQiEMt+zpSbkzzclsXP4hM0c4T1p/fn3URHOs/vmcfnARUirWXVOkYADBtIFf5ryDXoCxo=
X-Received: by 2002:a25:13c6:: with SMTP id 189mr58782767ybt.113.1638975421890; 
 Wed, 08 Dec 2021 06:57:01 -0800 (PST)
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
 <3ed9270f-00da-5c88-cadd-59b4419b9a98@grsecurity.net>
In-Reply-To: <3ed9270f-00da-5c88-cadd-59b4419b9a98@grsecurity.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 8 Dec 2021 15:56:50 +0100
X-Gmail-Original-Message-ID: <CAHmME9rFHkydmrYcS83PEf=MJP8brwsdis+7TQ=oLkO4RNTX9g@mail.gmail.com>
Message-ID: <CAHmME9rFHkydmrYcS83PEf=MJP8brwsdis+7TQ=oLkO4RNTX9g@mail.gmail.com>
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

On Mon, Dec 6, 2021 at 10:00 PM Mathias Krause <minipli@grsecurity.net> wrote:
> Yes, probably, but you're mixing up the two.

Oh, thanks, right.

I'll talk to EverCrypt upstream and see.

Jason
