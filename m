Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95CCFD49223
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Nov 2024 13:24:05 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id dc978e2c;
	Mon, 18 Nov 2024 12:36:21 +0000 (UTC)
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [2607:f8b0:4864:20::435])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 0d7f8782
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Sun, 13 Oct 2024 20:53:34 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-71e453c7408so1290167b3a.2
 for <wireguard@lists.zx2c4.com>; Sun, 13 Oct 2024 13:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1728852813; x=1729457613;
 darn=lists.zx2c4.com; 
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tW/oVLxMGVp293pF30Jw4BkfUNSmxaGcYjy7Hqe9zSo=;
 b=C6aVOgJJCsaDC/O+dmRSZJ+/ecfnvfA7Agup8RdKnWK253QtHIuH2NlhMarMcmdkq5
 CJf0B3QgeoHx3vyE0jK12H8xBGHzWpYf1oqYUiWDo2bN+gfxxUmYBZoUrl8C+gpEI5do
 diDs5ak/OZtrEkE9cFqNh61W6sNAT3trlhK+iE8bJahs6lo49priGzwy8v4QjtIpsWz1
 gxknWMj4uMRB9rQ4O3zTm2fnKGPrtl2VrHqyU+B0npp9OoJd8OTuNBq0FjvJt9NbdM+M
 Tq2MZl/88GxhJQIGv9qy7zGa04M+uFwtVWvrHiPtEp1WKIBfSISTPqs+7TkiZpapmBmo
 3yZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728852813; x=1729457613;
 h=content-transfer-encoding:mime-version:date:message-id:subject
 :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tW/oVLxMGVp293pF30Jw4BkfUNSmxaGcYjy7Hqe9zSo=;
 b=i+kUZibzRkS61NArg6uRDNPB+av/WNsrQwOfWuIUp52+lQPYE5DuL+Q24cJQMm+Eku
 VFsSl9+rrZ2ZSjk4knbVhHf/bRQa4oNrF6y4joxaUPFHilo3N0Ny0EdcHAI/zhwU+lJC
 Ud63sKZ3/QON52I/HvMJzy+MN0r8ju9WU9IS5YcM2cJ/GnVnSimfbaKzHONrdVKF/8Dt
 OhA2qEhLtG0q/6PmSvySUbkMTNYDdAavXoE1HlYbwJCnKeb5H9Uy1uCPpG7peFu5m4CO
 BKx7/dsNfOyZAFh3BUDa2EeTUCyrjyar2Yy00CI0Gjrgiw7B9UEi6e9kv+IfHi7XG2H5
 SXSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrOJvbith9GArD8qRjD/5XvuTCSEuLLoeXp0Zdm6r7ZqxUhLGBDWvni/5CR8ktOw+FsLEYBhtC11E=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YyxpBAaemwCBd/V2rKJ9IllECDZi6WhZiLwwe/T6ojoAyqpln2c
 s0+iHTaXxIhjpj1wwiWOmggTSWNlEIkk0CjJcL5N8SGZmS1Eq4iO3M1lgSgj16Y=
X-Google-Smtp-Source: AGHT+IGeHW/T1utnJaL2THMthWNT/SlEE9KTreIWsQr33pvF5db22afBNXHDL1azWfd6tDGW/vbLCA==
X-Received: by 2002:a05:6a00:1391:b0:71e:ba5:820e with SMTP id
 d2e1a72fcca58-71e4c1dcd95mr9404250b3a.27.1728852812746; 
 Sun, 13 Oct 2024 13:53:32 -0700 (PDT)
Received: from [127.0.0.1] ([198.8.77.157]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71e48bcfe81sm3815287b3a.66.2024.10.13.13.53.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 13 Oct 2024 13:53:32 -0700 (PDT)
From: Jens Axboe <axboe@kernel.dk>
To: linux-nfs@vger.kernel.org, Julia Lawall <Julia.Lawall@inria.fr>
Cc: kernel-janitors@vger.kernel.org, vbabka@suse.cz, paulmck@kernel.org, 
 Tom Talpey <tom@talpey.com>, Dai Ngo <Dai.Ngo@oracle.com>, 
 Olga Kornievskaia <okorniev@redhat.com>, Neil Brown <neilb@suse.de>, 
 linux-can@vger.kernel.org, bridge@lists.linux.dev, 
 b.a.t.m.a.n@lists.open-mesh.org, linux-kernel@vger.kernel.org, 
 wireguard@lists.zx2c4.com, netdev@vger.kernel.org, ecryptfs@vger.kernel.org, 
 linux-block@vger.kernel.org, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
 linuxppc-dev@lists.ozlabs.org, kvm@vger.kernel.org, 
 netfilter-devel@vger.kernel.org, coreteam@netfilter.org
In-Reply-To: <20241013201704.49576-1-Julia.Lawall@inria.fr>
References: <20241013201704.49576-1-Julia.Lawall@inria.fr>
Subject: Re: (subset) [PATCH 00/17] replace call_rcu by kfree_rcu for
 simple kmem_cache_free callback
Message-Id: <172885281086.338120.2063739137198887833.b4-ty@kernel.dk>
Date: Sun, 13 Oct 2024 14:53:30 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Mailman-Approved-At: Mon, 18 Nov 2024 12:35:39 +0000
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


On Sun, 13 Oct 2024 22:16:47 +0200, Julia Lawall wrote:
> Since SLOB was removed and since
> commit 6c6c47b063b5 ("mm, slab: call kvfree_rcu_barrier() from kmem_cache_destroy()"),
> it is not necessary to use call_rcu when the callback only performs
> kmem_cache_free. Use kfree_rcu() directly.
> 
> The changes were done using the following Coccinelle semantic patch.
> This semantic patch is designed to ignore cases where the callback
> function is used in another way.
> 
> [...]

Applied, thanks!

[09/17] block: replace call_rcu by kfree_rcu for simple kmem_cache_free callback
        commit: 7a9b197adbafa9d6d1a79a0633607b78b1adef82

Best regards,
-- 
Jens Axboe



