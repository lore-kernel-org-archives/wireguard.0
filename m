Return-Path: <SRS0=PVHX=M2=lists.zx2c4.com=wireguard-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 154F0C432BE
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  3 Aug 2021 08:59:34 +0000 (UTC)
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 24C5E60EB9
	for <zx2c4-wireguard@archiver.kernel.org>; Tue,  3 Aug 2021 08:59:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 24C5E60EB9
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=lists.zx2c4.com
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 896f1011;
	Tue, 3 Aug 2021 08:57:20 +0000 (UTC)
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [2a00:1450:4864:20::335])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 37831b0e
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Tue, 3 Aug 2021 08:57:16 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 e25-20020a05600c4b99b0290253418ba0fbso1652473wmp.1
 for <wireguard@lists.zx2c4.com>; Tue, 03 Aug 2021 01:57:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding:content-language;
 bh=zFzLMmG2pM1vNLnYKSrARrw2h+MU0I4UPuq8McFnbdY=;
 b=sv6nAzL7T8Jd0Zm1AHJZXdaiGcLB0jy30LP/8YBKrRTPlmiBYodtNI3YHWYBo0gtw9
 n25AoBNU32/PmGIOdY4i+8qbMuTgy1x7FRr8f0AqteNCYXB0sD8/6ZO5TLqRBCYP9kXw
 zsYxXM60U1ppXpEdQwemjGcq4gyyNq5vUJilMoEOq+UFXbVG/vieHQbW2iRmgKR6nWOX
 SwiVtBDycgdXPyu5LEyd2qNLU3iZtMxPRDzr60epKgGCnpzdWVxjSJXw1lEzVdHWAT2M
 C7ONE9d1Q9SWQWO6MEyclbtAp8haA1bPXLnpApb4ZV+3AJX06jIyfNWZXnGteS2RRnQD
 nuVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-transfer-encoding
 :content-language;
 bh=zFzLMmG2pM1vNLnYKSrARrw2h+MU0I4UPuq8McFnbdY=;
 b=k6jZRXF+LkbXC560sVDdfqQfrahRK6dkacOI6Z+DkDYU0kw3JMk8gG6Bq+RHWaMGiy
 ddtO/Vr3aIS7IJwaApcK/+OYXKG1HcitIwjGlLZA7DahAw+2XYJsnw7fj30XMQzBoWGu
 zNso8wqWIQ4L5Qgu7HpKsd51lB3HfhtCIlBH2cvlRpsSt+Jz74XWkoAUV5A2ROeWnNrN
 12ze2Z+L+WxnQaf2nkG9RbMyebm2T4mYKxaFGVaauL/6FLFKw2Evm002pNp+pKwNiIvn
 yv7R/CCu8uTNtWhuPXDVD248uZFaEAI/Pnl6c2ngfRvE3jZBTIairxuWwuQd1p7VOBrG
 KNyg==
X-Gm-Message-State: AOAM533tA8CMge0GLDVvRtl6YjzGXerbD1/1q7tfouAYdTae4A0Pj5Lf
 g2s2/R0jx/Cw/Vy8/mgWPgChNmUQ6PqoWA==
X-Google-Smtp-Source: ABdhPJz7pUTIVdFg4Ql5KjxjpuZs+0+e4u0stGydfzT6L4WfI1GnsLK9MefIxv9FfQT3UvQVgsrQFA==
X-Received: by 2002:a05:600c:154b:: with SMTP id
 f11mr3164707wmg.116.1627981036210; 
 Tue, 03 Aug 2021 01:57:16 -0700 (PDT)
Received: from [192.168.25.202] ([31.127.152.180])
 by smtp.gmail.com with ESMTPSA id w4sm1939889wrm.24.2021.08.03.01.57.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 03 Aug 2021 01:57:15 -0700 (PDT)
Subject: Re: Problems with Windows client over PulseSecure VPN
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Heiko Kendziorra <kendziorra@dresearch-fe.de>,
 Christopher Ng <facboy@gmail.com>
Cc: WireGuard mailing list <wireguard@lists.zx2c4.com>
References: <9f621ce6-ec3d-0641-c359-756d0ad36f65@gmail.com>
 <6a01b182-a98f-1736-676f-d0811f6de086@gmail.com>
 <CAHmME9qtPLOTaY3UzyCY1C6guVZXvJjXHeFwT8=94d=Zpjj=Tw@mail.gmail.com>
 <CAHmME9r5kecTj1iBGyqjvNRKsHZPRrXmN+fDXkaX3y==VPoMqA@mail.gmail.com>
From: Peter Whisker <peter.whisker@gmail.com>
Message-ID: <4ff6b3ed-66c0-82d4-1641-44849ca390ef@gmail.com>
Date: Tue, 3 Aug 2021 09:57:14 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <CAHmME9r5kecTj1iBGyqjvNRKsHZPRrXmN+fDXkaX3y==VPoMqA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
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

Hi Jason and team

Thank you all for this amazing effort! I upgraded to v0.4 this morning 
and thought I should give it a go.

I set DWORD "ExperimentalKernelDriver = 1" in the registry. My simple 
"normal" tunnel which goes directly and not via PulseSecure works fine. :)

I removed the "PostUp = wg set %WIREGUARD_TUNNEL_NAME% listen-port 0" 
from my configs which go via the PulseSecure tunnel however traffic does 
not flow, the received byte counter remains at zero although the tunnel 
allegedly becomes "Activated" - see the log below.

