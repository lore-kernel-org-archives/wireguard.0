Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CAB6D49213
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 18 Nov 2024 12:40:44 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 77da4ee7;
	Mon, 18 Nov 2024 12:36:11 +0000 (UTC)
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [2607:f8b0:4864:20::631])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 22804485
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Wed, 12 Jun 2024 22:53:02 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-1f715fd5e60so443935ad.2
 for <wireguard@lists.zx2c4.com>; Wed, 12 Jun 2024 15:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1718232780; x=1718837580;
 darn=lists.zx2c4.com; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=HCKGfocKzBU0+xeBiPtl1Ex5TwQcMh3k2EBSdA3xSn0=;
 b=bhpCbaX+MyB2ADgDB3jmzqbbmLcay+IPMsQQhGigb0ivzZknASpylsIbOSiKrIgjV2
 w2T1IaPjwBPm2FjC1BHwvbjaiafo9Rsaf3CFp+PEWDdOBIUXr261PQLyWjOZ9LXmIA+W
 50OC2EcSBVMDf3Nk+SXiJ6mwX/HIJ/9vHPgYhXL/2VdFjIBmESS9xU5twKGriUfW5zx4
 +jUMfNTbwpxvfZhRKL4FQNi9/DmJJNSjJ1/+HeUHTBflmR6drtt72aor3VNrUXlrCtsj
 jm1JVHL9Slz77k94/Ip38IKOWYKYXqDAeIiDnNkI4pASFucoH12i38mD9sNkw8jsmeLf
 G54w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718232780; x=1718837580;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HCKGfocKzBU0+xeBiPtl1Ex5TwQcMh3k2EBSdA3xSn0=;
 b=mtjW/6t0dGbHu8IJA/4rPVYQ1+PL3P1rQXL6ieMmzPc9jMAMvFqkwozDxgXUrzTNnz
 LEcC0l6gZL8PGEOE+EiRGFNywUN9u3a35D67o7+AIOSktnwVPWYCK5u8Jm0QJRMzKJ8G
 FbXeJTxALCiVjU1JsWLw9cyGjNTJWsUUDfxip/1etVgwkZyuyUTfQhvxG2N90Livtnvw
 DLn/MJfovffI8TeO7aQdPIgOVVFUeOhS9+6/XFwOUnACzGea1GhAhZ+dELYvuKKuPf5c
 wOySO6m/QsNxQk64pu4u+/MS7OoksCE3J1B+5/RgD/Ee7G06T8lv/aTVIqr4GYgQoJPw
 X41Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCV1lpaoAlnPOFxBypFAfDcGYp30DhaWlo7UJHzur/f/VisUFbAe5vVoJts0Cnk7XITlIqG9goAcH40=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YyTd0yRcwtS8gMEinZMmpjn6vFAxFn+lo3GLf8e2hkB5W9nal8q
 0KhXLp3a0uIYnenDoAXnicCWBtusyEjQXwfxX0e6t1OnzzXKufb3BuglAkR/qWk=
X-Google-Smtp-Source: AGHT+IH5UZSMoyLCwmMYbQsnXovMsmtOxcZgzfit4qNG1yAnUakar4EveGlx5xiJfFg6llU0rCt4rg==
X-Received: by 2002:a05:6a20:5647:b0:1af:acda:979d with SMTP id
 adf61e73a8af0-1b8a9b4e85fmr2859600637.1.1718232780575; 
 Wed, 12 Jun 2024 15:53:00 -0700 (PDT)
Received: from [192.168.1.150] ([198.8.77.157])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-705ccb3d2c5sm73821b3a.105.2024.06.12.15.52.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 12 Jun 2024 15:53:00 -0700 (PDT)
Message-ID: <7e58e73d-4173-49fe-8f05-38a3699bc2c1@kernel.dk>
Date: Wed, 12 Jun 2024 16:52:57 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/14] replace call_rcu by kfree_rcu for simple
 kmem_cache_free callback
To: paulmck@kernel.org, Jakub Kicinski <kuba@kernel.org>
Cc: Julia Lawall <Julia.Lawall@inria.fr>, linux-block@vger.kernel.org,
 kernel-janitors@vger.kernel.org, bridge@lists.linux.dev,
 linux-trace-kernel@vger.kernel.org,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, kvm@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Nicholas Piggin <npiggin@gmail.com>, netdev@vger.kernel.org,
 wireguard@lists.zx2c4.com, linux-kernel@vger.kernel.org,
 ecryptfs@vger.kernel.org, Neil Brown <neilb@suse.de>,
 Olga Kornievskaia <kolga@netapp.com>, Dai Ngo <Dai.Ngo@oracle.com>,
 Tom Talpey <tom@talpey.com>, linux-nfs@vger.kernel.org,
 linux-can@vger.kernel.org, Lai Jiangshan <jiangshanlai@gmail.com>,
 netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
 Vlastimil Babka <vbabka@suse.cz>
References: <20240609082726.32742-1-Julia.Lawall@inria.fr>
 <20240612143305.451abf58@kernel.org>
 <baee4d58-17b4-4918-8e45-4d8068a23e8c@paulmck-laptop>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <baee4d58-17b4-4918-8e45-4d8068a23e8c@paulmck-laptop>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 6/12/24 4:37 PM, Paul E. McKenney wrote:
> [PATCH 09/14] block: replace call_rcu by kfree_rcu for simple kmem_cache_free callback
> 	I don't see a kmem_cache_destroy(), but then again, I also don't
> 	see the kmem_cache_create().  Unless someone can see what I am
> 	not seeing, let's wait.

It's in that same file:

blk_ioc_init()

the cache itself never goes away, as the ioc code is not unloadable. So
I think the change there should be fine.

-- 
Jens Axboe

