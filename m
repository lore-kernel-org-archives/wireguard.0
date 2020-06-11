Return-Path: <SRS0=aF/C=7Y=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78629C433E0
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 11 Jun 2020 12:06:41 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D7EE920760
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 11 Jun 2020 12:06:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ginkel.com header.i=@ginkel.com header.b="rgkOKgoP"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D7EE920760
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ginkel.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2e780ee0;
	Thu, 11 Jun 2020 11:48:54 +0000 (UTC)
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [2a00:1450:4864:20::233])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b0971c04
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Thu, 11 Jun 2020 11:48:52 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id s1so6616376ljo.0
 for <wireguard@lists.zx2c4.com>; Thu, 11 Jun 2020 05:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ginkel.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bP6A0QFV2AKZ30bFQrr3Li7UkJDjzDUPeAa2SaMsPFE=;
 b=rgkOKgoP82l9/sFnZ4GCQKStu2DXO/FcECXRFUzijaLlNX/tKJFbiEH8RmXK0wNyFP
 R5dHeq0NP8wTIpgFbT7YOSnEzhKE/A1V92G7fEwYObw41LVfJ95UH29/Ddyz6jC1ExI2
 c35xkMQOT/fNBzmKpHrVTJcS05DN0N8qGrGZg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bP6A0QFV2AKZ30bFQrr3Li7UkJDjzDUPeAa2SaMsPFE=;
 b=PpNAWWe+fEEQXC0mi3QPvxuohvGaXGg7PXZMfF7/jMldUc4DAFE6rKj183dQJWfWYu
 Bfp1tlagt02k+IiPEBmMBpzo9p/uI923dGOP/uFMZQcz8FAs7V4cETb+nEUDBpn+xoyr
 Aeh5JYp+r1D4srb6m+iOojcCqwQusygdZhkItxN8Fo44x79HWmfD2Bigirc3/Qe8TRv/
 F3v3DUSrqv+Ow+xhFwk2+36Q1O4fApZ+zTlpFIjuXGBH/0aWmBlA/rFET+8dG2CxlA8l
 vYLQefZST187K+Upq2/+fvOFBmEM2AnC24y+nZlQvwPBTPDnQoepbP3gw23JanydF/bH
 QWFA==
X-Gm-Message-State: AOAM532GD1t++9sKa79hlP793EnQnwLPxZ9+XqYJxu+YQe46sL9aXTwh
 4gWEwWKxbF5iOWfyw0UWiJiW31YXlFps11v0HmfRRA==
X-Google-Smtp-Source: ABdhPJwuZGwgkZ3PamL6Zb8x/kfD+OS3lMQ8ArLH6k4zxbhCpc/Jf8pfr42T0yAUUNxWmaKE/kAUXZXa+MTzRjEKmCc=
X-Received: by 2002:a2e:309:: with SMTP id 9mr4373294ljd.385.1591877169724;
 Thu, 11 Jun 2020 05:06:09 -0700 (PDT)
MIME-Version: 1.0
References: <CANvSZQ97BG02tHyTUBf46XUfJKXArx-gaKe-R2ao0UEUoh55LA@mail.gmail.com>
 <CAHmME9qUaMon2-e9tM=fko0zf=Z==HNNXiLrh8RxyURo+VW=Yw@mail.gmail.com>
In-Reply-To: <CAHmME9qUaMon2-e9tM=fko0zf=Z==HNNXiLrh8RxyURo+VW=Yw@mail.gmail.com>
From: Thilo-Alexander Ginkel <thilo@ginkel.com>
Date: Thu, 11 Jun 2020 14:05:53 +0200
Message-ID: <CANvSZQ-H6JA4haPfD5iLzCRGcNqmeW3S4YZ01fa1bPUX2+dOEw@mail.gmail.com>
Subject: Re: Ubuntu 18.04 kernel 4.15.0-106-generic breaks
 wireguard-1.0.20200520
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>, unit193@ubuntu.com
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

On Thu, Jun 11, 2020 at 10:29 AM Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> Fixed: https://lists.zx2c4.com/pipermail/wireguard/2020-June/005480.html

Excellent, thanks a lot!

Regards,
Thilo