Regards

Peter

2021-08-03 09:52:13.130462: [TUN] [mini-deb2] Starting WireGuard/0.4 
(Windows 10.0.19042; amd64)
2021-08-03 09:52:13.130462: [TUN] [mini-deb2] Watching network interfaces
2021-08-03 09:52:13.134477: [TUN] [mini-deb2] Resolving DNS names
2021-08-03 09:52:13.144960: [TUN] [mini-deb2] Creating network adapter
2021-08-03 09:52:13.150857: [TUN] [mini-deb2] WireGuardCreateAdapter: 
Creating adapter
2021-08-03 09:52:13.357365: [TUN] [mini-deb2] SelectDriver: Using 
existing driver 0.1
2021-08-03 09:52:13.986764: [TUN] [mini-deb2] Using WireGuardNT/0.1
2021-08-03 09:52:13.990466: [TUN] [mini-deb2] Enabling firewall rules
2021-08-03 09:52:13.990984: [TUN] [mini-deb2] Interface created
2021-08-03 09:52:13.994159: [TUN] [mini-deb2] Dropping privileges
2021-08-03 09:52:13.995190: [TUN] [mini-deb2] Peer 1 created
2021-08-03 09:52:13.997778: [TUN] [mini-deb2] Monitoring MTU of default 
v4 routes
2021-08-03 09:52:13.998285: [TUN] [mini-deb2] Sending keepalive packet 
to peer 1 (158.234.90.60:51820)
2021-08-03 09:52:13.998285: [TUN] [mini-deb2] Sending handshake 
initiation to peer 1 (158.234.90.60:51820)
2021-08-03 09:52:13.998285: [TUN] [mini-deb2] Interface up
2021-08-03 09:52:14.009369: [TUN] [mini-deb2] Setting device v4 addresses
2021-08-03 09:52:14.012575: [TUN] [mini-deb2] Monitoring MTU of default 
v6 routes
2021-08-03 09:52:14.012575: [TUN] [mini-deb2] Setting device v6 addresses
2021-08-03 09:52:14.017056: [TUN] [mini-deb2] Startup complete
2021-08-03 09:52:19.001078: [TUN] [mini-deb2] Sending handshake 
initiation to peer 1 (158.234.90.60:51820)
2021-08-03 09:52:24.162600: [TUN] [mini-deb2] Handshake for peer 1 
(158.234.90.60:51820) did not complete after 5 seconds, retrying (try 2)
2021-08-03 09:52:24.162600: [TUN] [mini-deb2] Sending handshake 
initiation to peer 1 (158.234.90.60:51820)
2021-08-03 09:52:29.276205: [TUN] [mini-deb2] Handshake for peer 1 
(158.234.90.60:51820) did not complete after 5 seconds, retrying (try 2)
2021-08-03 09:52:29.276205: [TUN] [mini-deb2] Sending handshake 
initiation to peer 1 (158.234.90.60:51820)
2021-08-03 09:52:34.380120: [TUN] [mini-deb2] Handshake for peer 1 
(158.234.90.60:51820) did not complete after 5 seconds, retrying (try 3)
2021-08-03 09:52:34.380120: [TUN] [mini-deb2] Sending handshake 
initiation to peer 1 (158.234.90.60:51820)
2021-08-03 09:52:39.412842: [TUN] [mini-deb2] Handshake for peer 1 
(158.234.90.60:51820) did not complete after 5 seconds, retrying (try 4)
2021-08-03 09:52:39.412842: [TUN] [mini-deb2] Sending handshake 
initiation to peer 1 (158.234.90.60:51820)
2021-08-03 09:52:44.441204: [TUN] [mini-deb2] Handshake for peer 1 
(158.234.90.60:51820) did not complete after 5 seconds, retrying (try 5)
2021-08-03 09:52:44.443407: [TUN] [mini-deb2] Sending handshake 
initiation to peer 1 (158.234.90.60:51820)
2021-08-03 09:52:49.471250: [TUN] [mini-deb2] Handshake for peer 1 
(158.234.90.60:51820) did not complete after 5 seconds, retrying (try 6)
2021-08-03 09:52:49.471250: [TUN] [mini-deb2] Sending handshake 
initiation to peer 1 (158.234.90.60:51820)



On 29/07/2021 12:00, Jason A. Donenfeld wrote:
> Hi Peter, Heiko, Christopher, and others,
>
> An update on:
>
>> I had a strange idea for how to fix this without requiring
>> recompilation or removal of that code.
>>
>> 1) Enable DangerousScriptExecution:
>> https://git.zx2c4.com/wireguard-windows/about/docs/adminregistry.md#hklmsoftwarewireguarddangerousscriptexecution
>>
>> 2) Add a PostUp line to your [Interface] section:
>>
>> PostUp = wg set %WIREGUARD_TUNNEL_NAME% listen-port 0
> I just wanted to let you know that this problem has been entirely
> fixed (I think?) in the "WireGuardNT" kernel driver project I've been
> working on (and haven't yet announced aside from development
> screenshots on Twitter), and therefore the above steps will no longer
> be necessary. When that ships as part of the v0.4 series of the normal
> wireguard-windows client, you won't need the "listen-port 0" hack
> anymore, as the kernel driver uses a more clever trick than the one
> used by wireguard-go. So please do watch this mailing list in the next
> few weeks for an announcement of that project, as I'll be very
> interested in some real world tests and confirmation of the fix.
>
> Thanks,
> Jason
