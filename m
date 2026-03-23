Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C8F8F483DE
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 23 Mar 2026 17:49:45 +0000 (UTC)
Received: 
	by lists.zx2c4.com (OpenSMTPD) with ESMTP id 30c0fcc0;
	Mon, 23 Mar 2026 17:43:53 +0000 (UTC)
Received: from sea.source.kernel.org (sea.source.kernel.org
 [2600:3c0a:e001:78e:0:1991:8:25])
 by lists.zx2c4.com (OpenSMTPD) with ESMTPS id 35efca2c
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 23 Mar 2026 17:43:51 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 70F7141A3B
 for <wireguard@lists.zx2c4.com>; Mon, 23 Mar 2026 17:43:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F5B0C2BCB0
 for <wireguard@lists.zx2c4.com>; Mon, 23 Mar 2026 17:43:48 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="eQ3lRGHR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1774287827;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=RmeUeWBBjLSugMsj/xpuzUXlg/jk7uvSh4TlnYDkD8Q=;
 b=eQ3lRGHRmRnYg5nsuhZ5q4wUKJcMea4lUHjI23tdHZCbZEfNUUsK2q7ctOQdGWyn3LmAmq
 CyjWc0INMF4pITKCkzaBI0PuA5r+MQh7JPhdh3NGrtPBOF6fq+aAT3/pbPhUMFSgnOrTLH
 7/6UIjbzXsLbNjSsEf5xOSSJkI98TLo=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id a871a7b6
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 23 Mar 2026 17:43:47 +0000 (UTC)
Received: by mail-ot1-f53.google.com with SMTP id
 46e09a7af769-7d7422b4ff1so1494999a34.3
 for <wireguard@lists.zx2c4.com>; Mon, 23 Mar 2026 10:43:47 -0700 (PDT)
X-Gm-Message-State: AOJu0Yypd6T00S3I999Ih05ytk4d+W7iRJfpcymvSCe70ZjXiaiGlsn7
 bRjIbH3/MAGg47D2RAgDmDefH4n6KdZNSTTcaeKzPdjCuQpvI8AKkdnKRTt2lfrzFYUpTrQ1HUl
 42n5Lx11W+O/GLUJpcUHPJQROeld1z8M=
X-Received: by 2002:a05:6830:dc3:b0:7d7:b701:ef54 with SMTP id
 46e09a7af769-7d7eafc5f95mr8796186a34.29.1774287826591; Mon, 23 Mar 2026
 10:43:46 -0700 (PDT)
MIME-Version: 1.0
References: <GVXP251MB0790009AEBCBE7855DDCB5B28375A@GVXP251MB0790.EURP251.PROD.OUTLOOK.COM>
In-Reply-To: <GVXP251MB0790009AEBCBE7855DDCB5B28375A@GVXP251MB0790.EURP251.PROD.OUTLOOK.COM>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 23 Mar 2026 18:43:35 +0100
X-Gmail-Original-Message-ID: <CAHmME9q6vwkXp0Hzsp7ZoLN6QxNr_Lsqu12OWjOi1shhV-seyQ@mail.gmail.com>
X-Gm-Features: AQROBzB2uhgI_F1JSOn45rtFZf8pOH6S3t-MkT4t1rQl61ySi-4R7NJ3g6E0Cto
Message-ID: <CAHmME9q6vwkXp0Hzsp7ZoLN6QxNr_Lsqu12OWjOi1shhV-seyQ@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_gutd_=E2=80=94_WireGuard_traffic_obfuscator_via_TC=2FXDP?=
 =?UTF-8?Q?_eBPF_=28no_kernel_patches=29?=
To: sh0rch <sh0rch@iwl.dev>
Cc: "wireguard@lists.zx2c4.com" <wireguard@lists.zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
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

Hi sh0rch,

This is an awesome project! It seems like doing this with eBPF and
TC/XDP is exactly the right way to do this, and lets you just drop it
in on top of an existing configuration. I really like this
architecture.

I'll try to find some time to look at the internals in proper detail.
But I think this is basically the right direction. Thank you for
implementing it!

Jason
