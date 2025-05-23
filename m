Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3B3DC54ED0
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 23 May 2025 18:28:54 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e21786d3;
	Fri, 23 May 2025 18:28:52 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 30cd5abd
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 23 May 2025 18:28:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id EDADE629CD
 for <wireguard@lists.zx2c4.com>; Fri, 23 May 2025 18:28:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67753C4CEEF
 for <wireguard@lists.zx2c4.com>; Fri, 23 May 2025 18:28:49 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="kB+sv6Rq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1748024926;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Y/nnU5vNzX6O3BRGXCuupCQl41Mf1d+0nxmT81O3A0o=;
 b=kB+sv6RqA8cvXuP7vx7boqazuyCV+RrFxRM93ZAVNOIRnA9anf+e9+Z+TxIukwJ62kBsOL
 ndsP2AbTCl3wOJevYXCpxh9g9BRzF+VJYaF21gOcZoKnG9cpc+0YX8GxZ4rI2qHP5g8U9N
 uVxqlz9kBJSnaS3bS7KjpbLLgmqW7JA=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 725fa45b
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 23 May 2025 18:28:46 +0000 (UTC)
Received: by mail-oa1-f48.google.com with SMTP id
 586e51a60fabf-2c769da02b0so151051fac.3
 for <wireguard@lists.zx2c4.com>; Fri, 23 May 2025 11:28:46 -0700 (PDT)
X-Gm-Message-State: AOJu0YxikSzsJ0kAmczBJeNpSiUk4uixSP8Vu57HOtxXRNvKOb0K9esl
 xzD5XIaFlk7z+XUXiMdeuzdzZcv7FUmWlojtzMulFm/iPWb2vdCFI3um5malTpDU9zJ/WcVUSNW
 MMvulxSGGe29dFZiHBWic7OXFqYiz++w=
X-Google-Smtp-Source: AGHT+IGLwvCXWfd5tAbmWZT/s3KD9E0d9Lh2ymXPorf/cMhb14MfglAoJJAXYRzguAYNBpJ8B8kEUEzJ5fPv9++mt7Q=
X-Received: by 2002:a05:6870:940a:b0:2bc:69d8:a39e with SMTP id
 586e51a60fabf-2e862101872mr245281fac.33.1748024925163; Fri, 23 May 2025
 11:28:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250314093920.3448871-1-patrick.havelange_ext@softathome.com>
In-Reply-To: <20250314093920.3448871-1-patrick.havelange_ext@softathome.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 23 May 2025 20:28:33 +0200
X-Gmail-Original-Message-ID: <CAHmME9q9t122WdD=kW6siHujMVjXOj-rehx-2wKFUuq15-dkQQ@mail.gmail.com>
X-Gm-Features: AX0GCFvb3vALssqpKr3UwCJOb5pcu9anQ4bESs25qGVonRfO60cP32HG-Lxneac
Message-ID: <CAHmME9q9t122WdD=kW6siHujMVjXOj-rehx-2wKFUuq15-dkQQ@mail.gmail.com>
Subject: Re: [PATCH] wg: syncconf: also handle psk changes
To: Patrick Havelange <patrick.havelange_ext@softathome.com>
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

Your patch is wrong; did you test it? When it detects a mismatch in
PSK, it removes the peer, rather than removing the PSK.

I implemented a different fix:
https://git.zx2c4.com/wireguard-tools/commit/?id=780182e37d2b5981171766b8f31bcefd64da7a43
It seems to work for me, but please test this and let me know.

Either way, thanks for the bug report.

Thanks,
Jason
