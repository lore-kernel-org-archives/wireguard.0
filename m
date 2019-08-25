Return-Path: <SRS0=QHSY=WV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21390C3A5A1
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 15:52:10 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B59B22080C
	for <zx2c4-wireguard@archiver.kernel.org>; Sun, 25 Aug 2019 15:52:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="vYZYFCIg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B59B22080C
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 26833b27;
	Sun, 25 Aug 2019 15:51:07 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7a8b42ca
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 15:51:05 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 37d36469
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 15:48:02 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 2e1124f7
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 15:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=hweLHcTUMbcybEd/PzjhpFGFx1w=; b=vYZYFC
 Igc07Tj7wM/UDDS0yatWt3nq6I3/WIFAknmmwG8u2AiHtS3U/Z97YrCSPBjCdfS0
 ygN7eTlaMsVKTEe+HwlU4PrN2oz0/38G7g5BxzPiEqQtf8/GCqacvti3Lywxa5WY
 61OqqfBnYGyTIykb1Pa07u4NFrNSSOJWh73sothBb+SH0zqFZmik9Pxsl9kHkLOM
 GMQEg1/Fy3ui65mPCG+YqI1kF4EkqOV4PeSKug482H3K0IhYYxAAGnnAEEnm17DJ
 TgNYSnZJUNoRuveP9+jVNFM5NVz74vFt9JUoecU0gveSiobo6jWKQF+LacFhzFaD
 Z5qQhtfFIeM0OU+Q==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 76488177
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 25 Aug 2019 15:06:14 +0000 (UTC)
Received: by mail-ua1-f54.google.com with SMTP id k7so4911112uao.6
 for <wireguard@lists.zx2c4.com>; Sun, 25 Aug 2019 08:48:02 -0700 (PDT)
X-Gm-Message-State: APjAAAXVKg+kJk/lJ6NwX7leckuMABBty1RCOlmNOcY/1fJXyFczFzNH
 +E5hJK5aInmiye50NZL1xrqT1fSlTpUfq/q29wA=
X-Google-Smtp-Source: APXvYqwE1qL1GrTmqO3Xidi292zHfrNhPVPsMAdaVA4ClpcTfJOHGrFQ9lib8rHJx4S1/gdxEStn6JO0rf4Fk3kboIw=
X-Received: by 2002:ab0:31c7:: with SMTP id e7mr1188361uan.55.1566748081715;
 Sun, 25 Aug 2019 08:48:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAMaqUZ3z8i2TVPgO6iuGrALueX2kvHLufH7AXCFDXW3T6fBTLA@mail.gmail.com>
In-Reply-To: <CAMaqUZ3z8i2TVPgO6iuGrALueX2kvHLufH7AXCFDXW3T6fBTLA@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Sun, 25 Aug 2019 09:47:50 -0600
X-Gmail-Original-Message-ID: <CAHmME9rnYwxVOQ0dXm-_hPzc8kHNA5whFgWZfaQ0=BsvB12O4w@mail.gmail.com>
Message-ID: <CAHmME9rnYwxVOQ0dXm-_hPzc8kHNA5whFgWZfaQ0=BsvB12O4w@mail.gmail.com>
Subject: Re: Are cookie-required handshakes at least REKEY_TIMEOUT long?
To: Reid Rankin <reidrankin@gmail.com>
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

Yes, to prevent certain types of DoS. Most packets only move around
the timer state machine, but don't actually result in a direct action.
Rather, a timer firing sometime later is what starts an action. In the
case of cookies, the cookie is used in the subsequent message. See
section 6.6 of https://www.wireguard.com/papers/wireguard.pdf
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
