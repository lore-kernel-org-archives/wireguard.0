Return-Path: <SRS0=F0uL=3T=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.3 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D2CAC35246
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 30 Jan 2020 02:04:35 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2318A206D5
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 30 Jan 2020 02:04:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b+phoCaG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2318A206D5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id caa7d78b;
	Thu, 30 Jan 2020 01:54:07 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 984e8762
 for <wireguard@lists.zx2c4.com>;
 Wed, 15 Jan 2020 23:49:40 +0000 (UTC)
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0c9b12e2
 for <wireguard@lists.zx2c4.com>;
 Wed, 15 Jan 2020 23:49:40 +0000 (UTC)
Received: by mail-il1-x12d.google.com with SMTP id b15so16509424iln.3
 for <wireguard@lists.zx2c4.com>; Wed, 15 Jan 2020 15:49:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nkcqYp1SpS7J6IE2jYK2o5vJQTSZL3G0JeCVCRpBg+g=;
 b=b+phoCaGM4IqlfaUJjyUjSpWVgT0MQk4wd+plYTJDSw901kQAFPJ5Slt8RLmAYgXly
 TR3Z5kKmQPZu5VN1djvkw+fCBrARkICCxcdsie7emYtafrRueWns/NggH/qQuBjRuysG
 jMCKi3fogfTjKHhwAnm+HIO3VQQwa2jIdPlLlyW5qQmNTMSfp0pB2voSVwNjJ7ppfi/J
 K2KI6JMnvlvYBIXqpRDZx12bzATuR3dUweqPQdHxTxPMx4jrwtaIf4JThVzAS+Y97BZL
 pCtAXP5QrSSLzBn7+YFhrQJAZEReRZeL+Kx42WKSZY15R2TDJiKVtjzAjQ5iM9SKIex1
 CqfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nkcqYp1SpS7J6IE2jYK2o5vJQTSZL3G0JeCVCRpBg+g=;
 b=pW3VntgHIlHMkHqmwYybawBrXbuplB5mBEhe41zomGrYccPIpro+u/JJfD9czmwBBw
 1XHWNdGV9UbPcaHi0/EPpZIc83VM3ecR+xElI7bbZDaoWtPxUu6Vt42aIrNlOdUozhDu
 akCCVxtIA3g94swTIpLx36YM4C45OOGJRjcduQAwj3RIlYdW4PLgSgT87MeCkCW7d4et
 TIQprGY9beDgEIt+2OF/T1JZcXUJfbE3OU8HsMWY6pZWytsDz6rxCzkhw2uobKTf7fJl
 FTDAvlHHn+efwCAz0HNkcpsZlS8OG+1nMCP0XDnTtg9Xv6rbprMNcITvxjRjxbj93jzz
 gqJw==
X-Gm-Message-State: APjAAAW8M2dZbHu/mYvGPUNc25qbNUCiKDwDxtq4C3uekNyPnppcFrwL
 FvoPOoeTojnwOEIMJZkqhGBx1HvGq8HVp8TmAwo=
X-Google-Smtp-Source: APXvYqyf1A6GM8R/RqZdMPWUrq+h8i2WlpEKq++Mfb3IzszWppl2VjvFPhG/jI8hR7cdMSGf4zaW6WPpomxGUFHr0tQ=
X-Received: by 2002:a92:1b59:: with SMTP id b86mr1078729ilb.84.1579132179972; 
 Wed, 15 Jan 2020 15:49:39 -0800 (PST)
MIME-Version: 1.0
References: <CALXT2kFp9SPFELS97vHJFndGH7cFh0=gjC1h9Tuv2LgSMHeJ-Q@mail.gmail.com>
 <CANGvTamn0NJYumfXWvzGYVvoWaXdmox8rLMTFnMmZvOoNaz__g@mail.gmail.com>
 <CAHmME9oO1VmHwREkUT6ffru3EBNWbmvqFnS5VLLC5jrc26_RvQ@mail.gmail.com>
In-Reply-To: <CAHmME9oO1VmHwREkUT6ffru3EBNWbmvqFnS5VLLC5jrc26_RvQ@mail.gmail.com>
From: Blaok <chiblaok+wireguarddev@gmail.com>
Date: Wed, 15 Jan 2020 15:49:28 -0800
Message-ID: <CANGvTakxGM0PucspTGnDTSezMA-C-U9t2sJb7U51kzTxJpdGXQ@mail.gmail.com>
Subject: Re: Data Connection Lost Win10 (Server) Win10 (Clients) 37
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
X-Mailman-Approved-At: Thu, 30 Jan 2020 02:54:05 +0100
Cc: eric brandl <ericb0813@gmail.com>,
 WireGuard mailing list <wireguard@lists.zx2c4.com>
X-BeenThere: wireguard@lists.zx2c4.com
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Development discussion of WireGuard <wireguard.lists.zx2c4.com>
List-Unsubscribe: <https://lists.zx2c4.com/mailman/options/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=unsubscribe>
List-Archive: <http://lists.zx2c4.com/pipermail/wireguard/>
List-Post: <mailto:wireguard@lists.zx2c4.com>
List-Help: <mailto:wireguard-request@lists.zx2c4.com?subject=help>
List-Subscribe: <https://lists.zx2c4.com/mailman/listinfo/wireguard>,
 <mailto:wireguard-request@lists.zx2c4.com?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

I have been using v0.0.38 for a week and haven't experienced any
problem. Thank you so much!


On Tue, Jan 7, 2020 at 11:41 PM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
>
> Thanks for the reports. This should be fixed in v0.0.38. Please let me
> know the results of your tests.
>
> Jason
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
