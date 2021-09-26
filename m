Return-Path: <SRS0=3VOv=OQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B1A8C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 26 Sep 2021 03:19:57 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 861B861041
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 26 Sep 2021 03:19:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 861B861041
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 43294e07;
	Sun, 26 Sep 2021 03:19:54 +0000 (UTC)
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [2a00:1450:4864:20::42a])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 1edc5275
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 26 Sep 2021 00:43:42 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id t8so39399377wrq.4
 for <wireguard@lists.zx2c4.com>; Sat, 25 Sep 2021 17:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=1hSNWA1jJq82Y8LMaC0z9OOzlqaNGRrdBimJgephuuk=;
 b=fqO3cPbdk1eKTXoY4ajGZLal55cK9jqdCZEcQoH6TY7JLweRMW7hAds1xR4qPWtoPL
 e8ZDsfqJqHKbod0QFhetuI1hiqO17Ec1bldr8rio1KdYNr1fodyrYRdmoHfOtBS2CRkJ
 awpYEFP/rR8lnGBzY/aDff0iZ08jZC4gvCnZVMyhEcPwaBhP1YYJw5VBpkW5z3hmWKg9
 SuoK0g3ilMSsEfNqYCQN2uiQsWfqQtfqsxnDaePYkRsT24HIypigvQEej5egI6JLKIUD
 NsvP8bRdebVwgBDmvZFdLhFs/MJLLe6HnX4FiuBWWSjuafSsZhkeByCLNEjEPs8mbSYF
 TN0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=1hSNWA1jJq82Y8LMaC0z9OOzlqaNGRrdBimJgephuuk=;
 b=qslukd3L+ZlrGziH1GnI/BjLRw9j7ZFUXwEfs1c3hWdieFjDmKk4lwydH8u8c04qqh
 Oa/6CZyHJLC4WkRshLAKyPA/zVzpSh3qhPen2EallNw4dDjCeDHDjxmaJiLqeHtXgmoq
 G076+zrR4GIpJBg2F6KtQxTtaW7Z+bxCzTeP8BxKce7HU4wrgZsgVfbyX6dTza1y09Pn
 /9Al/g/ETt4qTJ6egUGwkBumds2UfamzDslpeVmpQglFy4UpSPl/PsC90WkA7+s+915W
 6gs0AWXS8cUuYKhmEdqQLCsCSC+9gbMhYd0n8wfTLFcQnl2NUYqYwUW/GwuD5xzq8F9H
 n+KQ==
X-Gm-Message-State: AOAM533aM1gx/042yVG+BCmKsM9e7dS1K7ID2daMHL6lYvEL7Z+lwQri
 cbtBgdZzfKvr45ZZQokrmLuo5dufXHceHtYe0s4fvtpwQ88=
X-Google-Smtp-Source: ABdhPJxkbPN/PmcAX56FWTg73kqk/E8nJOZGNueOyuVoGKRsgzdSJImUvqfrDjRgTyqjUbqrmhZgDTUSUK9Gpz+9o2Q=
X-Received: by 2002:a5d:6846:: with SMTP id o6mr19976860wrw.327.1632617021675; 
 Sat, 25 Sep 2021 17:43:41 -0700 (PDT)
MIME-Version: 1.0
From: Alexis Geoffrey <alexis.geoffrey97@gmail.com>
Date: Sat, 25 Sep 2021 19:43:32 -0500
Message-ID: <CAKFP4-gORakAyi7A+f2uMwRiE5LT5Ui7rBgZedqoBPcV6Q0M0Q@mail.gmail.com>
Subject: Can't add search domain in Wireguard Android App
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sun, 26 Sep 2021 03:19:53 +0000
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

I'm not sure if this has been posted before, but I am unable to add a
custom search domain to the "DNS servers" field of the Wireguard
Android app. The app responds "Cannot parse IP address "<my local
domain>" in Interface's DNS." Is there an alternative way to do this
on Android, or will this feature be added in a future update? Or is
simply a result of running wireguard as non-root, and so this is
impossible on an Android phone?

Thanks,
Alexis
