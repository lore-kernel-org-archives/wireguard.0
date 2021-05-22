Return-Path: <SRS0=22yv=KS=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5ECD1C4707A
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 23 May 2021 08:18:44 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 759F960234
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 23 May 2021 08:18:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 759F960234
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id b22f2184;
	Sun, 23 May 2021 08:18:09 +0000 (UTC)
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [2a00:1450:4864:20::431])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 963d9700
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 22 May 2021 18:41:54 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id p7so20477595wru.10
 for <wireguard@lists.zx2c4.com>; Sat, 22 May 2021 11:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=D0BXwHN3YEoE+krixVngWa1eaPnV56gou7e8li1y0s8=;
 b=Vn/Vrc55SXPl2E2bgN6IBZMJjX8Atxpxhwzonqcyr03ingmlYfYi/dZ5JjftfPie1K
 4QxPH+CpDepJbiYapYi5Z1nhDHkVjhTu4RT6Ggb+0F/FSAnycxt7H8yBbIr+2/v2A2MU
 LgIfTMP5S+Rv9sDQfaAaFwL3z4zPbUyuwD35XUk8VAVDxvLPHTchXeS82ZlyxDIF4kNn
 0Aq7tbMX8ztgSWOKVT7vLsbiaSt9d8r7YmKrLiRbcsbM4wLSp7pQEF6mEdHja8DnOeay
 ZSKH2O/wZgpxey2IOp1eYsGUGPfz4G9Foe0p80ndAvc0uqWJY9NRapoeB26rwZApQw31
 HFAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=D0BXwHN3YEoE+krixVngWa1eaPnV56gou7e8li1y0s8=;
 b=kJwHPWqe7B1YYGPMAGa+Pb45qzEePTB2zG7sUn8mxLEmOPMJYAWnURiwB8UpRpaJ3h
 s8bBD3k6RnZgevIhJfbbi4gcw+SlhsPkRvJwhRzCXSE4mtm9sWgjI/Q1EL0GwDOvUxDv
 EyfA3cGCPorVLHU6xW3BZTZYDdaJSCdRa3bT1R3xSM2O8Dlu7sbAvqvRfdMmrVf1PMhF
 ApfHDb7iL2swh7rMey3a8dvYw8kr7haLnR3LIZTy5m7qvxi9/94qcNT1tzRo5HAEAeXq
 Ab1YvF4wjeL/3mMjE+SB2VMKRfhbOG2uw5DNrryBOUIsp0WJtttrZe7RkNaI1W9hYuf0
 Hv4g==
X-Gm-Message-State: AOAM530ucgw2q5axC1jBL//CON+WJayR9v022mM1yF6m5qX/kErsUh+e
 KUBxzULvrw+33rMxRLsW1pgA4vyoUIKESnhP9+ohlqdqoa3d+35L
X-Google-Smtp-Source: ABdhPJyLa2nYqqpPb3JzRO0DdfiA8eHh0lQDG5yABpF/BehKJ5hdA3gwm0tpGBu7WUlYqoMMSpF3B4sILzYkjVqLpWg=
X-Received: by 2002:a5d:63c1:: with SMTP id c1mr15000506wrw.71.1621708913867; 
 Sat, 22 May 2021 11:41:53 -0700 (PDT)
MIME-Version: 1.0
From: Hank Bao <hankbao84@gmail.com>
Date: Sun, 23 May 2021 02:41:18 +0800
Message-ID: <CACYctB=RCNhx8QoSy0tKePzTik_iYk-d_ifB-bBnqqitDKSsGg@mail.gmail.com>
Subject: Re: Error when connecting from windows client
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sun, 23 May 2021 08:18:08 +0000
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

Hello Everyone.

I believe I've encountered the same issue. My Wintun interface failed
to boot up, and I found a warning sign on the Wintun adapter in the
device manager.

After digging into the setupapi.dev.log, I found that it's the same
error message as Johnathan's.

!    dvi: Device pending start: Device has problem: 0x38
(CM_PROB_NEED_CLASS_CONFIG), problem status: 0x00000000.

I noticed that the Cisco AnyConnect secure mobility client got a
virtual adapter installed in the system, which instance id is also
'ROOT\NET\0000'.
Hopefully, this will be helpful.

Regards,
Hank Bao
