Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B42A0C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 10 Dec 2021 23:01:10 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id c1f34358;
	Fri, 10 Dec 2021 22:58:22 +0000 (UTC)
Received: from sin.source.kernel.org (sin.source.kernel.org [145.40.73.55])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id a87bd55c
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 10 Dec 2021 22:58:20 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 0E9C8CE2D89
 for <wireguard@lists.zx2c4.com>; Fri, 10 Dec 2021 22:58:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23EBFC341C8
 for <wireguard@lists.zx2c4.com>; Fri, 10 Dec 2021 22:58:15 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="kJDixTZs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1639177093;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=80TuZSBR3pgAQ4KzwOXtG7jEgl+ygU68FONJA93NQlE=;
 b=kJDixTZsdsgnysqiYzcr2AqHEAXGtb5V/bRwYfPB7c141qhWphkj2jnapWCVj5Cuwqf8KN
 nYdZZ691wSD6YohmeptP1amVTrusSP+dmFsCtDPFrijGyGcvLHIatsa3446gixxqlwAUN9
 ZDUhmZ+CfHwK1IT8GzzQTuBBrCeseXc=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3416eadb
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 10 Dec 2021 22:58:13 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id j2so24571860ybg.9
 for <wireguard@lists.zx2c4.com>; Fri, 10 Dec 2021 14:58:12 -0800 (PST)
X-Gm-Message-State: AOAM530nWf8HCCaDEM9ybifN/5stUatQiLHUQfz9pPY53FEKwduglrDs
 4w8AA7HLnLoK1JH9f+WfmM5W+4Rq8rcgCkWg8L4=
X-Google-Smtp-Source: ABdhPJzboetutmYxFbebgYXODvYK0O8mLjcu79NGLH7y3oWjzfltaDbAtsFdx8w+P8w4Zrtc4dlcSxVQSSeCASd+HLM=
X-Received: by 2002:a25:d393:: with SMTP id
 e141mr18750628ybf.255.1639177092117; 
 Fri, 10 Dec 2021 14:58:12 -0800 (PST)
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
 <CAHmME9rFHkydmrYcS83PEf=MJP8brwsdis+7TQ=oLkO4RNTX9g@mail.gmail.com>
 <30231bb2-50e0-3880-b705-942b263eafe8@grsecurity.net>
In-Reply-To: <30231bb2-50e0-3880-b705-942b263eafe8@grsecurity.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 10 Dec 2021 23:58:01 +0100
X-Gmail-Original-Message-ID: <CAHmME9rT+aR-FJKFxVaW+tsACKX0kH-2T6cw7xbjjaeVsJbybw@mail.gmail.com>
Message-ID: <CAHmME9rT+aR-FJKFxVaW+tsACKX0kH-2T6cw7xbjjaeVsJbybw@mail.gmail.com>
Subject: Re: [PATCH 0/2] wireguard-linux-compat: grsecurity compat patches
To: Mathias Krause <minipli@grsecurity.net>, aymeric.fromherz@inria.fr
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

CC'ing in Aymeric, who's working on Vale's codegen.

On Thu, Dec 9, 2021 at 8:59 AM Mathias Krause <minipli@grsecurity.net> wrote:
>
> Am 08.12.21 um 15:56 schrieb Jason A. Donenfeld:
> > On Mon, Dec 6, 2021 at 10:00 PM Mathias Krause <minipli@grsecurity.net> wrote:
> >> Yes, probably, but you're mixing up the two.
> >
> > Oh, thanks, right.
> >
> > I'll talk to EverCrypt upstream and see.
>
> FWIW, 'out' is also wrongly flagged as output operand in fmul() and
> fmul2(). But making it an input operand needs more surgery, as the
> operand order changes and this requires some code churn.
>
> Mathias
