Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3AE3C2BA18
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 17 Jun 2024 16:51:29 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id cddb5353;
	Mon, 17 Jun 2024 16:42:35 +0000 (UTC)
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [2a00:1450:4864:20::12f])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 1c38e3d0
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 17 Jun 2024 16:42:27 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-52c84a21c62so5148553e87.1
 for <wireguard@lists.zx2c4.com>; Mon, 17 Jun 2024 09:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718642547; x=1719247347; darn=lists.zx2c4.com;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:date:from:from:to
 :cc:subject:date:message-id:reply-to;
 bh=nVbXAXBamX9byggpH5pf9RLnfjUsWFyotRoWWJmUCyg=;
 b=ZGhnbqBj57CfX+W4oornI2V6cEvd5awvWVc/pELhG4idD+L26r1OdRIVVqNqyXGgf+
 1WCJPYXrpt+rMOFYNxxYjVXnJ/g+jETzzFgLtELmBOMdWO9dOU0QKqacnxkIdMS4ouVx
 c4vC/EdVtWJl2zMYRpWoBUcI/rVm0tZBDtw2qOBGg7TYrnAkEXYSLhG2DjNkzm44rs8Y
 uFeCSz5P4M3lrvPFONFmodysjpSeQOKtq2VKL8NfZtRNHZWAENGrU6jeezurMR3OgHNy
 lfWROKgmmFp4KR285DDAdqUBNmJV7D6JvaJQyKnTVhGUJmAdB7hbC6E+sUjunlyssQBn
 ilNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718642547; x=1719247347;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:date:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=nVbXAXBamX9byggpH5pf9RLnfjUsWFyotRoWWJmUCyg=;
 b=m2+VQJ7Wh9CvJPDYdrWVfyeanULy89GlAbGHJULW32wcbLvKbgkxD1Y15hOLOM3qpO
 Wes0D7X/YckVMtmZOlpwcmnSSFxEWXjJ9SWy3+Di3bLDYBXuX+/4lpEjcz+4OaAUKOfg
 FDTT1gwrWsNEH6U2Y6tGDYSDz3q/FVtBC7JYR6+BCynhemLKnF/BzC+otAJag5xPSDf2
 rImcUcs4yTfLCiNQOU0Roz8eaJl5F+q911eFQxU2zu9ibu+Ooit6OD8xm+1T43mb8xrN
 m2dn+UhJbwmJXVdSd7m6qUEP7awiScvKNaFhVZy7TQFl7HM3dLtSGlkGDV6REVkNqLuj
 akcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1eiGPRZ3OMHhBia6vyPPwiLWyfuxL3Rtx4ogL3/FQtrPKmaXOQ+xTwE6StymYLLCakREvaM7Ujr8xvw5V9W71L2ScYV764wb0
X-Gm-Message-State: AOJu0Yy8r6EzmDYdrU6k0PLP+enGbP5aig3VPdKsdAe8cMzZyVS3idry
 41mDKuyi4LVtrKlu9+ZvXoCeANb3SMbGAQKKS9svNEa4aoMpdR86
X-Google-Smtp-Source: AGHT+IEbAoHoo+cqq7GZF8p0qgsFLjS7D8dpwx0oAM5cf5weHrkVdSXGtAH7Cuol28FV9Mqr6MxQYg==
X-Received: by 2002:a19:2d48:0:b0:52c:8fba:e2a1 with SMTP id
 2adb3069b0e04-52ca6e657c4mr6499193e87.18.1718642546982; 
 Mon, 17 Jun 2024 09:42:26 -0700 (PDT)
Received: from pc636 (host-90-233-216-238.mobileonline.telia.com.
 [90.233.216.238]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ca28722e2sm1265845e87.136.2024.06.17.09.42.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Jun 2024 09:42:26 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Mon, 17 Jun 2024 18:42:23 +0200
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
Message-ID: <ZnBnb1WkJFXs5L6z@pc636>
References: <Zmsuswo8OPIhY5KJ@pc636>
 <cb51bc57-47b8-456a-9ac0-f8aa0931b144@paulmck-laptop>
 <ZmszOd5idhf2Cb-v@pc636>
 <b03b007f-3afa-4ad4-b76b-dea7b3aa2bc3@paulmck-laptop>
 <Zmw5FTX752g0vtlD@pc638.lan> <ZmybGZDbXkw7JTjc@zx2c4.com>
 <ZnA_QFvuyABnD3ZA@pc636> <ZnBOkZClsvAUa_5X@zx2c4.com>
 <ZnBkvYdbAWILs7qx@pc636>
 <CAHmME9r4q8erE3E-Xn61ZkSOdDDrgx6jhTAywx3ca4=G0z=wAA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHmME9r4q8erE3E-Xn61ZkSOdDDrgx6jhTAywx3ca4=G0z=wAA@mail.gmail.com>
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

On Mon, Jun 17, 2024 at 06:33:23PM +0200, Jason A. Donenfeld wrote:
> On Mon, Jun 17, 2024 at 6:30 PM Uladzislau Rezki <urezki@gmail.com> wrote:
> > Here if an "err" is less then "0" means there are still objects
> > whereas "is_destroyed" is set to "true" which is not correlated
> > with a comment:
> >
> > "Destruction happens when no objects"
> 
> The comment is just poorly written. But the logic of the code is right.
> 
OK.

> >
> > >  out_unlock:
> > >       mutex_unlock(&slab_mutex);
> > >       cpus_read_unlock();
> > > diff --git a/mm/slub.c b/mm/slub.c
> > > index 1373ac365a46..7db8fe90a323 100644
> > > --- a/mm/slub.c
> > > +++ b/mm/slub.c
> > > @@ -4510,6 +4510,8 @@ void kmem_cache_free(struct kmem_cache *s, void *x)
> > >               return;
> > >       trace_kmem_cache_free(_RET_IP_, x, s);
> > >       slab_free(s, virt_to_slab(x), x, _RET_IP_);
> > > +     if (s->is_destroyed)
> > > +             kmem_cache_destroy(s);
>
Here i am not follow you. How do you see that a cache has been fully
freed? Or is it just super draft code?

Thanks!

--
Uladzislau Rezki
