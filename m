Return-Path: <SRS0=EmC4=DQ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA2E3C433E7
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  9 Oct 2020 12:21:09 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CBC8E2184D
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  9 Oct 2020 12:21:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="pDFUeC9B"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CBC8E2184D
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bc269adb;
	Fri, 9 Oct 2020 11:47:58 +0000 (UTC)
Received: from mail.zx2c4.com (mail.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 567a5ebf
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 9 Oct 2020 11:47:56 +0000 (UTC)
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4a161b88
 for <wireguard@lists.zx2c4.com>; Fri, 9 Oct 2020 11:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=uPfQSYxwiRSfia15Qqxog0qYcho=; b=pDFUeC
 9BZj6M0YNo5d+RoQ90pM9SCwegHP6l9eQxcBf6NIwZeTBS6JcirVtnoL9oefRWR6
 81Dip6cMm3iZYbb48FfNO12wimDN4ZXBAoPgCw9Fk1pI1bqd2BnLWjRRDcibM4+/
 KNJ61vlQ8f4dKHsFUb87LUQvCQ3gwb3WQxyV2V+I/5vSgbGxTJJPzaMmA1xa3wh2
 1UPMd/R/NI1ulUscOHHfTDyS4cDCNuacPMDQx4zdp0xE33UpuarYoQGZeaHFa9lY
 2m3peQBMuNp2M2EoFFdF/73J6VtYcf8M/JCII2syZoJxppiZKi5eIyjLFQuEnO1N
 h6/YFtSKtt3FthWg==
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id f64c52b3
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Fri, 9 Oct 2020 11:47:55 +0000 (UTC)
Received: by mail-io1-f44.google.com with SMTP id 67so9835983iob.8
 for <wireguard@lists.zx2c4.com>; Fri, 09 Oct 2020 05:20:48 -0700 (PDT)
X-Gm-Message-State: AOAM530VXIm0oypa9YAHufflgwl/dLCIG6/gCpLtLyK0RlQjloUoiW5g
 OpNRX5ORODhdbnBEzu8CKGjWwffnoPj2I/ehd40=
X-Google-Smtp-Source: ABdhPJwOT+6IqTkJXqZccaw1YrTAg4uLtDcqJIQFbJlWOr6CjkbkY50hlSTnlLYtA4Ow3XMidWuQn+DZaTz2QGpXQ10=
X-Received: by 2002:a05:6638:c3:: with SMTP id
 w3mr9890208jao.108.1602246047898; 
 Fri, 09 Oct 2020 05:20:47 -0700 (PDT)
MIME-Version: 1.0
References: <be4e9109-399b-5520-e6fd-e7163350aaf0@riseup.net>
In-Reply-To: <be4e9109-399b-5520-e6fd-e7163350aaf0@riseup.net>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Fri, 9 Oct 2020 14:20:37 +0200
X-Gmail-Original-Message-ID: <CAHmME9oe5e84gpsGjGYkWHZoOLYKX1xUZBNzM7g0R6cEHg5JUg@mail.gmail.com>
Message-ID: <CAHmME9oe5e84gpsGjGYkWHZoOLYKX1xUZBNzM7g0R6cEHg5JUg@mail.gmail.com>
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

This seems like a weird inconsistent hack. Strip should return
something that is acted on by something else, and not also do things.

But I have another suggestion on how to achieve what you want:

wg syncconf wg0 <(printf '[Interface]\nPrivateKey=%s\n' "$(wg show wg0
private-key)"; wg-quick strip wg0)
