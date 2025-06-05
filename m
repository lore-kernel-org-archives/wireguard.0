Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC56FC61DB8
	for <zx2c4-wireguard@archiver.kernel.org>; Thu,  5 Jun 2025 04:23:35 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 608f2cfe;
	Thu, 5 Jun 2025 04:23:33 +0000 (UTC)
Received: from mail-yb1-xb2b.google.com (mail-yb1-xb2b.google.com
 [2607:f8b0:4864:20::b2b])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 199779d2
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Thu, 5 Jun 2025 04:23:32 +0000 (UTC)
Received: by mail-yb1-xb2b.google.com with SMTP id
 3f1490d57ef6-e75668006b9so579055276.3
 for <wireguard@lists.zx2c4.com>; Wed, 04 Jun 2025 21:23:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1749097411; x=1749702211; darn=lists.zx2c4.com;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=PcOrzpWjq/BkBEzwdw8mv0dCDmFt7adswzP9QPspSUg=;
 b=hpQkAJHQQaMgOusSODvUoYB2BRLwe1sFL2RaayvcsoimWp4VxL9SnynVbW/PFU02tZ
 eN8ehIOg5lIriqAJDWOqztTag5r2bsyh9zSi5b4QVPEbxRe/S8pJSJlzHa3qW809DLhL
 bCMVL9ZsiXcW+nDwQ4pXNkX8x2wkhebQ4dcAo/gxKH/lLC7IVlqAwkSWSfwiIJZWF7Nw
 7zduLCNd9DDGTMZpMRPAjcSzIU/RKNOLOx11VDasZ+JEH4PJR/mUg2b1HIlOr2WkiUON
 WZdGw8p0Hzh4pYlkY0WN1jy4wefvG5BzFI2/P9iBqainuygetspRJDOKEVEMbRZbaYsn
 pxUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749097411; x=1749702211;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PcOrzpWjq/BkBEzwdw8mv0dCDmFt7adswzP9QPspSUg=;
 b=NIqRGHPfWbpTIrK/ytV60N9IeEAVsa7UYbh9r7iYjxnV+B6w9/CHx5H4jxkOHO89Iz
 IVnt6RrnH/J58IqMJddILe3TriXM0xkx86OFrB/32VaMXNi6fNhdQKxow1n3uQsnWGRX
 kljIlTy/ueqKnnnuekD0xYiRxymR3vDKX7Gt/8z/sel6X1j+ezVXDe1h/H0ubaKOORys
 8qCCcUVx3j8BS15AXXP5Ikp3J+d+TMErt1lewn6iEKLk6O07rbO2SnPGRZ0bn7YqC6GD
 Y4UiSbNRY8CwPLSP5KKY6OlLNgG+gSUToRh7hliS8QL3cciaBkpiGdiM/MDZdCj8q5Uk
 emEA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUyFeCJjqv8YUNaA/gqD8O9aAYMD9LTK87KM8N52OR2reoQeGU1XUqqVFEF5PTfQEiFHRcF93JBNHI=@lists.zx2c4.com
X-Gm-Message-State: AOJu0YzK+XZrXg2m6Feg21mozK+TDwEOtTxizwMGcLIjgajxtKA8NARK
 TOtrRiXl/pZMZ4abaYDxCcGkCTQ0YWJDUqcxKKTKsJLM6KQyRXRX/zvN
X-Gm-Gg: ASbGncuKBh98Nrkh/venXm7q+jjHf6zklVylQpc29WWkYTfk/2Aislhuvb7Z6JmilYn
 KxxKM/0KKBUphiV/ILa/a0OMUdiAc2G4p84VtKxiexlrX1EstymlM+YB539cW7ea6VSMvX/+/fX
 wsCEjS8sCJ/+W3i+yvWI4QWf6WAop4YH/Jf4u49n2YkM7J0RUcCCmf1xKcxP0Q158KXUeHe7tQR
 ZgNFku1NGO5xi217axaRwSbYRWVXUd2zl9wEJw8318V/qRge3W4GefhFGJ1dPuAu8t/T2TC7bOw
 Zw5zLIX4ljbs+dWTa3u9Peqt64PlltDs1K4jgJ1QZIpPiSOpc2tY1EBDOJ11ZD9ikZOzxhBDxGc
 N6XdSFJ01M/A=
X-Google-Smtp-Source: AGHT+IGwjW7MDmAwX88wzy2K6C4SsiEVtRq6YqAm1ZsuSD7WYUpOBa/WcBffoD7Zr8Xr/9saSv6bAA==
X-Received: by 2002:a05:6902:2e05:b0:e81:8760:15c8 with SMTP id
 3f1490d57ef6-e8187601fc2mr3665429276.28.1749097410596; 
 Wed, 04 Jun 2025 21:23:30 -0700 (PDT)
Received: from localhost (c-73-224-175-84.hsd1.fl.comcast.net. [73.224.175.84])
 by smtp.gmail.com with ESMTPSA id
 3f1490d57ef6-e7f733ee856sm3483847276.30.2025.06.04.21.23.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Jun 2025 21:23:29 -0700 (PDT)
Date: Thu, 5 Jun 2025 00:23:29 -0400
From: Yury Norov <yury.norov@gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] wireguard/queueing: simplify wg_cpumask_next_online()
Message-ID: <aEEbwQzSoVQAPqLq@yury>
References: <20250604233656.41896-1-yury.norov@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250604233656.41896-1-yury.norov@gmail.com>
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

On Wed, Jun 04, 2025 at 07:36:55PM -0400, Yury Norov wrote:
> wg_cpumask_choose_online() opencodes cpumask_nth(). Use it and make the
> function significantly simpler. While there, fix opencoded cpu_online()
> too. 
> 
> Signed-off-by: Yury Norov <yury.norov@gmail.com>
> ---
>  drivers/net/wireguard/queueing.h | 14 ++++----------
>  1 file changed, 4 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/net/wireguard/queueing.h b/drivers/net/wireguard/queueing.h
> index 7eb76724b3ed..3bfe16f71af0 100644
> --- a/drivers/net/wireguard/queueing.h
> +++ b/drivers/net/wireguard/queueing.h
> @@ -104,17 +104,11 @@ static inline void wg_reset_packet(struct sk_buff *skb, bool encapsulating)
>  
>  static inline int wg_cpumask_choose_online(int *stored_cpu, unsigned int id)
>  {
> -	unsigned int cpu = *stored_cpu, cpu_index, i;
> +	if (likely(*stored_cpu < nr_cpu_ids && cpu_online(*stored_cpu)))
> +		return cpu;

Oops... This should be 
                return *stored_cpu;

I'll resend, sorry for noise.

>  
> -	if (unlikely(cpu >= nr_cpu_ids ||
> -		     !cpumask_test_cpu(cpu, cpu_online_mask))) {
> -		cpu_index = id % cpumask_weight(cpu_online_mask);
> -		cpu = cpumask_first(cpu_online_mask);
> -		for (i = 0; i < cpu_index; ++i)
> -			cpu = cpumask_next(cpu, cpu_online_mask);
> -		*stored_cpu = cpu;
> -	}
> -	return cpu;
> +	*stored_cpu = cpumask_nth(id % num_online_cpus(), cpu_online_mask);
> +	return *stored_cpu;
>  }
>  
>  /* This function is racy, in the sense that it's called while last_cpu is
> -- 
> 2.43.0
