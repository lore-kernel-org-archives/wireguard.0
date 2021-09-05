Return-Path: <SRS0=TPXl=N3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_20,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADF2FC433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  5 Sep 2021 13:22:56 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D879B60F45
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  5 Sep 2021 13:22:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D879B60F45
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 04c1d469;
	Sun, 5 Sep 2021 13:22:54 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 0339ff61
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 5 Sep 2021 13:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1630848169;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RrbBs19yyt0H04uHUHzZm9gSQepLSkyO+DiMOHSlpZk=;
 b=m9GUVTzQWH0UEn4etGVCLdJUxmHWsTA+lhgI8cN8mxRLhHtFATVhJlOvPRN/0bPDSTUhc1
 BzIcLwQDhbLoR4k2BjD50dHBXUJOjye76cvDPtayMvPDJK1RpXteVbsp17GJEvFHOBJwt3
 pDhErossEHQzAf1G5dk8Q8FXoor634c=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3a0f2214
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 5 Sep 2021 13:22:49 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id e133so8102068ybh.0
 for <wireguard@lists.zx2c4.com>; Sun, 05 Sep 2021 06:22:49 -0700 (PDT)
X-Gm-Message-State: AOAM531KV2KcrH9hCjcYDwVFmtVjBizvHdZhHnO6+hwxVvam2xBVB1Bm
 zshL+FQb/ZDsfiwMj5bS1ndwyKstHChtnpgwxTE=
X-Google-Smtp-Source: ABdhPJw9zG3T9Szoh/+msAitvBg0UU/QU0iYteRFGhyTBA+4tms3iW1rsSlNwSAu3LaBt5f6RHlD6FLqVT4KWFWu0lI=
X-Received: by 2002:a25:d2c8:: with SMTP id
 j191mr10440087ybg.412.1630848168485; 
 Sun, 05 Sep 2021 06:22:48 -0700 (PDT)
MIME-Version: 1.0
References: <CAC6DygdBVsk2Sa3LFLLs5WdOUUOi1Vs0+v6gXV7d+h-noy8v1A@mail.gmail.com>
In-Reply-To: <CAC6DygdBVsk2Sa3LFLLs5WdOUUOi1Vs0+v6gXV7d+h-noy8v1A@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 5 Sep 2021 15:22:36 +0200
X-Gmail-Original-Message-ID: <CAHmME9qH9T3O04YG+DMdq79BgkUBxSTzHfgfL5m0CaymvGJ3LQ@mail.gmail.com>
Message-ID: <CAHmME9qH9T3O04YG+DMdq79BgkUBxSTzHfgfL5m0CaymvGJ3LQ@mail.gmail.com>
Subject: Re: Unable to load wintun library for Windows
To: Veerabhushan Hatte <vkhatte@gmail.com>
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

Copy it to "C:\Program Files\Something" and execute your exe from
there too. Never copy files into C:\windows\system32.
