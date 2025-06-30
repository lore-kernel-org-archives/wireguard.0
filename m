Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 289BCC83029
	for <zx2c4-wireguard@archiver.kernel.org>; Mon, 30 Jun 2025 17:43:12 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a73ca3bb;
	Mon, 30 Jun 2025 17:33:45 +0000 (UTC)
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com
 [2607:f8b0:4864:20::1033])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 959baae2
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>;
 Mon, 30 Jun 2025 17:33:42 +0000 (UTC)
Received: by mail-pj1-x1033.google.com with SMTP id
 98e67ed59e1d1-31223a4cddeso1238333a91.1
 for <wireguard@lists.zx2c4.com>; Mon, 30 Jun 2025 10:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1751304821; x=1751909621; darn=lists.zx2c4.com;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=HbxVGgcvP6OMrt/mkiJLM3OwkDNoJLobRkyzsMgrhcs=;
 b=PwFfsDfVhQG9Pv5Rpx6VF7NMIAxcu/5HJJG9n9ilFhzzA5KpbCbVzx6KV9PtoXvGZh
 ZibRB3HxjwXLyV+v6wHD9cLLcRhq3RXLDCdTobhLgb2tLzy6WqR9ewnr3la1nx7pdfev
 NrtNJEfhhUPcse+I/TF9e8rnNr4HzDFdsTeyeiiHA/naaKzBtvqTWVrKpfgVYjdmB0H0
 hgao+rMDeQVWIKFrQuJp9144s7MhSY5S9LohpzdERfEk0+bmc7PkauncHPNLvJfV0BDn
 x3+pQg+sh8hZL2R/ehua+Jj99BxuTJnlD6CIe/dPGXnItFg+dRaPowRLkiDAtPOQ+Wzb
 tvyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751304821; x=1751909621;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HbxVGgcvP6OMrt/mkiJLM3OwkDNoJLobRkyzsMgrhcs=;
 b=dME8WS9SI6cO2AlAhwcUkqShmPAuvJcmn1bCpo8tAVHIZ9HclfndbeRSwW0EJlu+z7
 IRQTt2mGD2AcSfrsgrQsOSs+zBvYMXqtKBdOT8DnUpRJJ9ECXAVtYT/SRrCjbJUGi0Gb
 0BCE+6e2i2+6IEnlPxHgPFTj1u1omnLuhEjdzHBYw0R0sbkvPT7nojd3YJyVaZR73ZtG
 /0+PnP4a+k95IM+mCYXKgNDrs/86C4H6j6n3TuLaZHUJsZsmEYT5CdXQcC37UltK3bOc
 104x6j1Qp+WwagEw1UkFyt4RWPyEwtDYXiOrjOum7QXIOkq6XkeSQq+CyD/b7p/VdrUt
 sfjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkYxIeYGDaFXkyfreG+w2j40PnCthkbKd3SruwavrR571x8luEEgsHKqHhuzs+Ux05TapiIempamE=@lists.zx2c4.com
X-Gm-Message-State: AOJu0Yx02JAlF92OuHw+jYkRUMh2MmiCFkQs/jJj5/cBky2ppBRlkTGg
 eOwL/d4b7pa7jc3tPYiJXqyySQnir9HIgL03TyllJaK3AmfB8++q2TJ84XIZ+Q==
X-Gm-Gg: ASbGnctQo2ArdK4MgH1IZDDutseGoy3K71x/uhmrxQPzMPBngsxbEJ0aJ2yqWbe/IkN
 pBLZTOHh2JjepInO+x55q976Bc0mUIx72SqlNZXN7O4VmvV4raoNl/ziNwuU+bw1TvmMduTdTuN
 NXzsp/9ZMZXbyCoKGeFkNZQadBulzHfPyVxW2Blj8Jpk7cOB0SY0rxrDVl0zK8uBkFyXUdIlp/m
 Y9Ky5jxu+seHhqw+GAtrpX0d+LWOHngQok8J4DKzhg1VGTH+DmFh99HKzLvhVmwUQdxWhFFU2aC
 lF6acSYfr/zJyXFGR2Tb/HiLzdBuspsClvd041Eq2W6ptekFqZ2OOIon3XcnvLZUmQmkwxyD
X-Google-Smtp-Source: AGHT+IHxwfs1tneuBNRJHj9AainQycwiHovhSKVrs9FnHQypaUW4br4XdYSWpdOhHL9jUZJPzIIlyA==
X-Received: by 2002:a17:90b:2c83:b0:315:cc22:68d9 with SMTP id
 98e67ed59e1d1-318c927f2e4mr19601212a91.31.1751304820832; 
 Mon, 30 Jun 2025 10:33:40 -0700 (PDT)
Received: from localhost ([216.228.127.130]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3193a5d7e8fsm74846a91.1.2025.06.30.10.33.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jun 2025 10:33:40 -0700 (PDT)
Date: Mon, 30 Jun 2025 13:33:37 -0400
From: Yury Norov <yury.norov@gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] wireguard: queueing: simplify wg_cpumask_next_online()
Message-ID: <aGLKcbR6QmrQ7HE8@yury>
References: <20250619145501.351951-1-yury.norov@gmail.com>
 <aGLIUZXHyBTG4zjm@zx2c4.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGLIUZXHyBTG4zjm@zx2c4.com>
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

On Mon, Jun 30, 2025 at 07:24:33PM +0200, Jason A. Donenfeld wrote:
> On Thu, Jun 19, 2025 at 10:54:59AM -0400, Yury Norov wrote:
> > From: Yury Norov [NVIDIA] <yury.norov@gmail.com>
> > 
> > wg_cpumask_choose_online() opencodes cpumask_nth(). Use it and make the
> > function significantly simpler. While there, fix opencoded cpu_online()
> > too.
> > 
> > Signed-off-by: Yury Norov [NVIDIA] <yury.norov@gmail.com>
> > ---
> > v1: https://lore.kernel.org/all/20250604233656.41896-1-yury.norov@gmail.com/
> > v2:
> >  - fix 'cpu' undeclared;
> >  - change subject (Jason);
> >  - keep the original function structure (Jason);
> > 
> >  drivers/net/wireguard/queueing.h | 13 ++++---------
> >  1 file changed, 4 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/net/wireguard/queueing.h b/drivers/net/wireguard/queueing.h
> > index 7eb76724b3ed..56314f98b6ba 100644
> > --- a/drivers/net/wireguard/queueing.h
> > +++ b/drivers/net/wireguard/queueing.h
> > @@ -104,16 +104,11 @@ static inline void wg_reset_packet(struct sk_buff *skb, bool encapsulating)
> >  
> >  static inline int wg_cpumask_choose_online(int *stored_cpu, unsigned int id)
> >  {
> > -	unsigned int cpu = *stored_cpu, cpu_index, i;
> > +	unsigned int cpu = *stored_cpu;
> > +
> > +	if (unlikely(cpu >= nr_cpu_ids || !cpu_online(cpu)))
> > +		cpu = *stored_cpu = cpumask_nth(id % num_online_cpus(), cpu_online_mask);
> 
> I was about to apply this but then it occurred to me: what happens if
> cpu_online_mask changes (shrinks) after num_online_cpus() is evaluated?
> cpumask_nth() will then return nr_cpu_ids?

It will return >= nd_cpu_ids. The original version based a for-loop
does the same, so I decided that the caller is safe against it.

If not, I can send a v3. But, what should we do - retry, or return a
local cpu? Or something else?

Thanks,
Yury
