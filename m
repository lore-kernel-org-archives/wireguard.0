Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77E9CC433EF
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 12 Jan 2022 13:16:52 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 285956be;
	Wed, 12 Jan 2022 13:16:50 +0000 (UTC)
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id e5150d8a
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 12 Jan 2022 13:16:47 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 352D1B81ECF
 for <wireguard@lists.zx2c4.com>; Wed, 12 Jan 2022 13:16:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8338C36AF2
 for <wireguard@lists.zx2c4.com>; Wed, 12 Jan 2022 13:16:44 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="FDlbmO1b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1641993401;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+ERN5rRsPm0rpLZ8AUFAgKWDNZpuOr1YxLTNsM2DPHs=;
 b=FDlbmO1b2/VLSTE1GNuo7C38PFeDkNXxNThTVIYZF0zv/Ap1ViVU8MNih5dLfvQrgmxnBp
 wG9I8IvOdyWPi4IDm6T4Or/04g2EJYv5AgYi3lsavPmOFMX4BRfUS8DkVauubwoIcZ3zBM
 B2GAs+Jh9A0ZCxB4oSEnVhKE+Td9Iu0=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id b9618e71
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 12 Jan 2022 13:16:41 +0000 (UTC)
Received: by mail-yb1-f182.google.com with SMTP id z22so5771913ybi.11
 for <wireguard@lists.zx2c4.com>; Wed, 12 Jan 2022 05:16:41 -0800 (PST)
X-Gm-Message-State: AOAM531pN4HhJmoc7x9zL8jdLdz4Dw3iSkRhNKbSYQjkvRc/R9309/96
 O3YR5TnL+uIP2oGbY+4gKrrgBCDPGOO5eHlZPPQ=
X-Google-Smtp-Source: ABdhPJyOtRheGa3Nv5mPsxCc30bLc7gtenqAvHgaogN7DEA3AXXEPV/CTk5I92jjUNifY5K090QgZZp4Vh/SZ8imjew=
X-Received: by 2002:a25:854f:: with SMTP id f15mr12274112ybn.121.1641993399315; 
 Wed, 12 Jan 2022 05:16:39 -0800 (PST)
MIME-Version: 1.0
References: <CAHmME9qbnYmhvsuarButi6s=58=FPiti0Z-QnGMJ=OsMzy1eOg@mail.gmail.com>
 <20220111134934.324663-1-Jason@zx2c4.com>
 <20220111134934.324663-2-Jason@zx2c4.com>
 <CAMuHMdWOheM0WsHNTA2dS=wJA8kXEYx6G78bnZ51T1X8HWdzNg@mail.gmail.com>
In-Reply-To: <CAMuHMdWOheM0WsHNTA2dS=wJA8kXEYx6G78bnZ51T1X8HWdzNg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 12 Jan 2022 14:16:28 +0100
X-Gmail-Original-Message-ID: <CAHmME9q1Fm+m7JsGQWYY4qLApdaiqWHz-OYRE4qWjN1uA+HL9Q@mail.gmail.com>
Message-ID: <CAHmME9q1Fm+m7JsGQWYY4qLApdaiqWHz-OYRE4qWjN1uA+HL9Q@mail.gmail.com>
Subject: Re: [PATCH crypto 1/2] lib/crypto: blake2s-generic: reduce code size
 on small systems
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 netdev <netdev@vger.kernel.org>, 
 WireGuard mailing list <wireguard@lists.zx2c4.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 bpf <bpf@vger.kernel.org>, 
 Theodore Tso <tytso@mit.edu>, Greg KH <gregkh@linuxfoundation.org>, 
 Jean-Philippe Aumasson <jeanphilippe.aumasson@gmail.com>,
 Ard Biesheuvel <ardb@kernel.org>, Herbert Xu <herbert@gondor.apana.org.au>
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

Hi Geert,

Thanks for testing this. However, I've *abandoned* this patch, due to
unacceptable performance hits, and figuring out that we can accomplish
basically the same thing without as large of a hit by modifying the
obsolete sha1 implementation.

Herbert - please do not apply this patch. Instead, later versions of
this patchset (e.g. v3 [1] and potentially later if it comes to that)
are what should be applied.

Jason

[1] https://lore.kernel.org/linux-crypto/20220111220506.742067-1-Jason@zx2c4.com/
