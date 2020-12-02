Return-Path: <SRS0=K6Kf=FG=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5EA2C64E7C
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  2 Dec 2020 13:46:49 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 11E23208FE
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  2 Dec 2020 13:46:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 11E23208FE
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 88dcd43c;
	Wed, 2 Dec 2020 13:39:27 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 9f7ed431
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 2 Dec 2020 13:39:25 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ca89e1a5
 for <wireguard@lists.zx2c4.com>; Wed, 2 Dec 2020 13:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=ilDaPaWWi4gPOPri172+p6uycgA=; b=IQpAEp
 VvvRu0dsrcT8Nj6BuLM4kA8rN3cj1XZhdk1hEUn0jSOzTpkL2ctp6F4bCj9gCtky
 CUhvxFXyipTr0AzY7sOwBOW1DG+sN32vDXOICJh1PvEzHewLYDBxfrH6k8YO7A/U
 DsYLmoxSttIk9N1Z1WGD7PWN4R5yLUfxmPugdxS7o+jInJDkrnyQACXw100WVDU0
 qJaGv8LvP3daER5m2XMhv9ihCHlHe9peuoj82dWAEOuXCwYz6gOLJFEdOK7PFA/F
 mjG57Lph56QTvo0MwogjCG/4TBVOooH8/hKUTq0kz+OMz0fsCrtR4e0xFf9m8mr0
 Sgc/MJts+Qu3M8tg==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a99f0233
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 2 Dec 2020 13:40:11 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id o71so1658519ybc.2
 for <wireguard@lists.zx2c4.com>; Wed, 02 Dec 2020 05:45:59 -0800 (PST)
X-Gm-Message-State: AOAM530rgEkP59F9oVtmePDQR89blONSPy0eivbIWTiNvRZgqEsHEaQ9
 56dHLnTnNLLnwHa+ZR6Jd4R/xvtWQWG+BSx+xfY=
X-Google-Smtp-Source: ABdhPJzMA7KI1fzD5ahnrhZ5MPgS5mWHOcVO1hsnHu7zOCFL3VDY5NEPCTVqFGbKVnnykzl2ZH+9rmi8lkuXnW4Yd+8=
X-Received: by 2002:a25:2054:: with SMTP id g81mr3115981ybg.178.1606916758891; 
 Wed, 02 Dec 2020 05:45:58 -0800 (PST)
MIME-Version: 1.0
References: <CAMy1ncKmBmWcnsyD0Mg9SGGMpYsHpbH+nGTMtx4Kkx0kF4V_VQ@mail.gmail.com>
In-Reply-To: <CAMy1ncKmBmWcnsyD0Mg9SGGMpYsHpbH+nGTMtx4Kkx0kF4V_VQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 2 Dec 2020 14:45:48 +0100
X-Gmail-Original-Message-ID: <CAHmME9rqKvkJn_=DJrvTOQhp8Q1pQobYBHivYXDerawF5UFdjg@mail.gmail.com>
Message-ID: <CAHmME9rqKvkJn_=DJrvTOQhp8Q1pQobYBHivYXDerawF5UFdjg@mail.gmail.com>
Subject: Re: [PATCH] Use localtime in inf2cat
To: Stefan Rinkes <stefan.rinkes@gmail.com>
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

Hi Stefan,

Thanks for the patch. So this is why I couldn't build the driver
between midnight and 2am here in France. :) Actually, I'd seen
something about this on an old Microsoft blog, and had just forgotten
whether there was a good solution. I'm glad you found it and sent this
patch.

I can't apply this patch as-is because it's missing your Signed-off-by
line. So you'll need to resubmit if you'd like it to be committed with
your authorship. Otherwise I'll fall back to a Reported-by: line.

Jason
