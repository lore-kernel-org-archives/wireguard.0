Return-Path: <SRS0=TPXl=N3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=3.0 tests=BAYES_20,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A219AC4332F
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  5 Sep 2021 11:12:57 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E693B60F22
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  5 Sep 2021 11:12:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E693B60F22
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6d243217;
	Sun, 5 Sep 2021 11:12:55 +0000 (UTC)
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [2607:f8b0:4864:20::133])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 43709950
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 3 Sep 2021 23:08:05 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id j15so564694ila.1
 for <wireguard@lists.zx2c4.com>; Fri, 03 Sep 2021 16:08:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=ax+41KFU+FtwwIlpI/+w/HBU8ARbC+foUhtk0lVJWeA=;
 b=F+CvT28EKzw3b/8lN9zNLAcnwDLnyDR84Y2vfq2vWh5g8qLRg/lZp5D/Gck0lxgTf9
 Y70fsB/tmhkBX9mVkkZJr6eCK2kYT46sn4XmlMm9mJd+/IwvZuE77djalrz4aPBuUKM5
 Un1gWo8RvBO/VGhTjaFHSUSTwXP+/ndn4eHRPq6r8GCvLBg1P0O6d78PbyyJxJIiTpvO
 /Yqt/hh/SC6MNGaCQCY2h5BhmILlAIxaWxAX8DR7mk1uxNrp/PMq43oE/aX9bNN+iAgx
 hO9J3Urx+/tgshl0icUL4faZGwKqRnEv9q08M+hY2B/aeTxDpiBi0gvqiWW7kAT0CGKC
 7zhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=ax+41KFU+FtwwIlpI/+w/HBU8ARbC+foUhtk0lVJWeA=;
 b=FXdRfkjibmYpoz+TBUao9dd/sdJAuiWeAsWwd4H9i6VadUFOCbGSvusYERgSYN645o
 bC4oLiU+vKjZGsamUTxBUSLkT6PJJ7RFQaWX31txJHyUcNuEqocyddLf5578P1eREjV3
 mUUjfNFLJQOqHwU8Q4gAWr+3+MG/Qy7oqll+98mXKfQXK4deb/xkCeAIy8l2ZTQ6URlX
 5SjcdNVfscf2tIF8veq2roq2CH8t9ThDZKrhoklxiKzFsXBps/Gn4FDtrcei41X1jyx1
 EnD4Uay86nqjWGGK1L/PZ9xJdC74zx+hR9Y/sOt3MpcSws7FCXa60Ku5uW0zhsc3R79Y
 bQrg==
X-Gm-Message-State: AOAM5303qPM3eclbUukT2fuDFuyKvrMyoZcTmvU/F/kvR6e10BXUU/OU
 SnvWi0s9tyXjS1SD3KLSznts3qnEUzflyDVKbwzr5WtdVIk=
X-Google-Smtp-Source: ABdhPJyzc3w66tsY6t9HJM1U7y1jwg1kiHpWP/P9j7Pixa0mwAMtli93Nws/K66PHhYOs+qvPfnuaTyt5Tojp/h2MGM=
X-Received: by 2002:a92:8702:: with SMTP id m2mr905830ild.250.1630710483556;
 Fri, 03 Sep 2021 16:08:03 -0700 (PDT)
MIME-Version: 1.0
From: Veerabhushan Hatte <vkhatte@gmail.com>
Date: Fri, 3 Sep 2021 16:07:52 -0700
Message-ID: <CAC6DygdBVsk2Sa3LFLLs5WdOUUOi1Vs0+v6gXV7d+h-noy8v1A@mail.gmail.com>
Subject: Unable to load wintun library for Windows
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sun, 05 Sep 2021 11:12:49 +0000
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

Hi All,

We are trying to use wintun DLL to create SSL tunnel. I copied
wintun.dll into c:\Windows\system32\ and tried the example provided to
load the library (LoadLibraryExW(wintun.dll,...)). I am unable to load
library and I am getting error 126 for LoadLibraryEXW.

How do I solve this issue?

Thanks,
Veera
