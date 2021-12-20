Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BEB4C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 20 Dec 2021 17:04:38 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 62221eca;
	Mon, 20 Dec 2021 17:00:51 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 76b129d3
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 20 Dec 2021 17:00:49 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 98BD8B80FBD
 for <wireguard@lists.zx2c4.com>; Mon, 20 Dec 2021 17:00:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D23EC36AE7
 for <wireguard@lists.zx2c4.com>; Mon, 20 Dec 2021 17:00:48 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="n06Pl7+V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1640019646;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=BnaXmnzBPS7BoDzBZnkC4EThTcy8DJ0C2+d0oh3HATc=;
 b=n06Pl7+Ve5g8v+T2cIj03AEGMdsC2dNknS/gGvGP7TC49pTBvfifDfmV8rioeOUV94q5rx
 IUGKnI5IbeHwII1ClDSeGNi6Z7eiBms7XVeKrlNR0Z9hFJvoCjmc58ds6yBHtpfdx2ImKG
 jUlGV3Atunfqr13nINvuVZm+f9luuxU=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d577c8a1
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 20 Dec 2021 17:00:46 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id d10so30793434ybe.3
 for <wireguard@lists.zx2c4.com>; Mon, 20 Dec 2021 09:00:46 -0800 (PST)
X-Gm-Message-State: AOAM532v+mGBORQ/H53WPOC+/wybkcAB/m0DpnzvaVZd6mKm711GZftk
 zrChXTnH5l8kAGiWAX78YT75o1scW44328QrMdo=
X-Google-Smtp-Source: ABdhPJw9NsKdV/boGpz5LnUM+6xh4YU1P4xAQGLP+CeMXPnhAXrZPu7MU2JNKyBFbU2Hayzav9E6aDpq3C6+oX2ere4=
X-Received: by 2002:a05:6902:1144:: with SMTP id
 p4mr25192475ybu.638.1640019645788; 
 Mon, 20 Dec 2021 09:00:45 -0800 (PST)
MIME-Version: 1.0
References: <CACD1g0AfxsGNdO9e-fRLUvONfPJXJnLbzGjQb-s8t+iizXdB6A@mail.gmail.com>
In-Reply-To: <CACD1g0AfxsGNdO9e-fRLUvONfPJXJnLbzGjQb-s8t+iizXdB6A@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 20 Dec 2021 18:00:34 +0100
X-Gmail-Original-Message-ID: <CAHmME9pxjOO_0pQNprxdxRK9zPWk3dDKMrk6X4YWz-B7BvLncA@mail.gmail.com>
Message-ID: <CAHmME9pxjOO_0pQNprxdxRK9zPWk3dDKMrk6X4YWz-B7BvLncA@mail.gmail.com>
Subject: Re: Running PTP (Precision Time Protocol) over Wireguard
To: Antonio Teixeira <antonio.teixeira@bry.com.br>
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

I've never used these APIs and I wasn't aware it was something that
needed explicit support inside of virtual drivers. What happens when
you try to use it? Are the timestamps bogus or does it return an
error? If the former, in what way are they bogus? If the latter,
what's the error?

Jason
