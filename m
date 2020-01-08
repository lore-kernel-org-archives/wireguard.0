Return-Path: <SRS0=tlKF=25=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CED74C00523
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  8 Jan 2020 07:41:22 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E2B2F2053B
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  8 Jan 2020 07:41:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=zx2c4.com header.i=@zx2c4.com header.b="IaMGHAyw"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E2B2F2053B
Authentication-Results: mail.kernel.org; dmarc=pass (p=none dis=none) header.from=zx2c4.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 51f6824d;
	Wed, 8 Jan 2020 07:41:09 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 85de6964
 for <wireguard@lists.zx2c4.com>; Wed, 8 Jan 2020 07:41:08 +0000 (UTC)
Received: from frisell.zx2c4.com (frisell.zx2c4.com [192.95.5.64])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5496d496
 for <wireguard@lists.zx2c4.com>; Wed, 8 Jan 2020 07:41:08 +0000 (UTC)
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0c210127
 for <wireguard@lists.zx2c4.com>; Wed, 8 Jan 2020 06:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=zx2c4.com; h=mime-version
 :references:in-reply-to:from:date:message-id:subject:to:cc
 :content-type; s=mail; bh=awrvWZhxD16+QlkaUwxvViyS6uc=; b=IaMGHA
 ywgUV+urh5wR0h5a8sNVmdcrwTaP3SA7yk4gZ860tEt5chS7V2/wo+Wx139Hy/zj
 bqE0AARFpWVvKZXXX9HcTMvr/ioMomteKvw5rBzc8dBBM0eJHCty/obp0PvWulm2
 eJ2ihPk/neeZ8oJNvtx4tHNWq1NxB5HmTjY1WLeuu33rkNs3lHH0SH384eInqHM8
 Xyy2QC6TU0Vf56fmQJ32kUpCvTwTWV0kk7ouoGGfFjswZLEuB/H8hQOsUF5V9BkN
 7g3w25znueobv24fRukbvFs8t23kyDCCRSMPH/SKRKDkU1TB1BOfgVl1GdlHUclk
 CJDsnd+BvWD/Ye/w==
Received: by frisell.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 67c0d7eb
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 8 Jan 2020 06:41:53 +0000 (UTC)
Received: by mail-ot1-f52.google.com with SMTP id r9so2640052otp.13
 for <wireguard@lists.zx2c4.com>; Tue, 07 Jan 2020 23:41:07 -0800 (PST)
X-Gm-Message-State: APjAAAWPd0z6T/vsSU7cgkoISmLMlXVuyYHBADcyz8xnQ1kOfHjzrKRW
 d906E9ZmJiqhQlV70JjZEiYifUlCkLEzTTIgnis=
X-Google-Smtp-Source: APXvYqw26aeSK3oPYwJ0F2yqzUHbe2s4VnhmigATyA+64OIdTaJ9t0kvhcUEqJ64AlO6hM8FXFLS3QhbWg3a68P5BvE=
X-Received: by 2002:a9d:6745:: with SMTP id w5mr3308767otm.52.1578469267283;
 Tue, 07 Jan 2020 23:41:07 -0800 (PST)
MIME-Version: 1.0
References: <CALXT2kFp9SPFELS97vHJFndGH7cFh0=gjC1h9Tuv2LgSMHeJ-Q@mail.gmail.com>
 <CANGvTamn0NJYumfXWvzGYVvoWaXdmox8rLMTFnMmZvOoNaz__g@mail.gmail.com>
In-Reply-To: <CANGvTamn0NJYumfXWvzGYVvoWaXdmox8rLMTFnMmZvOoNaz__g@mail.gmail.com>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Wed, 8 Jan 2020 02:40:56 -0500
X-Gmail-Original-Message-ID: <CAHmME9oO1VmHwREkUT6ffru3EBNWbmvqFnS5VLLC5jrc26_RvQ@mail.gmail.com>
Message-ID: <CAHmME9oO1VmHwREkUT6ffru3EBNWbmvqFnS5VLLC5jrc26_RvQ@mail.gmail.com>
Subject: Re: Data Connection Lost Win10 (Server) Win10 (Clients) 37
To: Blaok <chiblaok+wireguarddev@gmail.com>, eric brandl <ericb0813@gmail.com>
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

Thanks for the reports. This should be fixed in v0.0.38. Please let me
know the results of your tests.

Jason
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
