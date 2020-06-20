Return-Path: <SRS0=kilO=AD=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 847E8C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 22 Jun 2020 08:17:27 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF1242068F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 22 Jun 2020 08:17:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FsxlimJd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EF1242068F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6beab1b0;
	Mon, 22 Jun 2020 07:58:26 +0000 (UTC)
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [2607:f8b0:4864:20::d32])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 681da2d4
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 20 Jun 2020 22:19:01 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id y5so15459054iob.12
 for <wireguard@lists.zx2c4.com>; Sat, 20 Jun 2020 15:37:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=//znLbDBrePs4rNwrcQJgzN2OQYJnCz8X1X2tGMovxw=;
 b=FsxlimJdiC4WIOA2mUe9vObru8shAJ+BJJ7T8GhblOLcKQf48CcGm2+sOKCBm9iRVL
 qI3u77RN0CsRbH5wV1/oVvOE+IzZ5bUl/NeUzxK+OOOv6ZrQRiou+1dmOMztwSuKl+my
 AOADoaMwGspzF7/2rhCESmHVXPqrxChgFfoiSyCEiXQFISIl7LbJqMWtgLMk68jVNa6Y
 JzugiFxjt1wk0KIbHlBrgjRRaawWe8juJZKuUyNtcMBVluyd5iiLchCVrsMsziu76Y37
 vFahfmeKRlBfIs+BzjxSQxBYlHt2UOUf4OJpDF2JQEVENWemy4RKgobf4hsGe2GLT3Jj
 XhgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=//znLbDBrePs4rNwrcQJgzN2OQYJnCz8X1X2tGMovxw=;
 b=YIbL0mvE2Ok5LHytYR0RJP/utzRlg9G1Iu4lTeU9YRfpAwEdLCJGEhLyVd34KGsfXH
 mJVl9nFilX07geRC8Vffq2wHBr1nB0vWF2rghfquR/lh8GI7K2t2U2HNwrZIktcKy7AD
 DwTxa5g3U6WxxFSP2gb0zwjsUVbAN3OEGt6X+lr1h1+KXXLU14dComuJN1PNrHzljZRp
 +CJKAw9eRt8Vfs1FM5nMgKQEMuno9L8sd/ugwQ89/4vek46QKOx/ZTq8Byen0G0ZHprj
 elioM2ROQuCEFNG1ghnJifpQeHl8lseXxD/ShlAojMM9lWAIJdN59LSpHgwnkp07qlOg
 wW4Q==
X-Gm-Message-State: AOAM533mctWwiltApCV18/j4UFANnhC79CVAcX8wq1Y6+jqM0qq8jyah
 v92FWpolBqb1+owb00PiX683rnhexcJKdUNAh9MpCmu3sN8=
X-Google-Smtp-Source: ABdhPJyiYgwrUdCzTwboET6Vo6NcNXCjacW6FfzNQru86ZU5TMW7IR9d6JEhZTPCj0mhrf/MvTLR9Wm4XGI75Ri5ilc=
X-Received: by 2002:a05:6638:601:: with SMTP id
 g1mr1214236jar.137.1592692652463; 
 Sat, 20 Jun 2020 15:37:32 -0700 (PDT)
MIME-Version: 1.0
From: Bing Ho <bingho1@gmail.com>
Date: Sat, 20 Jun 2020 17:37:21 -0500
Message-ID: <CAMLDjmSh5pXr8Xx0kpFguBhkVOfkxB9=F+vqBWdqiAU1jBY80Q@mail.gmail.com>
Subject: Issue with microk8s and wireguard
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Mon, 22 Jun 2020 09:58:24 +0200
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

Hello,

I recently encountered this issue with microk8s and wg-quick. This is
reproducible for both Ubuntu 18.04 and 20.04, and Fedora 32. I believe
it has to do with the microk8s network interfaces and iptable rules,
and annoyingly requires disabling microk8s and rebooting the computer.

https://github.com/ubuntu/microk8s/issues/688

Given the age of the issue report and non-response from microk8s
developers, I was hoping that perhaps members of the wireguard mailing
list might have an iptables workaround.

Thank you
