Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D615C6FD1A
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 Mar 2023 23:22:58 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 616e972b;
	Mon, 6 Mar 2023 23:06:55 +0000 (UTC)
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com
 [2607:f8b0:4864:20::336])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 37bf4544
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 6 Mar 2023 16:54:09 +0000 (UTC)
Received: by mail-ot1-x336.google.com with SMTP id
 m25-20020a05683026d900b006941a2838caso5678028otu.7
 for <wireguard@lists.zx2c4.com>; Mon, 06 Mar 2023 08:54:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1678121648;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=OOfn1AerasUS9ICTw0rEuQ9lCFS4+7nv1OQbmZdEVCo=;
 b=EOaVCRsHqgl2uqGltPzu8aonWC2uhbJ0E6jehzJi9EN22aq8u+BWmjtcLhHr5QK58f
 KJOPqayFFAolBQLLc6ZBv8qsupHxbnID78JLn8/0zCPAEEUzqKb6l7Cq5cNPxnFWMUgs
 R9t1boZhO+J9BBbc7eM+GTk7Zl5WnyZUvwwwHR2QKp7KylnOuV1cb7I8ECP+oiDj4Gk0
 mIYsoE589sCGTvRupXowE/MKnA+llI7Pdj8I8BFbKzsP9x/khxBNjVjgN8/y7AhyZjwQ
 oaC+Th4DHAUw2fnOjP3OuWB0b1Sgjk+fgI5DBRJwZVLsVvF4glFH8rvwiy/SDxL5/oGA
 jeTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678121648;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=OOfn1AerasUS9ICTw0rEuQ9lCFS4+7nv1OQbmZdEVCo=;
 b=LqtLdrJqPhDX9ZX14IsYT+E+J2SdZXbVT4TCXyQ5kKr/WF/gB5dc2+q0jcInxPYL5e
 o7o09QmHzp2byT4NhoCi0YIedSlN79a/1ohEnaBte62eC+xzKwJKL41WW1k6Wliandig
 vnMNzjPmSOJhCJf1nYbYtMWS7jeZlNdjvp1vxInqnIxwvzFbVB6UVX0dYyLkgwSDybsq
 zfa0JfS1E32GuEoR+Q3G2+2KyHOdD3XKPC2XSQvOG4RCbsYy7SzKSegSJUYvkFBHAttT
 0oNDNC2InNid6DZvZIxusimhhdyd6gT86IkO2pew1DYRc02coB3vkRam+8PnfKuvLphg
 0pKg==
X-Gm-Message-State: AO0yUKUqFFjRcP4zs66fKADq51Y0bHXhKH20k54icN5YA6Q4zQk1snmz
 P/taCqATignDsSZiwCbOuaI=
X-Google-Smtp-Source: AK7set9lCHqv4JZ0R5pBNzoiQy05SJNmnktQ6CARvZPrtVMzchG+owZd5TdIHMVxjPQP6P5u4j7SxQ==
X-Received: by 2002:a05:6830:3142:b0:68d:bd4d:f4b7 with SMTP id
 c2-20020a056830314200b0068dbd4df4b7mr6193198ots.21.1678121648416; 
 Mon, 06 Mar 2023 08:54:08 -0800 (PST)
Received: from localhost ([12.97.180.36]) by smtp.gmail.com with ESMTPSA id
 z10-20020a9d468a000000b0069452b2aa2dsm3633661ote.50.2023.03.06.08.54.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Mar 2023 08:54:07 -0800 (PST)
Date: Mon, 6 Mar 2023 08:54:06 -0800
From: Yury Norov <yury.norov@gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Vernon Yang <vernon2gm@gmail.com>, torvalds@linux-foundation.org,
 tytso@mit.edu, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, jejb@linux.ibm.com,
 martin.petersen@oracle.com, andriy.shevchenko@linux.intel.com,
 linux@rasmusvillemoes.dk, james.smart@broadcom.com,
 dick.kennedy@broadcom.com, linux-kernel@vger.kernel.org,
 wireguard@lists.zx2c4.com, netdev@vger.kernel.org,
 linux-scsi@vger.kernel.org
Subject: Re: [PATCH 5/5] cpumask: fix comment of cpumask_xxx
Message-ID: <ZAYartD+NsF1JxlH@yury-laptop>
References: <20230306160651.2016767-1-vernon2gm@gmail.com>
 <20230306160651.2016767-6-vernon2gm@gmail.com>
 <ZAYXJ2E+JHcp2kD/@yury-laptop>
 <CAHmME9r_JXNCVVCNxZRQkafA=eOOu5k0+AweRDor3tNu283bdg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHmME9r_JXNCVVCNxZRQkafA=eOOu5k0+AweRDor3tNu283bdg@mail.gmail.com>
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

On Mon, Mar 06, 2023 at 05:44:41PM +0100, Jason A. Donenfeld wrote:
> On Mon, Mar 6, 2023 at 5:39 PM Yury Norov <yury.norov@gmail.com> wrote:
> >
> > On Tue, Mar 07, 2023 at 12:06:51AM +0800, Vernon Yang wrote:
> > > After commit 596ff4a09b89 ("cpumask: re-introduce constant-sized cpumask
> > > optimizations"), the cpumask size is divided into three different case,
> > > so fix comment of cpumask_xxx correctly.
> > >
> > > Signed-off-by: Vernon Yang <vernon2gm@gmail.com>
> > > ---
> > >  include/linux/cpumask.h | 46 ++++++++++++++++++++---------------------
> > >  1 file changed, 23 insertions(+), 23 deletions(-)
> > >
> > > diff --git a/include/linux/cpumask.h b/include/linux/cpumask.h
> > > index 8fbe76607965..248bdb1c50dc 100644
> > > --- a/include/linux/cpumask.h
> > > +++ b/include/linux/cpumask.h
> > > @@ -155,7 +155,7 @@ static __always_inline unsigned int cpumask_check(unsigned int cpu)
> > >   * cpumask_first - get the first cpu in a cpumask
> > >   * @srcp: the cpumask pointer
> > >   *
> > > - * Returns >= nr_cpu_ids if no cpus set.
> > > + * Returns >= small_cpumask_bits if no cpus set.
> >
> > There's no such thing like small_cpumask_bits. Here and everywhere,
> > nr_cpu_ids must be used.
> >
> > Actually, before 596ff4a09b89 nr_cpumask_bits was deprecated, and it
> > must be like that for all users even now.
> >
> > nr_cpumask_bits must be considered as internal cpumask parameter and
> > never referenced outside of cpumask code.
> 
> What's the right thing I should do, then, for wireguard's usage and
> for random.c's usage? It sounds like you object to this patchset, but
> if the problem is real, it sounds like I should at least fix the two
> cases I maintain. What's the right check?

Everywhere outside of cpumasks internals use (cpu < nr_cpu_ids) to
check if the cpu is in a valid range, like:

cpu = cpumask_first(cpus);
if (cpu >= nr_cpu_ids)
        pr_err("There's no cpus");
 

