Return-Path: <SRS0=9XF/=H3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE6BDC433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 25 Feb 2021 15:56:26 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE15D64F18
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 25 Feb 2021 15:56:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE15D64F18
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c8f0b1fe;
	Thu, 25 Feb 2021 15:54:13 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [104.131.123.232])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 40ec77d6
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 25 Feb 2021 15:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1614268448;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gw+1d8caSiWD/OMAgKLp7n73W4EEf8GDYeyswFgVHS4=;
 b=TVhXzPkL0+Hs7JaDtYXKj54MOwoO1TV/ENLZW8QRBircGrakHTT88X9MemCey3c5s5CNdM
 HmJHrR/k5SRV67PcwrczxfACv6YViIrnKxaOV9VE/FkB6rjw4KpxT0a00mM3u7dRPCY67q
 YkuAM7qD1/PMlcaccWUoIHZL4ObiP5c=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 5a725746
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 25 Feb 2021 15:54:07 +0000 (UTC)
Received: by mail-yb1-f171.google.com with SMTP id m188so5825388yba.13
 for <wireguard@lists.zx2c4.com>; Thu, 25 Feb 2021 07:54:07 -0800 (PST)
X-Gm-Message-State: AOAM5339WNqMogqy8+7FnHyyUkbsTn0qtlOlGPe+I/s82DkzEcSV/GS1
 zlaU8aIc80Ppvai43hJB+Dm+B+CpupgAFLch2sM=
X-Google-Smtp-Source: ABdhPJzIFAUDIUU+HsBRRD/ZhhaeT8EEDI2P19sAc+YVKInEjKHQqpP2f+Pn5hmXLedJITxXJ9KemIGL3+uPnoK1OsQ=
X-Received: by 2002:a25:3cd:: with SMTP id 196mr5062202ybd.456.1614268447486; 
 Thu, 25 Feb 2021 07:54:07 -0800 (PST)
MIME-Version: 1.0
References: <CADjMg7Vp+p7n_JLMfFU4GwtNu_X3ARFJOuhxLasonuD-fvB5Hg@mail.gmail.com>
In-Reply-To: <CADjMg7Vp+p7n_JLMfFU4GwtNu_X3ARFJOuhxLasonuD-fvB5Hg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Thu, 25 Feb 2021 16:53:56 +0100
X-Gmail-Original-Message-ID: <CAHmME9o9YNUKawN8bYArdfbDF9cZF+1nSTZuMef5RRVeaPTrXQ@mail.gmail.com>
Message-ID: <CAHmME9o9YNUKawN8bYArdfbDF9cZF+1nSTZuMef5RRVeaPTrXQ@mail.gmail.com>
Subject: Re: wireguard-go on windows
To: Devanath S <s.devanath@gmail.com>
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

I'm curious to learn what you're trying to debug this way; you're
better off using wireguard-windows.

The pipe permissions are too strict internally, it appears. Try
running as Local System.

Jason
