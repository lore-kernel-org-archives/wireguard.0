Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 008F5C41513
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 17 Jun 2024 17:22:17 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 3493da4e;
	Mon, 17 Jun 2024 17:20:00 +0000 (UTC)
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [2a00:1450:4864:20::131])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id cc46f661
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 Jun 2024 17:19:58 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-52c89d6b4adso4236354e87.3
 for <wireguard@lists.zx2c4.com>; Mon, 17 Jun 2024 10:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718644797; x=1719249597; darn=lists.zx2c4.com;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:date:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=vZ8O3vkKnV5WMsPPzukATAgUwpYfoN3xcCe/8i65jUE=;
 b=WZYQuIqTGwH9U9fXVYidAuPvd2FenhxyzQMkDA0KNiQkRNzOCS6JJ+wIf20z7A1F0z
 PeKeh7rEEFj6tKCz3tb4LKHEwIoBnmzlvfPNImd3NVc71yQNVLZ5REZG5VDX42o7r2/1
 cg08ucprTlXQeHpsbMfs37T1P2Q2bZenOw1g6rieGYwvev9O7Gk09SwDM6y2qMZERIBe
 CDHE3/VDTIIhF9bE/YEcUspl1JmKo+UXydeVAsmo7e9LowAj3s5fMOr2NMZ/JOhtLzIq
 eGm9MHe7YmhvnN36+qtgefc0Sz/X1fN7Qrz4Z6FqvBwHB2tMJZeUygjqUc72eABit/az
 ApHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718644797; x=1719249597;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:date:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vZ8O3vkKnV5WMsPPzukATAgUwpYfoN3xcCe/8i65jUE=;
 b=q3siE7F3dZd/QhM6lg/lnp6EGSEFqYufh2veYRDGhS/dS/WYLuDxXIOjDb7ae0hXq1
 QANk2RNorNbG4JBnhaoeCT07Z6O5BzEmESdVEO86gymBBSbME5Bid02wn6CVPoeqVrzf
 Ix63IRhguT9xGIpzwkysdW9uGmIl3lPra9AZwqIY2IVseUq6bZWEXPQZFCB3UyN8rj7b
 EOgT/ze26ytsXMBxu+XJupA1pw7RgECb7DiEgKsR/d13h0juxUkVQz61QWuV8gwEECpp
 iaA/G/XChalHVmBLC7mWuhTRbIuJmI6UpKiB12PvP3tGbE+1M+qeYVOhMERGzW1i6wV1
 43lA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMrX5vkhjnMjWXiTgBH5Ybx1xlcO1bfdaEDlABdzvmL1APD/ZBcmfiXdEv3zDAnCbMyz9IYdrknulgJkUmYxvP1dTMXCPXvEpy
X-Gm-Message-State: AOJu0Yw6cLPKrSe3QbbqE57jx2lRixzYdyFixC4/bASoFR25v4IG7riO
 5S3NqJhAiCX//IYdCpwz9yQDWg9pBxIwS+9GobXPPCg6DD2n6NUzKwLj1nNV
X-Google-Smtp-Source: AGHT+IF+kn6orlxXNu+KbBfK5TuJ9FRTaW/E7mKFLwWnfY9/g3N+9lA943ajPi6EK1Z9MmgGKAp4XQ==
X-Received: by 2002:a19:8c5a:0:b0:52c:88d6:891d with SMTP id
 2adb3069b0e04-52ca6e5637emr6427245e87.9.1718644797253; 
 Mon, 17 Jun 2024 10:19:57 -0700 (PDT)
Received: from pc636 (host-90-233-216-238.mobileonline.telia.com.
 [90.233.216.238]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ca28722b0sm1286680e87.126.2024.06.17.10.19.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 10:19:56 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Mon, 17 Jun 2024 19:19:53 +0200
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Uladzislau Rezki <urezki@gmail.com>,
 "Paul E. McKenney" <paulmck@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>, Jakub Kicinski <kuba@kernel.org>,
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
 netfilter-devel@vger.kernel.org, coreteam@netfilter.org
Subject: Re: [PATCH 00/14] replace call_rcu by kfree_rcu for simple
 kmem_cache_free callback
Message-ID: <ZnBwOf3faUJMbrfW@pc636>
References: <ZmszOd5idhf2Cb-v@pc636>
 <b03b007f-3afa-4ad4-b76b-dea7b3aa2bc3@paulmck-laptop>
 <Zmw5FTX752g0vtlD@pc638.lan> <ZmybGZDbXkw7JTjc@zx2c4.com>
 <ZnA_QFvuyABnD3ZA@pc636> <ZnBOkZClsvAUa_5X@zx2c4.com>
 <ZnBkvYdbAWILs7qx@pc636>
 <CAHmME9r4q8erE3E-Xn61ZkSOdDDrgx6jhTAywx3ca4=G0z=wAA@mail.gmail.com>
 <ZnBnb1WkJFXs5L6z@pc636> <ZnBrCQy13jZV_hyZ@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZnBrCQy13jZV_hyZ@zx2c4.com>
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

On Mon, Jun 17, 2024 at 06:57:45PM +0200, Jason A. Donenfeld wrote:
> On Mon, Jun 17, 2024 at 06:42:23PM +0200, Uladzislau Rezki wrote:
> > On Mon, Jun 17, 2024 at 06:33:23PM +0200, Jason A. Donenfeld wrote:
> > > On Mon, Jun 17, 2024 at 6:30 PM Uladzislau Rezki <urezki@gmail.com> wrote:
> > > > Here if an "err" is less then "0" means there are still objects
> > > > whereas "is_destroyed" is set to "true" which is not correlated
> > > > with a comment:
> > > >
> > > > "Destruction happens when no objects"
> > > 
> > > The comment is just poorly written. But the logic of the code is right.
> > > 
> > OK.
> > 
> > > >
> > > > >  out_unlock:
> > > > >       mutex_unlock(&slab_mutex);
> > > > >       cpus_read_unlock();
> > > > > diff --git a/mm/slub.c b/mm/slub.c
> > > > > index 1373ac365a46..7db8fe90a323 100644
> > > > > --- a/mm/slub.c
> > > > > +++ b/mm/slub.c
> > > > > @@ -4510,6 +4510,8 @@ void kmem_cache_free(struct kmem_cache *s, void *x)
> > > > >               return;
> > > > >       trace_kmem_cache_free(_RET_IP_, x, s);
> > > > >       slab_free(s, virt_to_slab(x), x, _RET_IP_);
> > > > > +     if (s->is_destroyed)
> > > > > +             kmem_cache_destroy(s);
> > >
> > Here i am not follow you. How do you see that a cache has been fully
> > freed? Or is it just super draft code?
> 
> kmem_cache_destroy() does this in shutdown_cache().
>
Right. In this scenario you invoke kmem_cache_destroy() over and over
until the last object gets freed. This potentially slowing the kmem_cache_free()
which is not OK, at least to me.

--
Uladzislau Rezki
