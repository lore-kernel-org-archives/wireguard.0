Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD854C433F5
	for <zx2c4-wireguard@archiver.kernel.org>; Fri, 22 Apr 2022 17:24:30 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 7e9132c1;
	Fri, 22 Apr 2022 17:24:28 +0000 (UTC)
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com
 [2607:f8b0:4864:20::236])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id edd0a503
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Fri, 22 Apr 2022 13:36:25 +0000 (UTC)
Received: by mail-oi1-x236.google.com with SMTP id q129so9054619oif.4
 for <wireguard@lists.zx2c4.com>; Fri, 22 Apr 2022 06:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=see1AwYsA07CUou7PN9gJyiZ1lTNI3+tWlNB+AOGUok=;
 b=C9qE01YLWDx+volJjry4oVgtIel4fmK7nduDLDAxT1fFvAVtmOGcMIPUJVK7qZ1Ar8
 LWfOI9qSv4V5DrEzFQy8OKhrj23sY63yHg1z94Dkv+pD+nAHIY8nEEmUgqcXtDWigL0R
 Nd6BYbN1fBWKwZleMxu5WkJaA7OWLleD4pc0YNmsc5Ih2/OTV4eb5bKLtkNpk9vqHhf1
 qDrQl4fhef0DBxowSE49nwV+ieEDqM4Ch9VP2tuVJrgS4TMTaSGDWiBSkunkIkLiWWAr
 jV+3D2cXNxnJ1J7BCIw3Me8FzTSN/JgINaXpXeZiwsD0qMc6Z6V/1pQc12ahfVXKSosz
 4Sgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=see1AwYsA07CUou7PN9gJyiZ1lTNI3+tWlNB+AOGUok=;
 b=OBSXAKaszL8Ag1DEtwA2awSFzPPxDZSraL2rYXu38DfXE7rycAPJ3JjZaAhT20H7zd
 E8SRyJdiYKyUuuTT5PeIEPPRRb/g9L7LzeTlmeMlGE59XNOyMu84joHv/PxUTsX1qRXI
 oXMr3nBI65SQwX1sgBO7pCMFEbt6MkUITOFq6T5soJ6rWeZk3oS3A8QpLVccb8xJrrB3
 59T0Uhyv/oNkmC506c7YrYm4brkJQMmGuS81Sxq9NsscIGfnkAYyOvhtdj3UQuVau9z5
 0/PIxHV82SwkN0eXw8dYboVuCo6bI4MtJU0Ko6GSVLS7dA6yflU2btcLkuHVOWJL2cTS
 ziYA==
X-Gm-Message-State: AOAM5332lBOYumwQwKsyGxQkiOH9UEHQDWjzBKltIokaXojJWsAE9bN5
 gIFKwg4h3FoGsFjV2EhRhhf9SeCdq5o=
X-Google-Smtp-Source: ABdhPJz5SRkR3RaFEZwpqnzW/mmnkF5dG7dLD0xh+RqaL8hfFsRaZbQlbydoP6p4mJ2Vzd4sxoPBGw==
X-Received: by 2002:a05:6808:1452:b0:316:9f5c:d6b9 with SMTP id
 x18-20020a056808145200b003169f5cd6b9mr2238959oiv.221.1650634584428; 
 Fri, 22 Apr 2022 06:36:24 -0700 (PDT)
Received: from [10.0.4.89] ([70.114.124.8]) by smtp.gmail.com with ESMTPSA id
 ay9-20020a056808300900b0032272231c25sm749122oib.40.2022.04.22.06.36.23
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 22 Apr 2022 06:36:23 -0700 (PDT)
From: "Jason Grant" <dadima@gmail.com>
To: wireguard@lists.zx2c4.com
Subject: Re: Is it possible to disable wireguard on specific Wi-Fi ?
Date: Fri, 22 Apr 2022 08:36:23 -0500
X-Mailer: MailMate (1.13.2r5673)
Message-ID: <148B89DC-E709-41D2-B942-4FD63558EEDC@gmail.com>
In-Reply-To: <84b2749c-4a9d-b58e-0659-09ee9c70c67c@gmail.com>
References: <84b2749c-4a9d-b58e-0659-09ee9c70c67c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"; format=flowed; markup=markdown
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 22 Apr 2022 17:24:27 +0000
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

On 17 Apr 2022, at 21:12, Nohk Two wrote:

> So, I have this idea that if it is possible to configure the Wireguard 
> app to turn off or disable automatically when the network is 
> established on specific Wi-Fi SSIDs ?

The MacOS WireGuard client has exactly this feature. You can 
enable/disable on-demand access for particular SSIDs, and it’s very 
useful for a situation where you’re moving your device around, between 
home and office say. Any timetable for adding this feature to other 
platforms, like Windows or Android?
