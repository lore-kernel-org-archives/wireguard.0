Return-Path: <SRS0=+Ywq=PB=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B718C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 13 Oct 2021 00:19:58 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B80160724
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 13 Oct 2021 00:19:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7B80160724
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a3645431;
	Wed, 13 Oct 2021 00:13:34 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b123158c
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Oct 2021 00:13:32 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id B80F7604DA
 for <wireguard@lists.zx2c4.com>; Wed, 13 Oct 2021 00:13:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="P/enJ430"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1634084009;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uwFWFLNvxJhniqmknouH/9WYU6RbuOWIp15gvlHbcpU=;
 b=P/enJ430Xz8rb3BaVJI6WLGskKU8pTaokB86HEKefTuxJcgh0TpqkoxOp81JmP0TbHV9se
 7082W8iOG4JkxcMBcka9ja+4g+lyWj088hjn668Pggu1iu0aezqcBd/5BflL0XQVzVAGRh
 2RMEedFAwbuS5cWhTW5xzShx4ISHB7w=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e5efae1e
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 13 Oct 2021 00:13:29 +0000 (UTC)
Received: by mail-yb1-f175.google.com with SMTP id s4so2196864ybs.8
 for <wireguard@lists.zx2c4.com>; Tue, 12 Oct 2021 17:13:28 -0700 (PDT)
X-Gm-Message-State: AOAM533dzIae3x9XwbuXSzmKDVA8B3/ncxkvHsNLwu4B80NjIncone/P
 cLH0AyiEPwQVs592+l3acI9APVVv2wDiqvqyty4=
X-Google-Smtp-Source: ABdhPJyaiz0hWUCAzrz+xwE4UzgMZURWa8BZiG7TQCE8KCzOQgblBC4kCxI3GVA49Iee/NGQezfmKExQHUvFBlf9CHU=
X-Received: by 2002:a25:854c:: with SMTP id f12mr30376446ybn.95.1634084007865; 
 Tue, 12 Oct 2021 17:13:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7110:61c1:b0:fa:e5:57f7 with HTTP; Tue, 12 Oct 2021
 17:13:27 -0700 (PDT)
In-Reply-To: <CABGW2bUxOaOBuChZTS4w7+3OX0WNvypjYc-+cSNgQO-zWQHaFw@mail.gmail.com>
References: <CABGW2bUxOaOBuChZTS4w7+3OX0WNvypjYc-+cSNgQO-zWQHaFw@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 12 Oct 2021 18:13:27 -0600
X-Gmail-Original-Message-ID: <CAHmME9rd7uKcbKY0dXKLOPKVdxqrULOOCMvtjgFiaXK1ki1KHA@mail.gmail.com>
Message-ID: <CAHmME9rd7uKcbKY0dXKLOPKVdxqrULOOCMvtjgFiaXK1ki1KHA@mail.gmail.com>
Subject: Re: Wintun.dll (amd64) GetProcAddress failure
To: Scott Bonar <sbonar@gmail.com>
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

If you're using the just-releases Wintun 0.14, make sure you're using
the wintun.h from that release, alongside the InitializeWintun
function from example.c.
