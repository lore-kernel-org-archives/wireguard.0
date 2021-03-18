Return-Path: <SRS0=R3ug=IQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3AFFC433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 18 Mar 2021 16:53:52 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B213D64D74
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 18 Mar 2021 16:53:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B213D64D74
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=freebsd.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7bb06b7d;
	Thu, 18 Mar 2021 16:52:38 +0000 (UTC)
Received: from mx2.freebsd.org (mx2.freebsd.org [2610:1c1:1:606c::19:2])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 1cf4af2e
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Mar 2021 16:52:36 +0000 (UTC)
Received: from mx1.freebsd.org (mx1.freebsd.org [96.47.72.80])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 73FCE93C5D
 for <wireguard@lists.zx2c4.com>; Thu, 18 Mar 2021 16:52:35 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org
 [IPv6:2610:1c1:1:606c::24b:4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4F1Y3l2TMrz4RMp
 for <wireguard@lists.zx2c4.com>; Thu, 18 Mar 2021 16:52:35 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com
 [209.85.219.49])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id 433BA2D4D6
 for <wireguard@lists.zx2c4.com>; Thu, 18 Mar 2021 16:52:35 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qv1-f49.google.com with SMTP id t16so3509627qvr.12
 for <wireguard@lists.zx2c4.com>; Thu, 18 Mar 2021 09:52:35 -0700 (PDT)
X-Gm-Message-State: AOAM5331M1yQ7Vam3K7UJzz2DcYOerhiiWazQETotSTA/kV8WoELRUmi
 0JVixPOszgxCGHPx9FQTwX7vDtFCzvMJtOsENFA=
X-Google-Smtp-Source: ABdhPJwqB8n/oSCRMe6UElGKb44MIyrUyblGSO1L5kLm8AruHbr6Y7r82awrKU8to5GzYn3Ga0MHFLxIZHFoosrnyM8=
X-Received: by 2002:ad4:4aa8:: with SMTP id i8mr5364279qvx.22.1616086354927;
 Thu, 18 Mar 2021 09:52:34 -0700 (PDT)
MIME-Version: 1.0
References: <CACNAnaHR9Li0wPOjmwRk7jG76-AESoTt0QrrG_UVTrev38N=bQ@mail.gmail.com>
In-Reply-To: <CACNAnaHR9Li0wPOjmwRk7jG76-AESoTt0QrrG_UVTrev38N=bQ@mail.gmail.com>
From: Kyle Evans <kevans@freebsd.org>
Date: Thu, 18 Mar 2021 11:52:21 -0500
X-Gmail-Original-Message-ID: <CACNAnaHit=-=rNy2DFZg6=zs1XFBvqt10Ta-MTM79NSWu1AK0w@mail.gmail.com>
Message-ID: <CACNAnaHit=-=rNy2DFZg6=zs1XFBvqt10Ta-MTM79NSWu1AK0w@mail.gmail.com>
Subject: Re: Removing WireGuard Support From FreeBSD Base
To: freebsd-arch@freebsd.org, FreeBSD Hackers <freebsd-hackers@freebsd.org>
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

On Tue, Mar 16, 2021 at 11:48 AM Kyle Evans <kevans@freebsd.org> wrote:
>
> Hi,
>
> You may have recently noticed some chatter around the internet about
> FreeBSD's in-kernel WireGuard implementation, and the work we've done
> on it in the last week.  You may have also noticed additional chatter
> afterwards with regards to the original implementation.  I'd like to give
> some context and information with regards to the current situation, as
> well as provide some insight into the future as one of the developers
> involved.
>

I'm afraid I must follow this one up with an announcement that I'm
stepping back from the wireguard-freebsd efforts.

You'll likely hear some things about me in the coming days. I'm sure
I've said more things in the past week and a half in anger that I
regret, and I'll have to live with that. I'd like to set the record
straight. Netgate personnel were involved in part with my announcement
of removal. I did not take a number of suggestions, because I wrote
what I believed in and I continue to do so. Netgate is in no way
involved with this announcement that I'm leaving it for now. There's
been too much press surrounding this, and it's distracting me from the
work that I like to do and what I'm typically known for.

The wireguard-freebsd project will need a new maintainer.

Thanks,

Kyle Evans
