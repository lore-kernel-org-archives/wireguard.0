Return-Path: <SRS0=6BFc=56=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EC14C2BA19
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 14 Apr 2020 09:06:32 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3F1DF2063A
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 14 Apr 2020 09:06:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="yJ3n7pQP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3F1DF2063A
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5986e531;
	Tue, 14 Apr 2020 08:56:42 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 28f61db7
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 Apr 2020 08:56:40 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3ed475cf
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 Apr 2020 08:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=+1BP09hmLV9zuZIC5GcqpypNVGM=; b=yJ3n7p
 QP0ncBG0VAYPLWetD3k+fwnND2jf4R4zHYkyzowzKezIN+T/xe0wTgLAQR3OD19v
 wNT+nTQbNTEhPxdvAK8AiM30PCJD7rZeTJ4ExoHlcCpWvCgoi/QwDAg3WJxun6rH
 LrhxNiDXZ5V3ePMw+Hg1bNEtZzLyrbWCcQqFWsw603ZYNIglNqL4u02yK/AaWW91
 m6XBa3NAP/49o7auYrbK3M3wFUWDuZqmDqivmeiqRDpuJt+bz4rOdL5MBAXzys/o
 4bFjodH7S7X4wm6XKHGZrrwFyhOUZZg+kOFhzCzYVX4v+I+IESalp8jfaZgdq/oB
 dQq81XVARG4mpnEg==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4dd20367
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 14 Apr 2020 08:56:40 +0000 (UTC)
Received: by mail-il1-f170.google.com with SMTP id i75so11246129ild.13
 for <wireguard@lists.zx2c4.com>; Tue, 14 Apr 2020 02:06:28 -0700 (PDT)
X-Gm-Message-State: AGi0PuZ6usbwpOA87uqnabInoDJy+46Aw/D3iqsBD1M0wlgg/aKDC04m
 RoEuQcrn9xt/Miwon9OY1GGJuecW4YwDicWHYhI=
X-Google-Smtp-Source: APiQypJ2ecjuuQ5f2zxwEnPZm5AZC9Fj0Zxjg7WxnwVEWuwrA11CCW30kTAwQXSqzTLRSuOpspfDTlJfnSOyyTI0UFg=
X-Received: by 2002:a92:d98c:: with SMTP id r12mr2907996iln.224.1586855187829; 
 Tue, 14 Apr 2020 02:06:27 -0700 (PDT)
MIME-Version: 1.0
References: <0312354a-8bdb-00b1-f342-092c71e4817c@gmx.net>
In-Reply-To: <0312354a-8bdb-00b1-f342-092c71e4817c@gmx.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 14 Apr 2020 03:06:16 -0600
X-Gmail-Original-Message-ID: <CAHmME9qdGhJsuruytK07c5V68iM=1vE0nD6vzqw3txGSzjOHCg@mail.gmail.com>
Message-ID: <CAHmME9qdGhJsuruytK07c5V68iM=1vE0nD6vzqw3txGSzjOHCg@mail.gmail.com>
Subject: Re: RHEL 7.8, Kernel 3.10: ratelimiter.c:25:1: error: unknown type
 name 'hsiphash_key_t'
To: Christian Weiss <cwei@gmx.net>
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

Hi Christian,

Thanks. Addressed here:
https://git.zx2c4.com/wireguard-linux-compat/commit/?id=c15894ad17cb0760471c2dd798bfbbea2081b4db
. I'll have a new release out shortly.

By the way, you'll have more reliability using the elrepo kmod these days:
https://lists.zx2c4.com/pipermail/wireguard/2020-April/005239.html

Jason
