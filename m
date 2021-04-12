Return-Path: <SRS0=b8ma=JJ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_05,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5208C433B4
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 12 Apr 2021 17:34:18 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05C746121F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 12 Apr 2021 17:34:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05C746121F
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3b35ef4d;
	Mon, 12 Apr 2021 17:32:05 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 72b5cdd5
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 12 Apr 2021 17:32:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1618248720;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=aejHCnS0rPEJLCrpiasX6aVFRgAYEnCBb1SFfE4fQN0=;
 b=ROGwCTpZpNqD441oCxVLYPgU5JYk2FKU47ZU1DS4++mMfuCahCS+0UvY1ni4+6u+fDtEvf
 0zU9KLkBCu9Xv1V0pUWuffuzOk2GNSuqjfXCwE4Jk5LkJmx7lpeApzy3iflXs1XlN8Df14
 ge8VfqMbkZzERk7I5Kd3ew1URAxUGoI=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 477ba23c
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 12 Apr 2021 17:32:00 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id n12so15024244ybf.8
 for <wireguard@lists.zx2c4.com>; Mon, 12 Apr 2021 10:32:00 -0700 (PDT)
X-Gm-Message-State: AOAM533JN7s4nyJhuiikmIz+IE41flhYEn6tpKg5mbX9aGvbe83KJE2x
 CQYpE32IFIkYpGVEWjNznH6SHdzWrubhWBwvtLI=
X-Google-Smtp-Source: ABdhPJx/gRIBrTQnpFE1VHpjdwnBGu8+e/VhtVpZZ2TuD6olG8j7cNz9xX9qs4/WDfInJRwBHK6C9Oj9CAXhP8HV2tA=
X-Received: by 2002:a25:c985:: with SMTP id z127mr40936036ybf.20.1618248719729; 
 Mon, 12 Apr 2021 10:31:59 -0700 (PDT)
MIME-Version: 1.0
References: <CALaUSusmdvz2XAT6c24023dZroTwVPKr0k7S+y6YVAXW1-ubJw@mail.gmail.com>
 <CAHmME9qYHttPgwranGbUS4ijQOde96Je-f2VAM94LMvsNqSfVw@mail.gmail.com>
 <CALaUSutUZSCEdLjkire-cJAymWU34r57yB=rJvYoUO+AdxF9wQ@mail.gmail.com>
 <CAHmME9rPV3r9iTBR97e-5D97ffUqqt_30PXkszBssAuO2azNmg@mail.gmail.com>
 <CAHmME9o_yJkAtoVQ58WBYDJwuD2Q3QntaYaGpOA63VFG8CO9fA@mail.gmail.com>
 <3e55e6c9-6446-3e8f-20bd-87986ad5f4ac@gmail.com>
In-Reply-To: <3e55e6c9-6446-3e8f-20bd-87986ad5f4ac@gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 12 Apr 2021 11:31:48 -0600
X-Gmail-Original-Message-ID: <CAHmME9qUXd1iFAbrMfEedaF9C300Tz8e_-B72=hBvEGrmd7cNg@mail.gmail.com>
Message-ID: <CAHmME9qUXd1iFAbrMfEedaF9C300Tz8e_-B72=hBvEGrmd7cNg@mail.gmail.com>
Subject: Re: WireGuard for Windows crash "panic: ring is full" since release
 of 0.3.10
To: Peter Whisker <peter.whisker@gmail.com>
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

Hi Peter,

Please let me know if updating to 0.3.11 fixes the issue.

Jason
