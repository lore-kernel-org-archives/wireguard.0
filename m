Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49F00C64EC4
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 Mar 2023 23:35:01 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id eeba5b85;
	Mon, 6 Mar 2023 23:07:00 +0000 (UTC)
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [2607:f8b0:4864:20::633])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 4d6f3719
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 6 Mar 2023 20:09:45 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id i10so11725998plr.9
 for <wireguard@lists.zx2c4.com>; Mon, 06 Mar 2023 12:09:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678133383;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=6/LQ22SxCIaIMKCmzqtubiDIW3rGorKjMWE5QuR4ZXc=;
 b=fHyBqUUng0UtV2DrPjYsCsxUdTJ0m92kQd6HPV9pj4B7tkHIl2tI/EGKc1+lBqHwWr
 dS+YnXVZUQAQdgrw4g/nsX3PlB3PCAA1/fKNTO3g6Pa8BlX0xwcwOHuJQp/o4Ftt06U7
 SCwmAdgtzvw7JEjy3zW8BDcHQjKudPCgkjuRafuzM42A+0bK0f+jnrbQxPtb0okVQ2/A
 nccDT5T4/ir/zLCsOtcqRbz7FIVzqeNDs+zWimcQahkKSDSwCsxVAh0bcEzP1akiZNMw
 f6M+0CT4biDiU1LRo58zXen/y5TeCXYFQqRnUw3sZzwnXJ2+PEeKDAxWlPM+rpBS1ZJB
 Cbcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678133383;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6/LQ22SxCIaIMKCmzqtubiDIW3rGorKjMWE5QuR4ZXc=;
 b=dtTWFl7Y1jVQojZpUFpve80dh/LJDA4+K2jLW+DzYI1zzs5BZVKJfqjLNyZHJGtw11
 xfoXCm0vZ55nhkXbuAXQefVg2j6RaaJnjIMQ+SA8Xg4/ozsxF1nuTvYeEBN16WuLYSyp
 XRFX67gCQ/XF0x1Oj4ly5b2oxGmw/8ZPF6gRWanJK+JtqmkyDe5QmSC00pAAmzqcRfMf
 OaJU27i39uEdWxFKCq62785DCIJA1LzenpFV6rLAsIhiWKtQPBVKIBd23vihHHdQlLfT
 421wJxx8FACldduzOXnw2jHr/Z7khBYdgOF0PLAyAq4k1cuDfRwdVSCdZ7sh5SRmQeos
 YIAQ==
X-Gm-Message-State: AO0yUKWvTTmMB7Jrd340NfxkHiaYNS9YSMtawc5u4svKiqnUr1wpAzpn
 TjULTa07cYEr5U7pe+R/rZA=
X-Google-Smtp-Source: AK7set8ml1Zwwn2Jgrqz4SIpPButPySeJkHFErNLtXD+4bzwyvrMYjJswOKnxcAA24bZzTL44s7Ohw==
X-Received: by 2002:a17:902:ea0c:b0:19a:727e:d4f3 with SMTP id
 s12-20020a170902ea0c00b0019a727ed4f3mr18574527plg.5.1678133383608; 
 Mon, 06 Mar 2023 12:09:43 -0800 (PST)
Received: from vernon-pc ([49.67.2.142]) by smtp.gmail.com with ESMTPSA id
 v4-20020a1709029a0400b00198b01b412csm7059281plp.303.2023.03.06.12.09.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 12:09:43 -0800 (PST)
Date: Tue, 7 Mar 2023 04:09:37 +0800
From: Vernon Yang <vernon2gm@gmail.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: tytso@mit.edu, Jason@zx2c4.com, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 jejb@linux.ibm.com, martin.petersen@oracle.com,
 yury.norov@gmail.com, andriy.shevchenko@linux.intel.com,
 linux@rasmusvillemoes.dk, james.smart@broadcom.com,
 dick.kennedy@broadcom.com, linux-kernel@vger.kernel.org,
 wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 linux-scsi@vger.kernel.org
Subject: Re: [PATCH 3/5] scsi: lpfc: fix lpfc_cpu_affinity_check() if no
 further cpus set
Message-ID: <ZAZIgcpEBE7HXBuy@vernon-pc>
References: <20230306160651.2016767-1-vernon2gm@gmail.com>
 <20230306160651.2016767-4-vernon2gm@gmail.com>
 <CAHk-=wj73=Os1p=W7D2va=Rd81ZKvjb35yWgXQNgn1hXNRpAbw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHk-=wj73=Os1p=W7D2va=Rd81ZKvjb35yWgXQNgn1hXNRpAbw@mail.gmail.com>
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

On Mon, Mar 06, 2023 at 10:48:04AM -0800, Linus Torvalds wrote:
> On Mon, Mar 6, 2023 at 8:07 AM Vernon Yang <vernon2gm@gmail.com> wrote:
> >
> > -                               if (new_cpu == nr_cpumask_bits)
> > +                               if (new_cpu >= nr_cpumask_bits)
>
> This all should use "nr_cpu_ids", not "nr_cpumask_bits".
>
> But I really suspect that it should all be rewritten to not do that
> thing over and over, but just use a helper function for it.
>
>   int lpfc_next_present_cpu(int n, int alternate)
>   {
>         n = cpumask_next(n, cpu_present_mask);
>         if (n >= nr_cpu_ids)
>                 n = alternate;
>         return n;
>   }
>
> and then you could just use
>
>         start_cpu = lpfc_next_present_cpu(new_cpu, first_cpu);

OK, thanks you very much.

I'll send a second version shortly

>
> or similar.
>
>               Linus
>
> PS. We "kind of" already have a helper function for this:
> cpumask_next_wrap(). But it's really meant for a different pattern
> entirely, so let's not confuse things.
