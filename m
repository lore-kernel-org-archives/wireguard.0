Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7F31C61DA4
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 Mar 2023 23:22:56 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id a473aa72;
	Mon, 6 Mar 2023 23:06:53 +0000 (UTC)
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [2607:f8b0:4864:20::336])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id b122c2cf
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 6 Mar 2023 16:26:35 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 e9-20020a056830200900b00694651d19f6so2746315otp.12
 for <wireguard@lists.zx2c4.com>; Mon, 06 Mar 2023 08:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678119994;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=JXnJjEIOpZbPuEgqFoR8MuwGlYRD8/do8e4iqVYe9jA=;
 b=g2J1sOvHFScq9ttVIurPqh6uAVdu9A9+zHDROKJbzN8VcYNxBAVfI+tsucHnUA8/Ac
 8tq9jyUdB63cpoi9l0zvWwyf2mdYmtBfgqEwUkHi5aw4AKS2lLQoG6JZoCTo1EQXpC5d
 mjQ2vS7bP7YwIcosH996Cgf2tKcoXLNfKwZnuXvOnKDJG4r5Tpyqs1JdvZakHp1KvNlZ
 0YDzTjz7eakWo+QR8wrkz7uT/6nAcIhTBWimKa/6KmyM+YEXfapBRIqwUSKh215xAUn6
 VlfoXFS+0t0Gl5NLgaJ6Ar1Ld4OjC4EX5wk1s2WenrPJoIy34wEEqo2rC/EF/8eFOMA/
 CKsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678119994;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JXnJjEIOpZbPuEgqFoR8MuwGlYRD8/do8e4iqVYe9jA=;
 b=Pz1CudG/rVZEmk1ezy8Hyj9N6OrjEP+G6Z3Gwg43t8wXdcV9l2z5q/DD7jKjA4KOu4
 abnZY2516qPHJURqkmZ1DKbB+WeJb7UDRjATiFVkV/aTTlJtgfvm6zPhiMGs8IZazPVr
 iQvJd+MIhEkuKx/BFBIXdAgS5VHX4jJlSL1wBPmlwCCn7rhles8iQAWyoMxpb60S2eXt
 S3qD9Etua6AsqCyUBf9k/v9zqE0LM9SM6R1y8ykhupwxQUJDaChwgiJF126BW5rviE+K
 ble5QQmw9MHxH2KpgOWRL6cjnfS/45VVkr7JMI5/XJPTnCIoWUtY9y+lyPYrYgoEkzaZ
 1ipg==
X-Gm-Message-State: AO0yUKWOKcKP6f2UenD996pP1zktxEFpMzCQFCdA79HX3we4ybbwObzo
 8lfkpckAmKsv3PsbDQ0Q5oc=
X-Google-Smtp-Source: AK7set854bcEzEyHdjoLmMiODiDoqSho1Jnq1WR5UQCRePSQOWlyKsiQ7DfOgrVk6sIwi1qC6U3GzQ==
X-Received: by 2002:a9d:718e:0:b0:694:1f5b:9a81 with SMTP id
 o14-20020a9d718e000000b006941f5b9a81mr4626020otj.28.1678119993802; 
 Mon, 06 Mar 2023 08:26:33 -0800 (PST)
Received: from localhost ([12.97.180.36]) by smtp.gmail.com with ESMTPSA id
 f9-20020a9d5f09000000b0068bce0cd4e1sm4260265oti.9.2023.03.06.08.26.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 08:26:33 -0800 (PST)
Date: Mon, 6 Mar 2023 08:26:32 -0800
From: Yury Norov <yury.norov@gmail.com>
To: Vernon Yang <vernon2gm@gmail.com>
Cc: torvalds@linux-foundation.org, tytso@mit.edu, Jason@zx2c4.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, jejb@linux.ibm.com, martin.petersen@oracle.com,
 andriy.shevchenko@linux.intel.com, linux@rasmusvillemoes.dk,
 james.smart@broadcom.com, dick.kennedy@broadcom.com,
 linux-kernel@vger.kernel.org, wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org, linux-scsi@vger.kernel.org
Subject: Re: [PATCH 1/5] random: fix try_to_generate_entropy() if no further
 cpus set
Message-ID: <ZAYUODI1yaH5PqHk@yury-laptop>
References: <20230306160651.2016767-1-vernon2gm@gmail.com>
 <20230306160651.2016767-2-vernon2gm@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230306160651.2016767-2-vernon2gm@gmail.com>
X-Mailman-Approved-At: Mon, 06 Mar 2023 23:06:36 +0000
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

On Tue, Mar 07, 2023 at 12:06:47AM +0800, Vernon Yang wrote:
> After commit 596ff4a09b89 ("cpumask: re-introduce constant-sized cpumask
> optimizations"), when NR_CPUS <= BITS_PER_LONG, small_cpumask_bits used
> a macro instead of variable-sized for efficient.
> 
> If no further cpus set, the cpumask_next() returns small_cpumask_bits,
> it must greater than or equal to nr_cpumask_bits, so fix it to correctly.
> 
> Signed-off-by: Vernon Yang <vernon2gm@gmail.com>

Hi Vernon,

In all that cases, nr_cpu_ids must be used. The difference is that
nr_cpumask_bits is an upper limit for possible CPUs, and it's derived
from compile-time NR_CPUS, unless CPUMASK_OFFSTACK is enabled.

nr_cpu_ids is an actual number of CPUS as counted on boot.

So, nr_cpu_ids is always equal or less than nr_cpumask_bits, and we'd
compare with the smaller number.

Nor sure, but maybe it's worth to introduce a macro like:
 #define valid_cpuid(cpu) (cpu) < nr_cpu_ids

Thanks,
Yury
> ---
>  drivers/char/random.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/char/random.c b/drivers/char/random.c
> index ce3ccd172cc8..d76f12a5f74f 100644
> --- a/drivers/char/random.c
> +++ b/drivers/char/random.c
> @@ -1311,7 +1311,7 @@ static void __cold try_to_generate_entropy(void)
>  			/* Basic CPU round-robin, which avoids the current CPU. */
>  			do {
>  				cpu = cpumask_next(cpu, &timer_cpus);
> -				if (cpu == nr_cpumask_bits)
> +				if (cpu >= nr_cpumask_bits)
>  					cpu = cpumask_first(&timer_cpus);
>  			} while (cpu == smp_processor_id() && num_cpus > 1);
>  
> -- 
> 2.34.1
