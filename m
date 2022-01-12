Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19574C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 12 Jan 2022 15:43:55 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 60207258;
	Wed, 12 Jan 2022 15:43:54 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 9456ce2d
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 12 Jan 2022 15:43:51 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 333016197C
 for <wireguard@lists.zx2c4.com>; Wed, 12 Jan 2022 15:43:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 547EBC36AEB
 for <wireguard@lists.zx2c4.com>; Wed, 12 Jan 2022 15:43:49 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="mfDUQQ1V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1642002227;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0vAKDZlg9/klNtvs7g86KFoTFRQ/16ab7sAV0KF90hQ=;
 b=mfDUQQ1VnNh1b3g5wRAm7Z3jQYBLHvfvBGvwgpRouBAm7IDk18FZf5Kdzu+BB2lXkiLAIM
 Tt4fdJlGUhG/wQbTjdslCVmCeflHSrw6IeTTfQqEGe1Hq1/Om6gCSpkDI5D0DqHUHqXPPL
 houIdiRwxrejptpPQckE3InRDvA504c=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 2a9c76fd
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 12 Jan 2022 15:43:47 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id d7so7536927ybo.5
 for <wireguard@lists.zx2c4.com>; Wed, 12 Jan 2022 07:43:47 -0800 (PST)
X-Gm-Message-State: AOAM5339AlxDt3k0RRmnZPF2gp1DsgXQmaFjn81t1rQsqh7ucEBrhJgy
 YG8nxHDXejj9frXE05Tq5kXj8B7s6lf4YcHGCmg=
X-Google-Smtp-Source: ABdhPJzoJDHlJogx6Uqe87qu4cwCnwSUHr9Nf90gL+Z1svdXDeRXNt+ZR0Ya/YICugBRXT6QN8jcuhMiFMpI6/vnBT0=
X-Received: by 2002:a25:ae8d:: with SMTP id b13mr328061ybj.255.1642002226567; 
 Wed, 12 Jan 2022 07:43:46 -0800 (PST)
MIME-Version: 1.0
References: <CABBZOsm1hzRqQ65izwk23S4rQrVCYBkwL73yi3LT5BdvNVbeeg@mail.gmail.com>
In-Reply-To: <CABBZOsm1hzRqQ65izwk23S4rQrVCYBkwL73yi3LT5BdvNVbeeg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 12 Jan 2022 16:43:35 +0100
X-Gmail-Original-Message-ID: <CAHmME9rtqmcjKnaR6fCC4Wtj7gkzBF+LJ8AWDsT3cweuZSkHLQ@mail.gmail.com>
Message-ID: <CAHmME9rtqmcjKnaR6fCC4Wtj7gkzBF+LJ8AWDsT3cweuZSkHLQ@mail.gmail.com>
Subject: Re: Enable BitCode on libwg-go.a (Wireguard iOS project)
To: Houman <houmie@gmail.com>
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

Looks like gomobile fixed it via:

https://github.com/golang/mobile/commit/ddd6497b067577b19dddcb2b88017887a0227eb5

We should probably do the same.
