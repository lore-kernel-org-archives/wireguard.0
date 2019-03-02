Return-Path: <SRS0=972F=RL=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8F76C43381
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  8 Mar 2019 15:30:41 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EEF40208E4
	for <zx2c4-wireguard@archiver.kernel.org>; Fri,  8 Mar 2019 15:30:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=pcfreak.de header.i=@pcfreak.de header.b="hdoYpVwl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EEF40208E4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pcfreak.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 94525c00;
	Fri, 8 Mar 2019 15:18:54 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id bf3a5534
 for <wireguard@lists.zx2c4.com>; Sat, 2 Mar 2019 20:40:03 +0000 (UTC)
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 49e87ade
 for <wireguard@lists.zx2c4.com>; Sat, 2 Mar 2019 20:40:03 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id q1so1397260wrp.7
 for <wireguard@lists.zx2c4.com>; Sat, 02 Mar 2019 12:50:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pcfreak.de; s=google;
 h=mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=Q4r7XqVB3tgyiqxKIxnIPuO3/XhKeI0sZrKXmwP3TS0=;
 b=hdoYpVwlb/cmrA2TPYAYdtsw1TJY8vGq5s/7lB1IvNRC+Wd2V1TBtGPs94dTUlYMSC
 uwl9S3mgAEpuZWEK70CbiECwPOYsdWEF1XvwEOTOGsB8ZOZhSTFyRXdstmpUgjhCX2YA
 /iNCJnL0cz1zluYGg3jGYfTZpRmyI6i9e5AgA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
 :content-transfer-encoding:message-id:references:to;
 bh=Q4r7XqVB3tgyiqxKIxnIPuO3/XhKeI0sZrKXmwP3TS0=;
 b=qyAgen0AU4GrPYqlnQSKRcktyrMPL4wV3dRMzc2tM7wSuVTszA4x4FwuOM2ULHsIZT
 qyIWemyh9bq2tQ4nYUvY6WD4PXvJmT/EYR0qNQ6feXsjsaVYGiibWs6yRDS7fWo1K0Dg
 gNVclifv7jrIw4JSaavl6VwXHC5PHZZs2iEGhOLVeUCVtPqSVJ59kbKA/zCOPDE4Qbax
 x1EAV4FWxk5/JkwRjJVQW3tdhd+ATQabTD7I/PzbNIyVvIWRK3JNpDDcV2U5Ob+K1UA9
 YUFyhpHQj2orXnZAtedmXPEZxqsHhn08Dq6onjMDPThCBLkTL2Btg2YnEB2IQmWwjjkf
 B19w==
X-Gm-Message-State: APjAAAXHX06xnryg/NKGZ23xW8zOctXNIpeSrumgTCsncyeBLpCdUlCG
 ux1XAwV1Vb3KI8cHqDdfT/pn0A==
X-Google-Smtp-Source: APXvYqxUgLaKSGxsmIKLmUvABs9za0a1U+LxJ5+64cOHmcBJmtfOHeISb3JJpDtMGruHtmRtfjB5hA==
X-Received: by 2002:a5d:6288:: with SMTP id k8mr8165060wru.173.1551559801854; 
 Sat, 02 Mar 2019 12:50:01 -0800 (PST)
Received: from [192.168.178.41] (p4FC72A06.dip0.t-ipconnect.de. [79.199.42.6])
 by smtp.gmail.com with ESMTPSA id
 z10sm1442269wml.39.2019.03.02.12.50.00
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 02 Mar 2019 12:50:01 -0800 (PST)
Mime-Version: 1.0 (1.0)
Subject: Re: iOS WG Battery Life
From: Mailing Lists <mailinglists@pcfreak.de>
X-Mailer: iPhone Mail (16D57)
In-Reply-To: <2iVkG0SJ64643A39NC7WLPcFxQc4oevInPxiNTvr0tixLQMLV3DyvvwNBLqj-tTk95sykibLeTPEPgDK1PvH4b-FS_YWR3kO9I3DLWuealE=@protonmail.com>
Date: Sat, 2 Mar 2019 21:50:00 +0100
Message-Id: <58158D37-9937-4BA2-B89B-A63DF8BA03A1@pcfreak.de>
References: <zk1gAdr9rlJCh4vzh4DYSc11v_Ja4r_9xYurdAcwFsa50g2zMxHskd5Nb0leXZKUZrCqV3YIZFI5pNYptUGXTyQBIl5zWoF_N306lQKO_tg=@protonmail.com>
 <CAKXLc7dop2Q7cS0FJ=c0fA4os6HTZQHWuuqPxzb4bygsiRNu6Q@mail.gmail.com>
 <1cY0xL4k2A_qU-I2aF2Oz5uEt2LP_i6oCVA5H5rAsRet4lY1MU8GkCQWOXy8OYSZKGtprlH3lZorUozIOKChzb201YR8fdcMDsp5OS9zT1E=@protonmail.com>
 <EA2CDA40-8988-4C4F-B848-B2F7C6D8716C@lonnie.abelbeck.com>
 <2iVkG0SJ64643A39NC7WLPcFxQc4oevInPxiNTvr0tixLQMLV3DyvvwNBLqj-tTk95sykibLeTPEPgDK1PvH4b-FS_YWR3kO9I3DLWuealE=@protonmail.com>
To: kolargol <kolargol@protonmail.com>
X-Mailman-Approved-At: Fri, 08 Mar 2019 16:18:46 +0100
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
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

what about uninstalling all vpns and try over night?

via Smartphone

> Am 02.03.2019 um 20:54 schrieb kolargol <kolargol@protonmail.com>:
> 
> 
>> Possibly, is PersistentKeepalive defined at the "server" endpoint for your iOS peer ?
>> 
>> I would expect a measurable additional battery usage if either peer endpoint had PersistentKeepalive defined (non-zero).
> 
> Both server and peer have PersistentKeepalive disabled, there is no fancy apps runnign in backgroud - and i am using exac same WiFi and VPN endpoint (for OpenVPN and WG comparision).
> WiFI connection is stable and have strong signal, same with LTE.
> The battery grap shows sharp down in the night as something continuesly draing battery (here wg)
> How can i debug it ?
> 
> _______________________________________________
> WireGuard mailing list
> WireGuard@lists.zx2c4.com
> https://lists.zx2c4.com/mailman/listinfo/wireguard
_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
