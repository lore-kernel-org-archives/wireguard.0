Return-Path: <SRS0=B3Yb=IO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBC58C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 16 Mar 2021 17:30:31 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 248B0650F8
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 16 Mar 2021 17:30:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 248B0650F8
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id da2364e6;
	Tue, 16 Mar 2021 17:30:29 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ef66680d
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 16 Mar 2021 17:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1615915824;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=8Wql75Z38d6yNM6r69wKmE/MYWRMTbeRnNhGgBKT7nM=;
 b=hUIAws7jH+1QslmUGbEGuMKW3xQlSwRXyhlJj0WMpE3sHTeMzrG366yMmmySp6R3SLesmG
 M2GIe3GRMpEWKvXpwN2dHKYFcbfC3yfrVsHvWCoeh4ezUKp1y32w40yDMNhuZ0erbOEClB
 ahlfGrEEggjQn2zTGJIqG9PDjcE4y1Y=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 2b4113da
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 16 Mar 2021 17:30:24 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id c131so37641434ybf.7
 for <wireguard@lists.zx2c4.com>; Tue, 16 Mar 2021 10:30:24 -0700 (PDT)
X-Gm-Message-State: AOAM533nCXFZWFeec0j8CTOCXcXBFZDBuckmPYQFHtlYgAV0BkezFQCU
 5U6aZzbf2wJG5q2CrdNBmqkP4mQZpCcM20OM+f8=
X-Google-Smtp-Source: ABdhPJwN7MNuNHax0zFW1DWekEcylejoa77+qtpE8iuS9EQjfWrdbqCePH/cC5IzdVuU02rBjvP6STFdhowug1s8yT0=
X-Received: by 2002:a25:4d02:: with SMTP id a2mr7623914ybb.49.1615915824259;
 Tue, 16 Mar 2021 10:30:24 -0700 (PDT)
MIME-Version: 1.0
References: <CACNAnaHR9Li0wPOjmwRk7jG76-AESoTt0QrrG_UVTrev38N=bQ@mail.gmail.com>
In-Reply-To: <CACNAnaHR9Li0wPOjmwRk7jG76-AESoTt0QrrG_UVTrev38N=bQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 16 Mar 2021 11:30:13 -0600
X-Gmail-Original-Message-ID: <CAHmME9rZRQ3ncWx6kfN21DXC-w55A5srYe3s7gdOxjN=hXL8pA@mail.gmail.com>
Message-ID: <CAHmME9rZRQ3ncWx6kfN21DXC-w55A5srYe3s7gdOxjN=hXL8pA@mail.gmail.com>
Subject: Re: Removing WireGuard Support From FreeBSD Base
To: Kyle Evans <kevans@freebsd.org>
Cc: freebsd-arch@freebsd.org, FreeBSD Hackers <freebsd-hackers@freebsd.org>, 
 WireGuard mailing list <wireguard@lists.zx2c4.com>
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

I think what you describe is a great plan. I think everybody realizes
at this point that the original code base from the original author
never should have been merged. We went head first in trying to fix it
in a week because we thought that was our only choice. But knowing now
that we can simply remove it, and get back to coding it carefully and
deliberately, is just a huge relief. So that's great. And while it's
under development, we can have an out-of-tree repo for folks to test
out intermediate snapshots and provide feedback, just like the
WireGuard project has always done. In other words, we'll follow the
tried and true formulation of: slow, careful coding + regular
snapshots to receive testing and feedback.

So, I'm quite happy there. And when it is ready, I'm confident it'll
get a thorough review from FreeBSD core developers, which is terrific.
More review ==> better code.

I also want to thank you for your words about Netgate and the various
parties involved. I think nobody wants animosity and tension, and I
imagine your email has helped to calm the tone quite a bit. That's
just the type of reset we need, so that we can get back to what we do
best: writing and refining code.

To others reading, with regards to actual project logistics, I think
what I wrote in the original announcement still stands: we'll have
instructions for module building and such online and we'll announce it
here. And for developers interested, Kyle, MattD, and I have been
coordinating code writing on IRC; if you'd like to join in, ping one
of us there and we'll get you up to speed on repos and ssh keys
whatnot.

Regards,
Jason
