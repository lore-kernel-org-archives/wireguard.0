Return-Path: <SRS0=t+97=OC=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=3.0 tests=BAYES_50,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C864C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 12 Sep 2021 14:18:38 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 777576108C
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 12 Sep 2021 14:18:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 777576108C
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 51adddbc;
	Sun, 12 Sep 2021 14:18:35 +0000 (UTC)
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 37110a74
 (TLSv1.2:ECDHE-ECDSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 12 Sep 2021 14:18:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5879561050
 for <wireguard@lists.zx2c4.com>; Sun, 12 Sep 2021 14:18:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="VNsLERN3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1631456311;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wOWhFIuIi7OGRwOCGpJWMyxUVbfKKpKf4/Fm7t31oVI=;
 b=VNsLERN37ReARabb+iAjmclND2yk9wBr88Zsu0SoKRaPagi/QrXGrNKs0zQKBx1a+4/+Cm
 yI7mfhgs+NwnI0OEa29nxqpC+T+1aQmrAdpJGNwaekZX9C+/qQotW9HkojYeOr2e9aEY0Q
 aF/ePNv0Gf48YHGCNdQ09tGjIKiomaA=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 3c257e1a
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 12 Sep 2021 14:18:30 +0000 (UTC)
Received: by mail-yb1-f180.google.com with SMTP id y13so14807926ybi.6
 for <wireguard@lists.zx2c4.com>; Sun, 12 Sep 2021 07:18:30 -0700 (PDT)
X-Gm-Message-State: AOAM5310Q+ZR4+77ZWTARNT2tF680MFZfpvpdP9ZSLYwiPATlpfNYPz8
 dYTExcT/1+eQrJJVeoB0xwlYkzRb8vxwCPfV7OI=
X-Google-Smtp-Source: ABdhPJxYwarydMQMvO7On59uSod9mO/feMLm/1MZQsZB5HAjjqhVMBBViB9CaLuxAaJlrS1B8+r8JRx3RuG+PcYt4Qk=
X-Received: by 2002:a25:8082:: with SMTP id n2mr9609469ybk.79.1631456310170;
 Sun, 12 Sep 2021 07:18:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7110:9051:b0:f4:e5bd:7c83 with HTTP; Sun, 12 Sep 2021
 07:18:29 -0700 (PDT)
In-Reply-To: <CAKmhVkpNf0b54udsaB26W7a8ivct5RO66CF-NAhYZ+FSaGHNGg@mail.gmail.com>
References: <CAKmhVkpNf0b54udsaB26W7a8ivct5RO66CF-NAhYZ+FSaGHNGg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 12 Sep 2021 16:18:29 +0200
X-Gmail-Original-Message-ID: <CAHmME9q9bVNfHSgNVcc+a1stXoWpotrYu_0W_55hvo8KMQoVaQ@mail.gmail.com>
Message-ID: <CAHmME9q9bVNfHSgNVcc+a1stXoWpotrYu_0W_55hvo8KMQoVaQ@mail.gmail.com>
Subject: Re: Hiring: Free Software Network Security Engineer
To: buddybalaa@gmail.com
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

Please do not advertise on this mailing list.

[There is no need to send a follow up email to this thread.]
