Return-Path: <SRS0=ykJm=HG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 482D7C433DB
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  4 Feb 2021 00:29:10 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3789064F65
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  4 Feb 2021 00:29:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3789064F65
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cbce6392;
	Thu, 4 Feb 2021 00:26:31 +0000 (UTC)
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [2607:f8b0:4864:20::b2b])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 0ddc8243
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 1 Feb 2021 14:08:55 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id j84so3763470ybg.1
 for <wireguard@lists.zx2c4.com>; Mon, 01 Feb 2021 06:08:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=ZWYm6/is5EEcFozG7fVFmcODlLvH0Tj1ZiPXp5SYDF8=;
 b=nYfQxWFvVPcMNethc6zOv/3Jv8eURy6XR85+QqTLB8ceBhk6SjRRiPyKnUtUbIYfKf
 ORDanNAA4k5MOeLhirMdPqCuKRdmp+Plj/pexmZ3xvbG8QjOUVWd1XboRclQvz7WGQKk
 z8At6a4eWKpl1k1OaJNRrvsUQoCYmaV3xWcksmMObrdbz17Uy5oeSANqAzoGrM0a8kQg
 6/UzSbhjrt5YojeZUNziNTmxRjATgGugAEzbEEI/m1fE+1MUr3nOBm7BdQDW78rPrDaE
 Ia5ZbNXGTMhsVme6EJYuUE2bxTkVnq54L0NTb1j4E/uQYXuY8AYLTHgqvt5s+qNUBVwu
 IP2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=ZWYm6/is5EEcFozG7fVFmcODlLvH0Tj1ZiPXp5SYDF8=;
 b=CKl7DW4hoRLgeu7+8a9Q0HW6wImro52lUEVURvkQblRF60X3BwkMSx7HyY7PmqMIxp
 kY3gLNem5SOsdHRoBh7YbnzpAl1P+5lXnwqZiZAQ9PRTqQ2EdZkm3hV67plU6Ns1SbYk
 6WHzLuCCGUThUSqiVQU71q6drfkFLG8hHAUf/asex1gOIJMUOYY+edtxsoM82wBQCLME
 X0EeoiKE+WjJckvwAJWLlH8bE6dkHIWMS4GQK3DUa8nUMAhQKYE5wOptbWr/HxFiE7lG
 sDdbp90YRMJzqRtU9Xb+rckAdBWDq9MpIXPT+ioDsGELouG+sqcNUU4FqlaQsuDC84TY
 lnoA==
X-Gm-Message-State: AOAM530R06MO9DzgUgLaYE4nEheQSA3Wx7O0WNAhXmjyREZvo/Kn4oWy
 WehCqeN8sqd/Kgx7ZHL35F0HReO1+VpWYGM0BFt6hlUwLmn2tg==
X-Google-Smtp-Source: ABdhPJwOQ1bbVZoboYJU9Ognip5PELMzlY81vweDyDUC2n//IcdA2x/GuMWECucJMQg7k4VJFG6faK7tE4ybECCz7m8=
X-Received: by 2002:a25:f54:: with SMTP id 81mr24112991ybp.76.1612188534483;
 Mon, 01 Feb 2021 06:08:54 -0800 (PST)
MIME-Version: 1.0
From: Vladyslav Ivasyuk <vlady.ivasyuk@gmail.com>
Date: Mon, 1 Feb 2021 16:08:43 +0200
Message-ID: <CAJ0ZNNmwpRVdygsgUnTqJCZR436RhcCWvw2bgUG3KpM5s0=otg@mail.gmail.com>
Subject: Re: [Windows] Unable to build latest wireguard missing
 i686-w64-mingw32-windres
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Thu, 04 Feb 2021 00:26:30 +0000
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

the problem with "unknown revision" is happening because git history
was rewritten. There are two projects which are kept in branches of
the Windows WireGuard client project. Those are "github.com/lxn/walk"
and "github.com/lxn/win" and branches for them are "pkg/walk" and
"plg/walk-win" respectively. Both branches have a number of
customization commits which are kept at the top of the git history.
Hence sync with lxn's code is done with rebasing and then force
pushing. So after the sync, old commit id is lost and replaced with a
new one. Each time those branches are updated, you can also see the
"mod: bump" commit in the main branch. All commits before that will
not work anymore. Therefore old tags are not reliable too.

Probably, it can be fixed by keeping separate branch for at least
every tag, so build on tags does not break. Though, it would be better
to create a new branch on every update/sync. Another options to
consider are maintaining the lxn in a separate repository or keep
changes as a set of patches.

Best,
Vladyslav
