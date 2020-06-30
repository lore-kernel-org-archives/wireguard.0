Return-Path: <SRS0=5l8i=AL=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9DF0C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 30 Jun 2020 01:25:03 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5216320760
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 30 Jun 2020 01:25:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="A8gK/exz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5216320760
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 667101a0;
	Tue, 30 Jun 2020 01:05:03 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a09fe7f9
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 30 Jun 2020 01:05:00 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b2a18913
 for <wireguard@lists.zx2c4.com>;
 Tue, 30 Jun 2020 01:05:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=b5numLy2nQlnwwRMJQ7EmFD2UP8=; b=A8gK/e
 xzFUUESe/2OQWVGKAf1rsqAGwPpCoT4OfaLDDnwq0BChjHS1jIR6lWgq5svFvQWy
 6xPxpbYnXBKamHWdXKiunAGdHpp43zZDq4SRULcjW3oqecDZoN7TPbeOyZfxAu67
 JLB/vTbiULy9LTVpU3yMNE9VV0lGVL2FFZ3Y+c3LO+ND5+DOR+AO1fftow1A802/
 jr/fIjhxrkhojZLsULSwf2r4IRx4BO+8SEvC9b0Mievjw4Zd5DNGajEoDeN+05Kv
 9a7kmo87CGDIcs44Wq0jzqmHu0Ow7zaotDJduazJ9Qg4UJmBVcH+AbgtZBGN96SZ
 8JZnFIsxCPfGeqyw==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3d75220a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 30 Jun 2020 01:05:00 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id f6so3671952ioj.5
 for <wireguard@lists.zx2c4.com>; Mon, 29 Jun 2020 18:24:43 -0700 (PDT)
X-Gm-Message-State: AOAM532AVdCoSex3ydEUgEJbvvtuMk10IQ1ejKm3NJe18XwiNf7LrqJz
 nOgDo2/SYzvcT1vK6RZuLpRXgqpyi0mHjI1OCqU=
X-Google-Smtp-Source: ABdhPJzYmDHwkcpEgENRM6ttRDlp9LrgqwuBovoDuGXjA9Am2n6rOKyVt1fY4wQQQi2AFxwlQ091Yad1Lx7LaVBN42o=
X-Received: by 2002:a6b:ee15:: with SMTP id i21mr8539058ioh.25.1593480282946; 
 Mon, 29 Jun 2020 18:24:42 -0700 (PDT)
MIME-Version: 1.0
References: <372AE79B-69E5-4B18-926C-E402FDFB2E95@lonnie.abelbeck.com>
 <20171205035352.01ffe1f5@vega.skynet.aixah.de>
 <CAHmME9ouUNV4pc7qwr4bO-5bEecFc1U64PF13ExgmYnH9q45tw@mail.gmail.com>
 <20200624153706.3yngzzslepqh7q54@ws.flokli.de>
 <CA+cYV6uWUC1YDbpXz+ft-fKug7SY4_QNrR-x7q_z_qWmj7u-Ww@mail.gmail.com>
 <CAMaqUZ0nTL9mbYEifHP-sc8kQ6ehAOOWfmEb7ARNfZWWDkv4eA@mail.gmail.com>
 <875zbai32e.fsf@toke.dk> <20200629153118.4d72f447@natsu>
 <87r1tygmlv.fsf@toke.dk>
 <20200629163851.41d6d755@natsu> <87lfk6gjax.fsf@toke.dk>
 <910f09eb8b67bef5cc55114fe1b0bd6297ea2ec4.camel@gmail.com>
 <CAHmME9rsiejKsNw9Wq6noNPf46m=2eYu9o4e0EHj_=ek5phZig@mail.gmail.com>
 <CAMaqUZ1TkemV7Ocvx+VzHUbOJeEx_L4tVTPLzbzS4hzBu7TXaQ@mail.gmail.com>
In-Reply-To: <CAMaqUZ1TkemV7Ocvx+VzHUbOJeEx_L4tVTPLzbzS4hzBu7TXaQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 29 Jun 2020 19:24:31 -0600
X-Gmail-Original-Message-ID: <CAHmME9prQFruLSsJ-jW1yF4ohfOkiqWR3Jjax=HDrLiQ5Dy_MQ@mail.gmail.com>
Message-ID: <CAHmME9prQFruLSsJ-jW1yF4ohfOkiqWR3Jjax=HDrLiQ5Dy_MQ@mail.gmail.com>
Subject: Re: Standardized IPv6 ULA from PublicKey
To: Reid Rankin <reidrankin@gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@toke.dk>, 
 Roman Mamedov <rm@romanrm.net>, ch@ntrv.dk, Arti Zirk <arti.zirk@gmail.com>
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

On Mon, Jun 29, 2020 at 1:59 PM Reid Rankin <reidrankin@gmail.com> wrote:
> Well, it looks like you've discovered the method behind my madness!
> Specifically, while a handshake *initiator* must know the public key
> of the responder it's trying to talk to, the *responder* doesn't need
> to know anything about the initiator ahead of time -- because the
> initiator's public key is right there in the handshake.

Fun fact: initial versions of WireGuard from years ago weren't like
this. We wound up redoing some crypto and coming up with the `_psk2`
variant for this purpose. I'm glad it's useful. I'm interested to
learn: what are you doing this for? Got any code online?

> In my usecase,
> I examine incoming handshake requests in a userspace daemon via
> nfqueue. The daemon knows the interface private key, so it can also
> see the initiator's public key, and if it's a new peer the daemon adds
> it via `wg set` -- with only the calculated LLA in the `AllowedIPs`
> list -- before releasing the handshake request for delivery. The
> newly-minted peer can then send a certificate via TFTP (a very simple,
> DoS-resistant protocol) to the responder's LLA, which convinces the
> responder to add additional stuff to the initiator's `AllowedIPs`
> list. Because this bootstrap process occurs within the tunnel,
> integrity and confidentiality protection are already assured -- and
> WireGuard is already ensuring that the node with the initiator's LLA
> possesses the initiator's private key.

This sounds like a motivation for doing the LLv6 generation inside of
your daemon, not inside of the kernel, right? In that case, your
design must already take into account a malicious peer finding public
key collisions after hashing. Perhaps you have some PRF situation? Or
something else? Either way, this doesn't sound like something for
core-wireguard, but a nice and novel thing you're building on top,
sort of like wg-dynamic, which can happily exist in userspace, where
the security of your design can be validated as one unit.

Jason
