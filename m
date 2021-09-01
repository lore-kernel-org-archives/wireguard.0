Return-Path: <SRS0=ArOK=NX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 070C1C432BE
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  1 Sep 2021 13:50:11 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B7386101A
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  1 Sep 2021 13:50:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2B7386101A
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5731dbb8;
	Wed, 1 Sep 2021 13:46:36 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id e53671ea
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 1 Sep 2021 13:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1630503988;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=oEJ7+xDrfegvHPd4H20eNZprosFZd2jsqVEjo8Jcnxw=;
 b=SGQQH3JoawGmnDpJaGDzks0mY5k1M8wQpgw/7cX+ROHj7mozjqffOYC6xWJsRQnpWX7BZg
 GMJrdMiin97makl/RLVMA2PZmqAKKl/lWA8e49L3G0hMH0wM212CK2/UQG+dvCVFvJIf9e
 yt3B15i4X9C+FZ6oC+oSQr1bZZrAmcs=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 52bdcefa
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 1 Sep 2021 13:46:28 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id e131so5192425ybb.7
 for <wireguard@lists.zx2c4.com>; Wed, 01 Sep 2021 06:46:27 -0700 (PDT)
X-Gm-Message-State: AOAM5326OvNzHv71XlByCP8hmspgQlf2L650oUloCOJrFu+gqPkLAhls
 qS47lYf61d8yZ+zRFX+Vlj/GpUTSL/Bb9aXfZ0E=
X-Google-Smtp-Source: ABdhPJwCJ3tyALmcXHVYLaH4zERaZiv00OI4bgNOKTp76A4CtFuSANq5jEv5HqsEZEgVmgxOCHnx97wU3xfV52xZ2Jw=
X-Received: by 2002:a25:4589:: with SMTP id s131mr1779731yba.279.1630503985074; 
 Wed, 01 Sep 2021 06:46:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210818060533.3569517-1-keescook@chromium.org>
 <20210818060533.3569517-8-keescook@chromium.org>
In-Reply-To: <20210818060533.3569517-8-keescook@chromium.org>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 1 Sep 2021 15:46:14 +0200
X-Gmail-Original-Message-ID: <CAHmME9pmXsfgiavSrv6+Eh8C0qrfuYRoQoLvT5EQZz4OdZj=Ww@mail.gmail.com>
Message-ID: <CAHmME9pmXsfgiavSrv6+Eh8C0qrfuYRoQoLvT5EQZz4OdZj=Ww@mail.gmail.com>
Subject: Re: [PATCH v2 07/63] skbuff: Switch structure bounds to struct_group()
To: Kees Cook <keescook@chromium.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
 "David S. Miller" <davem@davemloft.net>, 
 Jakub Kicinski <kuba@kernel.org>, Jonathan Lemon <jonathan.lemon@gmail.com>, 
 Alexander Lobakin <alobakin@pm.me>, Jakub Sitnicki <jakub@cloudflare.com>,
 Marco Elver <elver@google.com>, Willem de Bruijn <willemb@google.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>, 
 Netdev <netdev@vger.kernel.org>,
 "Gustavo A . R . Silva" <gustavoars@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>, 
 linux-wireless <linux-wireless@vger.kernel.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>, linux-staging@lists.linux.dev, 
 linux-block@vger.kernel.org, 
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
 clang-built-linux <clang-built-linux@googlegroups.com>, 
 Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-hardening@vger.kernel.org
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

For the drivers/net/wireguard part,

Reviewed-by: Jason A. Donenfeld <Jason@zx2c4.com>
