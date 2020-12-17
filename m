Return-Path: <SRS0=K437=FV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AA9DC4361B
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 17 Dec 2020 21:54:05 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AEB792388E
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 17 Dec 2020 21:54:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AEB792388E
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 61624554;
	Thu, 17 Dec 2020 21:45:29 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id d7fe254c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 17 Dec 2020 21:45:27 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 39dc59c9
 for <wireguard@lists.zx2c4.com>;
 Thu, 17 Dec 2020 21:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to
 :content-type; s=mail; bh=x/bAv3FYev6ju+AEsLO3yD5vUmk=; b=SINxR8
 UnkUM+XJQmPK8Hd+RJaVyi47Q5S2CMZW4olHRT70F2pu3CzkObA9bioqAMf4HlME
 agtt5uj5cppMAIzl8F7jpCA6dPicSZ+f8GV4R7uh7mfPVey9+TZ5YbGBuG0hc1rz
 Cdrvth9I2RrCq96U2sjw23e8MwZQH8ZE6lJww8h7/1XfClAy7Pq7yXnBLp+ajUcE
 gm3Rq493JgnaBS6wUwh7oQloOLZzUr+iYZ5zvvTNLhDj8oyL9HX/6XILX4TrfxKq
 nfptSEGwjnR2lr9o8ihYT4dYS8S3mBts8xjZHyyGYYpH2mZMePUanU0tdWQkh1Z/
 2sd7zg4uspLU94dg==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 409e501e
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 17 Dec 2020 21:46:13 +0000 (UTC)
Received: by mail-yb1-f172.google.com with SMTP id d37so101201ybi.4
 for <wireguard@lists.zx2c4.com>; Thu, 17 Dec 2020 13:54:00 -0800 (PST)
X-Gm-Message-State: AOAM530CMfZJCHDvTeBFQbrI9+tuCrqpC8kWdIkJkRNdysvyr7RMw5fn
 aiAR/KlHLTEOgICdNihI/UzY3D69jHtQ9AGWr88=
X-Google-Smtp-Source: ABdhPJzCijuhFPukeAievlj4TUnNEdD31wZN4VXnhnl96QazUm3+DpbaqEVbbq6qqdJDGdXtznx2715jV9o6jG247gg=
X-Received: by 2002:a25:2054:: with SMTP id g81mr1945258ybg.178.1608242040242; 
 Thu, 17 Dec 2020 13:54:00 -0800 (PST)
MIME-Version: 1.0
References: <A9F23E70-C8AA-4C54-99E4-63E2E40FE0FA@glenn.id.au>
 <CAHmME9pzNQeEdDnvu8mXFnYHgNibuqSLi5viAtYjDrF0wbEMoQ@mail.gmail.com>
In-Reply-To: <CAHmME9pzNQeEdDnvu8mXFnYHgNibuqSLi5viAtYjDrF0wbEMoQ@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 17 Dec 2020 22:53:49 +0100
X-Gmail-Original-Message-ID: <CAHmME9qCRWXMVjuz6g6M0wMvhj9v90sTkHNOFCr+Jht-rUNFoQ@mail.gmail.com>
Message-ID: <CAHmME9qCRWXMVjuz6g6M0wMvhj9v90sTkHNOFCr+Jht-rUNFoQ@mail.gmail.com>
Subject: Re: WireGuard on macOS stopped working after 1.0.10 update
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Hi list,

To provide an update on this issue:

On Thu, Dec 17, 2020 at 2:43 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> I'm really very sorry about this regression. I fixed it earlier today
> already here: https://git.zx2c4.com/wireguard-apple/commit/?id=20bdf46792905de8862ae7641e50e0f9f99ec946
> but now we're stuck having to wait for Apple's review of the fix. This
> is as frustrating for me as it is for you.

The macOS update went through, and version 1.0.11 is now available
from the App Store. In my tests, this fixes the issue, but some
confirmation from list subscribers is always helpful.

However, they rejected the iOS update, due to the link in the version
info window to https://www.wireguard.com/donations/ that we've had on
there for two years. You can see their rejection here:
https://data.zx2c4.com/apple-asks-me-to-remove-donation-link-from-app.png
https://data.zx2c4.com/the-screenshot-that-apple-provided.png

Not wanting to hold up getting this fix deployed, I quickly removed
the link and resubmitted to the App Store:
https://git.zx2c4.com/wireguard-apple/commit/?id=a4fc0f64b8bca8afae5abab37b81ba0b45836975

So now the process of getting that fix deployed on iOS starts from the
beginning again. It could take another 24 hours. It could take a full
month. The process is opaque, and try as I may, I don't know what else
I can do to get the fix out faster.

And again, I'm really very sorry about the regression in the code, and
that we didn't catch it earlier. I hope the update gets deployed to
you all sooner rather than later.

Jason
