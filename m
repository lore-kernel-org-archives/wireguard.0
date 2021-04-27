Return-Path: <SRS0=T23V=JZ=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19734C43461
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 28 Apr 2021 00:43:13 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E5E361090
	for <zx2c4-wireguard@archiver.kernel.org>; Wed, 28 Apr 2021 00:43:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E5E361090
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d9f8024c;
	Wed, 28 Apr 2021 00:43:11 +0000 (UTC)
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [2607:f8b0:4864:20::433])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 01e531ea
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 27 Apr 2021 23:36:48 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id 10so7043986pfl.1
 for <wireguard@lists.zx2c4.com>; Tue, 27 Apr 2021 16:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:from:date:message-id:subject:to;
 bh=uMSA5zQN32AyuRcWGiBn8/U8oCJWShkUqgUfuBB6+7A=;
 b=kaZtmNWLumYk0XUKqv/vpE+u89C+kaWcWECuvOU+JoG/k6USH9B3O5xrIB+cFzV3PX
 ftGe8k7NZSvqVeITADzPCOJPEJ71oYa1v9pPpGyVn8asIorNdaGLe2e6QloI11HPgZ17
 RTb3qUI99qe3Z5yeUMOCK92gJ6KE5mhu+EFLbcif6lbqj1DjoJroopGuRQqVF3pTCDCf
 970di1x5G34get9i9Ig3gtb5JVB9wVGHPn/0+HKLOwKuAd2kQwpgEHe3xHPXFE/fCa+J
 TR6nCAFo0TKpkSClvKkwUqQJrc9FOQfHHaQ/ozHJdJrFPp647i2FNtRkVX1OGnBUJn6l
 7g9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=uMSA5zQN32AyuRcWGiBn8/U8oCJWShkUqgUfuBB6+7A=;
 b=DkpaLRsi5k5qka70kRqCEq41RaDZnjz2phK9yukyTN4vhPpQgyTRO51gUH2Arm3t3h
 S2+dnyLUYRcQspTYR9j9lygvOzPFSzjZcAgL6XLgQI5102uKlTBVlT18eWoV94UTAJuy
 qhWe1z/oYYU51vtw5oMfgRp76uUwJffF9/0FtFgFq7qBZT2Bqjdzw8J6nBHGSJt3fnq/
 hWD7f/v5rvgyQ5vyv7Fl/PqipwwoDEc6aHE65JBKTRAIBwo5t7K3IAeFwJ5mNpx8JpoU
 HcKO2fvGLysrrA5CRs54EnFaRdwYGqzIujabym9Tixa8XAxiDMHlcfvQ7vJidyDbX7kC
 QMLw==
X-Gm-Message-State: AOAM533EFf5L3vyUL9xc7w4PvNyLjlimTD21hHpU3TtIzvC3fJfv+lxm
 TP9ruVtdOdxoXZ1Ei1yxb9z2odzQ4KQ/zjcIFo2v+DkXqq8=
X-Google-Smtp-Source: ABdhPJwjmb+GBtoU1jNIzaXbaKeFoXUdq2KSKg0/cZ89fjF63yaLVo5OfocD7jUWpp4rukxvBXCoQW8nzNBzm3Gqv9g=
X-Received: by 2002:a63:4413:: with SMTP id r19mr23997701pga.75.1619566606726; 
 Tue, 27 Apr 2021 16:36:46 -0700 (PDT)
MIME-Version: 1.0
From: Christian McDonald <rcmcdonald91@gmail.com>
Date: Tue, 27 Apr 2021 19:36:36 -0400
Message-ID: <CADTMz0L9Xxuo+xeo4GEjjLCN5aOgBrLEJ3t=XE+JJPsyi0OBpA@mail.gmail.com>
Subject: Kernel Panic on FreeBSD 12.2 when downing an tunnel interface
To: wireguard@lists.zx2c4.com
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 28 Apr 2021 00:43:06 +0000
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

Greetings,

Here are my versions:

wireguard-kmod 0.0.20210424_1
wireguard-tools 1.0.20210424

I'm running the latest snapshot code (see above) on FreeBSD 12.2. I am
seeing kernel panics when tearing down tunnels using `wg-quick down`
and even `ifconfig wg0 destroy` when the interface has IPv6 addresses
assigned to it.

Any ideas?


All the best




--
R. Christian McDonald
M: (616) 856-9291
E: rcmcdonald91@gmail.com
