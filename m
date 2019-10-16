Return-Path: <SRS0=F87Q=YJ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91696FA3728
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 16 Oct 2019 20:12:32 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6D0B218DE
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 16 Oct 2019 20:12:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="L4ZP+eKL"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D6D0B218DE
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ce4b66ed;
	Wed, 16 Oct 2019 20:12:30 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id c1bdda5c
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Oct 2019 20:12:28 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 34a63f7b
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Oct 2019 20:12:28 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d5f6a002
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Oct 2019 19:24:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to
 :content-type; s=mail; bh=Jk5E3I9m8u7HwetiERnSQ1gMuxo=; b=L4ZP+e
 KLLscKAzFAiUJyuFf7NchsiJHsb8Kz6cmQ8PrN520U7ARCFN5LO4RThU3N0q4/8m
 IiCMg8qLMB84aas7W4TFNDwhptdVC+RaA0Youl+Te31AFmAP2IJ9wgoAX85LO2Qn
 CVFhb6QPEkAd6e1aB4jenGS0GiNAgluG128X6Y/bwWNt/zG0hMYqW63JflGn5pEb
 BaZuKEmEXLnyKlu1fQv+vS01cJmUq9MBgluQAvxW81TjO2WuD8tHpopouCrpDELg
 PpD+3xHaQF5rqLVC8bePnyyLe7Gvdq9LsdVjSSTJFGtd88dz0A+2bZ3HaVCADUhh
 yPUKeQTvvRw2jOGQ==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 485f3eb6
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 16 Oct 2019 19:23:59 +0000 (UTC)
Received: by mail-ot1-f48.google.com with SMTP id 60so21309373otu.0
 for <wireguard@lists.zx2c4.com>; Wed, 16 Oct 2019 13:12:28 -0700 (PDT)
X-Gm-Message-State: APjAAAU+nXrl3PzF23tV3JnG81Vg6lvBkRgncYUW7yytbQsD3B63k+kY
 6HWZkKi2w/E031XD8C0W4wRcH8WhAKXl68wy3po=
X-Google-Smtp-Source: APXvYqwtQ5oYF607RkevU00oCAKNaWcY5R7OWPzYTgzFv1yBbIsj8pfFnBgNmdExXrl/6/D30vXMrWMSKnmLaPci5q0=
X-Received: by 2002:a05:6830:1bd9:: with SMTP id
 v25mr79412ota.52.1571256747552; 
 Wed, 16 Oct 2019 13:12:27 -0700 (PDT)
MIME-Version: 1.0
References: <CAHmME9rcxwHNwT33cQzP6pGf64YG1Sz5iJtjQcOyFGanQf-CMg@mail.gmail.com>
In-Reply-To: <CAHmME9rcxwHNwT33cQzP6pGf64YG1Sz5iJtjQcOyFGanQf-CMg@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 16 Oct 2019 22:12:16 +0200
X-Gmail-Original-Message-ID: <CAHmME9r1oxTF=LJejR-gRhkBTw-Zd9eK5pWuMbRLLN8sAjfP8Q@mail.gmail.com>
Message-ID: <CAHmME9r1oxTF=LJejR-gRhkBTw-Zd9eK5pWuMbRLLN8sAjfP8Q@mail.gmail.com>
Subject: Re: WireGuard removed from Google Play Store,
 rectification in progress
To: WireGuard mailing list <wireguard@lists.zx2c4.com>
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

Hi again,

I expected to send this email sometime next week due to usual Play
Store review process delays, but it seems like the attention the prior
email received has sped up the process considerably. This is a notice
that the app has been relisted on the Play Store in its usual
location: https://play.google.com/store/apps/details?id=com.wireguard.android
. Sorry again for any inconvenience this has caused users, or caused
developers who depend on the availability of our app for use by their
own users. We won't be making any similar changes unless we're certain
that we won't be delisted.

Regards,
Jason
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
