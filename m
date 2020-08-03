Return-Path: <SRS0=XHON=BN=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67732C433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 Aug 2020 21:25:35 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 289B62075A
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  3 Aug 2020 21:25:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="GUSqaAV1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 289B62075A
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 90804315;
	Mon, 3 Aug 2020 21:00:51 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 5da17b93
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 3 Aug 2020 21:00:48 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ca0bd07f
 for <wireguard@lists.zx2c4.com>; Mon, 3 Aug 2020 21:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=sF9LNPahN5x2xD1bpD30GeRkUDg=; b=GUSqaA
 V187yEAyeby4Hvd4gSvmOK2kGsM2RYPoS5CBn7e5w6QOM5LrjSx9es5U0+/9u6M3
 5BSRT4qAVz2jUQ05jEpRvnsXjCIV3z4FONRjDt7QVmSv6Oq4CctSGGnrbXKgbKuP
 3MVuZpNCr5HUBmUy5wcNPLT5BDpRqIbIF2OQteIIGqpUY1NglXev1kEZvmgB42Ej
 kh+W1sfYGt5tEOnJ9FT4Z2LirwwEa/0CM5KiUwT4pyYeeOxcXqmD0PAjNqFqJzXV
 8UbpLfQWKfbPqdHWgdpq9M9ojPKBqCF81PUfvW1pHNGDQzB5gtUKe4aChQ8HkDhM
 Lq6VSJxvYhzEu/wQ==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 250a6b70
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 3 Aug 2020 21:00:46 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id df16so11946944edb.9
 for <wireguard@lists.zx2c4.com>; Mon, 03 Aug 2020 14:25:02 -0700 (PDT)
X-Gm-Message-State: AOAM532xFP+ngAkMU+812u7Lh7Nf+ftObHtyWLvi2a6C+mqOJNYcx2yr
 yVdNYFIHQZ8p//4ZKaqKnbpihkntMI3s9wr8yIw=
X-Google-Smtp-Source: ABdhPJwoWq/9h0HsxBNTjvrLuU7DQe5wZh3hkDFBUDVy3/QEJYGR0zZAhXLTooDJr8ywp5McbZuXbqxKwW63870Thww=
X-Received: by 2002:aa7:db44:: with SMTP id n4mr17948006edt.158.1596489901395; 
 Mon, 03 Aug 2020 14:25:01 -0700 (PDT)
MIME-Version: 1.0
References: <20200803102808.GA1402387@zx2c4.com>
 <5fe66967628e355831945a610f6804fdfd9a6928.camel@noddingdog.org>
 <20200803211838.GD6317@brain>
In-Reply-To: <20200803211838.GD6317@brain>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 3 Aug 2020 23:24:50 +0200
X-Gmail-Original-Message-ID: <CAHmME9rYf4PEHcjOudmy54ZBOi1BUPGOU7i-A5QZcGUJ6Ow-Uw@mail.gmail.com>
Message-ID: <CAHmME9rYf4PEHcjOudmy54ZBOi1BUPGOU7i-A5QZcGUJ6Ow-Uw@mail.gmail.com>
Subject: Re: Migrating From Ubuntu PPA to Real Ubuntu Packages
To: Andy Whitcroft <apw@canonical.com>
Cc: NoddingDog <lists@noddingdog.org>, 
 WireGuard mailing list <wireguard@lists.zx2c4.com>, unit193@ubuntu.com, 
 Daniel Kahn Gillmor <dkg@debian.org>
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

Hi Andy,

On Mon, Aug 3, 2020 at 11:18 PM Andy Whitcroft <apw@canonical.com> wrote:
> Yes, this is primarily a bug in the Depends on the wireguard package:
>
>     Depends: wireguard-modules (>= 0.0.20191219) | wireguard-dkms (>=
>         0.0.20200121-2), wireguard-tools (>= 1.0.20200513-1)

As discussed, this ordering here has the effect of making manifest the
bug you mentioned below, the missing Provides of your meta package.
Without this ordering, there would still be a bug, but most users
wouldn't notice and things would just be subtly worse and eventually
break during some dkms crossover update situation, as we've had
before. So, also not good. Not as dramatic, of course, but not good
either, and would probably be harder to diagnose and fix later on. And
anyway, I'm grateful that we were able to catch this bug so quickly
here. So, fixing that Provides:, as you indicated below, remains
priority in my mind.

For changing the order of the Depends:, I'd encourage you to send a MR
to https://salsa.debian.org/debian/wireguard/-/merge_requests or file
a Debian bug report, so that the Debian maintainers (CC'd) can
deliberate with you on if changing the order actually makes good sense
for both Ubuntu and for Debian. In that lucky scenario, Ubuntu can
carry on auto importing the changed Debian package, without the need
for you to manually change it.

> The linux-oem kernel has (separatly) a bug in its Provides so it does
> not think it contains wireguard.ko.  In that scenario we want the apt
> resolver to pick wireguard-dkms as at least that way you have a
> wireguard.ko.  But the way it is formed it will pick wireguard-modules
> for installation if neither is installed already.  This can only be
> solved by installing an unrelated kernel.

Correct. This is the bug to be solved here and now.

> Am working on solving these problems variously.

Thanks a lot for jumping on this so quickly. I really appreciate it.

Regards,
Jason
