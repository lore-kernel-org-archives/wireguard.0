Return-Path: <SRS0=Rf1T=6J=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96193C55185
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 25 Apr 2020 08:52:25 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E7E9320700
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 25 Apr 2020 08:52:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="q+GcINP1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E7E9320700
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 74506d42;
	Sat, 25 Apr 2020 08:40:44 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 2ef586f5
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 25 Apr 2020 08:40:42 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 797062bf
 for <wireguard@lists.zx2c4.com>;
 Sat, 25 Apr 2020 08:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=Cy3Kw4pzwi4GWXgyieI8w8Qv7Go=; b=q+GcIN
 P1vp9EEPm1WjzFJxcloxm9QRF3eKW439H/vNKaryAcfk/6esoZCHVSmZLcHd21nF
 RrynZckrbyin/W64fSsBTtVjK5kmSS0gA+KboTGZkeErIGhU0Qa3gmQNSvizLno4
 jrKdkBwCWFfTDaL/HtwJFFN+dWwE0gWvxdrXASmSWckT4tJxJdZnVb2MuO7oFMrB
 a0SvzvgVD6zsbUvcXaPOAjrR5AcLSD/fq7wiWYNg3TVyPkaNtIDZfKvwCZNmTSrk
 pWHks7fFjcPgMGqf1K3WofGa0tI19ZmgefjO5B6OfPhE1yajaukVGR8LPmb8hmHv
 8bqUnXX6vhRSeR+g==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b1c50716
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 25 Apr 2020 08:40:41 +0000 (UTC)
Received: by mail-il1-f177.google.com with SMTP id c16so11660711ilr.3
 for <wireguard@lists.zx2c4.com>; Sat, 25 Apr 2020 01:51:55 -0700 (PDT)
X-Gm-Message-State: AGi0PuZYiEZUxP8fJPm/HpWmoZBK60W94Plhg0Mw+cDXS0jCSqFudy7V
 eWZ27KosMdqb9dbLfNBgyY5KwVYg9dpbhX1xNwg=
X-Google-Smtp-Source: APiQypJwlHAyMvwwuTqW+flnKGDH3HMlfWg8eju1Ru4J0Gr78G77Wpl2fjOSDYyJxryUPGiPtG0G6icCFdTGJ3zqnOw=
X-Received: by 2002:a92:d98c:: with SMTP id r12mr12869648iln.224.1587804714431; 
 Sat, 25 Apr 2020 01:51:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200424194010.32225-1-godisgovernment@gmail.com>
 <B6B013EB-18CF-4017-A096-3512B19C9963@rozman.si>
In-Reply-To: <B6B013EB-18CF-4017-A096-3512B19C9963@rozman.si>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 25 Apr 2020 02:51:43 -0600
X-Gmail-Original-Message-ID: <CAHmME9rSMmdCgLdO1ST2ECWFbFvmUxmWWO+QXe+7+pitAhe8uw@mail.gmail.com>
Message-ID: <CAHmME9rSMmdCgLdO1ST2ECWFbFvmUxmWWO+QXe+7+pitAhe8uw@mail.gmail.com>
Subject: Re: [PATCH 0/1] wintun: use standard volatile semantics
To: Simon Rozman <simon@rozman.si>
Cc: Shawn Hoffman <godisgovernment@gmail.com>, 
 "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
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

On Sat, Apr 25, 2020 at 12:23 AM Simon Rozman <simon@rozman.si> wrote:
>
> Hi Shawn!
>
> Thank you. This generally looks good. I can't find any official documentation on the set of functions and macros from wdm.h, but that's nothing new with Microsoft.
>
> I have some nitpicks thou.
>
> 1. As the atomic.h is no longer used; it could be deleted from the repo.
> 2. By removing #include "atomic.h", you should add #include <wdm.h>. wintun.c is now directly using functions and macros declared in wdm.h.
> 3. Please add "Signed-of-by: Shawn Hoffman <godisgovernment@gmail.com>" line to your commit message.

He resubmitted with his S-o-b line. See that patch series for the latest.
