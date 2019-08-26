Return-Path: <SRS0=Q0ZK=WW=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: **
X-Spam-Status: No, score=2.6 required=3.0 tests=CHARSET_FARAWAY_HEADER,
	DKIM_INVALID,DKIM_SIGNED,FROM_EXCESS_BASE64,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91B72C3A5A1
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 26 Aug 2019 03:29:14 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BFBDF20828
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 26 Aug 2019 03:29:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.b="nYwDu4Wi"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BFBDF20828
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=bytedance.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 1f6408ce;
	Mon, 26 Aug 2019 03:29:12 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a46c95c1
 for <wireguard@lists.zx2c4.com>;
 Mon, 26 Aug 2019 03:29:09 +0000 (UTC)
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com
 [IPv6:2607:f8b0:4864:20::534])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f44be167
 for <wireguard@lists.zx2c4.com>;
 Mon, 26 Aug 2019 03:29:09 +0000 (UTC)
Received: by mail-pg1-x534.google.com with SMTP id e11so9680975pga.5
 for <wireguard@lists.zx2c4.com>; Sun, 25 Aug 2019 20:29:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=NDFHPBPa7PTAN251xJBD0lMQoT43f7FDyIxDCKajEEg=;
 b=nYwDu4WiBNKy+L9mJO/xaAsSB/a+dMWrvEIrxHs1/Rque6Izbh5fCLupdJWkKaS6rB
 NzOlwp8OsMCOUUXNPsH/d7tu9oySOUbelo/t+XMLwF+mmHoWJKT3zQ+E2hlEWh0PGChk
 /ttL2OTnBVYuu0eCgNbH6x09BlrF3ggJJ6RRXy7RzxhZ2c15TM0sjCiQt+/QzzCjzbhY
 issBK5wg9urGC4LLH2QrPDAKdEiD7OCh8/xjQBqoHnO6mLFCn8Vj5nbrCplu5jaGZljn
 a8ZWK5mBq5O59dXt7s2JnH9/h1y8WRpKvZPXtHPLY/ZykP3IqAqHRsSsFQ6XnAc93nUk
 X/hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=NDFHPBPa7PTAN251xJBD0lMQoT43f7FDyIxDCKajEEg=;
 b=pbaNw+qK+1hdIWyDIAhCyLS287fwElnxwD2JmU0rD249JPDUHZNt1Shfctz/nkTTV3
 rVwrQXVFj4JmN3+XwKTjChh+rHOOIbpE8sgF6803a4tyE2gm1x9j63IeB2at8EZBb4Sl
 Lr1Zg24/yrc+ugLdjl6h5YZEtebfaxflhMa3+M38eG30/tHOGDCT/eVV4apw5EvLdx5X
 Mr+FAG61O+pHrK3/tQuBsmho2YdON+4MDidwrjz4P7Jcp+WqRpOZFzAebIyGEs/2+7DS
 APVEi/8dlHBuv/tNeaSjoAXoYkd83kSuFVmRD9a1Ju83e4wAGpUQb27V7iePR3+V+SFg
 gMYQ==
X-Gm-Message-State: APjAAAUMjfesQACCLNO38eEnUiJ/K2yw7ELZ/v9Bmao1AnM62zMRrQg2
 thBw14yuQ3GKeVj0XPsuJOaqGw==
X-Google-Smtp-Source: APXvYqzPKj/lwNzeyDEZ/fogz/26CzXjtStMM6hNgAZ7ymPETjJM5dFtXnY97wz0lFzRcb78+irYdA==
X-Received: by 2002:a62:7d0d:: with SMTP id y13mr17267632pfc.150.1566790148636; 
 Sun, 25 Aug 2019 20:29:08 -0700 (PDT)
Received: from [10.2.209.63] ([61.120.150.75])
 by smtp.gmail.com with ESMTPSA id r23sm11072567pfg.10.2019.08.25.20.29.06
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 25 Aug 2019 20:29:08 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.11\))
Subject: Re: Re: [PATCH] tun: darwin: fix panic: close of closed channel
From: =?gb2312?B?wfW6o7Ox?= <liuhaichao@bytedance.com>
In-Reply-To: <CAHmME9rDLvQQNd0VO5_rrNMakxaXuYt9hKij+tqOJ5aOur3gQQ@mail.gmail.com>
Date: Mon, 26 Aug 2019 11:29:05 +0800
Message-Id: <3AEA86B2-D5B9-46ED-ADD0-6557F8BD471F@bytedance.com>
References: <5d625420.1c69fb81.9f8e7.70a4@mx.google.com>
 <CAHmME9rDLvQQNd0VO5_rrNMakxaXuYt9hKij+tqOJ5aOur3gQQ@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
X-Mailer: Apple Mail (2.3445.104.11)
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
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

SSB1c2VkIHRoZSBwcmV2aW91cyB2ZXJzaW9uLCBzbyB0aGlzIGJ1ZyB3YXMgdHJpZ2dlcmVkLiBC
dXQgd2h5IHNob3VsZCB3ZSBjbG9zZSB0dW4uZXZlbnRzIGluIHR3byBwbGFjZXMuCgo+INTaIDIw
MTnE6jjUwjI1yNWjrDIzOjIyo6xKYXNvbiBBLiBEb25lbmZlbGQgPEphc29uQHp4MmM0LmNvbT4g
0LS1wKO6Cj4gCj4gSSB3YXMgdW5kZXIgdGhlIGltcHJlc3Npb24gdGhpcyB3YXMgZml4ZWQgd2l0
aAo+IGh0dHBzOi8vZ2l0Lnp4MmM0LmNvbS93aXJlZ3VhcmQtZ28vY29tbWl0Lz9pZD02ZDc4Zjg5
NTU3OWIxMTRjOTNiZDQ5M2FkOGQ2MTMxNmZjNWRkMTVhCj4gCj4gV2hhdCBwcmVjaXNlbHkgaXMg
dGhlIGJ1ZyB5b3UncmUgc2VlaW5nPwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KV2lyZUd1YXJkIG1haWxpbmcgbGlzdApXaXJlR3VhcmRAbGlzdHMuengy
YzQuY29tCmh0dHBzOi8vbGlzdHMuengyYzQuY29tL21haWxtYW4vbGlzdGluZm8vd2lyZWd1YXJk
Cg==
