Return-Path: <wireguard-bounces@lists.zx2c4.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.zx2c4.com (lists.zx2c4.com [165.227.139.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69932C61DA4
	for <zx2c4-wireguard@archiver.kernel.org>; Mon,  6 Mar 2023 17:47:57 +0000 (UTC)
Received: 
	by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTP id f588950d;
	Mon, 6 Mar 2023 17:47:54 +0000 (UTC)
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [2a00:1450:4864:20::52d])
 by lists.zx2c4.com (ZX2C4 Mail Server) with ESMTPS id 3cd7c241
 (TLSv1.3:TLS_AES_256_GCM_SHA384:256:NO)
 for <wireguard@lists.zx2c4.com>; Mon, 6 Mar 2023 17:47:53 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id da10so42171877edb.3
 for <wireguard@lists.zx2c4.com>; Mon, 06 Mar 2023 09:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1678124872;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yHxMDJkAMxG+U7tsJ3okEl2/ScLLX/X7tonuUjq/u1I=;
 b=ckVkcyPoPmhakiRDn8WT3GtuhY1iVz4TCIFpaSpRNFSI5T5+f5NLSEXb7HrV0L1aIA
 3njxBfRcnIMISOh8QOdW8d7OHbEvEK/fUE8EFBWiiwlx+uAecoKDuJY/UGdrpdtvTDmu
 dvlI7sFA1gNjKGDa4lQafh2mXWwvBTIsa6xpw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678124872;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yHxMDJkAMxG+U7tsJ3okEl2/ScLLX/X7tonuUjq/u1I=;
 b=hYVJTBHmCqXr2+T7N9XGGPG/ZRcRE94OExOpGN20vy66hRJlhFB5kRfbORz7UFjhoT
 FuaU19PoLq0wS2ZhvY6uQCD8VVShi+cpmLQ40t4r6DtS4qyv3l6UINxGCM9LRv7ARpPD
 oEqgtwAjANBiCO8sw0vtO3yTAx94oPWagU3rTTW0qWy9n0FunRIwGuaP1sdiJ7VFbRY1
 ohQSQMHPk7Gf+N62mPjiDYmME5Cnlmm/35GYwjHgKYtpuOMDuJZzC5fMdUuj72wPjuso
 6gtnjuuoMgOSR9vwO4yZsj9Q+LDGZxiwqt4EzOOBc5cHTqW9yiiyD/6AH9XWBdNBbpdc
 T1iw==
X-Gm-Message-State: AO0yUKWxL6iEJf1Am5QcG6etKUdynayWQs1fy/+gfZA2ktF5FFfMATHS
 uKX5blkORHl5m3WqIDvQsU7mf/FYr+qt1J/7ntG6nw==
X-Google-Smtp-Source: AK7set9fFWqj/M2XvrpcwYMeEFEGuGOhyfqmlRcHRCvEOr6ZzhwmctU10icmhYWYwfDoEAyiBuDB4g==
X-Received: by 2002:a17:906:ae4b:b0:88a:724:244c with SMTP id
 lf11-20020a170906ae4b00b0088a0724244cmr10867980ejb.71.1678124872372; 
 Mon, 06 Mar 2023 09:47:52 -0800 (PST)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com.
 [209.85.208.52]) by smtp.gmail.com with ESMTPSA id
 i30-20020a50871e000000b004c44d00a3b5sm5423995edb.20.2023.03.06.09.47.51
 for <wireguard@lists.zx2c4.com>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 06 Mar 2023 09:47:51 -0800 (PST)
Received: by mail-ed1-f52.google.com with SMTP id cw28so42112655edb.5
 for <wireguard@lists.zx2c4.com>; Mon, 06 Mar 2023 09:47:51 -0800 (PST)
X-Received: by 2002:a17:906:4997:b0:877:7480:c75d with SMTP id
 p23-20020a170906499700b008777480c75dmr5674931eju.0.1678124871381; Mon, 06 Mar
 2023 09:47:51 -0800 (PST)
MIME-Version: 1.0
References: <20230306160651.2016767-1-vernon2gm@gmail.com>
 <20230306160651.2016767-6-vernon2gm@gmail.com>
 <CAHk-=whVnaTBt2Xm-A+8SMc5-q5CuZBDU6rUZ8yC8GoAnbTBvw@mail.gmail.com>
In-Reply-To: <CAHk-=whVnaTBt2Xm-A+8SMc5-q5CuZBDU6rUZ8yC8GoAnbTBvw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 6 Mar 2023 09:47:34 -0800
X-Gmail-Original-Message-ID: <CAHk-=witXXeQuP9fgs4dDL2Ex0meXQiHJs+3JEfNdaPwngMVEg@mail.gmail.com>
Message-ID: <CAHk-=witXXeQuP9fgs4dDL2Ex0meXQiHJs+3JEfNdaPwngMVEg@mail.gmail.com>
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

On Mon, Mar 6, 2023 at 9:29=E2=80=AFAM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> The correct thing to do is always that
>
>    * Returns >=3D nr_cpu_ids if no cpus set.
>
> because nr_cpu_ids is always the *smallest* of the access sizes.
>
> Of course, right now Guenter seems to be reporting a problem with that
> optimization, so unless I figure out what is going on I'll just need
> to revert it anyway.

Ahh. And the reason is exactly that people do *not* follow that
"Returns >=3D nr_cpu_ids" rule.

The drivers/char/random.c code is very wrong, and does

             if (cpu =3D=3D nr_cpumask_bits)
                             cpu =3D cpumask_first(&timer_cpus);

which fails miserably exactly because it doesn't use ">=3D".

Oh well.

I'll have to look for more of this pattern, but basically all those
"xyz_cpumask_bits" things were supposed to always be just internal to
that header file implementation, which is *exactly* why you have to
check the result for ">=3D nr_cpu_ids".

       Linus
