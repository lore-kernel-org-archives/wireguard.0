Return-Path: <SRS0=GTIq=ES=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C14E6C2D0A3
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 12 Nov 2020 08:50:33 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CB432206FB
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 12 Nov 2020 08:50:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="aUTvvRq8"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CB432206FB
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a7d82f41;
	Thu, 12 Nov 2020 08:46:35 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id e071775f
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 12 Nov 2020 08:46:33 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 164be630
 for <wireguard@lists.zx2c4.com>;
 Thu, 12 Nov 2020 08:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=hdwC2xr0AdUsCbDR4ZPdDq2JZ7Y=; b=aUTvvR
 q8BOUxbamcwaNoH1xOUMfAFlUx9CbHs9/ecIW+kL/9rDsPtyW1Nr/G2szdlDMVpS
 hX3kf+BBo2WxUYgrukOeSQOOd/nJRNIS2ZNiVIrZ4/ceEtg5bsEEpLIZBfngBulg
 tDeLJWAe3I4M5w7cNA/OOj0xQrQd9qpJlsEdUobQGPN90mXftWK4Ot3ObAYysc+9
 zua6yV2v7c6Oi0mjhSwhJ9UC2KZceuIq6nu7D57eUPjGkLHpjzcLI104XHFDd4nH
 tAHbNJMv+rmvC10R1iPgSoYn/J6FmybMq8wO0ATzELr4FR721EWqL4tzckI4ya8t
 D8KHihgaTRVEJ4KA==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 7e252947
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 12 Nov 2020 08:47:19 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id c18so4584420ybj.10
 for <wireguard@lists.zx2c4.com>; Thu, 12 Nov 2020 00:50:29 -0800 (PST)
X-Gm-Message-State: AOAM53020lNtmOK76YXM8i5h98Neso6MOOs8FRVYMkyfZo9RvCYX51Rr
 JB6TROPiE5xWUMML1tfdikVoO4S9KXheqqLGiV4=
X-Google-Smtp-Source: ABdhPJxEo+z3W71rBFDFdVG4T+CrI/cYb7z6emRU7b7M86a6d5gXvXNbZggkpG2eT54s5KhXrPpaV/ROEHuTAMpWUsY=
X-Received: by 2002:a25:df05:: with SMTP id w5mr43126995ybg.20.1605171029151; 
 Thu, 12 Nov 2020 00:50:29 -0800 (PST)
MIME-Version: 1.0
References: <CAHmME9rW1e+rRc8q+-_eLR=U9OTn+Sn84ECJtGFY=Hjg8kzfEQ@mail.gmail.com>
 <K17360-33.1605029899@spamhaus.org>
 <CAHmME9pmKxGYmxxs0pLt=zt2igy6aR-g5xsB=2Zew6oWVY0Z3w@mail.gmail.com>
 <CABtXGiCs1fS3FHAwHL1zohuL1BfDhY7GhZhtLFfiqS2aJstr3g@mail.gmail.com>
In-Reply-To: <CABtXGiCs1fS3FHAwHL1zohuL1BfDhY7GhZhtLFfiqS2aJstr3g@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 12 Nov 2020 09:50:18 +0100
X-Gmail-Original-Message-ID: <CAHmME9oSxigxSbU6Tu4_UmNDwjhUY5N=zLX7crgbQp-ESEd5OA@mail.gmail.com>
Message-ID: <CAHmME9oSxigxSbU6Tu4_UmNDwjhUY5N=zLX7crgbQp-ESEd5OA@mail.gmail.com>
Subject: Re: Should we sunset Windows 7 support?
To: Phillip McMahon <phillip.mcmahon@gmail.com>
Cc: Andrew Fried <afried@spamteq.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Hi Philip,

On Thu, Nov 12, 2020 at 9:47 AM Phillip McMahon
<phillip.mcmahon@gmail.com> wrote:
>
> Take a look here
>
> https://gs.statcounter.com/os-version-market-share/windows/desktop/worldwide
>
> Would seem to suggest Windows 7 is in decline but still represents
> around 25% of OS footprint out there.

Thanks for sending. Indeed that seems pretty illustrative, and you can
adjust the graph to show it per-region, where indeed Africa and Asia
have ~22ish percent of the market share. So, I suppose we'll continue
to support Windows 7 until that dips much lower.

The good news is that we needn't worry about Windows 8 at all. :-P

Jason
