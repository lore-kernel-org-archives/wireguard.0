Return-Path: <SRS0=Q0ZK=WW=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4973C3A5A1
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 26 Aug 2019 02:09:01 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBF5320673
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 26 Aug 2019 02:09:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="XZJmQ7KF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DBF5320673
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 173b4ccf;
	Mon, 26 Aug 2019 02:08:59 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0015baad
 for <wireguard@lists.zx2c4.com>;
 Mon, 26 Aug 2019 02:08:57 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4ba2ee9a
 for <wireguard@lists.zx2c4.com>;
 Mon, 26 Aug 2019 02:08:57 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 01ef58d1
 for <wireguard@lists.zx2c4.com>;
 Mon, 26 Aug 2019 01:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=h7A1Y38m0xW+vV3JiYxYSc2KvxM=; b=XZJmQ7
 KFbDDiTwC+1mkNjhtJbJ9W1WkGJuIRXkgDO3hFRvjtqWTwwNl4TXpv+awjfW+mah
 jEzg5KXjJpLcS/sbdXLexdUa/TVVBXo3/Zzxlzr0KuRtt4609TFJk2dZzVgs6/gU
 DxlQ6tNC/5UiVWnX1Op7Uie0DhzHFIbJ9irhHcVASQhrvymIs1fmye4+H+bBExWp
 1ofP5tFDrebc9ykbIXGZY0RGL/Hx7861bQcgqDKyOXd3xA/AjmWz71geA4Pk4R8q
 zS6rGA7GNdDbC9GmaM7gxNI4JXJjYK8cLHlx4cAqxcK2eUgmNx9XEFTCd9YWUwNW
 of3+pwqDVm1W6sqA==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 49420412
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 26 Aug 2019 01:27:05 +0000 (UTC)
Received: by mail-ot1-f49.google.com with SMTP id b1so13778010otp.6
 for <wireguard@lists.zx2c4.com>; Sun, 25 Aug 2019 19:08:56 -0700 (PDT)
X-Gm-Message-State: APjAAAW3XAmQotdX5QRdPu1dZiZhZj+7fcdPEbpQH31XfMmdglUuoCtR
 eR7bwuLx/YHE6vneElN/UvpVQWrauD8z8qwuGWM=
X-Google-Smtp-Source: APXvYqxhdLzp06VUPlPGCSn6ZBjMnLykMxgXh0CUoeUtgwER7AtvfC36YDDb7TIvyRZkJN1Xf5JE9ZX9BhLX1NfLFxQ=
X-Received: by 2002:a05:6830:10c7:: with SMTP id
 z7mr13503367oto.243.1566785336176; 
 Sun, 25 Aug 2019 19:08:56 -0700 (PDT)
MIME-Version: 1.0
References: <CANH_QeanVTjMG1gsps0Boj2vOUBCQqReH+u84su1--_t-QyiJA@mail.gmail.com>
 <CAHmME9romoNCJKaNfQXETG2GE+3mcVjEOkuu6+P4on-xXobEjw@mail.gmail.com>
 <CANH_QeYk=1HyuOFgg2_1YxHNyR9keWH883BD90bKvQn3im497g@mail.gmail.com>
 <CAHmME9pxw2u=Su1jccf58iFPqvfY-opCSEJ3_TLtzjAA3tgYQw@mail.gmail.com>
 <CANH_QeaEDZ-UMZ_G_Zem7HhVBBZf7gaK1VnTZjTgVd+w1Th1pA@mail.gmail.com>
In-Reply-To: <CANH_QeaEDZ-UMZ_G_Zem7HhVBBZf7gaK1VnTZjTgVd+w1Th1pA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 25 Aug 2019 20:08:45 -0600
X-Gmail-Original-Message-ID: <CAHmME9pLLpPTJ+f2r0t0gh08nTrKZ8qGLgoL4o5NFoaUj_1KGQ@mail.gmail.com>
Message-ID: <CAHmME9pLLpPTJ+f2r0t0gh08nTrKZ8qGLgoL4o5NFoaUj_1KGQ@mail.gmail.com>
Subject: Re: Linux kernel 5 different behavior
To: Vasili Pupkin <diggest@gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

On Sun, Aug 25, 2019 at 2:04 PM Vasili Pupkin <diggest@gmail.com> wrote:
>
> Usage of fwmark is my current workaround. If the same user id of an
> outer packets is not a bug then ignore it.

I can see arguments both ways. Do you recall off hand the last kernel
version that had the prior behavior? I'd like to try to find the
commit and read the rationale upstream.
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
