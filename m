Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A57DC61DA4
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 Mar 2023 23:34:59 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 7d45dc6e;
	Mon, 6 Mar 2023 23:06:56 +0000 (UTC)
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com
 [2607:f8b0:4864:20::102a])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 02e17d76
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 6 Mar 2023 17:45:22 +0000 (UTC)
Received: by mail-pj1-x102a.google.com with SMTP id
 6-20020a17090a190600b00237c5b6ecd7so13898394pjg.4
 for <wireguard@lists.zx2c4.com>; Mon, 06 Mar 2023 09:45:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678124721;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=F8jEnuaODHkIgm3QXsy3NxYaf9Twek/6N1cAGCi4cq8=;
 b=gLXj/9ELW4hDPJYzjYYPm7rcW4EBxHVxreG9wJ+ygD2ziX4jcK3Fk77fqWfxfJdCEy
 UtI8NqCy4w8Sr+gM15dCWcFwCZxK+my98RKUM4DNL80X36xywZF2J+ls+36gXglvw0aw
 J4maDik894B2wi0/FI5nOAa7bF6dZtl95gZ2QvjJ/7zJiD6kmltlRT28TLq7Engimb56
 SsU+/JLA+S1P95giqlnpBlycbcmxT6oYT6evAm13H9arBp1kpl4YbORrEwzUkP96tF6v
 Cgv2dTAt6zXOh/3Wcq9nhlVe6heo3jWjSK/ckJLHWWBUnwgmIzbj8plYzdts7TOtdi+W
 FpLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678124721;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=F8jEnuaODHkIgm3QXsy3NxYaf9Twek/6N1cAGCi4cq8=;
 b=c0TL3JKf44PNXLUC759wDHByANhOcGH7Orxp1Oabz+sSSMapddrsTOboDAx6a8V/38
 +63OT3gWb4B/yYORqUSknCOxqOsB5gVv3+ItTJ0osjy95hz/SMgrjwsF5BwnkwN8jEmA
 eNqtP4ohWImFeqJlo/gxxjVGtXH6//iK4y7DjB4VrxFFRcPV/nkJYdPQ3Sx071ZcfYwl
 iTYMOKPIQkjj5N30yRPvtdWZxpu0gfDKrW3Z+eu8zSUHd7XwMdBFOOAzPwOL84gOZPGS
 yqIE/7QkcBQAiqlNyOIgxIQQ1+MruihciVU4cJooi3bGQ7IidsjzCD7X+LlvnEOVeCHi
 y2mg==
X-Gm-Message-State: AO0yUKX78rtE1ONq2JQq0xyeQBCFgfX4kTuf8/9gx5PzXlGAQUayF8TE
 ruTtq5Evq0A4HQDWLPNTbpY=
X-Google-Smtp-Source: AK7set+KGmAg/YZWyh+KxC/W4tyYr0Aryv8jvoRETy0kJlnidI1W8lj1sOCa4lJP/6kpyiVCRbmEOA==
X-Received: by 2002:a05:6a20:6aa8:b0:cb:ac6c:13ba with SMTP id
 bi40-20020a056a206aa800b000cbac6c13bamr10389268pzb.25.1678124720753; 
 Mon, 06 Mar 2023 09:45:20 -0800 (PST)
Received: from vernon-pc ([49.67.2.142]) by smtp.gmail.com with ESMTPSA id
 k15-20020aa792cf000000b005ac8a51d591sm6516741pfa.21.2023.03.06.09.45.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 09:45:20 -0800 (PST)
Date: Tue, 7 Mar 2023 01:45:13 +0800
From: Vernon Yang <vernon2gm@gmail.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: torvalds@linux-foundation.org, tytso@mit.edu, Jason@zx2c4.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, jejb@linux.ibm.com, martin.petersen@oracle.com,
 andriy.shevchenko@linux.intel.com, linux@rasmusvillemoes.dk,
 james.smart@broadcom.com, dick.kennedy@broadcom.com,
 linux-kernel@vger.kernel.org, wireguard@lists.zx2c4.com,
 netdev@vger.kernel.org, linux-scsi@vger.kernel.org
Subject: Re: [PATCH 5/5] cpumask: fix comment of cpumask_xxx
Message-ID: <ZAYmqVmeYdDPVpLZ@vernon-pc>
References: <20230306160651.2016767-1-vernon2gm@gmail.com>
 <20230306160651.2016767-6-vernon2gm@gmail.com>
 <ZAYXJ2E+JHcp2kD/@yury-laptop>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZAYXJ2E+JHcp2kD/@yury-laptop>
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

On Mon, Mar 06, 2023 at 08:39:03AM -0800, Yury Norov wrote:
> On Tue, Mar 07, 2023 at 12:06:51AM +0800, Vernon Yang wrote:
> > After commit 596ff4a09b89 ("cpumask: re-introduce constant-sized cpumask
> > optimizations"), the cpumask size is divided into three different case,
> > so fix comment of cpumask_xxx correctly.
> >
> > Signed-off-by: Vernon Yang <vernon2gm@gmail.com>
> > ---
> >  include/linux/cpumask.h | 46 ++++++++++++++++++++---------------------
> >  1 file changed, 23 insertions(+), 23 deletions(-)
> >
> > diff --git a/include/linux/cpumask.h b/include/linux/cpumask.h
> > index 8fbe76607965..248bdb1c50dc 100644
> > --- a/include/linux/cpumask.h
> > +++ b/include/linux/cpumask.h
> > @@ -155,7 +155,7 @@ static __always_inline unsigned int cpumask_check(unsigned int cpu)
> >   * cpumask_first - get the first cpu in a cpumask
> >   * @srcp: the cpumask pointer
> >   *
> > - * Returns >= nr_cpu_ids if no cpus set.
> > + * Returns >= small_cpumask_bits if no cpus set.
>
> There's no such thing like small_cpumask_bits. Here and everywhere,
> nr_cpu_ids must be used.
>
> Actually, before 596ff4a09b89 nr_cpumask_bits was deprecated, and it
> must be like that for all users even now.
>
> nr_cpumask_bits must be considered as internal cpumask parameter and
> never referenced outside of cpumask code.

OK, I remove this path for next version.

>
> Thansk,
> Yury
