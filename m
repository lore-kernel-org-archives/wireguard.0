Return-Path: <SRS0=5+V/=5V=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F6E5C2BA80
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  5 Apr 2020 21:47:17 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E62E620659
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  5 Apr 2020 21:47:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DHBpB7HI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E62E620659
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f6c951f9;
	Sun, 5 Apr 2020 21:38:19 +0000 (UTC)
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [2a00:1450:4864:20::52a])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id afca105e
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 29 Mar 2020 08:03:03 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id z65so17115841ede.0
 for <wireguard@lists.zx2c4.com>; Sun, 29 Mar 2020 01:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=4m2Q4pJ3w8zyPfNElLe04AaECaUs0H1nExx8gqqsljY=;
 b=DHBpB7HIOwv3NyB7694XBAYqITWN24q8vcelJV1UQTkY4WYxujErlLrBvYIZybDR8F
 Xp+xwM7JtZbhlcS8T0D/I9QPXGAb0aQYJ8okC2UKzEM1LRX8urCdXfwv749ve7lT7DKS
 BpG68kLAPCjh6IWVH1h+iRAjh5DS/PLl0GILLFJhVD5BM/5d0oSR9trj9a9TzkmELuze
 GLa6uPvyQpe6dZXVzqqiSQqlXcrFMHwMoe1PiSsLctrw6wbnZOXccYJVn2cuw8SkpWpI
 K32ALF0a6mlwTpWwigk2Anvx7WFn55DkM+Xqjnx7b32yw/Cxj/s9rum9U32ITuBK2eGO
 NLgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=4m2Q4pJ3w8zyPfNElLe04AaECaUs0H1nExx8gqqsljY=;
 b=sJDlRNq8JQX1E1ZuWy3JFT0W1HINLDUzFIe9zh5ylh6AnPnqLXpxQV4BENos8uajzv
 0kdHpdCYDvWfqIWEd2MnY5mJ0ILRsq3S1qcibs32bf2NYKgpmh6IQdoHMGl0VeNOQ+h5
 Kc1WbHyT2xCHw1lIbsGeS1nKOmtr5UNXHawXg9vcXzOMLvsLEn1T3lYGnMhMygt6hoga
 TFG1csWhbgLrvRfO4QAQQNzKk9+4CD7tNM8f47GPAOrQq2VojU5mM7jw2rmmtepstGpT
 hfEEejMUQ3q3NGG2X9PPVYQ0Im4pXXuAYiOMxjQScM2m46QzraIpcYhZL53GKAFqUGkc
 XPNA==
X-Gm-Message-State: ANhLgQ0JS08zGjuwoMz6mvo506UK3yBzBRCgXNcgw1wcUhGA1oiLFr64
 RVsNny7e6wGUCuFNwypVRjLxMS6S0tc7BvJdC85J/zW/
X-Google-Smtp-Source: ADFU+vtV+yk9N0H10m8klnWHtTBggusGDLC6mOjun3W4YQ46GGxZME/lWXRspgThy0DYIAusxw+KyCLu4rpoV4WA63o=
X-Received: by 2002:aa7:ce8e:: with SMTP id y14mr6427567edv.30.1585469447010; 
 Sun, 29 Mar 2020 01:10:47 -0700 (PDT)
MIME-Version: 1.0
From: _ _ <zero3point13@gmail.com>
Date: Sun, 29 Mar 2020 01:10:42 -0700
Message-ID: <CAOw14A4qMADyVWHPCFX6fysiig7QuHOSnKNCQWWtBJdDc3DpRA@mail.gmail.com>
Subject: Want to help, where to start
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Sun, 05 Apr 2020 23:38:13 +0200
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

Just joined, engineer interested particularly in Go version, how can I
help coding, where to start. Can do anything else as well

I see this https://git.zx2c4.com/wireguard-go but would welcome some
pointers on open bugs and a way to contribute

Thank you !
