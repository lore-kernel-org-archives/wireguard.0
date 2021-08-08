Return-Path: <SRS0=UgTS=M7=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C11B3C4338F
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  8 Aug 2021 20:25:09 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C996160BD3
	for <zx2c4-wireguard@archiver.kernel.org>; Sun,  8 Aug 2021 20:25:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C996160BD3
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ea1b29dd;
	Sun, 8 Aug 2021 20:23:01 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 93ed846a
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 8 Aug 2021 20:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1628454176;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=hwMXHfWfY1HwtKLFV1C9p+LNgMMZXcsO9o0YDBO5lpY=;
 b=A0sw1zzmJnofdfzUawTVUJ/IciosRPm+uLSnUwvRtxnt3LLTFNSDU3h+vGfe5Ndi/FowLf
 LjS9JXZosImxK0b2413SmCNhwokBiJNYwudSG+/oplPjozb+FLIT20ujRPfGod4q0ap87N
 uNReM6HlnDnqYV9jeL/fJoBYqMuXSu4=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f68bfc4c
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sun, 8 Aug 2021 20:22:56 +0000 (UTC)
Received: by mail-yb1-f176.google.com with SMTP id k65so25590814yba.13
 for <wireguard@lists.zx2c4.com>; Sun, 08 Aug 2021 13:22:55 -0700 (PDT)
X-Gm-Message-State: AOAM533uLBNV8lml4EmkyxTU+tWBYyxOMRn0xtMrieNs5LE8yF60wpxC
 5R33un+HH7mEkBPUCkVZfBHz9yP9TDxcWEVXD6Q=
X-Google-Smtp-Source: ABdhPJwAQlzVFpIsrq+ZqLHe2FFAW/bpSKn/srqbL9Rcr2xkwEBPFudnUGdpUeYlE2UfYEgtmwNjOzQmNPZpBk7bZwo=
X-Received: by 2002:a25:8445:: with SMTP id r5mr28369650ybm.20.1628454173366; 
 Sun, 08 Aug 2021 13:22:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210711223148.5250-1-rdunlap@infradead.org>
 <20210711223148.5250-7-rdunlap@infradead.org>
In-Reply-To: <20210711223148.5250-7-rdunlap@infradead.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 8 Aug 2021 22:22:42 +0200
X-Gmail-Original-Message-ID: <CAHmME9pqLEmNKu1gZDsvTbukzqv8O2kCp6ndQROTu9RzcPnrVA@mail.gmail.com>
Message-ID: <CAHmME9pqLEmNKu1gZDsvTbukzqv8O2kCp6ndQROTu9RzcPnrVA@mail.gmail.com>
Subject: Re: [PATCH 6/6 v2] wireguard: main: rename 'mod_init' & 'mod_exit'
 functions to be module-specific
To: Randy Dunlap <rdunlap@infradead.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Russell King <linux@armlinux.org.uk>, 
 linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
 Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andres Salomon <dilinger@queued.net>, 
 linux-geode@lists.infradead.org, Matt Mackall <mpm@selenic.com>, 
 Herbert Xu <herbert@gondor.apana.org.au>, 
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, 
 Christian Gromm <christian.gromm@microchip.com>,
 Krzysztof Halasa <khc@pm.waw.pl>, 
 Netdev <netdev@vger.kernel.org>, "David S. Miller" <davem@davemloft.net>, 
 Jakub Kicinski <kuba@kernel.org>, Martin Schiller <ms@dev.tdt.de>,
 linux-x25@vger.kernel.org, 
 WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Hi Randy,

Thanks, I've applied this to the wireguard stable tree, and it'll be
sent off to netdev during the next push there.

Regards,
Jason
