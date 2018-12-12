Return-Path: <SRS0=m2YW=OV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA968C65BAF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 12 Dec 2018 22:35:34 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD12220645
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 12 Dec 2018 22:35:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gwynne-id-au.20150623.gappssmtp.com header.i=@gwynne-id-au.20150623.gappssmtp.com header.b="SHPgCpyV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DD12220645
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=gwynne.id.au
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id db533cbd;
	Wed, 12 Dec 2018 22:26:16 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e285ab93
 for <wireguard@lists.zx2c4.com>;
 Wed, 12 Dec 2018 22:26:10 +0000 (UTC)
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com
 [IPv6:2607:f8b0:4864:20::543])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f91b527d
 for <wireguard@lists.zx2c4.com>;
 Wed, 12 Dec 2018 22:26:09 +0000 (UTC)
Received: by mail-pg1-x543.google.com with SMTP id w7so5770pgp.13
 for <wireguard@lists.zx2c4.com>; Wed, 12 Dec 2018 14:35:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gwynne-id-au.20150623.gappssmtp.com; s=20150623;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=hbSRiXlVBWog4IwFugj6npCJCTAbc5x5kYscNjqF5jQ=;
 b=SHPgCpyVCkTqvZ4nAlJB41M4xg3QPdnJN/jGdM3mIIfqil1WSmyBUSegn1r4WPLj5f
 Pi1GWO4EmB2O6oxkcxYNO72G8C9Y096FCbtW3K6+kUpf1nosQqnmDMobMMkGK7Disatt
 gkXesvBBb1l8mmf35fnbKSAgdIZlnhUFm85Hv/0LjDoeBvlBRYpwpbKAxx9npH18+CPx
 wLlR5ObT4y3EqvkpUhTju+/dNjIkl49wanKZlL0DV/sTaYdrG7CwODMOo+0iXkAAf99c
 /442O1D/6UYr4QDwjzSEvRZztWrwTvD+E7uSpcgC2QiJDnROnPmXGM6dTPsG6FaEcIO+
 CeFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=hbSRiXlVBWog4IwFugj6npCJCTAbc5x5kYscNjqF5jQ=;
 b=NICJ9FLinpn8vEhpRvrdtmuXoDjuYLCNwcLtfNpKkcJrE/eMF5E9i8yzQ8siCwRdt4
 x9fe5oYfUZXmH/UaCN+mOZ8xJVUzhehp7XT6TSWpOvU5Zmv03Ic/gjMW+f15Ue7GIR6O
 N3z8MLy8DBjcuIjcEFhKf0nX6+CzhxUxvIfGlv6x0QBYpBihMwvwc6zPYBkxOmbEPqVL
 SvfWZrOnKs3x3DW0GjOW1/UAxkIJsv13237QE3yiAqKO0kGtNYe0RCYbfJVhwMrHqayt
 B7K5EH+rSBS6fjfHScolM6P4adWokI+mI6YIPf1CTK5I30mCS+e/1U2s3CazBAH/cOFN
 3aFg==
X-Gm-Message-State: AA+aEWZLwFAz4CLpRD15IyXqtgF91IwSAwvnw28RRso4AMQQRclqTNYA
 ILU6i0JKRacAWliM9yk2Me8/Ww==
X-Google-Smtp-Source: AFSGD/XI+4IpaZcKrttpf4dhHSpoM3IFq8eHWHKcvMPqFCz/mgodiNSiZLsxRUu1g87hmJuaBuzstw==
X-Received: by 2002:a62:9657:: with SMTP id c84mr22503096pfe.77.1544654107355; 
 Wed, 12 Dec 2018 14:35:07 -0800 (PST)
Received: from opiate.eait.uq.edu.au ([130.102.10.71])
 by smtp.gmail.com with ESMTPSA id g65sm71321pfa.63.2018.12.12.14.35.05
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 12 Dec 2018 14:35:06 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 12.0 \(3445.100.39\))
Subject: Re: OpenBSD kernel implementation
From: David Gwynne <david@gwynne.id.au>
In-Reply-To: <d9c01aa2-9dab-44b0-d743-a93ff7936e38@zx2c4.com>
Date: Thu, 13 Dec 2018 08:34:54 +1000
Message-Id: <F48C44BC-EB3C-4399-A1A4-A7FF6B2691DF@gwynne.id.au>
References: <20181211132437.cooi2kwvx2j3llem@vertex.local>
 <d9c01aa2-9dab-44b0-d743-a93ff7936e38@zx2c4.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
X-Mailer: Apple Mail (2.3445.100.39)
Cc: wireguard@lists.zx2c4.com
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hi Jason and Matt,

Just have a question below.

> On 12 Dec 2018, at 01:29, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> 
> Hi Matt,
> 
> Exciting to see you working on this. However, I'm afraid the
> implementation you describe sounds deeply flawed and kind of misses
> the point of WireGuard.
> 
> On Tue, Dec 11, 2018 at 2:24 PM Matt wrote:
> > Currently, I want to take all the code that doesn't need to be in the
> > kernel and move it to userspace, which is essentially the handshake
> > code, timeout timers and state machine functions. What is left is
> > essentially the transport function (IPSEC transform equivalent),
> > peforming simple crypto on incoming/outgoing packets. This design is
> > somewhat similar to how IPSEC is currently implemented in OpenBSD. I
> > believe this is a reasonable approach, but welcome comments on things I
> > may not have considered.
> 
> Do not do this. This is entirely unacceptable and wholly contrary to
> the design approach of WireGuard. The transport layer and handshake
> layer exist on the same state machine, and I designed the handshake
> specifically to be extremely simple and implementable in kernel space.
> I'm happy to help you clean up your current approach -- which seems
> nicer and closer to the goal -- but your proposed separated approach
> is really deeply flawed, and overly complex. Do not make this mistake.

Did you tie the handshake and data state machines together so you would only have to handle packet crypto operations with a single set of keys? If so, what happens to data packets that are in flight while the handshake is happening? Do you keep the old keys around for a bit to allow operation on them?

> Rather, let's clean up your current WIP together. If you're on IRC,
> I'm happy to discuss with you there (I'm zx2c4 on Freenode) and we can
> get this into shape.
> 
> Regards,
> Jason
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
