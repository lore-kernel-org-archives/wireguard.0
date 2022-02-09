Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9813C433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  9 Feb 2022 11:09:22 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 88de5f66;
	Wed, 9 Feb 2022 11:02:40 +0000 (UTC)
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [2604:1380:4641:c500::1])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id b2da801c
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 9 Feb 2022 11:02:34 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id D92CD60EB6
 for <wireguard@lists.zx2c4.com>; Wed,  9 Feb 2022 11:02:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E578C340E7
 for <wireguard@lists.zx2c4.com>; Wed,  9 Feb 2022 11:02:32 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="B1P04lvy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1644404551;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=lHuXjtnGIwA8Zzr3bT7RPQh03xIe4TvMRJ0gk9Qtcas=;
 b=B1P04lvyyaGTMjHiL98EU7FTDV4vYbUyuojPOW0HgjvyiUaKISjfPdEn0gyaciw3QPZkZ1
 O5F8lHYO7HCm4XBgEbC0Y1ulyMLcpE7UTb7zGjh9TNj5D6gK9DcOkJxwdlLxpZyPlmJ38+
 eDCuMZJwy7bkWaSKWKhoD7/sDjW9g94=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 4956d79f
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 9 Feb 2022 11:02:31 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id y6so4792901ybc.5
 for <wireguard@lists.zx2c4.com>; Wed, 09 Feb 2022 03:02:30 -0800 (PST)
X-Gm-Message-State: AOAM533sXVLG3ABb3+qy4SGw6SjO9VZwt81nidwPeTdKUgFP1DFTLlQo
 2l5QhrdE4BPKR3/DLPSgOYYrXR1TeIig13WVhRU=
X-Google-Smtp-Source: ABdhPJzo8jtiSDe/lLhW1RxSNF+W9nw0ucLLlveEkkYCISbMD6svwYya2m05Ei/xqG8Sie/ixkyNTBIJYLGCohj+bY4=
X-Received: by 2002:a05:6902:726:: with SMTP id
 l6mr1547949ybt.115.1644404550292; 
 Wed, 09 Feb 2022 03:02:30 -0800 (PST)
MIME-Version: 1.0
References: <20220209105758.22038-1-michal.murin@jamf.com>
In-Reply-To: <20220209105758.22038-1-michal.murin@jamf.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 9 Feb 2022 12:02:19 +0100
X-Gmail-Original-Message-ID: <CAHmME9rENxqqBq+iDtW5dT+Zq30fHsWH_Donj=E6U7X_U4DiPg@mail.gmail.com>
Message-ID: <CAHmME9rENxqqBq+iDtW5dT+Zq30fHsWH_Donj=E6U7X_U4DiPg@mail.gmail.com>
Subject: Re: [PATCH] tunnel: fixed BadConfigExceptionTest
To: Michal Murin <michal.murin@jamf.com>
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

Applied, thanks.
