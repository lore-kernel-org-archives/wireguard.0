Return-Path: <SRS0=SfGb=OM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AA4EC433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 Sep 2021 22:28:33 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 525E7611B0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 22 Sep 2021 22:28:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 525E7611B0
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 53dd262e;
	Wed, 22 Sep 2021 22:26:19 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id ced16d24
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Sep 2021 22:26:16 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3DDD0611B0
 for <wireguard@lists.zx2c4.com>; Wed, 22 Sep 2021 22:26:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="GuF2cyXt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1632349572;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gkBzj+K+87ygCgIPJcYctGsTuTZNNfloGwIksscoYpA=;
 b=GuF2cyXtlhsOy6iadz4wEUBro9LdtP01QDfS5ENVj/d/pYEeW9YkAq183OIoFlMiMUu4PL
 gFnRnSj34StGgm6Jr1Wru5UGD1SbUZqeYXxiZOLDwbOB4OtT3cRM44kKYl/eC21lDE5kiq
 VZxXeRdxgSy7OyajhDSlF4Vy0XDQKY4=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 78f76e3d
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 22 Sep 2021 22:26:12 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id c7so15493444qka.2
 for <wireguard@lists.zx2c4.com>; Wed, 22 Sep 2021 15:26:12 -0700 (PDT)
X-Gm-Message-State: AOAM531WPG8ZADqeM0WMlBdsPfZJQvdGTNsp/XCtdt+qSMrdLLrrNi07
 ZVIRhyO+pApzq548T3UrMduYFUZaF8Z1Z49QiTE=
X-Google-Smtp-Source: ABdhPJwlyFNekuOJYJQyX40Hl9zdbEY5H/eQUuGqdEwl2Je6K63Swi+vxQ7l7kSmvSY4yjSLE3dX43Hd5wYS1616EfI=
X-Received: by 2002:a25:ad97:: with SMTP id z23mr1765492ybi.412.1632349571627; 
 Wed, 22 Sep 2021 15:26:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAHmME9p69qDGUJnbHVsqH_vx8mf=dNY3-sQ-7APhOG85xxLYWA@mail.gmail.com>
 <B096024B-E199-462E-978C-73B2C1D4C8D2@anatoli.ws>
In-Reply-To: <B096024B-E199-462E-978C-73B2C1D4C8D2@anatoli.ws>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 22 Sep 2021 16:26:00 -0600
X-Gmail-Original-Message-ID: <CAHmME9pjuin565o4Ckmj2rHEhO9bAd4uaGarMA9SAMmP=85_wQ@mail.gmail.com>
Message-ID: <CAHmME9pjuin565o4Ckmj2rHEhO9bAd4uaGarMA9SAMmP=85_wQ@mail.gmail.com>
Subject: Re: WireGuard Configurations Gone After iOS 15 Upgrade
To: Anatoli <me@anatoli.ws>
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

On Wed, Sep 22, 2021 at 4:24 PM Anatoli <me@anatoli.ws> wrote:
>
> I can confirm that recreating the tunnel from scratch does work. So the problem is that the tunnel settings become corrupted when iOS is upgraded from 13.x / 14.x to 15.0.

What are you testing? The new version of the app or the old one? Does
the new one corrupt settings or only the old one? Precision is
important here.
