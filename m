Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91510C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 13 Dec 2021 14:38:59 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 4d5ee591;
	Mon, 13 Dec 2021 14:38:10 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 49a74b9f
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Dec 2021 14:38:09 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DB520B810E2
 for <wireguard@lists.zx2c4.com>; Mon, 13 Dec 2021 14:38:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93D51C34606
 for <wireguard@lists.zx2c4.com>; Mon, 13 Dec 2021 14:38:07 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="bCWnIlAW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1639406286;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=MYKoNAInvLdqm0lmf2ClKOO+Hghwnl3y59L7p8EqiPI=;
 b=bCWnIlAWBDxoeFZUqxb5OWXdyapwDsRfKKx4v2QZF4EyRWBr9SKmjFdyQHX1eGPgvPFIhU
 z191ULU823OMp30rTNi8/9sDdMUuxjWQ1jxgu+fwrGy9RFj2xSrU5JWqNdAjU+9x8i139I
 eirJ8kSw7dnRTKE7uo5HJh+MuAIBbHA=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d9067b21
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 13 Dec 2021 14:38:05 +0000 (UTC)
Received: by mail-yb1-f173.google.com with SMTP id d10so38858542ybe.3
 for <wireguard@lists.zx2c4.com>; Mon, 13 Dec 2021 06:38:05 -0800 (PST)
X-Gm-Message-State: AOAM5300ORY6O1pfuo5YBngrdd1wKcNVJG8+2XXP1gPMvJVIMeeHwxW0
 UFPmFJfQzpSDX8qez2TyoLc6BkXsq1pedY4p1T4=
X-Google-Smtp-Source: ABdhPJxUW0lOx7PI/oOKqztfxYJ1YG9qzJTATov6VB6tZ8GWQDYZAeS6bhQluBhUAE53/qlv0V1ge5LAANqL2RpMxME=
X-Received: by 2002:a25:1e83:: with SMTP id e125mr32442079ybe.32.1639406281424; 
 Mon, 13 Dec 2021 06:38:01 -0800 (PST)
MIME-Version: 1.0
References: <20210706132714.8220-1-minipli@grsecurity.net>
 <CAHmME9odv1V9wUrLsX16J68wVD3rq+op0VvaNxtsLGG8Rrz4tQ@mail.gmail.com>
 <3ed9270f-00da-5c88-cadd-59b4419b9a98@grsecurity.net>
 <CAHmME9rFHkydmrYcS83PEf=MJP8brwsdis+7TQ=oLkO4RNTX9g@mail.gmail.com>
 <30231bb2-50e0-3880-b705-942b263eafe8@grsecurity.net>
 <CAHmME9rT+aR-FJKFxVaW+tsACKX0kH-2T6cw7xbjjaeVsJbybw@mail.gmail.com>
 <1554725710.1290070.1639240504281.JavaMail.zimbra@inria.fr>
 <3a1be638-4ddd-44c0-87aa-56cd26f4f396@grsecurity.net>
 <2026222873.1815432.1639405220767.JavaMail.zimbra@inria.fr>
 <fa249625-2698-3890-7e39-9273072810b9@grsecurity.net>
In-Reply-To: <fa249625-2698-3890-7e39-9273072810b9@grsecurity.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 13 Dec 2021 15:37:50 +0100
X-Gmail-Original-Message-ID: <CAHmME9pC=eVFq-4eiU6iFVGOqZfr7RgniAP7H5YGBXDqc7W9jg@mail.gmail.com>
Message-ID: <CAHmME9pC=eVFq-4eiU6iFVGOqZfr7RgniAP7H5YGBXDqc7W9jg@mail.gmail.com>
Subject: Re: [PATCH 0/2] wireguard-linux-compat: grsecurity compat patches
To: Mathias Krause <minipli@grsecurity.net>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Aymeric Fromherz <aymeric.fromherz@inria.fr>
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

On Mon, Dec 13, 2021 at 3:33 PM Mathias Krause <minipli@grsecurity.net> wrote:
> yeah, don't worry. We can keep this change downstream in grsec. Dunno if
> Jason wants to take it as well, his call. It was just a side observation
> which came out of our need to read and understand the code to provide a
> workaround for the gcc bug we were hitting.

I suppose I can load it up in kbench9000 to see if it makes a
difference. If it doesn't matter much, I'd prefer sticking with the
formally verified stuff. But if there is a nice speedup, then I guess
we can revisit more handwavy "obviously this is the same thing"
arguments.

Jason
