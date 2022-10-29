Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78A3CC38A02
	for <zx2c4-wireguard@archiver.kernel.org>; Sat, 29 Oct 2022 01:56:48 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 6e1ce26b;
	Sat, 29 Oct 2022 01:52:45 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 96c764c3
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 29 Oct 2022 01:52:43 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C617862B45
 for <wireguard@lists.zx2c4.com>; Sat, 29 Oct 2022 01:52:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0B77C433C1
 for <wireguard@lists.zx2c4.com>; Sat, 29 Oct 2022 01:52:40 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="N6ZUtLMp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1667008358;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WU+J+UXTFpLG11siToNSUwJ8DNfezAQk2RcPmcREPG4=;
 b=N6ZUtLMpdxUZoIkX25CiY7nW3I6ms9K7VoVsv5Os/Mr9byojliFQW0rO7EBOCHc2R27hBb
 DYQwH7LHjaIe0KVFnPDx1ZNcU63rTYvA3HW+URibNF+ytMl8yRZfcCwv5ojR+3nhjCJqZ7
 bz9ROUJad+OG/bPJEKFbaGymReDf3IE=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e22c1a14
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sat, 29 Oct 2022 01:52:38 +0000 (UTC)
Received: by mail-vs1-f45.google.com with SMTP id z189so6078058vsb.4
 for <wireguard@lists.zx2c4.com>; Fri, 28 Oct 2022 18:52:38 -0700 (PDT)
X-Gm-Message-State: ACrzQf2FkWQaAUdyiv3VGtRE5yOCnZAvVe8eKfsx5U19zkp364JwGlUV
 8FmHNcnlJJ7oBXKhQieDHsx8Gn8gl0KDBbMBcns=
X-Google-Smtp-Source: AMsMyM78whTb22llkW8V9xrwPNnxpaJpon2LNncqLjr9+HdKCo3IXbXxOleZYeO6DbkyARXA4du+puVWsj9pJGwZLQ8=
X-Received: by 2002:a67:c297:0:b0:3aa:3cac:97b6 with SMTP id
 k23-20020a67c297000000b003aa3cac97b6mr921187vsj.76.1667008357461; Fri, 28 Oct
 2022 18:52:37 -0700 (PDT)
MIME-Version: 1.0
References: <20221029014505.2679-1-kevans@FreeBSD.org>
In-Reply-To: <20221029014505.2679-1-kevans@FreeBSD.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sat, 29 Oct 2022 03:52:26 +0200
X-Gmail-Original-Message-ID: <CAHmME9ohp+_kFsPrP2hJBFY32yK65Sv-Q9Jo_P99sy0-Do2W8g@mail.gmail.com>
Message-ID: <CAHmME9ohp+_kFsPrP2hJBFY32yK65Sv-Q9Jo_P99sy0-Do2W8g@mail.gmail.com>
Subject: Re: [PATCH] wg: freebsd: move if_wg path to reflect new in-tree
 location
To: kevans@freebsd.org
Cc: wireguard@lists.zx2c4.com
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

https://git.zx2c4.com/wireguard-tools/commit/?id=7b2ae7aa2f52fbac65874a641cbfbb0182d0ba46

Applied, thanks!

(Very excited about all this...)

Jason
