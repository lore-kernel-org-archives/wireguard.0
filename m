Return-Path: <SRS0=dVqJ=BD=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BB8B0C433EA
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Jul 2020 09:15:35 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 64ADF206EB
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 24 Jul 2020 09:15:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="lShHnjBI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 64ADF206EB
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4a0a17d7;
	Fri, 24 Jul 2020 08:52:14 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id bcd91d9a
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Jul 2020 08:52:10 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id eeb6bd3b
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Jul 2020 08:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=lpvMsJsEZ4xHfca/FCNgqPMrTQo=; b=lShHnj
 BIzw1zO7444BWSFmLEOzAq7z1SOjgyy5yXgTPxs5Hi8YjnauypQYzz4xtPqDsiN0
 nDLs2AO45+DHJQ8tiJi7SvxSzUzJE4Z22p1d1w2QBub4j1hz+WySOCfARRHyEbYb
 8FeHIt2ulO/7OHfQs+AMkRjVQqdKUcJwzeWxCjrVehdEZeqbIOO7I+LVw/9KMv/i
 A08bHIH4y6aQ7kbVhn6v7xiGrI9m3mTRczcjhIW/YZptCap1NpqV3q37Uyfb9E1S
 9rxb7xOmPXTsupwWFTEIe/j6Rjf1fEa1nnk89qQ4pto/0A7CPwr8x2WsZ1rSohjX
 x8/NHrnYUJrA6Djw==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c1c761c9
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 24 Jul 2020 08:52:10 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id e64so9102364iof.12
 for <wireguard@lists.zx2c4.com>; Fri, 24 Jul 2020 02:15:04 -0700 (PDT)
X-Gm-Message-State: AOAM53156xlk/hImbbZqTHad2Q+wykD9MuMV2Kfg34bwzqL3buMzGbjD
 2qIZsWE7sWpcuIdnlASjkRR2X47/jJ/zgCixx44=
X-Google-Smtp-Source: ABdhPJxTm03wTKkPx3M71Qmb3zWUaZsbTDz86QUKIQVXK0RRS1GGW2kGSL00AEeFfQ/r4FDXmf+xw0HyAP+8/Re/G58=
X-Received: by 2002:a02:a78f:: with SMTP id e15mr9381017jaj.36.1595582103937; 
 Fri, 24 Jul 2020 02:15:03 -0700 (PDT)
MIME-Version: 1.0
References: <VI1PR02MB52169D6F055314DCD03746EDE6760@VI1PR02MB5216.eurprd02.prod.outlook.com>
 <865B9BD5-A256-43F8-9922-A6DE7680C216@tomcsanyi.net>
In-Reply-To: <865B9BD5-A256-43F8-9922-A6DE7680C216@tomcsanyi.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 24 Jul 2020 11:14:52 +0200
X-Gmail-Original-Message-ID: <CAHmME9qsfmK6_d4bDF1Oj4585_56Vtm+wCT+i-2PO=tXN3Jsfw@mail.gmail.com>
Message-ID: <CAHmME9qsfmK6_d4bDF1Oj4585_56Vtm+wCT+i-2PO=tXN3Jsfw@mail.gmail.com>
Subject: Re: [PATCH] Adding support for reloading configuration via systemd
To: "Tomcsanyi, Domonkos" <domi@tomcsanyi.net>
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

On Fri, Jul 24, 2020 at 10:30 AM Tomcsanyi, Domonkos <domi@tomcsanyi.net> wrote:
>
> Signed-off-by: Domonkos P. Tomcsanyi <domi@tomcsanyi.net>
> ---
> src/systemd/wg-quick@.service | 1 +
> 1 file changed, 1 insertion(+)
>
> diff --git a/src/systemd/wg-quick@.service b/src/systemd/wg-quick@.service
> index a9cbb58..8eb040b 100644
> --- a/src/systemd/wg-quick@.service
> +++ b/src/systemd/wg-quick@.service
> @@ -15,6 +15,7 @@ Type=oneshot
> RemainAfterExit=yes
> ExecStart=/usr/bin/wg-quick up %i
> ExecStop=/usr/bin/wg-quick down %i
> +ExecReload=/bin/bash -c '/usr/bin/wg syncconf %i <(/usr/bin/wg-quick strip
> %i)'
> Environment=WG_ENDPOINT_RESOLUTION_RETRIES=infinity
>
> [Install]
> --
> 2.17.1
>
> Not the cleanest solution, but I think it might help a lot of people, so I'm
> submitting it.

This actually doesn't seem too bad to me. Are there cleaner solutions
that I'm not thinking of that I should consider before applying this
patch?
