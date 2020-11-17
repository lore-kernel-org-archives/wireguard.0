Return-Path: <SRS0=xb9C=EX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8215FC2D0E4
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 17 Nov 2020 21:13:21 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DB5724199
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 17 Nov 2020 21:13:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="PQKHvf+5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6DB5724199
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id acbdf243;
	Tue, 17 Nov 2020 21:08:39 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 4eb506fe
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 17 Nov 2020 21:08:37 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bc8127da
 for <wireguard@lists.zx2c4.com>;
 Tue, 17 Nov 2020 21:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type:content-transfer-encoding; s=mail; bh=KKwBVm3y0AJh
 4sO+/BPypBxtisc=; b=PQKHvf+5TfSecVzH7LmkOS1db2iUypK2UY2ZDB58T514
 ClcwqVeOghT4/yqTXXxhyENOLk9UpdAlyvKjLy5xO8/styYqQ43tMAanFu6OweH2
 +xA2aEaBGzZMrQPG+pKuRkjeIb2a9v5IO6JeQqEefbI+/taFMEC21D2HLdgahh8P
 wk8hEeU2LuWxDu439dz6XFe9UJakSo+JFgwq7vPj/A9IyF83haX/QriP1/t2GWcD
 v7OIjC5esFoxAomhBYRcvsz69sHqWjSFReyX04PSTktVcYuLIm1RSYSigEK9Zp/x
 jQHYrIl48Y6PVDwRG4saLbi5DWq2ofCoty8Ps9UFjw==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 9db092bb
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 17 Nov 2020 21:09:23 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id 10so20281307ybx.9
 for <wireguard@lists.zx2c4.com>; Tue, 17 Nov 2020 13:13:16 -0800 (PST)
X-Gm-Message-State: AOAM531rABTufbD+AWReNbgB5SeKaSiWBKku/qvjQBImF//OC85Wls+p
 Gf1prWN6fhfYCUbcHKw9fucYig2YgIQh7yrQpI4=
X-Google-Smtp-Source: ABdhPJxCvGYVlz20NkrZqVSunngUvpREQbsrQdk539FvSLZFjBP0ALAZjlWv5930DUELfnzDwGPfmA4QWU4T1+k5Ldw=
X-Received: by 2002:a25:6089:: with SMTP id u131mr2363636ybb.456.1605647596210; 
 Tue, 17 Nov 2020 13:13:16 -0800 (PST)
MIME-Version: 1.0
References: <CALaUSuu+HvW+W=2--V1P9w4_4JoKpH12A=TNC5QsMsiaNZcrKQ@mail.gmail.com>
 <CAHmME9ridRrB+HsZ_SHDszjrrEvkU8Vp1+hmqjPjBdOO2x38GQ@mail.gmail.com>
In-Reply-To: <CAHmME9ridRrB+HsZ_SHDszjrrEvkU8Vp1+hmqjPjBdOO2x38GQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 17 Nov 2020 22:13:05 +0100
X-Gmail-Original-Message-ID: <CAHmME9rZsWXeGh__RpuZSC9ycgeK+jQ6OhRaksqX5P+LpcmnyQ@mail.gmail.com>
Message-ID: <CAHmME9rZsWXeGh__RpuZSC9ycgeK+jQ6OhRaksqX5P+LpcmnyQ@mail.gmail.com>
Subject: Re: WireGuard for Windows fails to enable firewall rules after update
 to v0.2.1
To: Joshua Sjoding <joshua.sjoding@scjalliance.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

This part of your log:

2020-11-17 08:19:14.469253: [MGR] Migrated configuration from
=E2=80=98C:\WINDOWS\system32\config\systemprofile\AppData\Local\WireGuard\C=
onfigurations\SCJ.conf.dpapi=E2=80=99
to =E2=80=98C:\Program Files\WireGuard\Data\Configurations\SCJ.conf.dpapi=
=E2=80=99
2020-11-17 08:19:14.480225: [MGR] Migrated service command line
arguments for =E2=80=98WireGuardTunnel$SCJ=E2=80=99
2020-11-17 08:19:14.485210: [MGR] Starting UI process for user
=E2=80=98[REDACTED_PERSON_A]@SCJ=E2=80=99 for session 1
2020-11-17 08:19:14.509146: [TUN] Unable to load configuration from
path: open C:\WINDOWS\system32\config\systemprofile\AppData\Local\WireGuard=
\Configurations\SCJ.conf.dpapi:
The system cannot find the path specified.
2020-11-17 08:19:14.509146: [TUN] Shutting down

Seems like it's do to a race in the migration, which this commit should fix=
:
https://git.zx2c4.com/wireguard-windows/commit/?id=3D6e4e535e0c1108bbd5a3f1=
5e273e13868f4ece20

But this part of your log:

2020-11-17 08:19:29.582424: [TUN] [SCJ] Enabling firewall rules
2020-11-17 08:19:29.746988: [TUN] [SCJ] Unable to enable firewall
rules: Firewall error at
golang.zx2c4.com/wireguard/windows/tunnel/firewall/helpers.go:100: The
specified group does not exist.
2020-11-17 08:19:29.767930: [TUN] [SCJ] Shutting down

Is extremely puzzling. I'm wondering what led to this and how you
eventually appeared to fix it. Did it go away on its own without user
intervention? Did you have to manually start/stop the tunnel a few
times?

Jason
