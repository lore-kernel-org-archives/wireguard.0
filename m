Return-Path: <SRS0=93XJ=IF=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BF6BC433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Mar 2021 17:23:29 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BA5B64F94
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  7 Mar 2021 17:23:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9BA5B64F94
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f1900d24;
	Sun, 7 Mar 2021 17:20:45 +0000 (UTC)
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [2607:f8b0:4864:20::d2e])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 48b69e2e
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 23 Feb 2021 23:24:37 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id p16so72405ioj.4
 for <wireguard@lists.zx2c4.com>; Tue, 23 Feb 2021 15:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=+6fNoivN0megZqPEGTcGhqX8JHqJ0E8kv1zYsF4rNDk=;
 b=Ag/q0HJnpUE3GOMXKGxxI6GKCjwDy6y1RE+grCHxLBKVi4VuqHO33Jxc0IzAoJH2s4
 ySzvgZJNfeK/3SmAK3Y4q0lU5fKhggd0Aj1SGS3ibZO5ZU0/gRmJze11mHFxEGJEmP1n
 pziGsqyhVHrAO+0wSXAY2YohoF8ABJhZI7axG2XKPVgYaS5his8tTEwJeqaVtd0iVcVd
 2rtS85/q67wY0co7fvND5H9KUhKNCiXdC6KZwxXJg0RBIvFRKNbjNHzTCtOFYwE3awFN
 /71sWBs91N1RW1BuqpWIsa/5Gp1znnJhtObWDPcKA0LELV2TfjsseN8aEY0+EWt0gZp2
 NEZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=+6fNoivN0megZqPEGTcGhqX8JHqJ0E8kv1zYsF4rNDk=;
 b=fnS+3uube8/a9l8Ih5hZNwFYuTxPF7fzTIt1SVNmJckxkBr3oxkzefq8vhegakb4ER
 MegJnQ1XWApT+WAXVtzd40iMwJZ/jBLM0SHWYMPa/0mvceZ96FD5TqZ64IAUELNeLiDZ
 fR/h6eqXnvB2h6t8kFnhHw6E8jyD1MwHEVGeNM+xvqGWfM6J5Dql9tLDVauePQZQb6eq
 /KXxYj+REEHykC5suqSWkMTwvllSxnYBT6zuNs4AZiKHlpKlK27tS2Il7C1smo/r3YTJ
 +R6ZmUchnhKXcLYpag/Z9UJVM8P4U/NpBtHwdL0uC0m5XwzSrPH9djaYzyshtG8zbCj+
 Nh9A==
X-Gm-Message-State: AOAM532u1XfdDZ6Z5BApT7WaxyHI0Tp+b0VFI1utA3bZ/p7PbC4oEjaL
 7/c6rCb+iUf/hjEXKlovqZ7NrNKLQHT9YPDv2MPDOqe5sbc=
X-Google-Smtp-Source: ABdhPJyItpY+EKyqJOMlTG0GPporpxD8AwmSC5JO1dDaUGMPrqjfEqDd97ivF999Rto2CU02qbDDqdTqzwfqhclex7o=
X-Received: by 2002:a05:6638:44e:: with SMTP id
 r14mr11799847jap.138.1614122676405; 
 Tue, 23 Feb 2021 15:24:36 -0800 (PST)
MIME-Version: 1.0
From: Peter Truman <peter.truman@gmail.com>
Date: Tue, 23 Feb 2021 23:24:25 +0000
Message-ID: <CAGJxn5oGmfp-vDPw7A6kTb0vtUMDRyaBhamQn1XqWoUyDrv+_g@mail.gmail.com>
Subject: Hairpin/interface change...
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sun, 07 Mar 2021 17:20:43 +0000
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

I'll no doubt be shot for asking, but having just switched routers to
one which appears not to want to support hairpin, everything I had
running has keeled over (yay).

I have setup internal DNS to point to the internal WG address, as well
as having a valid external one, but wireguard (Android) won't survive
an interface change (mobile to wifi and vice versa) - as I think it
tries the previously remembered IP.

Is there anyway to set an option for "crappy router" to force a DNS
lookup on an interface change? (or does the Android device DNS cache
break that?)
