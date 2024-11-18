Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3EA0D4920F
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Nov 2024 11:23:08 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7a872ce7;
	Mon, 18 Nov 2024 11:23:06 +0000 (UTC)
Received: from mail-pg1-x532.google.com (mail-pg1-x532.google.com
 [2607:f8b0:4864:20::532])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id f6f4501f
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 18 Nov 2024 10:09:04 +0000 (UTC)
Received: by mail-pg1-x532.google.com with SMTP id
 41be03b00d2f7-7f8095a200eso2751309a12.1
 for <wireguard@lists.zx2c4.com>; Mon, 18 Nov 2024 02:09:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731924543; x=1732529343; darn=lists.zx2c4.com;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=4Goi/04yT5xIN7OeRKBKYdqRHma0hsyOKgiMd+irV+s=;
 b=a5NXSskEjBRjIu2g0WvOY2nWR1t0dRxVaIkhfMMRjNZ1iznuzRlw0Pqb8YHobB0fpr
 ocgmGKgp7488b7cvglpng9BfUV+xAFQ8SUQ8ZJiW2rvTYJShjVq0WqjwodKZtL/zRZ1w
 SdLME26ffVCVF2bcLzcXM1uugdd7DVyfv1eCbDGGfgMdjgB4Acm53hFXoFqDZw1ktbd4
 iPVnvJ8OeTuzRMMcogBLLBJzaJn+AhpHxBWNMyuaeSpIGB+ONHHPJjHlcxLbElIMmI+1
 yuTe5vrbivPS4ea0eQ3IDRDt55vXMyAiTOvMCXSo1iWlmDzWOr28Mcvp1d1Gf8jRLG0A
 +cDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731924543; x=1732529343;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4Goi/04yT5xIN7OeRKBKYdqRHma0hsyOKgiMd+irV+s=;
 b=GtK4KOcE34pKxGWSbNL8vTu/rs1Mro13MDwIQ/HSPHhxQqEtT/T6aO+7f/uxYHOLSx
 Ps/E8WQ+gas9rf79te4EYDOPYKTFx5FSPS5T2nozaKoWNW22NsBxuwo137YJQClOK80C
 v8gMWeDxR8dvfgspubwdJqeI7FzOaXVLmVXgiKWuXEq16LQhja1gTN7GcO66j+A7SLmO
 SNmqWhbxoq3TOIsiNDZoD02yTuwmqaPGw6K7GeRRlE2xx5DG+cXROl0LK6d5M3z4JsXC
 NyCbW+sZ5xRQiWyujABQmy6DGy4zbEAdu35zEHK/rXV8RDaDkd6Ezg8gPxqhgtkY0uj4
 4HEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkliSq1u5zFzm47HNx5yZTjGwT/csFb3TMGsGCAwOYn1HpHxJTlhA1bDClz0abvMIyR54yFaFpi4U=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YzuahxEjOm5ce7pIJMpJ/IR39emRUQb+GdNNIewaaCSXU67j0c6
 +jmEUMd798AEfB9U7ffpyAkVWv5XNFftIapdF5Glp0UpLHeQ6b5l
X-Google-Smtp-Source: AGHT+IGUsm9S0hEZ6xp7ESqNA2ThEEcxKekQUPQciNMBgUVwcC33mAfegzLfpusuFWYQvVKGptTr9A==
X-Received: by 2002:a05:6a21:3282:b0:1d4:f7e9:172a with SMTP id
 adf61e73a8af0-1dc8069161bmr27734319637.23.1731924542658; 
 Mon, 18 Nov 2024 02:09:02 -0800 (PST)
Received: from fedora ([43.228.180.230]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-7f8c1dc658csm5605511a12.69.2024.11.18.02.08.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Nov 2024 02:09:01 -0800 (PST)
Date: Mon, 18 Nov 2024 10:08:55 +0000
From: Hangbin Liu <liuhangbin@gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: netdev@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
 "David S. Miller" <davem@davemloft.net>,
 Florian Westphal <fw@strlen.de>, Phil Sutter <phil@nwl.cc>,
 wireguard@lists.zx2c4.com, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCHv2 net-next] selftests: wireguards: use nft by default
Message-ID: <ZzsSN49rftIlBhtf@fedora>
References: <20241111041902.25814-1-liuhangbin@gmail.com>
 <ZzpNXM17NX3nVzMl@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZzpNXM17NX3nVzMl@zx2c4.com>
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

On Sun, Nov 17, 2024 at 09:09:00PM +0100, Jason A. Donenfeld wrote:
> On Mon, Nov 11, 2024 at 04:19:02AM +0000, Hangbin Liu wrote:
> > Use nft by default if it's supported, as nft is the replacement for iptables,
> > which is used by default in some releases. Additionally, iptables is dropped
> > in some releases.
>  
> Rather than having this optionality, I'd rather just do everything in
> one way or the other. So if you're adamant that we need to use nft, just
> convert the whole thing. And then subsequently, make sure that the qemu
> test harness supports it. That should probably be a series.

Thanks, I will do an update for the qemu test.

Hangbin
