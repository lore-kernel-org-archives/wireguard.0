Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 999A9C64EC4
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 Mar 2023 23:22:57 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id ede95dd4;
	Mon, 6 Mar 2023 23:06:54 +0000 (UTC)
Received: from mail-ot1-x32e.google.com (mail-ot1-x32e.google.com
 [2607:f8b0:4864:20::32e])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 8a82c22f
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 6 Mar 2023 16:39:08 +0000 (UTC)
Received: by mail-ot1-x32e.google.com with SMTP id
 l15-20020a9d7a8f000000b0069447f0db6fso5655345otn.4
 for <wireguard@lists.zx2c4.com>; Mon, 06 Mar 2023 08:39:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678120747;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=ODdiL2GGQjRs6UwWBSlS8tiPxUSq4W658M+jg5aLzG0=;
 b=F6lHsRRIzrKcRAFzqP9yI7YWTkYLFB3Z1LUHcR/1MZQC1+90X9iTmFzuYv47Ys8NR7
 istQsrJPZqZcI7RxBmNvpd6dJjjP+leWYMvsZTh/r0vb+6HpR/7uHNeXTZ73Yaw0W4Aj
 8jpvLHywe3El23xTNuloLVw91GakuIusxUzCZ5oPXxZ7nS6oMXQG+xnSR7wt7WvFNN7Z
 ww8sY80PgI41ccC3CfwY0/6UtQhMIbGvUG4Lpj5r7MYiaQ1wkrpa+omtXrwOS2eSPpS/
 S+4T5blMsSNr7JoW9bDt/TV03jsqD7h3tL/aBclN5Sw8FmDaLT/UPtPjfLih/D5q1sRK
 5lhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678120747;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ODdiL2GGQjRs6UwWBSlS8tiPxUSq4W658M+jg5aLzG0=;
 b=6R1U+T0BrTdR9RGGsxGdjYn5Nr1mSpbvriesrS3Ym4X99y3LLHoiXS+C3+FPIBu4fU
 QZWAxYjtH/FYixg+KkKSHYq10x+nAS/spkT6hjcTM6UfabB5GYNjKO6Ryj4Qufzj3QTN
 Ekn03uRaKawWvImjQDe4Q40v5oQpnnoOrLrFSj7sELtbYKgz5xiV1sDuKeY+8SyRMEUP
 TBKO9ILw2bGuWaQtKrCuncF6ohSSFW9cViLs5rt4B8i1x0WUST/5VqXgzvLcvJK9ipet
 xxYgVseg7AVB9lsklmtPjOM/hwSQ2F0e62ErdZwmUCMn/+RhAjLQoQe5TfsjMwRnyRR/
 FSkw==
X-Gm-Message-State: AO0yUKVzDYD3TNSh3aA6N65kLl0s/IWgrDcjTSFz8wPbEUm6oukeqZrd
 gvU6vSSXrL9msRLG49PutbI=
X-Google-Smtp-Source: AK7set/QPoZiDC4TbcumqnuEDD22DJBGZsx/R7WR0KaLLby38WnIdWFktBpxENYvtSNYNfABEju4hA==
X-Received: by 2002:a05:6830:3485:b0:68b:d9d3:d8f with SMTP id
 c5-20020a056830348500b0068bd9d30d8fmr6085883otu.3.1678120746784; 
 Mon, 06 Mar 2023 08:39:06 -0800 (PST)
Received: from localhost ([12.97.180.36]) by smtp.gmail.com with ESMTPSA id
 w6-20020a056830144600b00693c9f984b4sm4234153otp.70.2023.03.06.08.39.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 08:39:06 -0800 (PST)
Date: Mon, 6 Mar 2023 08:39:03 -0800
From: Yury Norov <yury.norov@gmail.com>
To: Vernon Yang <vernon2gm@gmail.com>
Cc: torvalds@linux-foundation.org, tytso@mit.edu, Jason@zx2c4.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, jejb@linux.ibm.com, martin.petersen@oracle.com,
 andriy.shevchenko@linux.intel.com, linux@rasmusvillemoes.dk,
 james.smart@broadcom.com, dick.kennedy@broadcom.com,
 linux-kernel@vger.kernel.org, wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org, linux-scsi@vger.kernel.org
Subject: Re: [PATCH 5/5] cpumask: fix comment of cpumask_xxx
Message-ID: <ZAYXJ2E+JHcp2kD/@yury-laptop>
References: <20230306160651.2016767-1-vernon2gm@gmail.com>
 <20230306160651.2016767-6-vernon2gm@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230306160651.2016767-6-vernon2gm@gmail.com>
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

On Tue, Mar 07, 2023 at 12:06:51AM +0800, Vernon Yang wrote:
> After commit 596ff4a09b89 ("cpumask: re-introduce constant-sized cpumask
> optimizations"), the cpumask size is divided into three different case,
> so fix comment of cpumask_xxx correctly.
> 
> Signed-off-by: Vernon Yang <vernon2gm@gmail.com>
> ---
>  include/linux/cpumask.h | 46 ++++++++++++++++++++---------------------
>  1 file changed, 23 insertions(+), 23 deletions(-)
> 
> diff --git a/include/linux/cpumask.h b/include/linux/cpumask.h
> index 8fbe76607965..248bdb1c50dc 100644
> --- a/include/linux/cpumask.h
> +++ b/include/linux/cpumask.h
> @@ -155,7 +155,7 @@ static __always_inline unsigned int cpumask_check(unsigned int cpu)
>   * cpumask_first - get the first cpu in a cpumask
>   * @srcp: the cpumask pointer
>   *
> - * Returns >= nr_cpu_ids if no cpus set.
> + * Returns >= small_cpumask_bits if no cpus set.

There's no such thing like small_cpumask_bits. Here and everywhere,
nr_cpu_ids must be used.

Actually, before 596ff4a09b89 nr_cpumask_bits was deprecated, and it
must be like that for all users even now.

nr_cpumask_bits must be considered as internal cpumask parameter and
never referenced outside of cpumask code.

Thansk,
Yury
