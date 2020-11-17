Return-Path: <SRS0=xb9C=EX=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 187A4C2D0E4
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 17 Nov 2020 08:31:18 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFC2A24655
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 17 Nov 2020 08:31:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="oqbOES1g"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EFC2A24655
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 71fc743b;
	Tue, 17 Nov 2020 08:26:14 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 585af3af
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 17 Nov 2020 08:26:12 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 84c9aded
 for <wireguard@lists.zx2c4.com>;
 Tue, 17 Nov 2020 08:26:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=z/RXovRLSYOedThve1IBUcWgk2A=; b=oqbOES
 1gmR16J90s6+lsQpH2tXN85o1+mb2Jhk1/1Ho5jdS3wSbdIkZ1gVp5b6Kfbf2CUD
 SXqzMC4+zGiYNkhPYfMHfgW9KO0YD8gEGR6oFwKUr+Ir5onOOIvcISD+UQTCCLsw
 eqGrl1vHaQPTwr203yOk9v1fJJsVqE23g5RW7HArObv58+LxcSZSjUAZnGx3Lbjh
 0UJmgdb2fgAc43/eQadCXDCRAqQSwPRrEdGJPebMpO4BHCOKs2L2W/MyyM5RbKaO
 54sjt6ADJKzY2dm7Qd5+AB2t+hh15sG7TP7GJuVgdBEy7cQpG7hzeUnj2xh+3ILp
 5/18VDjDdklN7hig==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 21120b8a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 17 Nov 2020 08:26:58 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id d1so5974628ybr.10
 for <wireguard@lists.zx2c4.com>; Tue, 17 Nov 2020 00:30:46 -0800 (PST)
X-Gm-Message-State: AOAM532xMUq019X5yrDACQo4KQAzwcuMtKTma9Oo2Anrp7Oo+BiGoZ5n
 d1zAm9ccPmQBDAEenuLXgDnugQU0x97slif8Pqw=
X-Google-Smtp-Source: ABdhPJxmPVcYu351aXbEk7YtUdCUEBVBnwD81zerLN4rS1+tvRv/82D5tbscpCF/X+kmZfpPTwikQVWAmzs1lwDI+lg=
X-Received: by 2002:a25:df05:: with SMTP id w5mr34289479ybg.20.1605601846472; 
 Tue, 17 Nov 2020 00:30:46 -0800 (PST)
MIME-Version: 1.0
References: <20201117021839.4146-1-a@unstable.cc>
In-Reply-To: <20201117021839.4146-1-a@unstable.cc>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Tue, 17 Nov 2020 09:30:35 +0100
X-Gmail-Original-Message-ID: <CAHmME9q8k26a9rn72KTfcJw0kJ0iMdob6BBsAsyYBzvfYjRtQQ@mail.gmail.com>
Message-ID: <CAHmME9q8k26a9rn72KTfcJw0kJ0iMdob6BBsAsyYBzvfYjRtQQ@mail.gmail.com>
Subject: Re: [PATCH cryptodev] crypto: lib/chacha20poly1305 - allow users to
 specify 96bit nonce
To: Antonio Quartulli <a@unstable.cc>
Cc: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>, 
 WireGuard mailing list <wireguard@lists.zx2c4.com>,
 Netdev <netdev@vger.kernel.org>, keyrings@vger.kernel.org, 
 linux-security-module <linux-security-module@vger.kernel.org>, 
 Antonio Quartulli <antonio@openvpn.net>,
 Herbert Xu <herbert@gondor.apana.org.au>, 
 David Howells <dhowells@redhat.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
 Jakub Kicinski <kuba@kernel.org>
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

Nack.

This API is meant to take simple integers, so that programmers can use
atomic64_t with it and have safe nonces. I'm also interested in
preserving the API's ability to safely encrypt more than 4 gigs of
data at once. Passing a buffer also encourages people to use
randomized nonces, which isn't really safe. Finally, there are no
in-tree users of 96bit nonces for this interface. If you're after a
cornucopia of compatibility primitives, the ipsec stuff might be more
to your fitting. Or, add a new simple function/api. But adding
complexity to users of the existing one and confusing future users of
it is a non-starter. It's supposed to be deliberately non-awful to
use.
