Return-Path: <SRS0=FF2+=JG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F113CC433ED
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  9 Apr 2021 22:47:36 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 236AE611AE
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  9 Apr 2021 22:47:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 236AE611AE
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7c981ca4;
	Fri, 9 Apr 2021 22:47:34 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a3b6e6ad
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 9 Apr 2021 22:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1618008448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=to1EDF3mav41LE3fBGHRFD8ZTc/Dq5KIUat4PbQamtI=;
 b=H3A5NnvMCNZUS4OAkcc/l58xdIQgqdXYlDXliBtJtZEL5KRbhHCqulRdFLApnMcAPqn12N
 sKR6H8bJZJEL55QfIQbECTvx8UvSc8mukeEdOxb9i+tIKAqqopQV26MGaoqzRWBw7AR0ml
 am44HLwIDAEg/hAZ2Z8eKwg1GN/GKpg=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 5e05208c
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 9 Apr 2021 22:47:27 +0000 (UTC)
Received: by mail-yb1-f177.google.com with SMTP id y2so6172256ybq.13
 for <wireguard@lists.zx2c4.com>; Fri, 09 Apr 2021 15:47:27 -0700 (PDT)
X-Gm-Message-State: AOAM531QtI8T4qdQJ8IvIVZZNnheMVr3xC6NCOyeS2ZkyE0xmYn/Ppbq
 YMb+iJGiNTrH7YhTM+O352GG+VqEJ8FVzv7uPn4=
X-Google-Smtp-Source: ABdhPJyU4qs44j2SwHCmM9DAgpQb+yB2YqZmgEdyIdAYw78AEdpg0ZhtipVu3CdNuc4aIFydYdR/dcB6zzz7nC7wCEQ=
X-Received: by 2002:a25:c985:: with SMTP id z127mr23256616ybf.20.1618008447344; 
 Fri, 09 Apr 2021 15:47:27 -0700 (PDT)
MIME-Version: 1.0
References: <CALaUSusmdvz2XAT6c24023dZroTwVPKr0k7S+y6YVAXW1-ubJw@mail.gmail.com>
 <CAHmME9qYHttPgwranGbUS4ijQOde96Je-f2VAM94LMvsNqSfVw@mail.gmail.com>
 <CALaUSutUZSCEdLjkire-cJAymWU34r57yB=rJvYoUO+AdxF9wQ@mail.gmail.com>
 <CAHmME9rPV3r9iTBR97e-5D97ffUqqt_30PXkszBssAuO2azNmg@mail.gmail.com>
In-Reply-To: <CAHmME9rPV3r9iTBR97e-5D97ffUqqt_30PXkszBssAuO2azNmg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 9 Apr 2021 16:47:16 -0600
X-Gmail-Original-Message-ID: <CAHmME9o_yJkAtoVQ58WBYDJwuD2Q3QntaYaGpOA63VFG8CO9fA@mail.gmail.com>
Message-ID: <CAHmME9o_yJkAtoVQ58WBYDJwuD2Q3QntaYaGpOA63VFG8CO9fA@mail.gmail.com>
Subject: Re: WireGuard for Windows "cq is corrupt" panic in rio_windows.go
 after insufficient buffer space
To: Joshua Sjoding <joshua.sjoding@scjalliance.com>
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

The fix has been released in 0.3.10.

Jason
