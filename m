Return-Path: <SRS0=B3Yb=IO=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F8DFC433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 16 Mar 2021 16:49:15 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B2A12650B1
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 16 Mar 2021 16:49:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B2A12650B1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=freebsd.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7bae3ee0;
	Tue, 16 Mar 2021 16:49:12 +0000 (UTC)
Received: from mx2.freebsd.org (mx2.freebsd.org [96.47.72.81])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b18a3e9a
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 16 Mar 2021 16:49:11 +0000 (UTC)
Received: from mx1.freebsd.org (mx1.freebsd.org [IPv6:2610:1c1:1:606c::19:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits)
 client-signature RSA-PSS (4096 bits))
 (Client CN "mx1.freebsd.org", Issuer "R3" (verified OK))
 by mx2.freebsd.org (Postfix) with ESMTPS id 2800A97100
 for <wireguard@lists.zx2c4.com>; Tue, 16 Mar 2021 16:49:10 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from smtp.freebsd.org (smtp.freebsd.org [96.47.72.83])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256
 client-signature RSA-PSS (4096 bits) client-digest SHA256)
 (Client CN "smtp.freebsd.org", Issuer "R3" (verified OK))
 by mx1.freebsd.org (Postfix) with ESMTPS id 4F0K4k0NrRz4nY2
 for <wireguard@lists.zx2c4.com>; Tue, 16 Mar 2021 16:49:10 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (Client CN "smtp.gmail.com", Issuer "GTS CA 1O1" (verified OK))
 (Authenticated sender: kevans)
 by smtp.freebsd.org (Postfix) with ESMTPSA id EF96176DD
 for <wireguard@lists.zx2c4.com>; Tue, 16 Mar 2021 16:49:09 +0000 (UTC)
 (envelope-from kevans@freebsd.org)
Received: by mail-qv1-f43.google.com with SMTP id t5so9837903qvs.5
 for <wireguard@lists.zx2c4.com>; Tue, 16 Mar 2021 09:49:09 -0700 (PDT)
X-Gm-Message-State: AOAM532qymLeX3tqj2SmaGrhGcRyYmKnPhAHwqsnFZrKRIcsJoMPxu4n
 JK2rhCk/RQojeqxt+rHcBgmIb08H+GjUac+8O8I=
X-Google-Smtp-Source: ABdhPJzi34QeuuOVEse/PFA41MQ0sLEBCfcjPCZtF6MJIU4MAD2F43d8XcxVIJylISCEjKpVOi7ZU5MBwDx/aFIZSqM=
X-Received: by 2002:ad4:51c1:: with SMTP id p1mr582860qvq.39.1615913349559;
 Tue, 16 Mar 2021 09:49:09 -0700 (PDT)
MIME-Version: 1.0
From: Kyle Evans <kevans@freebsd.org>
Date: Tue, 16 Mar 2021 11:48:56 -0500
X-Gmail-Original-Message-ID: <CACNAnaHR9Li0wPOjmwRk7jG76-AESoTt0QrrG_UVTrev38N=bQ@mail.gmail.com>
Message-ID: <CACNAnaHR9Li0wPOjmwRk7jG76-AESoTt0QrrG_UVTrev38N=bQ@mail.gmail.com>
Subject: Removing WireGuard Support From FreeBSD Base
To: freebsd-arch@freebsd.org, FreeBSD Hackers <freebsd-hackers@freebsd.org>, 
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

Hi,

You may have recently noticed some chatter around the internet about
FreeBSD's in-kernel WireGuard implementation, and the work we've done
on it in the last week.  You may have also noticed additional chatter
afterwards with regards to the original implementation.  I'd like to give
some context and information with regards to the current situation, as
well as provide some insight into the future as one of the developers
involved.

With regard to the original implementation, this will be my only
commentary on the matter. I'm a developer, and I'm passionate
about the work that I do- often to a fault. I've said some things that
I regret; the accusations that Scott Long alluded to in an e-mail on FreeBSD
mailing lists were indeed made by me, and his phrasing of what I
said was much kinder than it could have been. These were mistakes,
and I'm going to own that. However, my personal belief is that neither
Netgate, pfSense, nor the original developer deserved the level of
scorn and criticism that they've received in the past days from both the
press and the community at large.

In the next day or so, I will be committing a removal of all WireGuard
related bits from our 'main' branch, including the work that I recently
committed. It will be followed up by a removal of the implementation
from stable/13, and we will seek appropriate approval to remove it
from releng/13.0 as well. Please, do not be concerned by any of this;
this is being done with mutual support from all parties.

Did the original implementation have issues? Yes, it did. Are we
certain that our new version -doesn't- have issues? I believe it
doesn't, but it hasn't been through thorough enough review. We hacked
on this for a week, and we all reviewed each others' work in the
process. The problem is that this work, in particular, is a driver with fairly
severe security implications. Review by "three developers working
and beating on it" is not the higher bar that we should be
holding this to. While I believed I was doing what's right for the
community, it's become clear that what's right for the community is
to take a step back and do this the right way.

Note that we're not dropping this effort. We will continue iterating
on this out-of-tree, and we will go through the proper review
channels. Folks will be unhappy in the interim because we're removing
it right now, but in the end we will have a better FreeBSD because of
it. There will be a kernel module available in ports at some point,
but not before it's ready.

Moving forward, myself, members of Netgate, and members of the larger
community *are* working together on strictly technical details. I urge
anyone with an interest in reviewing the driver to also get in touch with me.
Please, let's move forward as a community on this.

Thank you,

Kyle Evans
