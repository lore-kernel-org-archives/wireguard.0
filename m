Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BC32C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 10 Dec 2021 22:36:41 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 2fd68e13;
	Fri, 10 Dec 2021 22:36:39 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id f2318875
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 10 Dec 2021 22:36:38 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id A9136B829DF
 for <wireguard@lists.zx2c4.com>; Fri, 10 Dec 2021 22:36:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31A70C341C8
 for <wireguard@lists.zx2c4.com>; Fri, 10 Dec 2021 22:36:36 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="drOxtqY4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1639175794;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=80TuZSBR3pgAQ4KzwOXtG7jEgl+ygU68FONJA93NQlE=;
 b=drOxtqY49zTjTu5+nJTTF+G9MpbD7sJos05JDt/9VpmgAI1JccDeOPM9KhVOWjGgBblrSR
 ewvW7GDqmJA+qIahJhTZ01DeT5TIOBcEsapgxq6j+VCIBfUHUsXH0TwsT174JG/hOA1LF7
 QufuGhzCQskGCkgUq/xN3u3SG/qaFZU=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d23a0e73
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 10 Dec 2021 22:36:34 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id f186so24573447ybg.2
 for <wireguard@lists.zx2c4.com>; Fri, 10 Dec 2021 14:36:34 -0800 (PST)
X-Gm-Message-State: AOAM532t2GbY4R09Sk8oQdwv2xLw984BO5IFEJDj9gTTFhdBxOitRGRi
 No3E/QQzjmg94KVPfxz9yKBYJsq+rB3AJIF5rBo=
X-Google-Smtp-Source: ABdhPJw9WF75DiCuEB6WhsmjV6C4VZtUmO+ToZrTyLCxOFK8ajyYtEosVmq7SP+h+HnWEHNyVtZR/8kjdTWAE1QodY0=
X-Received: by 2002:a5b:c81:: with SMTP id i1mr17654487ybq.115.1639175793078; 
 Fri, 10 Dec 2021 14:36:33 -0800 (PST)
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
Date: Fri, 10 Dec 2021 23:36:22 +0100
X-Gmail-Original-Message-ID: <CAHmME9pYPXm8xTZkWYS8_ir1j0Dq7QcbtNKM2tn4uO51HTbr4Q@mail.gmail.com>
Message-ID: <CAHmME9pYPXm8xTZkWYS8_ir1j0Dq7QcbtNKM2tn4uO51HTbr4Q@mail.gmail.com>
Subject: Re: [PATCH 0/2] wireguard-linux-compat: grsecurity compat patches
To: Mathias Krause <minipli@grsecurity.net>,
 Aymeric Fromherz <afromher@andrew.cmu.edu>
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
