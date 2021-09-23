Return-Path: <SRS0=9kqO=ON=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 932CDC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 23 Sep 2021 03:58:11 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8DCD561040
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 23 Sep 2021 03:58:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8DCD561040
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 14264b82;
	Thu, 23 Sep 2021 03:58:08 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id c3fe1a32
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 23 Sep 2021 03:58:04 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3984F61038
 for <wireguard@lists.zx2c4.com>; Thu, 23 Sep 2021 03:58:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="V6Q64ai3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1632369480;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=C09FmEwSUzUbGRGTmtK+GLQZYtduBfg1h5LCMR9/BPU=;
 b=V6Q64ai3yu2/sMzoywjr8A6cN2XRSIjdqPQo5eqaokdibC9nfFJEYjEVYhvNvhTER6b/IA
 uk4Eu086VFDvU1EdZY1D1yxeBhmEzC2LpV/rmV+LnSW2JsIlmYBVVpSLJhmA8B8TzQrfem
 CrBcYYROkIRJx8mO6r5WQnkJ2wNk8q0=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 51b39125
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 23 Sep 2021 03:58:00 +0000 (UTC)
Received: by mail-qk1-f182.google.com with SMTP id t4so17357180qkb.9
 for <wireguard@lists.zx2c4.com>; Wed, 22 Sep 2021 20:58:00 -0700 (PDT)
X-Gm-Message-State: AOAM531djcECskH7l9OL18kU0Xc4FRPmKY9S5q3rtH0DPoPuHGFZqP7r
 zrRz9G2p0yma3FpWTkEc5rAmJkr1pLAAyTlZNVE=
X-Google-Smtp-Source: ABdhPJzZX2ECfd36jLUa425Gf2jsDbh+8uqSX5Xlpzykd12x+OZKh3DxLirA70cMwXFpqDA2/GjPBkcbgf+oTZgMilM=
X-Received: by 2002:a25:ad97:: with SMTP id z23mr3091434ybi.412.1632369479305; 
 Wed, 22 Sep 2021 20:57:59 -0700 (PDT)
MIME-Version: 1.0
References: <95105bdf-8442-4c7c-dcc8-719b0784bced@attglobal.net>
 <CAHmME9qQZMb4ajHKHY8w-b8_9BNv8YM9YKyNO9U9RH0_thrCPw@mail.gmail.com>
 <49d1235b-1ed8-68f6-33bf-574ac0ad40e0@anatoli.ws>
 <CAHmME9q58QCUEY7vqhX767wPtqCPr23gmXgSS_bvbfvNZva=SQ@mail.gmail.com>
 <96bcc87f-7de1-05a4-641a-27ffac7b052d@attglobal.net>
 <DA133F84-7C21-4234-97DB-FFEDF79D1607@gmail.com>
 <CAHmME9p69qDGUJnbHVsqH_vx8mf=dNY3-sQ-7APhOG85xxLYWA@mail.gmail.com>
 <CAHmME9rQY8OU3jbXnB=OroBvudO1KCXL3vL6ESuEgZoMSRqVLw@mail.gmail.com>
 <CAHmME9reWG3UiHQm1fBvyQUoUF5_oJv6YiBGaOE2AUgLt-nK3w@mail.gmail.com>
 <BD9150AA-4F49-416A-A897-A9C4000C354E@gmail.com>
 <CAHmME9rREdEAWEDYyHaRWHwkUUWy1MPdrBokSygO8rhyxTJgXg@mail.gmail.com>
 <1B181919-09C0-4908-82F2-DD5661C53FD0@gmail.com>
 <CAHmME9r5HX6qYNQRarK0Mbv+Vf5dyyWwH-RjLmsjWHSy-YBEUQ@mail.gmail.com>
In-Reply-To: <CAHmME9r5HX6qYNQRarK0Mbv+Vf5dyyWwH-RjLmsjWHSy-YBEUQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 22 Sep 2021 21:57:48 -0600
X-Gmail-Original-Message-ID: <CAHmME9ruxL6LKmPNEhkmUCGG_tNQBhxkPx8v_dujPwAOnXowzw@mail.gmail.com>
Message-ID: <CAHmME9ruxL6LKmPNEhkmUCGG_tNQBhxkPx8v_dujPwAOnXowzw@mail.gmail.com>
Subject: Re: WireGuard Configurations Gone After iOS 15 Upgrade
To: Miguel Arroz <miguel.arroz@gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Eddie <stunnel@attglobal.net>, 
 Anatoli <me@anatoli.ws>, Roopesh Chander S <roop@roopc.net>,
 Alan Graham <alan@meshify.app>, oss@jacobwilder.org
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

Hi Miguel,

On Wed, Sep 22, 2021 at 9:22 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> Interesting... Alright then, new theory: the keychain references are
> accessible in the old 12-byte format, but are presented when iterating
> in the new 20-byte format. The deleteReferences(except: refs) function
> iterates through all, removes everything in the except list, and then
> deletes what remains. If the iteration reference doesn't match with
> the except reference, despite pointing to the same object, then it'll
> delete them incorrectly. ...restoring to iOS 14 now to test that
> theory.

Good news! The theory holds. Thanks for bringing that behavior to my
attention. I think this should be fixable.

iOS changing persistent keychain refs to be non-bijective I guess is a
bit of a shocker, but I'm glad we've gotten to the bottom of it.

Jason
