Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CB95C87FCF
	for <zx2c4-wireguard@archiver.kernel.org>; Sat,  9 Aug 2025 13:24:19 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 92dfe55f;
	Sat, 9 Aug 2025 13:24:17 +0000 (UTC)
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [2607:f8b0:4864:20::1036])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id fa2cee2f
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Sat, 9 Aug 2025 13:24:15 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-31ed9a17f1fso2499525a91.1
 for <wireguard@lists.zx2c4.com>; Sat, 09 Aug 2025 06:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1754745854; x=1755350654; darn=lists.zx2c4.com;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Gg5qA8e+0UYHLSOIBa7q2BXIt9K71iMCY0q3plis3nE=;
 b=iNKk+Gm1UAc7l+O3RE97wMVXs5+jSMdtqxbQjh/w3Fr04jpNdF8sjc9BFSz8knji4u
 rPHdjmWPuMvhSKLzQuLdlQmoaWPyPHSI0S8BZopPtxNCzGaOx40l75AceFMug7uvWO8Q
 uMux8lWrECi3CEL2jb9+AoUJMxE7kodxbsYXT4VW9IaIjum328JMh4r7rD2Ek2KHFgy3
 GBsGXTz4Lj256H4YelZYtYQ4TxsjzMLXACDBP5l/dbUB0ktDVjstQOzmi6XCmahBHpw9
 n/dQdAVXjiK9rDW9wLOzTS9g4NZQivUdmcQ+CTPNN7CpGcIRVukbOZtYyqDOktgBAPrA
 G5Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754745854; x=1755350654;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gg5qA8e+0UYHLSOIBa7q2BXIt9K71iMCY0q3plis3nE=;
 b=LgG/A6UQngmieuYO4YgzJu/U431c8uqn1IcMYsGpJBqd8rwkkVVAkaR45ekMZRVj9/
 CpsCRR370s/m77bF1KhAybqYNl7QZcbfyccsnHuHy935N+fwnTO5NXc9dpU4dFe8RmQv
 VGV7o4WHi9nLBNXlOU7Bbu5be1NPcscarSc7+ecJfX/i0piEhgmjRrRCO5HVgzWV5Bm6
 nI7dqc65GH95C1VRBKj+5oC6LQ5ICKXbegKHOP9taXsdoD1R3WxmAIo5iivabM0mGpEc
 Te76rXpyB30pILFjTMhYOKyMQ77oNJt/rbEzwaZiXdlHDZTeqVjg/XQq3o6kY8J2oqAN
 75MA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBM4Qz6lFCS2/eQh6/SnHCoVn/+hUN4zr1iRxm/2QkvoadA2gXf+jqUFJ6gL5+/nRjUjnr7bORtg8=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YyVR3BaVu0d5tNk4nXaUu5cS8eAb7D+JaGswGkqQ24+9ONNpOrH
 Vf0UBC/CwsE3+AElI92Z6RD1HaT01dpi1+WV9UQl6B4LsFHxyAZekTQk
X-Gm-Gg: ASbGncu8dbo/xnhoCwtWTs4TXPvzxVKg0tcFuWNf4gqZFs4+b4ahTtnJu7bpuC9QI/z
 gvkw8wHplkVxhvfApXz7faEC71SyLBarp0ZMB8oJIlrVlkSmumqy/r0KzjdjWP/5XPiGVOJuAIj
 CdRD7yGcCDe1/zKT7JeWr49unlG/vlHZdMEJjDMgUATG2a/bCiCHxORLL+WkDebbfPFv5gYZ239
 bmgrRjLwVTiIy7fW1gdjM/rMzROfmpo0cBqKvdtrGjA8mSF8JLDr8qLKeaga4uFHy8L5WSgv7Tf
 vYqpIFTv+Mccy0dAV1nFl08FSoxzDgkoJN6IoT7lCUvAUfaXLZAQAfeElz5Wxqd+qY3fNupqMNN
 jJoNLzVAvS5F/KYa+qI0VaA==
X-Google-Smtp-Source: AGHT+IG6XUjvU1ujGKElusFwiJuytuORtuq2Rt2NrzrdYHFF84WEYLfReDSdYsL1FrWIQ0Z4Hb3WYw==
X-Received: by 2002:a17:90b:2ecc:b0:321:87fa:e1e8 with SMTP id
 98e67ed59e1d1-32187fae3a9mr7874585a91.2.1754745854056; 
 Sat, 09 Aug 2025 06:24:14 -0700 (PDT)
Received: from localhost ([216.228.127.129]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3218c3c2d58sm3034935a91.16.2025.08.09.06.24.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Aug 2025 06:24:13 -0700 (PDT)
Date: Sat, 9 Aug 2025 09:24:11 -0400
From: Yury Norov <yury.norov@gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] rework wg_cpumask_next_online()
Message-ID: <aJdL-5t9va5Ln0xv@yury>
References: <20250719224444.411074-1-yury.norov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250719224444.411074-1-yury.norov@gmail.com>
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

Ping?

On Sat, Jul 19, 2025 at 06:44:41PM -0400, Yury Norov wrote:
> From: Yury Norov (NVIDIA) <yury.norov@gmail.com>
> 
> Simplify the function and fix possible out-of-boundary condition.
> 
> v2:
>  - fix possible >= nr_cpu_ids return (Jason).
> 
> Yury Norov (NVIDIA) (2):
>   wireguard: queueing: simplify wg_cpumask_next_online()
>   wireguard: queueing: always return valid online CPU in wg_cpumask_choose_online()
> 
>  drivers/net/wireguard/queueing.h | 13 ++++---------
>  1 file changed, 4 insertions(+), 9 deletions(-)
> 
> -- 
> 2.43.0
