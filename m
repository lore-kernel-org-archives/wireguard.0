Return-Path: <SRS0=215W=DT=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD986C433DF
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 12 Oct 2020 15:02:16 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DAA1E20838
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 12 Oct 2020 15:02:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="gdcL7uw8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DAA1E20838
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0860dd00;
	Mon, 12 Oct 2020 14:28:26 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 886f69a1
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 12 Oct 2020 14:28:24 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 19ef596a
 for <wireguard@lists.zx2c4.com>;
 Mon, 12 Oct 2020 14:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=BvVJtdlaJyp2OXg1U+0f5G66YHc=; b=gdcL7u
 w8W6+yXe5zX7KVc94ZXmE0Y5GGwDVqans8Ebx+G+2h99c4VEQ/UarUPODahZ8TO4
 xeC4qElfDoXc/fgFeT0sf30qTQ8Cs2S3tF/xPRquNuueCOiEFazpufd5E9H1kKtE
 SP+xp+ICSI1e7WMtTO0i+pZXD3cLcF9HGllbTOAttG0Fh5W1rUIO6cCAJAoQgFxE
 dleK9hrVgetfMqxbnxHQjM0Tk9UXbRNbUUkIXb16l9hHDsVsf1HBPOA0A67HNyOo
 j0PrPGp9bTsZ7GWYvKJcgLb16EE9z1DcUds8LXEu8GXOOKESATtx13xmzRl0Z74s
 i0MjyEiAbHKOSwtQ==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 206091b6
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 12 Oct 2020 14:28:24 +0000 (UTC)
Received: by mail-io1-f53.google.com with SMTP id g7so17857895iov.13
 for <wireguard@lists.zx2c4.com>; Mon, 12 Oct 2020 08:01:41 -0700 (PDT)
X-Gm-Message-State: AOAM530MunhMLlKYMHjBe7JPKo6UmUrOmduMhZog47zRsB2aYMzkbbTE
 iWRQ8m3P+T637vQWFBkrauL8XdWECgBkvzPWtjQ=
X-Google-Smtp-Source: ABdhPJxxvHdPGdmPA0zzf2J0u2Jxm4Kvr8XzDMFxui/Sd+RPr9A7jJRC/nRSJWqhq8Pi+2SxjqcPMQHgfyF5VsMW7iA=
X-Received: by 2002:a05:6602:22d4:: with SMTP id
 e20mr2928910ioe.79.1602514900850; 
 Mon, 12 Oct 2020 08:01:40 -0700 (PDT)
MIME-Version: 1.0
References: <be4e9109-399b-5520-e6fd-e7163350aaf0@riseup.net>
 <CAHmME9oe5e84gpsGjGYkWHZoOLYKX1xUZBNzM7g0R6cEHg5JUg@mail.gmail.com>
 <b1955eb8-bc38-770c-848d-540c6c13bfbc@riseup.net>
In-Reply-To: <b1955eb8-bc38-770c-848d-540c6c13bfbc@riseup.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 12 Oct 2020 17:01:29 +0200
X-Gmail-Original-Message-ID: <CAHmME9q0WPQYavB7cnJCcTfYYTafnJ3WxsswP33tv27C7+BMZw@mail.gmail.com>
Message-ID: <CAHmME9q0WPQYavB7cnJCcTfYYTafnJ3WxsswP33tv27C7+BMZw@mail.gmail.com>
Subject: Re: [PATCH] wg-quick linux: Add strip-and-eval cmd to extract keys
 from PostUp
To: Robin Schneider <ypid@riseup.net>
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

On Sat, Oct 10, 2020 at 5:58 PM Robin Schneider <ypid@riseup.net> wrote:
> The proposed workaround has two issues:
>
> 1. It does not allow to replace the PrivateKey or PresharedKey using the `syncconf` now from the config file which is what I want to have.
> 2. It only outputs the PrivateKey and not the PresharedKey for each peer. Sure, this could be done with a for loop.

Sounds like something easily achievable with scripting.
