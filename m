Return-Path: <SRS0=O1+2=M3=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A4D3C4338F
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  4 Aug 2021 02:22:03 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 66D1860F01
	for <zx2c4-wireguard@archiver.kernel.org>; Wed,  4 Aug 2021 02:22:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 66D1860F01
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=theoks.net
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 13dd2516;
	Wed, 4 Aug 2021 02:20:58 +0000 (UTC)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [2607:f8b0:4864:20::631])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a323d1b6
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Wed, 4 Aug 2021 01:51:22 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id j3so1273491plx.4
 for <wireguard@lists.zx2c4.com>; Tue, 03 Aug 2021 18:51:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theoks.net; s=google;
 h=from:subject:to:message-id:date:user-agent:mime-version
 :content-transfer-encoding:content-language;
 bh=MRsLU8/9oiqUjKkHHNSFpm2ExhioTOB0T/RxQSGiXk8=;
 b=eJTb5HB3d46lO5dt2Nk1OVfcnKH6R8YMhJ+D6DcqIycbxIg/tHGfBgcOAA77li4R5L
 lVFLoVdvJJ77soRztvH9i301Ffp9CsllUwTvv39LtEuadzlq8dcDLZ1ZE8KxzJTvk0Hb
 VA2+/LI/W/DbHtnbfX/n7VByptMeLDgij1+Bs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:subject:to:message-id:date:user-agent
 :mime-version:content-transfer-encoding:content-language;
 bh=MRsLU8/9oiqUjKkHHNSFpm2ExhioTOB0T/RxQSGiXk8=;
 b=ORGTyRIgoKV0oCMjuLpOAkQfjV6ljbfm+JVHjYKQbLE9mqv3BrEoWeiqu9ev4LqOgx
 vqeqmSQP1LrkIQGTejVCxSu5AdZiDp3uJcHbrTU3WizwuQ+qq0S8NIf4Rjdtibgo2j44
 Rm0q56DXeK8TjJnYwx+3gDOblf+AjFdIL3/pjBLq7lHds04ofcF1OMPuNjI2LvK6e8Pu
 btOnQSmJalwYqwjB3qRfr3TlhkNuaTDyu0vatKAxoVyvTjHnv09VaBSXXE4l7E9IWGrz
 iJGD9spa7CMxXl28qU715QKsDhj+POLWxx63pjGRTRZW6KTf2OzPlcVSApN9d4EQCwml
 rloA==
X-Gm-Message-State: AOAM5305an3Sd0PtxPFNL7sdAKqTg3KrXCd7lQIJ/3FYW85d8Kg1pWAj
 Nx70gqSZFApI9Lx+vF1YumcGV1ACs59OAQ==
X-Google-Smtp-Source: ABdhPJy0uNguMXYn0fMJ6PrKiA7XMmdTZAqd4ddhJVJTtEhtYcq2NZg05HQsjIMZaxdb3EQ51U0huA==
X-Received: by 2002:a63:e00b:: with SMTP id e11mr594220pgh.190.1628041879949; 
 Tue, 03 Aug 2021 18:51:19 -0700 (PDT)
Received: from ?IPv6:2601:601:ca80:4ec0:9da8:d6ed:514e:631e?
 ([2601:601:ca80:4ec0:9da8:d6ed:514e:631e])
 by smtp.googlemail.com with ESMTPSA id q7sm452994pjq.36.2021.08.03.18.51.19
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Aug 2021 18:51:19 -0700 (PDT)
From: Darren VanBuren <onekopaka@theoks.net>
Subject: WireGuardNT with a peer with a v6 endpoint address
To: wireguard@lists.zx2c4.com
Message-ID: <cfb04d23-8e07-53e6-1fca-2db52693eb84@theoks.net>
Date: Tue, 3 Aug 2021 18:51:19 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Mailman-Approved-At: Wed, 04 Aug 2021 02:20:57 +0000
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

Hello WireGuard list,

I was very excited to see that WireGuardNT was available to test with 
the WireGuard Windows 0.4 release and I jumped right on it. I have 
upgraded to 0.4.1 since then.

However, both from my desktop and laptop, where the laptop is on Windows 
10 build 19043 and the desktop is on Windows 10 build 19042, I'm not 
seeing even a handshake go out on the wire / air when I use a v6 
endpoint address for a peer, in my simple single peer configuration.
When I switch down to a v4 endpoint address for the peer, it does work. 
wireguard-go worked fine with the v6 endpoint address, and continues to 
work fine. Has anyone else seen this?

Thanks so much to the developers for the tremendous work on WireGuard in 
all its forms.

Here's the log from my laptop trying to handshake for a bit, I have 
censored my VPS' IP and cut the log after the 20 attempts to handshake:

