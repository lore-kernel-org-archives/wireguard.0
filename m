Return-Path: <SRS0=LBMS=NH=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73AADC4338F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 16 Aug 2021 19:51:59 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 676E860FC3
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 16 Aug 2021 19:51:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 676E860FC3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 13111928;
	Mon, 16 Aug 2021 19:50:49 +0000 (UTC)
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [2a00:1450:4864:20::22a])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id fd41b408
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 16 Aug 2021 18:59:57 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id n7so28889832ljq.0
 for <wireguard@lists.zx2c4.com>; Mon, 16 Aug 2021 11:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=ND4syPJJryn9R84lx1ApPA45OwTs6UCUOQF5emaogug=;
 b=s7PL2rcJV6BrS9LNOz9IXrDZTAwjavOs/6vJ5MsJdqkPTeoz4M0LwEHJfjSV3kPVV6
 sPWgNjRUx/3U2jL0tqS5q54LpYKJj0qiEHOJtKos7a44yGMYVR4R3zhDi9I/vy/BlQbf
 aUKXCar+ZnQOuSyH6H3qxOAQ3WbgiTtusOEstxYTdKVgRKPnO9MQfCp+HOCkbTOVM2W+
 eV3qBbSTcWP8nZp3qXiVMFGHZOLo5Ov+z+jLpRWQ4PzhO5v6hcy1eY2VkTJA1OMLI16R
 AACPU7lhsJXMyHO7z2XErHBedkCNnFstuAqwEen2D/6zd1GDCqks167YDbZskqqwXyKl
 RZVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=ND4syPJJryn9R84lx1ApPA45OwTs6UCUOQF5emaogug=;
 b=PP6zB5h6P0y3wMuFteLT2g8t5+OMaOptlx2WYJUj9KyhH9MZWLsq+GeabWJPwN+Ujx
 R6Yj3A02RnHkYLfUuKUe8VcKqm+6+s8efrSFC5TaV+hO726K3hw0WReXj+K45biVi8nG
 fVbaEd8ibVextPS2a1o5STyr4Ta+7Uxr+eNPnP0lsLHjgXmswwHLL9J0xJ2NmwcUsKa2
 inhlCcL5oR3hmUN4ZFA7O0tTD3cWpRId8mUXbg7x+K+ZXlZ4YM0inot44AMf9Zu9dWEE
 LRwGH/yarjFGCx4nIkvODeGcuy8SNnxVwBd6IDED4zEcCnhqEJIjM7zfbJswkKamKH8W
 yYDQ==
X-Gm-Message-State: AOAM530U9gCYvLDCnH4DkUnZNuzF52zL/Mk4WDCAw7VWWDtZ5/qW3Owh
 RvlQkRlc4+3KuOWhrPFIywVDIEambVTgO/niSTMuUecAXw64xQ==
X-Google-Smtp-Source: ABdhPJx27VbDZc535JXNgV2d09j4y6ZTdU9vF+0R1EbQ4LJjW0pE4dn9zIbKxCVjDssgCfuHOoZlig+zXxCcWvBREkA=
X-Received: by 2002:a2e:a806:: with SMTP id l6mr94585ljq.91.1629140396412;
 Mon, 16 Aug 2021 11:59:56 -0700 (PDT)
MIME-Version: 1.0
From: Kacper Michajlow <kasper93@gmail.com>
Date: Mon, 16 Aug 2021 20:59:46 +0200
Message-ID: <CABPLASSmgH0WZ=5X0zNtQtOjZKDX4ooPZUAfsa=bMH2nW_QE+Q@mail.gmail.com>
Subject: [wireguard-windows] Microsoft Store doesn't work when killswitch is
 enabled.
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 16 Aug 2021 19:50:48 +0000
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

I noticed an issue with Microsoft Store when Wiregaurd tunnel is
connected. When "killswitch" is enabled, MS Store doesn't work, it
says that "page could not be loaded". After some troubleshooting it
looks like the connection is dropped by the firewall (I see it in
logs). Source is my wg ip, destination is some akamai server, looks
legit, but it is dropped (both IPv4 and IPv6).

Do you have any idea why? Everything else works correctly. Is it some
UWP app quirk? If I disable "killswitch", traffic goes through the wg
tunnel and MS Store works, so it looks like the firewall shouldn't
drop this connection, when killswitch is enabled.

I searched for similar issues and only found this one
https://github.com/mullvad/mullvadvpn-app/issues/2845 looks like the
same symptoms and the guy reported that it works in Windows 11.
Regardless I would like to understand what is happening, maybe you
guys have more insight.

Best Regards,
Kacper
