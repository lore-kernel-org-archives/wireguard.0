Return-Path: <SRS0=5+V/=5V=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F1E4DC2BA19
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  5 Apr 2020 07:39:02 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E71A206C3
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  5 Apr 2020 07:39:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="2eXKknN4"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E71A206C3
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e322b4cb;
	Sun, 5 Apr 2020 07:29:51 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 61465df2
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 5 Apr 2020 07:29:50 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 68abe6a3
 for <wireguard@lists.zx2c4.com>; Sun, 5 Apr 2020 07:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=u8McmerZ0VtxbMkVcDBnYT7tGco=; b=2eXKkn
 N4qI/IP6nRBQPvdtqKFQF6DjtqubFU4KUZl0KIuYUIpEqNFL3AuRfYzGCfpcogYv
 KSDAwfxxLzFJepAJm7N5npR0Zv/fmU7OQqI6C7+UzFc3roB5D6vkwwYW05nlz8Xc
 2Q91TluXoa3wXq5CfqV3TGqMbD5fKtuCH3tfb88Ata8EoyJTSrRG5P9RRtPkDQYp
 mvzS7QypIFuTjb6tSYi8FF2KxXehMiLBdtly7nj5qu/55U/GwTRgx5SyruM5FOrt
 S+47JrkZ0XiJfKHRM5cylN7AiyLYlpJzssBvFMxQ6d2Dy7E9eGgJDVsPpHgMXOQc
 ih2AqIT44Cr7okYw==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 8103f283
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 5 Apr 2020 07:29:50 +0000 (UTC)
Received: by mail-il1-f169.google.com with SMTP id j69so11651262ila.11
 for <wireguard@lists.zx2c4.com>; Sun, 05 Apr 2020 00:38:28 -0700 (PDT)
X-Gm-Message-State: AGi0PubqEobWOiGS8tjnc4XAWbjch5micHqLXl0e/FAcVbyw5e4uAFJk
 +lPKZNm3TqAil+k/UJtXJL1VzHTNy066KRGDyq8=
X-Google-Smtp-Source: APiQypK+PVswX9ZFu89k7lz7/W3gCLH/ZSwo63+OwqEEglPeYc8VdJA/MwwT1lPAze6Tn4X2GsKzxFydn40BSLTE1PE=
X-Received: by 2002:a92:798f:: with SMTP id
 u137mr17000716ilc.231.1586072307784; 
 Sun, 05 Apr 2020 00:38:27 -0700 (PDT)
MIME-Version: 1.0
References: <445BCA5B-03B7-4127-82E8-029188083D45@gmail.com>
In-Reply-To: <445BCA5B-03B7-4127-82E8-029188083D45@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 5 Apr 2020 01:38:17 -0600
X-Gmail-Original-Message-ID: <CAHmME9rVRofNPx=Od3JZym-y=Jd1nN=_hZ9y9BOtNenofU0C1w@mail.gmail.com>
Message-ID: <CAHmME9rVRofNPx=Od3JZym-y=Jd1nN=_hZ9y9BOtNenofU0C1w@mail.gmail.com>
Subject: Re: Multihoming?
To: Alex Besogonov <alex.besogonov@gmail.com>
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

On Sat, Apr 4, 2020 at 4:45 PM Alex Besogonov <alex.besogonov@gmail.com> wrote:
> By true multihoming I mean possibility of using multiple connections at the same time, preferably with configurable rates for them on both sides.

Both connections at the same time, configurable rates... seems a bit
out of scope for an encrypted tunnel, doesn't it?

Rather, set up two tunnels, and then bond them or run some other
aggregation protocol over it. Several years ago I was aggregating
several different internet connections using MPTCP over various pipes.
Things worked extraordinarily well.
