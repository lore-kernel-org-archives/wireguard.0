Return-Path: <SRS0=gJ+C=HM=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50672C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 10 Feb 2021 14:43:34 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38A1964D87
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 10 Feb 2021 14:43:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 38A1964D87
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cbbd4905;
	Wed, 10 Feb 2021 14:43:30 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 7bbb22b6
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 10 Feb 2021 14:43:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1612968204;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=eSLTpwwsVwgWsPcJFnQQegMGHH75BCj9IxvJWfQd4o0=;
 b=fUAKEpvmE8qoro+EJU/3W3Jvl+ZKbpxjcfQgk9zYRfoysYbvUfTDP3M653SRz2f7WdBVnS
 sS7G+iLVFHke/RYkXmSMDT/sJ+btxKQZR/d7yPRtQDV9398WgknDHiQa/d4KizO0K3S3mh
 4t1PK57QXbtNLBZ+WFpN+r9HYHixxkA=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 65b73e5f
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 10 Feb 2021 14:43:24 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id y128so2204897ybf.10
 for <wireguard@lists.zx2c4.com>; Wed, 10 Feb 2021 06:43:24 -0800 (PST)
X-Gm-Message-State: AOAM533q02d7gr65SRDVrG8YiVm6BBYoCkDv0NbbHPJ5swUHlYshubZQ
 WSL69ngCDTy9gXvJUM1L/dk6rjPgTu0n5t2P6nU=
X-Google-Smtp-Source: ABdhPJx41XgivqxyecV81XzUiOU+3TBDp0dYXwEFW8f6cXUoOc1z3pwFnl0Gwlyn5vksFNCxTv2JrKQUAYs4SokCb90=
X-Received: by 2002:a25:3387:: with SMTP id z129mr4970293ybz.239.1612968204192; 
 Wed, 10 Feb 2021 06:43:24 -0800 (PST)
MIME-Version: 1.0
References: <6c752624-1195-ec77-c16a-9fd438cb11ae@blackberry.com>
In-Reply-To: <6c752624-1195-ec77-c16a-9fd438cb11ae@blackberry.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 10 Feb 2021 15:43:13 +0100
X-Gmail-Original-Message-ID: <CAHmME9o97YiTK6rjOmfE3G5BPaBzM_bdfiOBEGoBHbrDRzf9uA@mail.gmail.com>
Message-ID: <CAHmME9o97YiTK6rjOmfE3G5BPaBzM_bdfiOBEGoBHbrDRzf9uA@mail.gmail.com>
Subject: Re: [Wintun] DEPENDENTLOADFLAG for wintun.dll?
To: Brad Spencer <bspencer@blackberry.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Stefan Kanthak <stefan.kanthak@nexgo.de>
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

Hi Brad,

On Wed, Feb 10, 2021 at 3:04 PM Brad Spencer <bspencer@blackberry.com> wrote:
>
> Would it make sense to link the official wintun.dll with the MSVC
> linker's -DEPENDENTLOADFLAG:0x800 option?
>
> https://docs.microsoft.com/en-us/cpp/build/reference/dependentloadflag
>
> Doing so restricts the search path for immediate dependencies to the
> %windows%\system32\ directory, and I think all of the DLLs Wintun needs
> are there.

That flag is a bit of a can of worms, which I haven't been too
inclined to open. See:
https://skanthak.homepage.t-online.de/snafu.html

Instead, wintun.dll uses delay loading for all DLLs except for
kernel32.dll and ntdll.dll, and then forces the delay loader hook
through LoadLibraryEx. See:
https://git.zx2c4.com/wintun/tree/api/entry.c#n25 You can see this in
action by putting wintun.dll into depends:
https://data.zx2c4.com/depends-for-wintun-dll-feb-2021.png

(CCing Stefan, in case he's curious. The DLLs in question are
https://www.wintun.net/builds/wintun-0.10.1.zip )

Jason
