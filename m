Return-Path: <SRS0=YLBU=SV=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: *
X-Spam-Status: No, score=2.0 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MALFORMED_FREEMAIL,
	MISSING_HEADERS,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3206FC10F14
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 19 Apr 2019 00:21:15 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E59D214DA
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 19 Apr 2019 00:21:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QHxHueet"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7E59D214DA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 10ee9f63;
	Fri, 19 Apr 2019 00:21:12 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id e539d7d8
 for <wireguard@lists.zx2c4.com>;
 Fri, 19 Apr 2019 00:21:10 +0000 (UTC)
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 4e020bff
 for <wireguard@lists.zx2c4.com>;
 Fri, 19 Apr 2019 00:21:10 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id 4so4592800wmf.1
 for <wireguard@lists.zx2c4.com>; Thu, 18 Apr 2019 17:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:cc;
 bh=v3c8R8Tk+bJTVoRjCd6y7kalWKDSY/7ie2e5VKVN98o=;
 b=QHxHueetTF8h6fWriCwrhZTsOL5yuRkuy/2fsmXwRHtv5Ya86ybvfWrv5b8cD20e/y
 ngPoTeBS/k5HWLK1J1ROSI9r/CDxc9OvyAHyPWT981Bip0WKr9vjkOuAka5/gMg7O6Hr
 EdkpQWUCazCXvndnQL4+YTk5z7XummZ/uwfHX6nL9BSqd7ju6/Wq94pa1fX3QYbG+e9y
 xn9rVuMKE5ALjUD9qXFYrkI5Js7ksMQWbEIp1ZOTpeGMu0HHtBbx4BPAWuAuBLQqSHI8
 IG7qn6jiuC4X/oaqNigQHm7yLmT+0RnsEMeXMvG6Dr/gzfy6ugPmWhlgzyPTamVSeHB3
 azDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:cc;
 bh=v3c8R8Tk+bJTVoRjCd6y7kalWKDSY/7ie2e5VKVN98o=;
 b=LPNX2IFSWsA+S20dBpcrMrKYODYFPlwmqLpREFQ+yXdvXOz3vWkuQ0oM9SKKxUWjZN
 ndz+u7uebQEx/72nvga2tMGjr8hb9cGO44om/iH13D4pt5HJqyogwpzByddN+tNN1QuF
 2kluoGYoUsZNNsNNspN9bWckQ7oS6wP1yLGkmnfwW6fyJ8LE16YFtpGhUeTIkjaK32dJ
 xYeM0iqQL2zNaBnS8xV4uhGjyqGtXXuMEEdeHmjYcm6TB0M87LpgfsknqyPgyxoEj835
 mzFkWz35K9v5rW4YivYPSPMvweyRkp162J9pFvtcwApFVq+hCrGlRK8TZucFpoDHxFtL
 UuOg==
X-Gm-Message-State: APjAAAV82M6Ciy3+iLTQUGMOT7hB0xdvVtdPn7Av3XG6PiezMnf8LNOm
 /b9i4qq64wp4We5JW0bcytv5hPNJYKhpHE8w6Tmf+A==
X-Google-Smtp-Source: APXvYqzB+uT7hmWdgzCQF+sKECMraKtT4AbQX/AcxyHG0Xr43KD2G+kWdUA6DZ+v409tbVCmkiT9gv1fUnPwWCpA4wc=
X-Received: by 2002:a1c:9609:: with SMTP id y9mr571403wmd.27.1555633268071;
 Thu, 18 Apr 2019 17:21:08 -0700 (PDT)
MIME-Version: 1.0
References: <676a8baf337fbc174cd065143da771e3@mitteilung.com>
In-Reply-To: <676a8baf337fbc174cd065143da771e3@mitteilung.com>
From: d tbsky <tbskyd@gmail.com>
Date: Fri, 19 Apr 2019 08:20:56 +0800
Message-ID: <CAC6SzHJfx0Cc7mCu7oxynYCtngZRTsHH3cfYE3BxwsERocCw+g@mail.gmail.com>
Subject: Re: Feature Request for Multihomed Endpoints
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

Markus Grundmann <markus@activezone.de>
> I wish the endpoint was able to pick a explicit outgoing IP address to connect the other endpoint over the 802.3ad interface but the uplink interface address is not recommend for me. What do you think about it?

if you search the mail list, you will find this had been discussed
several times these years.  last year under rhel7 I could  make a
multi-home environment which wireguard can not work reliably.  however
I can not reproduce it under netns so can not debug it further.

I wonder if there is simple netns configuration to force wireguard
binding specific ip address?
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