2021-08-03 18:23:58.478: [TUN] [MainVPS] Starting WireGuard/0.4.1 
(Windows 10.0.19043; amd64)
2021-08-03 18:23:58.478: [TUN] [MainVPS] Watching network interfaces
2021-08-03 18:23:58.483: [TUN] [MainVPS] Resolving DNS names
2021-08-03 18:23:58.527: [TUN] [MainVPS] Creating network adapter
2021-08-03 18:23:58.532: [TUN] [MainVPS] WireGuardCreateAdapter: 
Creating adapter
2021-08-03 18:23:58.656: [TUN] [MainVPS] SelectDriver: Using existing 
driver 0.2
2021-08-03 18:23:59.170: [TUN] [MainVPS] Using WireGuardNT/0.2
2021-08-03 18:23:59.170: [TUN] [MainVPS] Enabling firewall rules
2021-08-03 18:23:59.170: [TUN] [MainVPS] Interface created
2021-08-03 18:23:59.178: [TUN] [MainVPS] Dropping privileges
2021-08-03 18:23:59.178: [TUN] [MainVPS] Peer 1 created
2021-08-03 18:23:59.190: [TUN] [MainVPS] Monitoring MTU of default v4 routes
2021-08-03 18:23:59.198: [TUN] [MainVPS] Setting device v4 addresses
2021-08-03 18:23:59.210: [TUN] [MainVPS] Monitoring MTU of default v6 routes
2021-08-03 18:23:59.210: [TUN] [MainVPS] Interface up
2021-08-03 18:23:59.210: [TUN] [MainVPS] Setting device v6 addresses
2021-08-03 18:23:59.270: [TUN] [MainVPS] Startup complete
2021-08-03 18:24:02.495: [TUN] [MainVPS] Sending handshake initiation to 
peer 1 ([2605:6400:20:xx:xxxx::1]:56780)
2021-08-03 18:24:07.664: [TUN] [MainVPS] Handshake for peer 1 
([2605:6400:20:xx:xxxx::1]:56780) did not complete after 5 seconds, 
retrying (try 2)
2021-08-03 18:24:07.664: [TUN] [MainVPS] Sending handshake initiation to 
peer 1 ([2605:6400:20:xx:xxxx::1]:56780)
2021-08-03 18:24:12.753: [TUN] [MainVPS] Handshake for peer 1 
([2605:6400:20:xx:xxxx::1]:56780) did not complete after 5 seconds, 
retrying (try 3)
2021-08-03 18:24:12.753: [TUN] [MainVPS] Sending handshake initiation to 
peer 1 ([2605:6400:20:xx:xxxx::1]:56780)
2021-08-03 18:24:17.876: [TUN] [MainVPS] Handshake for peer 1 
([2605:6400:20:xx:xxxx::1]:56780) did not complete after 5 seconds, 
retrying (try 2)
2021-08-03 18:24:17.876: [TUN] [MainVPS] Sending handshake initiation to 
peer 1 ([2605:6400:20:xx:xxxx::1]:56780)
2021-08-03 18:24:22.923: [TUN] [MainVPS] Handshake for peer 1 
([2605:6400:20:xx:xxxx::1]:56780) did not complete after 5 seconds, 
retrying (try 3)
2021-08-03 18:24:22.923: [TUN] [MainVPS] Sending handshake initiation to 
peer 1 ([2605:6400:20:xx:xxxx::1]:56780)
2021-08-03 18:24:28.089: [TUN] [MainVPS] Handshake for peer 1 
([2605:6400:20:xx:xxxx::1]:56780) did not complete after 5 seconds, 
retrying (try 4)
2021-08-03 18:24:28.089: [TUN] [MainVPS] Sending handshake initiation to 
peer 1 ([2605:6400:20:xx:xxxx::1]:56780)
2021-08-03 18:24:33.197: [TUN] [MainVPS] Handshake for peer 1 
([2605:6400:20:xx:xxxx::1]:56780) did not complete after 5 seconds, 
retrying (try 5)
2021-08-03 18:24:33.197: [TUN] [MainVPS] Sending handshake initiation to 
peer 1 ([2605:6400:20:xx:xxxx::1]:56780)
2021-08-03 18:24:38.280: [TUN] [MainVPS] Handshake for peer 1 
([2605:6400:20:xx:xxxx::1]:56780) did not complete after 5 seconds, 
retrying (try 6)
2021-08-03 18:24:38.280: [TUN] [MainVPS] Sending handshake initiation to 
peer 1 ([2605:6400:20:xx:xxxx::1]:56780)
2021-08-03 18:24:43.373: [TUN] [MainVPS] Handshake for peer 1 
([2605:6400:20:xx:xxxx::1]:56780) did not complete after 5 seconds, 
retrying (try 7)
2021-08-03 18:24:43.373: [TUN] [MainVPS] Sending handshake initiation to 
peer 1 ([2605:6400:20:xx:xxxx::1]:56780)
2021-08-03 18:24:48.482: [TUN] [MainVPS] Handshake for peer 1 
([2605:6400:20:xx:xxxx::1]:56780) did not complete after 5 seconds, 
retrying (try 8)
2021-08-03 18:24:48.482: [TUN] [MainVPS] Sending handshake initiation to 
peer 1 ([2605:6400:20:xx:xxxx::1]:56780)
2021-08-03 18:24:53.484: [TUN] [MainVPS] Handshake for peer 1 
([2605:6400:20:xx:xxxx::1]:56780) did not complete after 5 seconds, 
retrying (try 9)
2021-08-03 18:24:53.484: [TUN] [MainVPS] Sending handshake initiation to 
peer 1 ([2605:6400:20:xx:xxxx::1]:56780)
2021-08-03 18:24:58.567: [TUN] [MainVPS] Handshake for peer 1 
([2605:6400:20:xx:xxxx::1]:56780) did not complete after 5 seconds, 
retrying (try 10)
2021-08-03 18:24:58.567: [TUN] [MainVPS] Sending handshake initiation to 
peer 1 ([2605:6400:20:xx:xxxx::1]:56780)
2021-08-03 18:25:03.672: [TUN] [MainVPS] Handshake for peer 1 
([2605:6400:20:xx:xxxx::1]:56780) did not complete after 5 seconds, 
retrying (try 11)
2021-08-03 18:25:03.672: [TUN] [MainVPS] Sending handshake initiation to 
peer 1 ([2605:6400:20:xx:xxxx::1]:56780)
2021-08-03 18:25:08.760: [TUN] [MainVPS] Handshake for peer 1 
([2605:6400:20:xx:xxxx::1]:56780) did not complete after 5 seconds, 
retrying (try 12)
2021-08-03 18:25:08.760: [TUN] [MainVPS] Sending handshake initiation to 
peer 1 ([2605:6400:20:xx:xxxx::1]:56780)
2021-08-03 18:25:13.828: [TUN] [MainVPS] Handshake for peer 1 
([2605:6400:20:xx:xxxx::1]:56780) did not complete after 5 seconds, 
retrying (try 13)
2021-08-03 18:25:13.828: [TUN] [MainVPS] Sending handshake initiation to 
peer 1 ([2605:6400:20:xx:xxxx::1]:56780)
2021-08-03 18:25:18.913: [TUN] [MainVPS] Handshake for peer 1 
([2605:6400:20:xx:xxxx::1]:56780) did not complete after 5 seconds, 
retrying (try 14)
2021-08-03 18:25:18.913: [TUN] [MainVPS] Sending handshake initiation to 
peer 1 ([2605:6400:20:xx:xxxx::1]:56780)
2021-08-03 18:25:23.940: [TUN] [MainVPS] Handshake for peer 1 
([2605:6400:20:xx:xxxx::1]:56780) did not complete after 5 seconds, 
retrying (try 15)
2021-08-03 18:25:23.940: [TUN] [MainVPS] Sending handshake initiation to 
peer 1 ([2605:6400:20:xx:xxxx::1]:56780)
2021-08-03 18:25:29.096: [TUN] [MainVPS] Handshake for peer 1 
([2605:6400:20:xx:xxxx::1]:56780) did not complete after 5 seconds, 
retrying (try 16)
2021-08-03 18:25:29.096: [TUN] [MainVPS] Sending handshake initiation to 
peer 1 ([2605:6400:20:xx:xxxx::1]:56780)
2021-08-03 18:25:34.110: [TUN] [MainVPS] Handshake for peer 1 
([2605:6400:20:xx:xxxx::1]:56780) did not complete after 5 seconds, 
retrying (try 17)
2021-08-03 18:25:34.110: [TUN] [MainVPS] Sending handshake initiation to 
peer 1 ([2605:6400:20:xx:xxxx::1]:56780)
2021-08-03 18:25:39.244: [TUN] [MainVPS] Handshake for peer 1 
([2605:6400:20:xx:xxxx::1]:56780) did not complete after 5 seconds, 
retrying (try 18)
2021-08-03 18:25:39.244: [TUN] [MainVPS] Sending handshake initiation to 
peer 1 ([2605:6400:20:xx:xxxx::1]:56780)
2021-08-03 18:25:44.387: [TUN] [MainVPS] Handshake for peer 1 
([2605:6400:20:xx:xxxx::1]:56780) did not complete after 5 seconds, 
retrying (try 19)
2021-08-03 18:25:44.387: [TUN] [MainVPS] Sending handshake initiation to 
peer 1 ([2605:6400:20:xx:xxxx::1]:56780)
2021-08-03 18:25:49.455: [TUN] [MainVPS] Handshake for peer 1 
([2605:6400:20:xx:xxxx::1]:56780) did not complete after 5 seconds, 
retrying (try 20)
2021-08-03 18:25:49.455: [TUN] [MainVPS] Sending handshake initiation to 
peer 1 ([2605:6400:20:xx:xxxx::1]:56780)
2021-08-03 18:25:54.502: [TUN] [MainVPS] Handshake for peer 1 
([2605:6400:20:xx:xxxx::1]:56780) did not complete after 20 attempts, 
giving up

