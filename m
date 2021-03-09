Return-Path: <SRS0=TBPu=IH=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8EEFC433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  9 Mar 2021 21:25:52 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E44456527D
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  9 Mar 2021 21:25:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E44456527D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3e4a18ff;
	Tue, 9 Mar 2021 21:23:39 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b59f984f
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 9 Mar 2021 21:23:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1615325014;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ZeOrEEoJZEzodD25mtDI/GQmTAkh4a9P2eXxABJ7aKY=;
 b=WqF8CyC3PQJLA6AljVZeNhfayQX+zenZ1YsTRKRhYLSqsYu3z7w6xOXzWCJviV02rCoUvY
 f+PCw9WSxCUFmCs1pUewg1JJhGViLdll/NgQoYrd2BfB7UA77GELkRL8C9D03iWfyaxQC8
 p2faE3dQdyaJQo8hXIbq9Ey4dcvKTJQ=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d3836b3b
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 9 Mar 2021 21:23:33 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id d9so15536455ybq.1
 for <wireguard@lists.zx2c4.com>; Tue, 09 Mar 2021 13:23:33 -0800 (PST)
X-Gm-Message-State: AOAM532OegxZ1GLDAC1MZNcQsVKwK04dTx+SEy70jHDyj/RjzkviJc0k
 fhLG8jEu3tGRLCleZQN2fZ9Up1GkYdBa4Fsgl0w=
X-Google-Smtp-Source: ABdhPJz0fUBLUwlfCX4ETyu6wR212MSveG8tdZ3Bn25hxHVqJhstm+MduTdxXsoz2l6p8y9RvbziUM6Nk27dGSm1aH0=
X-Received: by 2002:a25:4d02:: with SMTP id a2mr39960891ybb.49.1615325013248; 
 Tue, 09 Mar 2021 13:23:33 -0800 (PST)
MIME-Version: 1.0
References: <CACNAnaHUO_GvqQd3BJ2i4Wh45L=0g-LSxJg11G_dEa3UKK6GUw@mail.gmail.com>
In-Reply-To: <CACNAnaHUO_GvqQd3BJ2i4Wh45L=0g-LSxJg11G_dEa3UKK6GUw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 9 Mar 2021 14:23:22 -0700
X-Gmail-Original-Message-ID: <CAHmME9pQGWUo=Q0ohXUkXapS7rZ1qbP+GFHkDDOD2hp5VSD+Pw@mail.gmail.com>
Message-ID: <CAHmME9pQGWUo=Q0ohXUkXapS7rZ1qbP+GFHkDDOD2hp5VSD+Pw@mail.gmail.com>
Subject: Re: FreeBSD/wireguard-tools
To: kevans@freebsd.org
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 =?UTF-8?Q?Bernhard_Fr=C3=B6hlich?= <decke@freebsd.org>, 
 Matt Dunwoodie <ncon@noconroy.net>
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

Hi Kyle,

Thanks for getting in touch. So far as I can tell, Matt Macy never
finished either the port of wireguard-tools or the port of the actual
kernel module from OpenBSD. I'm CCng Matt Dunwoodie, who has started
working through the kernel module finding issues. There was that awful
error in 25519 (lack of scalar clamping) that somebody emailed me
about a while ago. I don't know if that was ever fixed but I was quite
surprised that got committed. I got the impression from trying to work
with Matt Macy that there wasn't too much interest in collaboration.
Your email is a very welcome change.

I see the path forward for FreeBSD having a functional WireGuard
implementation as something like this:

1. We work out kinks in the kernel module crypto and state machine. I
need to sync with Matt Dunwoodie on his findings there. Maybe we can
send patches ourselves, but maybe it'd be best to just have a
screensharing call where we walk through this together, and after the
call you can code/commit the problems that we identify from
discussion? A similar undertaking has been on my todo list for a
veryverylongtimenow for NetBSD, but that implementation is much, much
further behind, while in contrast I think with FreeBSD we're a lot
closer to things being where they should, and a lot of it will be a
simple matter of syncing the OpenBSD code. So if you're willing to
work with us, I think that's something we can get done together in a
week or faster.

2. We fix/simplify the kernel module's IPC interface to just be a
simple get/set, like every other implementation of WireGuard.

3. We write support for that IPC protocol as "ipc-freebsd.h" in
wireguard-tools. Maybe we'll start with Macy's code, but he never
incorporated the feedback I provided on that, so perhaps you'd like to
start over. Whatever you please there is fine with me.

4. I relicense the tools as MIT. I've previously started on getting
this done, and the only blocker was the embedded libmnl, which is LGPL
and out of my control. But I think there are two reasons why this is
not a real impediment: 1) I've been in touch with the author there,
and I think he'll MIT it if poke again, and 2) that's only for Linux
anyway, so you wouldn't need that file *at all* on FreeBSD.

Does that seem like a good plan? And if so, are you the right contact
with whom to work on it? And what's the FreeBSD release schedule like?
How long do we have to fix this?

Talk soon,
Jason
