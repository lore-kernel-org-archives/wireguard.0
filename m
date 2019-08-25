Return-Path: <SRS0=QHSY=WV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ADB4C3A5A1
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 18:53:15 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05552206E0
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 18:53:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="mZOmBVEb"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 05552206E0
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 720150ea;
	Sun, 25 Aug 2019 18:52:33 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a77b8771
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 18:52:33 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4967b800
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 18:52:33 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 768ad28e
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 18:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=hQbSlawA2eLzaIhRN+m8BoZApUE=; b=mZOmBV
 EbBIdQkIb7eX983awfS8/Zy/wDZOeMdJirxKkmmnoUxhWJgZOtluyk+1AiXrdC3N
 Z0sYvDy1jXFpWVYrSMeEYI3TU7mvDRvAuKqXj6n962ypEfdegCwkECmFe6mANdgk
 WTm9Tph2yDCtXqYcVYME6S9KJSsDsU+7fCArRbMaUUsvOcxP8G7cU98SNHXaPP1u
 PrQLQ49Pgxb6MWxhGijhKHGggZbn+si4qhVgHt7Uh4dBOv4YcoaVIdccDRKsQEij
 AdHvn5DsqbSJettNLRcIIwXpah6e2ZBhfxaSYKg7ZQvwBATqi2jHAj/9w91BsiIn
 dCA53odGIJ+gSAaw==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 0f8e89cb
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 18:10:43 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id f17so13258174otq.4
 for <wireguard@lists.zx2c4.com>; Sun, 25 Aug 2019 11:52:32 -0700 (PDT)
X-Gm-Message-State: APjAAAXd/8HVkW3HyQPm8uF03iO4W9el589G2ZJbeh61/SDdKEz6hPgQ
 m/kYH6ONPvJxbcCeLHuWYiVXDxuEyEZc82nzOCY=
X-Google-Smtp-Source: APXvYqxvfUnQXalPBRNUwc18WFsDTDvJbrwCnGYTdwtjcKe6vJJ5by9QMFnG5ljGt84peakUlgg1vFLKADKutuwVxQw=
X-Received: by 2002:a9d:6854:: with SMTP id c20mr12721523oto.120.1566759152305; 
 Sun, 25 Aug 2019 11:52:32 -0700 (PDT)
MIME-Version: 1.0
References: <CANH_QeanVTjMG1gsps0Boj2vOUBCQqReH+u84su1--_t-QyiJA@mail.gmail.com>
In-Reply-To: <CANH_QeanVTjMG1gsps0Boj2vOUBCQqReH+u84su1--_t-QyiJA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 25 Aug 2019 12:52:21 -0600
X-Gmail-Original-Message-ID: <CAHmME9romoNCJKaNfQXETG2GE+3mcVjEOkuu6+P4on-xXobEjw@mail.gmail.com>
Message-ID: <CAHmME9romoNCJKaNfQXETG2GE+3mcVjEOkuu6+P4on-xXobEjw@mail.gmail.com>
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

Could you clarify? Do you mean that inner and outer packets were
marked differently in Linux < 5 but are now marked as belonging to the
same UID in Linux==5?
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
