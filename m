Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6423CA1016
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  8 Sep 2025 16:55:03 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a045eb82;
	Mon, 8 Sep 2025 16:51:16 +0000 (UTC)
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id a40d20f8
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 8 Sep 2025 16:51:15 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 908BB60054
 for <wireguard@lists.zx2c4.com>; Mon,  8 Sep 2025 16:51:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F9B0C4CEF1
 for <wireguard@lists.zx2c4.com>; Mon,  8 Sep 2025 16:51:12 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="E5DUSMpC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1757350272;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xXWDvVymMYA7ZAFzTiDQlRoZve3ci2e7tM+VCb2yFjc=;
 b=E5DUSMpC23neEz88FYltMObzZtXzfFF2SsHWsLiyL7Ar4XXUZWrZdQAKWyK4Dua0sCyzW8
 oDPcxCvCoZz9fQTBl4QCz73BFXLBgvfsB7Br6GabOtvLVo8hEE8bRPhp9dJVJNzb8ENqdX
 iJWxcoVULw7LLSmmYrrzrdmYFppNHx4=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id d41400dc
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 8 Sep 2025 16:51:11 +0000 (UTC)
Received: by mail-oo1-f49.google.com with SMTP id
 006d021491bc7-62177413b39so1222069eaf.2
 for <wireguard@lists.zx2c4.com>; Mon, 08 Sep 2025 09:51:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUjlfTzQmFTTggVEfCj9sz4KlqETO1UrOERyrNFvIPsAdkmSSCq/2wV5/18VR/KFA3eEz5guGltygM=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YyTukyX96HSjRujqMQX/6ZKE8PXTjBXe2yPJhsuDsVDUdm1H/jt
 mBfdiF3yZbqsSY3gGrcNFo4GXMsXV2lSqwwTVckhJwmHfJFK7NXCyF9kXCmdVjQCy7LnFhbW6/0
 AZDPgWKV1E9IZRPoNhanylLuwGSQV8IE=
X-Google-Smtp-Source: AGHT+IEIXB3taFnFRE1X8N/g/4h28EKNkcp5HSevCEifdzaf2Qt7TRstBZ6TcHCiXUIqym/JQbhnieXyX3EHlM10G54=
X-Received: by 2002:a05:6808:6a8c:b0:438:2767:6941 with SMTP id
 5614622812f47-43b29ac5a1emr3505387b6e.25.1757350270805; Mon, 08 Sep 2025
 09:51:10 -0700 (PDT)
MIME-Version: 1.0
References: <20250719224444.411074-1-yury.norov@gmail.com>
 <aJdL-5t9va5Ln0xv@yury>
In-Reply-To: <aJdL-5t9va5Ln0xv@yury>
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
Date: Mon, 8 Sep 2025 18:50:59 +0200
X-Gmail-Original-Message-ID: <CAHmME9p6VBKr67UyP+qkazUg3+zoX9Aj+_42BGuAprBewOgr9A@mail.gmail.com>
X-Gm-Features: AS18NWBTIimdNnwY7GG9qQ7DBuoAex7c3in2WUQB_jza-ecUhou3mlzuDbzD5Zw
Message-ID: <CAHmME9p6VBKr67UyP+qkazUg3+zoX9Aj+_42BGuAprBewOgr9A@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] rework wg_cpumask_next_online()
To: Yury Norov <yury.norov@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
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

Applied this series, thanks.
