Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07558C64EC4
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 Mar 2023 18:09:40 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id 0b998ad0;
	Mon, 6 Mar 2023 18:09:38 +0000 (UTC)
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [2a00:1450:4864:20::531])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 0a4e92c8
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 6 Mar 2023 18:09:37 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id i34so42342774eda.7
 for <wireguard@lists.zx2c4.com>; Mon, 06 Mar 2023 10:09:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1678126176;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nHiIbvE8ZF8yskiSHfLDDBQes7IipQHv7U2Dux2wiEU=;
 b=LGP4vhz5ZhY21ExJkBOM3qVXoQ/zBEw7SK1zZIs9c4YhagfkqfBN4St+eG2t/XBLcf
 JvcR78A3GjOr86YJSe2T6Dmr/QU+I/HpY7tkSSCqdFUbIwhSnnAkCzl/TOBt4L8ExhCl
 hLxHuPuUn4s1ZQlD8kYYwRBMuXtxofrUZU5KE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678126176;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nHiIbvE8ZF8yskiSHfLDDBQes7IipQHv7U2Dux2wiEU=;
 b=qkQ/mDuT5CvcCTXvZT9SiHsAM7xW4reW/zy64l1J5aBQSi4nfBo9jZfMmqTSHfLeHK
 Qyi+k+r4Vo7GjUcqxIMOLjm/NGbtk1YSQ366FsHIL9fJTcppAByRGU8wgwyOVUR3SALN
 5flXTy+I8uutCbkJn4WTt/zFK1Q8/8mC6V5inXaG7XdM6rtsL+SKlDXzjWcakmXUAhOv
 mPiL7B5obn32haiW2VqXheI4C7LEkmSX5n6PoXnZTZLBW8X8bWKNFXOfVTqQEeIXQG72
 5STBBaV4GIo0jFIqdEAFFrY1q8TjB3MzC3MinXH8VaogzbWMYMl4CD4XIXQ0vG3bTer4
 VPmQ==
X-Gm-Message-State: AO0yUKUZMYsAj+l7tnhSrwf9hb4ZPEYM7IUYz2YQKWTM5R6kNxxiuH48
 gDBcezmVln2Ok/m2/udRbDrYw8Xju9ZdxZUva8/5IA==
X-Google-Smtp-Source: AK7set+CfJe5sjCHWjWvwc8k7S7qpF5kKftqR3FdMk2IlhX4ln7pymrhA/8LL0vs2wTnSpYmTvd0xQ==
X-Received: by 2002:a17:907:86a6:b0:84d:3403:f4f2 with SMTP id
 qa38-20020a17090786a600b0084d3403f4f2mr15003669ejc.62.1678126176496; 
 Mon, 06 Mar 2023 10:09:36 -0800 (PST)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com.
 [209.85.208.44]) by smtp.gmail.com with ESMTPSA id
 ay24-20020a170906d29800b0090953b9da51sm4862259ejb.194.2023.03.06.10.09.36
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 10:09:36 -0800 (PST)
Received: by mail-ed1-f44.google.com with SMTP id cw28so42368359edb.5
 for <wireguard@lists.zx2c4.com>; Mon, 06 Mar 2023 10:09:36 -0800 (PST)
X-Received: by 2002:a50:9fa8:0:b0:4ae:e5f1:7c50 with SMTP id
 c37-20020a509fa8000000b004aee5f17c50mr6466912edf.5.1678125764592; Mon, 06 Mar
 2023 10:02:44 -0800 (PST)
MIME-Version: 1.0
References: <20230306160651.2016767-1-vernon2gm@gmail.com>
 <20230306160651.2016767-6-vernon2gm@gmail.com>
 <CAHk-=whVnaTBt2Xm-A+8SMc5-q5CuZBDU6rUZ8yC8GoAnbTBvw@mail.gmail.com>
 <CAHk-=witXXeQuP9fgs4dDL2Ex0meXQiHJs+3JEfNdaPwngMVEg@mail.gmail.com>
In-Reply-To: <CAHk-=witXXeQuP9fgs4dDL2Ex0meXQiHJs+3JEfNdaPwngMVEg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 6 Mar 2023 10:02:27 -0800
X-Gmail-Original-Message-ID: <CAHk-=wj5hFp39ZM7fEtmctwkWdHHnx0X7c2j5Z8L+b18jUgcMQ@mail.gmail.com>
Message-ID: <CAHk-=wj5hFp39ZM7fEtmctwkWdHHnx0X7c2j5Z8L+b18jUgcMQ@mail.gmail.com>
Subject: Re: [PATCH 5/5] cpumask: fix comment of cpumask_xxx
To: Vernon Yang <vernon2gm@gmail.com>
Cc: tytso@mit.edu, Jason@zx2c4.com, davem@davemloft.net, edumazet@google.com, 
 kuba@kernel.org, pabeni@redhat.com, jejb@linux.ibm.com, 
 martin.petersen@oracle.com, yury.norov@gmail.com, 
 andriy.shevchenko@linux.intel.com, linux@rasmusvillemoes.dk, 
 james.smart@broadcom.com, dick.kennedy@broadcom.com, 
 linux-kernel@vger.kernel.org, wireguard@lists.zx2c4.com, 
 netdev@vger.kernel.org, linux-scsi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

On Mon, Mar 6, 2023 at 9:47=E2=80=AFAM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> The drivers/char/random.c code is very wrong, and does
>
>              if (cpu =3D=3D nr_cpumask_bits)
>                              cpu =3D cpumask_first(&timer_cpus);
>
> which fails miserably exactly because it doesn't use ">=3D".

Turns out this "cpu =3D=3D nr_cpumask_bits" pattern exists in a couple of
other places too.

It was always wrong, but it always just happened to work. The lpfc
SCSI driver in particular seems to *love* this pattern:

        start_cpu =3D cpumask_next(new_cpu, cpu_present_mask);
        if (start_cpu =3D=3D nr_cpumask_bits)
                start_cpu =3D first_cpu;

and has repeated it multiple times, all incorrect.

We do have "cpumask_next_wrap()", and that *seems* to be what the lpcf
driver actually wants to do.

.. and then we have kernel/sched/fair.c, which is actually not buggy,
just odd. It uses nr_cpumask_bits too, but it uses it purely for its
own internal nefarious reasons - it's not actually related to the
cpumask functions at all, its just used as a "not valid CPU number".

I think that scheduler use is still very *wrong*, but it doesn't look
actively buggy.

The other cases all look very buggy indeed, but yes, they happened to
work, and now they don't. So commit 596ff4a09b89 ("cpumask:
re-introduce constant-sized cpumask optimizations") did break them.

I'd rather fix these bad users than revert, but there does seem to be
an alarming number of these things, which worries me:

     git grep '=3D=3D nr_cpumask_bits'

and that's just checking for this *exact* thing.

                Linus
