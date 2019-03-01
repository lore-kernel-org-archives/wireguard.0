Return-Path: <SRS0=/nf9=RE=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD9FBC43381
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  1 Mar 2019 19:54:44 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D704F20857
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  1 Mar 2019 19:54:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="nHtCbP1j"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D704F20857
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 6c1ffe25;
	Fri, 1 Mar 2019 19:44:50 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 03c62c71
 for <wireguard@lists.zx2c4.com>; Fri, 1 Mar 2019 19:44:47 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 72fd05e8
 for <wireguard@lists.zx2c4.com>; Fri, 1 Mar 2019 19:44:47 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 45eba146
 for <wireguard@lists.zx2c4.com>; Fri, 1 Mar 2019 19:35:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=QnMS6bg32P0pnq29upDsAvg5IhU=; b=nHtCbP
 1ji1/FpKLITsyKu28ijVasluZVSx2b22jcKnIKDsUB4I+b3kCsEdVHy51qn7CAgR
 /+ZZFERZTijva/lgY95sN8nL7GSauT5QpM9xGEyFcVHYSaT/ypxMMP+or7wL+QJW
 07CcEujekJT6Dz2S/BQqy421U5yglwJvq4s8C7NOSkJWonqhx7bjDZwLMjq7BxUk
 QapqL/JLxUimEDWXiNKJtdpjDVv1TEREVgZTD2hcrdF4xyKlgArzKDQzSSreT2/I
 /iMb/8l/MkXhMBditfjgIV/zBxP2L6uvAANkv1wTb2Q05ZNXt+tWTfAEGfIRmmQw
 r818jUtSGBvUz91w==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c2757735
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 1 Mar 2019 19:35:32 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id n71so22026309ota.10
 for <wireguard@lists.zx2c4.com>; Fri, 01 Mar 2019 11:54:38 -0800 (PST)
X-Gm-Message-State: APjAAAWFyNxADZl3HdW2ALt+nUDQ21K6a4+7H4rgs0raTwFREigbM7LK
 w0tW+9igv36601UaOsk9wgL0w+2osaRemGGoQvg=
X-Google-Smtp-Source: APXvYqw0ybgFyT/a66x/xfHLKLCdYvwXqGa6d16LUIs5LL0Md9uCdLgt8QhLMSoepJ36kCSdu5MSshprUG2HH3cThpM=
X-Received: by 2002:a9d:7404:: with SMTP id n4mr4645684otk.54.1551470077800;
 Fri, 01 Mar 2019 11:54:37 -0800 (PST)
MIME-Version: 1.0
References: <20190228190512.6209-1-kallisti5@unixzen.com>
In-Reply-To: <20190228190512.6209-1-kallisti5@unixzen.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 1 Mar 2019 20:54:26 +0100
X-Gmail-Original-Message-ID: <CAHmME9rQ-cKSV8o-sg3fJU4Uu6r5daC=Hx4mC-4OKGA8Z8hg7w@mail.gmail.com>
Message-ID: <CAHmME9rQ-cKSV8o-sg3fJU4Uu6r5daC=Hx4mC-4OKGA8Z8hg7w@mail.gmail.com>
Subject: Re: [PATCH 1/2] build/tools: Add support for Haiku
To: Alexander von Gluck IV <kallisti5@unixzen.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

May I apply this with your signed-off-by line?

Namely:

Signed-off-by: Alexander von Gluck IV <kallisti5@unixzen.com>
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
