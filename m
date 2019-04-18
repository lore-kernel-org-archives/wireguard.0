Return-Path: <SRS0=UJiM=SU=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E61CC10F14
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 18 Apr 2019 14:06:43 +0000 (UTC)
Received: from krantz.zx2c4.com (krantz.zx2c4.com [192.95.5.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5CE2217FA
	for <zx2c4-wireguard@archiver.kernel.org>; Thu, 18 Apr 2019 14:06:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YvXVjnpf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5CE2217FA
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=wireguard-bounces@lists.zx2c4.com
Received: from krantz.zx2c4.com (localhost [IPv6:::1])
	by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 5b982197;
	Thu, 18 Apr 2019 14:06:25 +0000 (UTC)
Received: from krantz.zx2c4.com (localhost [127.0.0.1])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d27ae07e
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Apr 2019 14:06:21 +0000 (UTC)
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by krantz.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 97de732d
 for <wireguard@lists.zx2c4.com>;
 Thu, 18 Apr 2019 14:06:21 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id x3so1971982iol.10
 for <wireguard@lists.zx2c4.com>; Thu, 18 Apr 2019 07:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=to:from:subject:message-id:date:user-agent:mime-version
 :content-transfer-encoding:content-language;
 bh=jaENxN9KteEeqIWuiSX3kanAMt5teAbTg+vhxaMMgds=;
 b=YvXVjnpfpueCS/oYduGYDK6NRyNWhEeY+81B2EMHSf7PFZG72XzbdRdBvFsWL+P27h
 on2pfIvE8Ueivr7ahB2jGBQQF6oPn6SxXutBOFpiiqoYCXuvUyykucz7aardbCtP3htJ
 c37Pe2hYD7cinOfOHV90MEcQ4pqZ0bct4n3U7uu6Cq4+8LbEYNsYX6a9oKho9avm0CLR
 /uutQ3AblW0g/OGzszHEbpU5cWabp6Ex2xVtgtqUZ3xVYw4o+DsSqE4TwbqUGxcW7W8H
 TxaOwC6PbUjz0HrvQcEZgaNc8sa3tY3Dau/jaYJF/VS4hlh15zSbn5g1Fqz0euD7Px5L
 F8VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:to:from:subject:message-id:date:user-agent
 :mime-version:content-transfer-encoding:content-language;
 bh=jaENxN9KteEeqIWuiSX3kanAMt5teAbTg+vhxaMMgds=;
 b=DbNcPkpmd6nv91fu6mjtRW2s8qNMi5SUxSx88/la+1h+eOh/irxmuCLicqBej/1TNe
 Oxz81j1FRwJUhVQUkFTtd/C5xJlK/TeoIpEnxx9nwUxVvMnJCRqURId9rdJ/Hqm1pmw8
 APMUHaB+sSH1xwmpl+caWjdYfE39Y5UHAtK48L48I2111211LPJ8RAxALF/2KoEmgQX9
 Fn3TfuTHH8sQfjBbnn144iFBzhAjsBx5t/h+V3swAlyQGpp/7YRRahTbx2aDzu9B8/fX
 xUgPohIW7WzSb78MP+tggXAgCv9sM2Bq2YGjeELhTBZHcEv0c7uT7s11n5/bedWntNMa
 ZB8A==
X-Gm-Message-State: APjAAAU6uaA8knEIeKLxmRNO3LO0gnN9Zg860R3IIoYyIupKRX1WLkYb
 JopQ/BUv2SB/9EiS2+QyTrUgSgl4OMU=
X-Google-Smtp-Source: APXvYqz/RuJ5FCLmSKiYsuBspR0QIV/FvfApmDxSzvWo6R6F+oFPSJzqf5/TDkUIFoBVaODXRLjaqA==
X-Received: by 2002:a05:6602:2086:: with SMTP id
 a6mr35885070ioa.252.1555596380268; 
 Thu, 18 Apr 2019 07:06:20 -0700 (PDT)
Received: from ?IPv6:2600:6c4a:787f:d200:39db:2285:5c86:9ef3?
 (2600-6c4a-787f-d200-39db-2285-5c86-9ef3.dhcp6.chtrptr.net.
 [2600:6c4a:787f:d200:39db:2285:5c86:9ef3])
 by smtp.gmail.com with ESMTPSA id n26sm644406iog.23.2019.04.18.07.06.18
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 18 Apr 2019 07:06:19 -0700 (PDT)
To: wireguard@lists.zx2c4.com
From: Matt Layher <mdlayher@gmail.com>
Subject: Use of __kernel_timespec in userspace genetlink API
Message-ID: <f87c87a0-c5b4-9ee8-ba28-9ff575987f72@gmail.com>
Date: Thu, 18 Apr 2019 10:06:17 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Language: en-US
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: wireguard-bounces@lists.zx2c4.com
Sender: "WireGuard" <wireguard-bounces@lists.zx2c4.com>

Hey all,

I recently received a bug report for 
https://github.com/mdlayher/wireguardctrl which indicated that the 
timespec structure being returned from the WireGuard genetlink API was 
not of the expected size on a 32-bit machine.

It then occurred to us that the userspace-facing API is returning a 
"__kernel_timespec"; something I did not realize before:

https://git.zx2c4.com/WireGuard/tree/src/uapi/wireguard.h?id=91b0a211861d487382a534572844ff29839064f1#n38
https://git.zx2c4.com/WireGuard/tree/src/netlink.c?id=91b0a211861d487382a534572844ff29839064f1#n112

My C experience is very limited, and I have no experience working on C 
within the kernel, but is exposing a "__kernel*" type to userspace a 
normal procedure? I would have expected to see a regular timespec from 
linux/time.h, or perhaps a timespec64 in its place.

I can do some slightly more intelligent checking to fix the current 
issue with my library, but I wanted to check in and confirm that this 
API contract is correct.

Thanks for your time!
- Matt Layher

_______________________________________________
WireGuard mailing list
WireGuard@lists.zx2c4.com
https://lists.zx2c4.com/mailman/listinfo/wireguard
