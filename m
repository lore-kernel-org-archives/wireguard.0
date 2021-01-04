Return-Path: <SRS0=t67z=GH=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5770BC433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  4 Jan 2021 21:56:46 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C6B12225E
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  4 Jan 2021 21:56:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C6B12225E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 9d55f5d0;
	Mon, 4 Jan 2021 21:44:54 +0000 (UTC)
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [2607:f8b0:4864:20::133])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 97aa5395
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 4 Jan 2021 21:44:51 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id q1so26773383ilt.6
 for <wireguard@lists.zx2c4.com>; Mon, 04 Jan 2021 13:55:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:reply-to:from:date:message-id
 :subject:to:cc;
 bh=EF9Oj6eckIaskbw4tFbG2bw+f0fQtzJHWW5KpMbtvvU=;
 b=dE3fnJloBG+I6ud69WeCBVen1PRuVS9nJ3D4shWry1P4BFIN+pj+gfDbyVBZw0M4Md
 37CvQYyIVjCSvR19uSwfEDUC9C9m1Z2txVIa9RIXszVvXVyP0t5FO5IblzquQ2WelWc2
 uayucKCPH/ljpAB/wX6Rp66ecFU0santzdIzt8RjUA54r3W/UOqUqTJK6ucxSY87aXho
 iCszgyoU5eWdRBzjAZTOQC3+Gx1UEByPSeMuA2LIU4dmd/W5bOah6ucdrXN/pWQL7+6R
 Yz/d6aT2lF7HGOfL2sNbYW5UKThmWP0Z4K2NbSkDJm8PQAxWTPXHGtL8GuqIivQXYNKN
 n1cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
 :from:date:message-id:subject:to:cc;
 bh=EF9Oj6eckIaskbw4tFbG2bw+f0fQtzJHWW5KpMbtvvU=;
 b=TLUc8DMDkLTdf78Zuh6wrhh8etFcrzGN7ytG1rsnIWVztKY2xQdxiuGT5wcmqzOFj1
 hWJ3YZJ0QzUN2plLUcKLbIe5WASVRTAjK25NLdCiskgDHJTXEB9fDjtlLTkK83d3n2N1
 zeLisfvAnmtdEEpw9mivjoFYOfFuBJVx0ysf4ssTf309pfyOs4e3JyvpA2Qr4Oij59qI
 vt8/P0w4/rsU2Y7hJ7wfsFHMz/RT3FPtgZYwOsCzojKdCQUb2tLom750+NVvGH9RPQdb
 tqO5p7a3rmvGAuLUFakIQYxkcNxLBxIGZ0yrEjhWr0i9AA7vQSUZP39+oum85UGjTBhH
 HKKg==
X-Gm-Message-State: AOAM533KrTCw1n6wx2LF2VsxU9yx2WmEU0J1axszW73Qfn8NvRRwcx++
 8zWYWjiLP3nNLSVP1TN7Y4aOUyJlIJO6EBUFZdKE5jHhQ/U=
X-Google-Smtp-Source: ABdhPJwmHNKLjJlJxFw58cDE6kkwD2vnxETv/40ThXvA8sDUxWwDyiwYwE1BnnnOn7ubhCrfLLxTRQw35fzFxCcn9vY=
X-Received: by 2002:a92:8495:: with SMTP id y21mr71233057ilk.55.1609797345291; 
 Mon, 04 Jan 2021 13:55:45 -0800 (PST)
MIME-Version: 1.0
References: <a79af0c5-ad54-2b17-964b-9e7891064335@53c70r.de>
 <176cafeade8.27b6.fd5e59abeac6319e4fe4e8192ea7d08d@solidadmin.com>
 <CAHmME9pzOrvHX2bVcHVHh44_j1P_bYaz+o-wCnjnEgxoMeZCyA@mail.gmail.com>
In-Reply-To: <CAHmME9pzOrvHX2bVcHVHh44_j1P_bYaz+o-wCnjnEgxoMeZCyA@mail.gmail.com>
From: Jeffrey Walton <noloader@gmail.com>
Date: Mon, 4 Jan 2021 16:55:14 -0500
Message-ID: <CAH8yC8n-fC8MJxR7cA+otkqRyDZwhR7wz2Ni+-YTAgiKz7CRHA@mail.gmail.com>
Subject: Re: Wireguard not available for CentOS Stream
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
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
Reply-To: noloader@gmail.com
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

On Mon, Jan 4, 2021 at 7:48 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> On Mon, Jan 4, 2021 at 2:24 AM Joe Doss <joe@solidadmin.com> wrote:
> >
> > https://copr.fedorainfracloud.org/coprs/jdoss/wireguard/
> >
> > The official DKMS install method for CentOS has a Stream repo enabled. It
> > should work fine. Let us know if you have any issues.
>
> It's actually presently broken. I've fixed it in the master branch with:
> https://git.zx2c4.com/wireguard-linux-compat/commit/?id=f7f55464a156e1181fa76d9c7e2fc0d495f2357e
>
> But Red Hat still has not fixed other bugs that will enable our CI to
> continue, and I won't release for RHEL alone until the CI is green.
> You can cherry pick that into your dkms package if you need. I wrote
> Red Hat a patch and sent it, but there's been no updated kernel yet.
>
> More generally, I'm on the fence about how much I actually want to
> support CentOS Stream. CentOS non-Stream is annoying, because it's
> developed behind closed doors and is extremely slow to fix things, but
> at least the changes are gradual and it's easy to keep up with, by
> virtue of rarely changing. In contrast, CentOS Stream is fast moving,
> and extremely unstable, with builds frequently breaking. This would be
> fine and I would prefer it, since it means we can in theory get things
> fixed reasonably fast, but actually, Stream is still developed behind
> closed doors, with no visibility about what's going on, no
> communication from RH on when fixes are coming out, no regular or
> reliable release schedule, no releases for months sometimes, and just
> a bugzilla blackbox that forces all reports to be private/secret. So,
> unstable+secretive development makes developing for CentOS Stream
> nearly as fun as developing for macOS, which is to say, not very fun.

From an admin and developer perspective I find Fedora Server a real
gem. Speaking from experience, I would much rather work on Fedora than
CentOS or Red Hat.  Fedora Server comes with the latest stable tools
and does not need things like Software Collections (SCL) to get a
modern Apache, Python or PHP.

Every year or so Fedora Server needs a DNF System Upgrade
(https://docs.fedoraproject.org/en-US/quick-docs/dnf-system-upgrade/),
which is like a Ubuntu dist-upgrade. I've not had one go bad since I
started using it back around F12 or F15.

If Wireguard needs to make a Red Hat-family recommendation, I think it
would be wise to consider Fedora Server.

Jeff
