Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE4FAD1118B
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 26 Nov 2025 18:02:49 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f81146ad;
	Wed, 26 Nov 2025 17:58:22 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org
 [2600:3c04:e001:324:0:1991:8:25])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id e35654d2
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 26 Nov 2025 17:58:20 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 420DC6023C
 for <wireguard@lists.zx2c4.com>; Wed, 26 Nov 2025 17:58:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B54F6C4CEF7
 for <wireguard@lists.zx2c4.com>; Wed, 26 Nov 2025 17:58:18 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="DTCqk4om"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1764179894;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=nk9iQUV0XsLI6d4//k6AYsJtSmW0aX1ARpzLYKj/qY0=;
 b=DTCqk4omXMj2cWOY0qmFomZdtktz5bhvzvMUYlO+Ty6TP8jdPuJ7pzeGUhloLx3+Lo4WgK
 9ceavxfabYJnqVAHR5Cyix2QoLNGrabSVTuIJb9b0h4T7k7nBq5mkdC2BJUde8+3aeOGWf
 bwxbbmQxCvhU1Jzbj8c2I1I6m9exP2Q=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e3623ca8
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 26 Nov 2025 17:58:14 +0000 (UTC)
Received: by mail-oa1-f47.google.com with SMTP id
 586e51a60fabf-3ec6c10a295so4879fac.0
 for <wireguard@lists.zx2c4.com>; Wed, 26 Nov 2025 09:58:13 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCW/CXJ0InWH4Fsz87MX80D3ZRWbB04qam60dM2h3Zm/SYreU2+Kx09kEj+mSlj8sUIFoTEvclu4vGU=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YyLIySpWzli+hyiCejK/5YAjh97tH/lNcF0DoDARooI9RP9UwsT
 2/mV/geG0nT7orAX0CJpD6KUddPL7efD9lCe3HjDnAIZNpbXiS1sJBHUvJauUbx4LSi3D/bWn4E
 Wt5LfsyBf3RL9LxbBKjUFn2/sG54WjPY=
X-Google-Smtp-Source: AGHT+IFTtQij18X9rcId8/xM3J3CLodhdl0o6d2Ojf4LIqtOBzWRLO3KWhny/Isr7a2DmvXJwy9ays14CPzzN+VmW4k=
X-Received: by 2002:a05:6808:4f67:b0:450:c58d:8c3a with SMTP id
 5614622812f47-45112d13fd4mr5903134b6e.46.1764179892530; Wed, 26 Nov 2025
 09:58:12 -0800 (PST)
MIME-Version: 1.0
References: <20251126173546.57681-1-ast@fiberby.net>
In-Reply-To: <20251126173546.57681-1-ast@fiberby.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 26 Nov 2025 18:58:01 +0100
X-Gmail-Original-Message-ID: <CAHmME9ptkYkEygY-BmCduqySToOL1mvZnrCrgFM2bBQrNmh71g@mail.gmail.com>
X-Gm-Features: AWmQ_bn4ajbqmMw4PaZ5c9-r1uz0ZNO5-beD-38rcNCG5zkfeRd9Ch8PwgaqHr8
Message-ID: <CAHmME9ptkYkEygY-BmCduqySToOL1mvZnrCrgFM2bBQrNmh71g@mail.gmail.com>
Subject: Re: [PATCH wireguard v4 00/10] wireguard: netlink: ynl conversion
To: =?UTF-8?B?QXNiasO4cm4gU2xvdGggVMO4bm5lc2Vu?= <ast@fiberby.net>
Cc: "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Donald Hunter <donald.hunter@gmail.com>, Simon Horman <horms@kernel.org>, 
 Jacob Keller <jacob.e.keller@intel.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
 wireguard@lists.zx2c4.com, netdev@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jordan Rife <jordan@jrife.io>
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

Hi Asbjorn,

Thank you for this! I've merged this to the wireguard devel tree, and
I'll send this up to net-next after letting it cook there for a little
while.

I really appreciate all the work you've put into this and the large
amounts of feedback you've incorporated.

Jason
