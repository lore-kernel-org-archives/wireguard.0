Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7C0EC27C4F
	for <zx2c4-wireguard@archiver.kernel.org>; Tue, 18 Jun 2024 09:33:35 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id d4e351f2;
	Tue, 18 Jun 2024 09:31:08 +0000 (UTC)
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [2a00:1450:4864:20::12d])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 34b75c29
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Tue, 18 Jun 2024 09:31:06 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-52c32d934c2so5622206e87.2
 for <wireguard@lists.zx2c4.com>; Tue, 18 Jun 2024 02:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718703065; x=1719307865; darn=lists.zx2c4.com;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Gd0sb+wrja9GmMiLQT0DMWUWixEF5baH+EtRGLOjO0I=;
 b=QH3+ep4peqUrABWtxHYcBsTTyr07NnUnKinzxe3G8KbnAdqNB1G8dtmUt0U58BX7wb
 PiMFbYvzLdkPkFv26xMplPqBFhxcDywCgsloj6+cNbUPwyKG6x0CCKsPuTshvEwr/Gab
 4FxG1MKEV9JR+A130fjqQ/Mfm+pwPftrfDCx0Vob+kKzfNy6ajsMi+T+ejiOvmgfkEuN
 Rnsk8rjsnrwT2lM2dBlUqLPHkkmsqpGXgAh867zXbCISpDv2iuQlrxN2r8E44dUBcB5i
 usCpD1R/0EH3Jzix3Q1iNMtYAtwyeixHhkffLEnbaSaolVI5JOKfS6D+HPeowgfKE/yP
 tZ4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718703065; x=1719307865;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Gd0sb+wrja9GmMiLQT0DMWUWixEF5baH+EtRGLOjO0I=;
 b=vavOe5rxDh4Qp09iI7iRM+79W1mZEz+vFgshqoEH4AKMSUJP0O/qptARygdnmXRcC9
 Oc70pCYyeka3HCnLCTuvqhslyupDuQSoq9WrqQu3WC0toiAncZzUl+Lzwa0uzrDYR5UX
 2bNATZOlsptb1BhAvyoYKZXeyq+7ouXlLc3y/S/VYsAWhlyQ2aJM4gf9wLIHVTj9mjQX
 Mu5RHczsLGUQmR2syvbYVeN6CTRU9QPnaQqXPDtkfvQqgyXnqeZekSAWOdwhdafgY5Qm
 j8B9pecVWqG9BeA1fiVxZzhMGJiLlE+wHfv8DQ+gkWHZEzqKHUBgIy9jkWsQfbn5guCl
 oXeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU27Yqb8CDzqThjLxQyhsWWQZULwxunjUm9MkepprHm8k9TbKhZstLeZg2fPw3bKqcLrCRbGBc+I0RcTd2PKHnVBM8GsyStpj1i
X-Gm-Message-State: AOJu0Yz5Ua3PNy8Y/EU1IYL3odM7pDMaf7oHxFYa4HNs+xEL2dY70ll/
 2YbEfhm+0n/UK7EdJqA3E3zxdMrYc6YywAROm5RjcOCyf7IsrMJz
X-Google-Smtp-Source: AGHT+IEirA7ZfcWMvk+A5QKOFGiN5irQ5RBB6sZAAJ03RtbeHM09p7vDGOoZf2DqBzAK5fdSSuz/pQ==
X-Received: by 2002:a19:9141:0:b0:52c:81d5:cf96 with SMTP id
 2adb3069b0e04-52ca6e659demr6468892e87.28.1718703065080; 
 Tue, 18 Jun 2024 02:31:05 -0700 (PDT)
Received: from pc636 (host-90-233-216-238.mobileonline.telia.com.
 [90.233.216.238]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ca2825b38sm1445362e87.24.2024.06.18.02.31.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jun 2024 02:31:04 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Tue, 18 Jun 2024 11:31:00 +0200
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Uladzislau Rezki <urezki@gmail.com>, paulmck@kernel.org,
 "Jason A. Donenfeld" <Jason@zx2c4.com>, Jakub Kicinski <kuba@kernel.org>,
 Julia Lawall <Julia.Lawall@inria.fr>, linux-block@vger.kernel.org,
 kernel-janitors@vger.kernel.org, bridge@lists.linux.dev,
 linux-trace-kernel@vger.kernel.org,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 kvm@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 "Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Nicholas Piggin <npiggin@gmail.com>, netdev@vger.kernel.org,
 wireguard@lists.zx2c4.com, linux-kernel@vger.kernel.org,
 ecryptfs@vger.kernel.org, Neil Brown <neilb@suse.de>,
 Olga Kornievskaia <kolga@netapp.com>, Dai Ngo <Dai.Ngo@oracle.com>,
 Tom Talpey <tom@talpey.com>, linux-nfs@vger.kernel.org,
 linux-can@vger.kernel.org, Lai Jiangshan <jiangshanlai@gmail.com>,
 netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
 kasan-dev <kasan-dev@googlegroups.com>
Subject: Re: [PATCH 00/14] replace call_rcu by kfree_rcu for simple
 kmem_cache_free callback
Message-ID: <ZnFT1Czb8oRb0SE7@pc636>
References: <baee4d58-17b4-4918-8e45-4d8068a23e8c@paulmck-laptop>
 <Zmov7ZaL-54T9GiM@zx2c4.com> <Zmo9-YGraiCj5-MI@zx2c4.com>
 <08ee7eb2-8d08-4f1f-9c46-495a544b8c0e@paulmck-laptop>
 <Zmrkkel0Fo4_g75a@zx2c4.com>
 <e926e3c6-05ce-4ba6-9e2e-e5f3b37bcc23@suse.cz>
 <3b6fe525-626c-41fb-8625-3925ca820d8e@paulmck-laptop>
 <6711935d-20b5-41c1-8864-db3fc7d7823d@suse.cz>
 <ZnCDgdg1EH6V7w5d@pc636>
 <36c60acd-543e-48c5-8bd2-6ed509972d28@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <36c60acd-543e-48c5-8bd2-6ed509972d28@suse.cz>
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

> On 6/17/24 8:42 PM, Uladzislau Rezki wrote:
> >> +
> >> +	s = container_of(work, struct kmem_cache, async_destroy_work);
> >> +
> >> +	// XXX use the real kmem_cache_free_barrier() or similar thing here
> > It implies that we need to introduce kfree_rcu_barrier(), a new API, which i
> > wanted to avoid initially.
> 
> I wanted to avoid new API or flags for kfree_rcu() users and this would
> be achieved. The barrier is used internally so I don't consider that an
> API to avoid. How difficult is the implementation is another question,
> depending on how the current batching works. Once (if) we have sheaves
> proven to work and move kfree_rcu() fully into SLUB, the barrier might
> also look different and hopefully easier. So maybe it's not worth to
> invest too much into that barrier and just go for the potentially
> longer, but easier to implement?
> 
Right. I agree here. If the cache is not empty, OK, we just defer the
work, even we can use a big 21 seconds delay, after that we just "warn"
if it is still not empty and leave it as it is, i.e. emit a warning and
we are done.

Destroying the cache is not something that must happen right away. 

> > Since you do it asynchronous can we just repeat
> > and wait until it a cache is furry freed?
> 
> The problem is we want to detect the cases when it's not fully freed
> because there was an actual read. So at some point we'd need to stop the
> repeats because we know there can no longer be any kfree_rcu()'s in
> flight since the kmem_cache_destroy() was called.
> 
Agree. As noted above, we can go with 21 seconds(as an example) interval
and just perform destroy(without repeating).

--
Uladzislau Rezki
